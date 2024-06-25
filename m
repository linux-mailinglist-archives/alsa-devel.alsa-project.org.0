Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3591DF4D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC24A2BC1;
	Mon,  1 Jul 2024 14:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC24A2BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837069;
	bh=RwEbAitLFL9PC/JlGA/nlGvdPfzpJSsLUjUj4Z2NcZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=va9YoQv3+lq5S32epTXM1jlrFTahuZpQ0WBAsbvbIJoNfUknl56UvjlRVoJSGedo2
	 M7QfYYxC6DVQyvm5P1K3bRTY7c7yCqWEw7IG4NPg+Ba2JxUaRmNW3v9dEDuqlLpyrl
	 U11PITVjFf2DzyGzbDIab/FKriD7M91USJuxlf/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0D16F898FF; Mon,  1 Jul 2024 14:22:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2C9DF898F7;
	Mon,  1 Jul 2024 14:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A28BF80495; Tue, 25 Jun 2024 10:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn
 [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F07FF80154
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 10:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F07FF80154
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.75.30.239) with ESMTP
	id 667A82A40003052C; Tue, 25 Jun 2024 16:41:14 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: BEDC5FDE2F4A442898948933E9459461
X-SMAIL-UIID: BEDC5FDE2F4A442898948933E9459461-20240625-164114
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 4/4] ASoC: codecs: ES8326: regcache_sync error issue
Date: Tue, 25 Jun 2024 16:41:07 +0800
Message-Id: <20240625084107.3177-5-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240625084107.3177-1-zhangyi@everest-semi.com>
References: <20240625084107.3177-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6VIXDSTQW5ZHA5ALTYWB5MBECXGN2WMU
X-Message-ID-Hash: 6VIXDSTQW5ZHA5ALTYWB5MBECXGN2WMU
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VIXDSTQW5ZHA5ALTYWB5MBECXGN2WMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are several registers that should be read-only registers.
If these registers are written while synchronizing the register values,
the codec will enter an error state.So we create es8326_writeable_register,
and set these registers to false

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 51ca17b779c2..d665fdbfc94f 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -329,11 +329,29 @@ static bool es8326_volatile_register(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool es8326_writeable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES8326_BIAS_SW1:
+	case ES8326_BIAS_SW2:
+	case ES8326_BIAS_SW3:
+	case ES8326_BIAS_SW4:
+	case ES8326_ADC_HPFS1:
+	case ES8326_ADC_HPFS2:
+		return false;
+	default:
+		return true;
+	}
+}
+
 static const struct regmap_config es8326_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0xff,
+	.use_single_read = true,
+	.use_single_write = true,
 	.volatile_reg = es8326_volatile_register,
+	.writeable_reg = es8326_writeable_register,
 	.cache_type = REGCACHE_RBTREE,
 };
 
-- 
2.17.1

