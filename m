Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B81A372AC4F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:30:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5974839;
	Sat, 10 Jun 2023 16:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5974839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407407;
	bh=aIOKt9M7LsfdAOb27Df+fSR9yb9ivNK5xWl9boMlO1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=abESPB3FHY6ChhjVrGffVyg0Agf+Q2MnbuUKjBSLOLcL4WZPnfgIeb+I4S8q5mmgm
	 oxKE7rndRG5bwVN68iEkl6K9R+e2KpLGWW7xbEkhHHfKHW1grEcLwU+/07dlothCxd
	 YxucOxcPt5iYggD/lW9BsHRnf30+GuLT93xRCPlQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6A34F805AC; Sat, 10 Jun 2023 16:27:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65505F805BA;
	Sat, 10 Jun 2023 16:27:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93FA6F80254; Sat, 10 Jun 2023 16:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6479BF80567
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6479BF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JwmwtxO1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2573460DF5;
	Sat, 10 Jun 2023 14:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CEAC433D2;
	Sat, 10 Jun 2023 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407258;
	bh=aIOKt9M7LsfdAOb27Df+fSR9yb9ivNK5xWl9boMlO1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JwmwtxO11wKBJEq7lK8fLT+uyEYnirigcmSmAuH7MLlZAUTX2UHVWeO5Jy/4BwojS
	 Vv6cFxQfcVoiBIXXeClo3Rqb5Q2qxDUe0oPgDNofYltvDVRW/PvJ/eHPWvkLhEEQCx
	 WZ2WojfubfLD+07/2xN5w4nleNTLLpqUiLYDnPNLRLIKejvfpCrT6xIdWvJWLKLhzx
	 UFpPI+CSLGTSnHNpcm0kafuN4ozak41ko1H6/4nS/CA4p7sm6XR8FW46SiBHPz8Iea
	 4layeObSrE1HHxrfY9NexJWZ++/TnWLafMXCMe9gGSrmFHSWL+v8CHi4ZX7QjzFYt0
	 iT0ryC/eBhnKg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:18 +0100
Subject: [PATCH 7/8] ASoC: rt1316: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-7-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aIOKt9M7LsfdAOb27Df+fSR9yb9ivNK5xWl9boMlO1o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhO4rmiL7KSsCrmfohsoemdfcdJtHcl8ApeVFAd
 swq6H2SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISITgAKCRAk1otyXVSH0N1+B/
 4r0k3ah/GI3WILAi1Y529ZrhhJbtFu/swBs3yX5B4bxcARAAv92Ebptb+gsnd2zSCj+j94irJQHuWf
 4nWarmhQX4NvY8OzRb+UFVl9jR0ETJvljlyCN9y3x1vU00UucdRoVRfgUdsPYStQh8wWiw9A+usXoN
 VBaONdX0pyc/YHsYbW26x1r6/AUWAVwJfNzRe1pu6wIav2jT5nGspVxx383IC/Kh2jmHyN8rcoriPz
 gAMWfXa+83p2PNqxrHZp8Ne+DKv6ZGEIaD1T4j7/MddcWgUbIz1eRvRBXlEN6yJJ3XFZa9+vUJTDMl
 3cqj8/hUPYWPlBLxEmqMzyZvVszzOB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: KOZHSIJKPJEC6HA3M42QEYDA2OKUYU46
X-Message-ID-Hash: KOZHSIJKPJEC6HA3M42QEYDA2OKUYU46
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOZHSIJKPJEC6HA3M42QEYDA2OKUYU46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt1316 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1316-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 601b76320124..721821d9e9af 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -188,7 +188,7 @@ static const struct regmap_config rt1316_sdw_regmap = {
 	.max_register = 0x4108ffff,
 	.reg_defaults = rt1316_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt1316_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

