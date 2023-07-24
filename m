Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C075E640
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83FE8844;
	Mon, 24 Jul 2023 03:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83FE8844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161400;
	bh=d4eXRz0DdDLvFLaxxi/lCZokUOFZ/nt3xxZcPl9Zuo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UU4Ja6enSdWgwBwXip5IqA7rkx3TAMvXUcIHTh+oJubO7hkwA5/Vps1o9O5To+OxF
	 EMFRtoizbNj4DR9D4SYpswnlhRiOGXrVrz8kWboR1tFUtHvH1sZBZf3MWXIyUnouvo
	 X9SwKsY/NMZoFBLPOCRdTr/fw5yTNvS2mpXhAj+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 092F8F80571; Mon, 24 Jul 2023 03:15:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28DDDF8055C;
	Mon, 24 Jul 2023 03:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B451F8053B; Mon, 24 Jul 2023 03:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BD7DF80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BD7DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nv9B7ec5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40F5760F0C;
	Mon, 24 Jul 2023 01:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E122C433C9;
	Mon, 24 Jul 2023 01:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161282;
	bh=d4eXRz0DdDLvFLaxxi/lCZokUOFZ/nt3xxZcPl9Zuo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nv9B7ec5jSFyOeJwCgCS2XKMXG/43j7xqHWI19hJjSHfPupRzjcT4zcm153cM8K2M
	 RU7oBbrlHipoWzRO1O6wRpK1sirp4SFneBSEjWMPtUcXZ1Ms7nE6ndz7j8f0Pm80e+
	 gzklUDYYqw3X6O+hIy9FDCRRmu/F70mz7sJkmL1kMcijAoKExsnKW9cInJcBchddMZ
	 5CszfXw+zFSnXEWLtNshjS0DhY7q8UZV/6wGQJvh8MOYbFB1YAHxWDBJDu61iuY/IU
	 shbKsvXVf8PjtJR8TCXKFUE/yguFQF1oNzh3rK3/X9Tx3QzS+r0cC5I4eFReNSBjZW
	 hqjIQfiVN6Fsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Subject: [PATCH AUTOSEL 6.4 13/58] ASoC: cs35l56: Move DSP part string
 generation so that it is done only once
Date: Sun, 23 Jul 2023 21:12:41 -0400
Message-Id: <20230724011338.2298062-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E4VAOWBHCDFKSR576N6BXV24P45DHAOU
X-Message-ID-Hash: E4VAOWBHCDFKSR576N6BXV24P45DHAOU
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4VAOWBHCDFKSR576N6BXV24P45DHAOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

[ Upstream commit 608f1b0dbddec6b2fd766c10bcce2b651995e936 ]

Each time we go through dsp_work() it does a devm_kasprintf() to
allocate memory to hold the part name string. It's not strictly a memory
leak because devm will free it all if the driver is removed. But we keep
allocating more and more memory to hold the same string.

Move the allocation so that it is performed after the version and
secured state information is gathered and handle allocation errors.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://lore.kernel.org/r/Message-Id: <20230518150250.1121006-2-rf@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l56.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index e0d2b9bb23262..f3fee448d759e 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -834,12 +834,6 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	if (!cs35l56->init_done)
 		return;
 
-	cs35l56->dsp.part = devm_kasprintf(cs35l56->dev, GFP_KERNEL, "cs35l56%s-%02x",
-					   cs35l56->secured ? "s" : "", cs35l56->rev);
-
-	if (!cs35l56->dsp.part)
-		return;
-
 	pm_runtime_get_sync(cs35l56->dev);
 
 	/*
@@ -1505,6 +1499,12 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	dev_info(cs35l56->dev, "Cirrus Logic CS35L56%s Rev %02X OTP%d\n",
 		 cs35l56->secured ? "s" : "", cs35l56->rev, otpid);
 
+	/* Populate the DSP information with the revision and security state */
+	cs35l56->dsp.part = devm_kasprintf(cs35l56->dev, GFP_KERNEL, "cs35l56%s-%02x",
+					   cs35l56->secured ? "s" : "", cs35l56->rev);
+	if (!cs35l56->dsp.part)
+		return -ENOMEM;
+
 	/* Wake source and *_BLOCKED interrupts default to unmasked, so mask them */
 	regmap_write(cs35l56->regmap, CS35L56_IRQ1_MASK_20, 0xffffffff);
 	regmap_update_bits(cs35l56->regmap, CS35L56_IRQ1_MASK_1,
-- 
2.39.2

