Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F77909BE
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 23:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBB2A4D;
	Sat,  2 Sep 2023 23:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBB2A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693689061;
	bh=pfmTebOGpABzh4OF3FG1M+nz4wpY8/aJTMADovLWHU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=stnQnKpLLkaBir6hfxjUq1Eu1q84ncbibNWRDG5cdw5ST7fkWiN69JzBKSWOrvDhe
	 2bnNFjKhV54KwddR0MnXjIYBOYEcP0KdLT6hNntINDIakeWotkB7lDfLfvjYJHzmfM
	 dphuaMPbhFgCJx709XCThr6/lEU8Vgn9jowKzjU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 824CCF805C1; Sat,  2 Sep 2023 23:09:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF5AF80580;
	Sat,  2 Sep 2023 23:09:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40007F8032D; Sat,  2 Sep 2023 23:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13026F800F5
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 23:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13026F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=C3wnYF8v
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CDFEA66072B5;
	Sat,  2 Sep 2023 22:06:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693688789;
	bh=pfmTebOGpABzh4OF3FG1M+nz4wpY8/aJTMADovLWHU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C3wnYF8vYhZ2lV9m4HpScGFPalTHpVL0T11sUFCevzhvp0TikBFINuTA8pBFBwIWo
	 NyKHvUITLRPBU/VnT5/odRtdndVEcM8ik4brEHaqWYW1/obvPbq6uV21qWHMa+nz6d
	 UwlgH5xv7M+2F2MMpqnnWCoVl+JsLSpkx8oj9XEIObcAeL4advE2KUAFrhlbCBAZU5
	 EA9JW8VJVXget0vc4ZKWVtyiwry+O5dT+oydZ7AvXBRH/dqWJXyhUrH615BKO8UPnE
	 jYj5qWhbaQlfBW0J5iQ6DoeC2WKuuD0NNertddz1jM4f3DLTfTA8jdNJMClwKjVf9P
	 1B/5JTRr7iTnA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/9] ASoC: cs35l41: Handle mdsync_down reg write errors
Date: Sun,  3 Sep 2023 00:06:13 +0300
Message-ID: <20230902210621.1184693-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P2Y4B32FT2OYUDMLFPNDV2BX4HKH56FH
X-Message-ID-Hash: P2Y4B32FT2OYUDMLFPNDV2BX4HKH56FH
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2Y4B32FT2OYUDMLFPNDV2BX4HKH56FH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The return code of regmap_multi_reg_write() call related to "MDSYNC
down" sequence is shadowed by the subsequent
wait_for_completion_timeout() invocation, which is expected to time
timeout in case the write operation failed.

Let cs35l41_global_enable() return the correct error code instead of
-ETIMEDOUT.

Fixes: f5030564938b ("ALSA: cs35l41: Add shared boost feature")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/cs35l41-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 4ec306cd2f47..a018f1d98428 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1243,7 +1243,7 @@ int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l4
 		cs35l41_mdsync_down_seq[2].def = pwr_ctrl1;
 		ret = regmap_multi_reg_write(regmap, cs35l41_mdsync_down_seq,
 					     ARRAY_SIZE(cs35l41_mdsync_down_seq));
-		if (!enable)
+		if (ret || !enable)
 			break;
 
 		if (!pll_lock)
-- 
2.41.0

