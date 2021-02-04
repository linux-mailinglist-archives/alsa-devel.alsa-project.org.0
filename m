Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E330E9D7
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 03:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D6C1706;
	Thu,  4 Feb 2021 03:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D6C1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612404192;
	bh=Zdc028LRmUn6mshMdFcozhIa0LShLuwiFR6/LVUxZ1c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VxRAc2zRIAk7vOF2xNq1qu8X+xnCsNbJ89m27UbuDe1rrIF2plyWrG3HokrHdmFVG
	 hKJ58PIRxhI7r2OUoqAQ/IVvGx1P94dAczyVb2JLZSRwp7OFt/n9jrVY6LRYVJLTuY
	 gF/plBY2xBbJwSwokaEvcJuu8kYDxuowEwK7u81E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5865AF8016E;
	Thu,  4 Feb 2021 03:00:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8706F80275; Thu,  4 Feb 2021 03:00:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 935ADF8015A
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 03:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 935ADF8015A
IronPort-SDR: eprORDBaXyyzxCpJNx9SUgi/UD82+tiqJtrHDH2fVSGWfK2WTGiGu6h440ALPZnE1tCq4nt3Jb
 PPiLFrsXBJbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="245227981"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="245227981"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 18:00:39 -0800
IronPort-SDR: A8XVUBdFeSSvVAWbvehw9GoAaQTlau/YoOlZZLL5j1G0/LQGY0izMNJlS81qaL6exJKMCqnDLN
 RL2leKTGiifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="433712037"
Received: from jsia-hp-z620-workstation.png.intel.com ([10.221.118.135])
 by orsmga001.jf.intel.com with ESMTP; 03 Feb 2021 18:00:37 -0800
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC 2/4] drm: bridge: adv7511: Support I2S IEC958 encoded PCM
 format
Date: Thu,  4 Feb 2021 09:42:56 +0800
Message-Id: <20210204014258.10197-3-jee.heng.sia@intel.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210204014258.10197-1-jee.heng.sia@intel.com>
References: <20210204014258.10197-1-jee.heng.sia@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Support IEC958 encoded PCM format for ADV7511 so that ADV7511 HDMI
audio driver can accept the IEC958 data from the I2S input.

Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h       | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index a9bb734366ae..05e3abb5a0c9 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -191,6 +191,7 @@
 #define ADV7511_I2S_FORMAT_I2S			0
 #define ADV7511_I2S_FORMAT_RIGHT_J		1
 #define ADV7511_I2S_FORMAT_LEFT_J		2
+#define ADV7511_I2S_IEC958_DIRECT		3
 
 #define ADV7511_PACKET(p, x)	    ((p) * 0x20 + (x))
 #define ADV7511_PACKET_SDP(x)	    ADV7511_PACKET(0, x)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 45838bd08d37..61f4a38e7d2b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -101,6 +101,10 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 	case 20:
 		len = ADV7511_I2S_SAMPLE_LEN_20;
 		break;
+	case 32:
+		if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
+			return -EINVAL;
+		fallthrough;
 	case 24:
 		len = ADV7511_I2S_SAMPLE_LEN_24;
 		break;
@@ -112,6 +116,8 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 	case HDMI_I2S:
 		audio_source = ADV7511_AUDIO_SOURCE_I2S;
 		i2s_format = ADV7511_I2S_FORMAT_I2S;
+		if (fmt->bit_fmt == SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
+			i2s_format = ADV7511_I2S_IEC958_DIRECT;
 		break;
 	case HDMI_RIGHT_J:
 		audio_source = ADV7511_AUDIO_SOURCE_I2S;
-- 
2.18.0

