Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539675151C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7996A4A;
	Thu, 13 Jul 2023 02:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7996A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207558;
	bh=aZ0Km6k2MpASmBDuwRnn2hw2kleJjjMTWXIxObqEJjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b/wTpQyZwtDomVSzOgK6flQoBoMFE74ep9vr+JfhcxBU+48BlImvXMv/jdxHHrwvu
	 kWom84wkGBcGH1WppMyF8lT9DGSnNElFlrw6gmToD3zT4yEw7a3kzae/0SK+wmLzWW
	 pWmyppUew62AgTo56awS0WMQ6HdBQmtvY93fLmq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FD81F80613; Thu, 13 Jul 2023 02:15:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD73F8060C;
	Thu, 13 Jul 2023 02:15:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79663F805E8; Thu, 13 Jul 2023 02:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D0E1F805DA
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D0E1F805DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I4QE4iMI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D11F661986;
	Thu, 13 Jul 2023 00:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B54C433C9;
	Thu, 13 Jul 2023 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207290;
	bh=aZ0Km6k2MpASmBDuwRnn2hw2kleJjjMTWXIxObqEJjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I4QE4iMIFdt8PE/laEhh7wYh5S/vI8hE9kFf2t3/rv04qtmVLcAnCLCIgjc8XYwuJ
	 wkNNdjjh+t4GvgQ95ZDO+4jE8RIK7K0qTveNHBjgGaeQgMBH+ZEFbuExRLY9BN1CZC
	 0pvYkbnG5mb6FC41isXyfnbMT5tARqrT8idAjKv4hD+5KeMHHQfek24WBotOXJyrt4
	 Hx22gyCoqrr921cd6isvfErHD4tRlVSJj7VpLr/xziSBKOZCYvzxPgVbNajNFthjIk
	 UquiwonEVFxkYED0y9j0IscpRnLqqXRXRBagdTaFsqflb/4sV6DxDYi5N8VAq1iINj
	 8xp4eR8ojyV3w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:26 +0100
Subject: [PATCH 13/48] ASoC: wm5100: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-13-a62651831735@kernel.org>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aZ0Km6k2MpASmBDuwRnn2hw2kleJjjMTWXIxObqEJjM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G24gLtpP3LQVGyJ30f9sTtZ7y/kKFdWhIFd
 /ZOMFiTYn2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtgAKCRAk1otyXVSH
 0CaNB/9ZeUKsGlTznRt6qqfU9fv9H8QuR62+Usl4KC13JgVfeFE11I6slNflWmppCeqg0Y/g0Z1
 +QptrXkyF7Nu+QiGK1z2QAxES33Uuhlb5ZxEvRmTPiWStGQHu0vfukiEVyFtQlY3LXcNu8+y8Wz
 ysPF9PwI1bQ5tTmJH+nxp6S8yMAMYqdbHskq4Hnl661SZI0B+Pkd9O2BEVNlIjmPKVD/8Bb032Q
 L4mm/TfKuL0j3BPIUodNMod7C8oC33xbMEYYrPUCdulSEo2NKfEMeg7GUc4LofdA9tTdwzO4OF1
 cyrPhobraNQ9X/45iApvz/XiSkpZjB0jtyt+4azZwYar+nVL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: AFJEMVRX2NICEL53RUBIALWWJR6WDYVG
X-Message-ID-Hash: AFJEMVRX2NICEL53RUBIALWWJR6WDYVG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AFJEMVRX2NICEL53RUBIALWWJR6WDYVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm5100 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm5100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index a86eacb2a9bb..ff63723928a1 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2400,7 +2400,7 @@ static const struct regmap_config wm5100_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm5100_reg_defaults),
 	.volatile_reg = wm5100_volatile_register,
 	.readable_reg = wm5100_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static const unsigned int wm5100_mic_ctrl_reg[] = {

-- 
2.39.2

