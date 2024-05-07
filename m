Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A898BF098
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 01:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF02741;
	Wed,  8 May 2024 01:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF02741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715123344;
	bh=C1B5jC0QAnqRkp/KEnzDHCaQIM2O1X0DeTCyuINL+nE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a/1BNQRLiPVKJ4zFQmWU0julTjpszwt80Z2WYxVG3miyWsr1lEuPKkdUK4DBnCESn
	 4jzQ2OI2X2FpLLk+dey5nRr3ZBvgHklhpyH13ieu6D78yvnt7EkvktV628WQbNknvI
	 tDx0UfPvy0HKXe4Nd2C9m8gX2e/G4IDEAQMvSbLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BFFEF805BE; Wed,  8 May 2024 01:08:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A176F805D4;
	Wed,  8 May 2024 01:08:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02248F804FB; Wed,  8 May 2024 01:08:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82C68F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 01:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C68F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ic4lyIOL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF27261A15;
	Tue,  7 May 2024 23:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F83C4FDF5;
	Tue,  7 May 2024 23:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123286;
	bh=C1B5jC0QAnqRkp/KEnzDHCaQIM2O1X0DeTCyuINL+nE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ic4lyIOLhxCnxIkrFTgx1FTi+xp75FnFZdZlK1vO8Ff4JKXPdbHFTkURJMHSJVNhj
	 80PedrS3tEMsXqSGvX0xqvpulgnWMPcUQUeVdoxTxeYOBSeqVCXS92ZFjWeDlMXz8n
	 ELGF5uDz11HQcCNq+KDzl32h2/h/3SZL5yTBVl2JqQlSV/UbOBYNxsrB01leAQavrA
	 8l3UsEqaGysAnKRE6e+G46mPdFzyEOpDVnTMeJZItKEoWEBrzWKjCguOExLV7/Z4vq
	 LM+hOWwZkQm+K/7Nrca+2DzJ5oDMs3jbn/QsX3bU2PVbLjcK6RIK/PSnyJgO3SOkg+
	 aHE/G32x956pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 03/52] ALSA: hda: cs35l56: Exit cache-only after
 cs35l56_wait_for_firmware_boot()
Date: Tue,  7 May 2024 19:06:29 -0400
Message-ID: <20240507230800.392128-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3U4G6M3YUFRWWGMUUU7LWI2SWFV4DM6A
X-Message-ID-Hash: 3U4G6M3YUFRWWGMUUU7LWI2SWFV4DM6A
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3U4G6M3YUFRWWGMUUU7LWI2SWFV4DM6A/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit 73580ec607dfe125b140ed30c7c0a074db78c558 ]

Adds calls to disable regmap cache-only after a successful return from
cs35l56_wait_for_firmware_boot().

This is to prepare for a change in the shared ASoC module that will
leave regmap in cache-only mode after cs35l56_system_reset(). This is
to prevent register accesses going to the hardware while it is
rebooting.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://msgid.link/r/20240408101803.43183-3-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/cs35l56_hda.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 43a445bd961fb..de58a953b48d2 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -629,6 +629,8 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
 		if (ret)
 			goto err_powered_up;
+
+		regcache_cache_only(cs35l56->base.regmap, false);
 	}
 
 	/* Disable auto-hibernate so that runtime_pm has control */
@@ -978,6 +980,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 	if (ret)
 		goto err;
 
+	regcache_cache_only(cs35l56->base.regmap, false);
+
 	ret = cs35l56_set_patch(&cs35l56->base);
 	if (ret)
 		goto err;
-- 
2.43.0

