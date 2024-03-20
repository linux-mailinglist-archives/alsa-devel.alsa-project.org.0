Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4B98812F1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:07:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CDB2BF0;
	Wed, 20 Mar 2024 15:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CDB2BF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943662;
	bh=nA5ArH96RmDb6mxS5UKlQ6WSY4Omr7Y0AcKquvjZe/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ugvbn0NWYZTLuozE3j3h8IE99MY94u2EgEkyy0Wi7SZkX0eY7LtpAHCz7aRbwS3kS
	 1lFgpd2wuC1arysSc1mTBwHmMweJ5T1xIDeomBEv7BbssahZUTcwxf58R5QFXbzAX9
	 JVSIrUGak0a7DTPGHCn4CLFQ/M+LmtbWJoqS7rIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B30BF897A0; Wed, 20 Mar 2024 15:01:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB73F89798;
	Wed, 20 Mar 2024 15:01:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CDA5F802DB; Wed, 20 Mar 2024 09:30:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-50.sinamail.sina.com.cn (mail78-50.sinamail.sina.com.cn
 [219.142.78.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 270B0F80563
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 09:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 270B0F80563
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.234) with ESMTP
	id 65FA9E9500036383; Wed, 20 Mar 2024 16:30:17 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: FB6F3D0C5CBE412B920FB698DBE11EB3
X-SMAIL-UIID: FB6F3D0C5CBE412B920FB698DBE11EB3-20240320-163017
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 2/2] ASoC: codecs: ES8326: Delete unused REG_SUPPLY
Date: Wed, 20 Mar 2024 16:30:12 +0800
Message-Id: <20240320083012.4282-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240320083012.4282-1-zhangyi@everest-semi.com>
References: <20240320083012.4282-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DVVX3PPSEI25GIXTB2M3EW27JALG53FL
X-Message-ID-Hash: DVVX3PPSEI25GIXTB2M3EW27JALG53FL
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVVX3PPSEI25GIXTB2M3EW27JALG53FL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

REG_SUPPLY mutes the DAC when switching between
HDMI and speaker, so remove it to fix the mute issues

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 635320c86c00..e8526844337d 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -292,11 +292,6 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("LHPMIX", ES8326_DAC2HPMIX, 7, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("RHPMIX", ES8326_DAC2HPMIX, 3, 0, NULL, 0),
 
-	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "HPOR Supply", ES8326_HP_CAL,
-			 4, 7, 0, 0),
-	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "HPOL Supply", ES8326_HP_CAL,
-			 0, 7, 0, 0),
-
 	SND_SOC_DAPM_OUTPUT("HPOL"),
 	SND_SOC_DAPM_OUTPUT("HPOR"),
 };
@@ -316,9 +311,6 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 	{"LHPMIX", NULL, "Left DAC"},
 	{"RHPMIX", NULL, "Right DAC"},
 
-	{"HPOR", NULL, "HPOR Supply"},
-	{"HPOL", NULL, "HPOL Supply"},
-
 	{"HPOL", NULL, "LHPMIX"},
 	{"HPOR", NULL, "RHPMIX"},
 };
-- 
2.17.1

