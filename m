Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB610D61C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 14:29:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78ABE16C7;
	Fri, 29 Nov 2019 14:28:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78ABE16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575034157;
	bh=qdBFPTt9I65NSmQeexjuLpc89/32m+yMUArSezZXbzQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e4trv92kNo5dzreiWVq4V4LiYUpvku1Ye1Ss4vKbpPox5lz0UO7eBR721AscjWGxr
	 eRqjimflmJsQc2n7reuT3F8qW/ivN05mw3yzeqiUQcGcYMkzvkErJcKi+ZWuqGvUIe
	 koBNqNQYMjj2vFlVTudsI2eQEALKkOv7jPxAYyZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6121F80141;
	Fri, 29 Nov 2019 14:27:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4625FF80141; Fri, 29 Nov 2019 14:27:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D553F800C2
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 14:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D553F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="s9zfE0mZ"
Received: by mail-wr1-x443.google.com with SMTP id a15so35194129wrf.9
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 05:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wLfDQ5ajtCtjsZut+MHDTVTGUfN92CA1VMVGdXe6/IY=;
 b=s9zfE0mZ46H/YCCF6SFMx+5kauV6ZRd5G/mkAxn2WUQ9jTi5/ICJ5UsjoHoaGzf0yt
 jICztwFjkmnOnPqaCM1Bofcnub9d9gBi8feCQ89IzLhHwezzaZrvWll2Kg3eZbKh3L2G
 QJo3cTnzarF65Hl+DfAIe41Doid3kjkXJULFBmzUcOW1juGWi7iPS1GG/PUovb4enixL
 uCELOoWEKc0QOjkHvHYvVj2GQrtAF1DiTAsxRShpfgDKDxV2LpEH4TQ2/vh7Ln5Oxcom
 U50W/UEB2WFlnp+fmicacfnyTc1ht0zbXtSu/wbQAJEdpjoey5NM0VM9DWbBGNOJF4/o
 suSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wLfDQ5ajtCtjsZut+MHDTVTGUfN92CA1VMVGdXe6/IY=;
 b=OA/sAkY3wXJjFH9OYJ0m7XY2Jw5ReuH1efhPuA8ZHSsc9otdMWTG2s6X4E6zCOehDv
 CMrsyhP/mW/r3t5CS6PMDPBPixUifOcd6c9OuJPZBlWHf4TC7rS0lYGht7setZgfLwzS
 snBzNWURLdf8phZwLtumSWPwR/v4EkzA3dKWk+AY8CoowlR6+aKJHjwGiwAsTQ1v7jXY
 NxZBUrmv4hMQwwbqR2GxiUlaYDm7vBw39g6pbf+Z4+IOOEnvlaldqrNkB28E/8Fh3DVE
 F7dLmjvgiv4b9XgWC9XNS/WJwOikRO1cYIxlA7ggKugWb2C0m77XuxnX5aZO0HPJbmFM
 bSXQ==
X-Gm-Message-State: APjAAAW/cI4DZcx69NUSTBeNHW7PZGCJbMIHfhrVtcRamIYNbpcE0De5
 Vgp0WEBT3BWftJMdpigyWttrD+N4QPY=
X-Google-Smtp-Source: APXvYqxFoXoj+7jxE3KhBSeo0GazT3SDB/RaZL6lwkxuZVlBQzZBqVBDBtYN+Vri/IDnNCJ4KoCg5w==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr8447343wrq.37.1575034045218;
 Fri, 29 Nov 2019 05:27:25 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id x8sm27151530wrm.7.2019.11.29.05.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 05:27:24 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>, "Andrew F. Davis" <afd@ti.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Fri, 29 Nov 2019 16:27:19 +0300
Message-Id: <20191129132719.11603-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Chris Healy <cphealy@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: tlv320aic31xx: Add Volume Soft Stepping
	control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Chip supports soft stepping of volume changes and it is enabled by
default.

This patch adds a control for it, so it could be either made slower
(two sample periods per step instead of one), or disabled.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 8 ++++++++
 sound/soc/codecs/tlv320aic31xx.h | 3 ---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index d6c462f21370..31daa60695bd 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -275,6 +275,12 @@ static const char * const hp_rampup_step_text[] = {
 static SOC_ENUM_SINGLE_DECL(hp_rampup_step_enum, AIC31XX_HPPOP, 1,
 	hp_rampup_step_text);
 
+static const char * const vol_soft_step_mode_text[] = {
+	"fast", "slow", "disabled" };
+
+static SOC_ENUM_SINGLE_DECL(vol_soft_step_mode_enum, AIC31XX_DACSETUP, 0,
+	vol_soft_step_mode_text);
+
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -6350, 50, 0);
 static const DECLARE_TLV_DB_SCALE(adc_fgain_tlv, 0, 10, 0);
 static const DECLARE_TLV_DB_SCALE(adc_cgain_tlv, -2000, 50, 0);
@@ -306,6 +312,8 @@ static const struct snd_kcontrol_new common31xx_snd_controls[] = {
 	 */
 	SOC_ENUM("HP Output Driver Power-On time", hp_poweron_time_enum),
 	SOC_ENUM("HP Output Driver Ramp-up step", hp_rampup_step_enum),
+
+	SOC_ENUM("Volume Soft Stepping", vol_soft_step_mode_enum),
 };
 
 static const struct snd_kcontrol_new aic31xx_snd_controls[] = {
diff --git a/sound/soc/codecs/tlv320aic31xx.h b/sound/soc/codecs/tlv320aic31xx.h
index 83a8c7604cc3..0523884cee74 100644
--- a/sound/soc/codecs/tlv320aic31xx.h
+++ b/sound/soc/codecs/tlv320aic31xx.h
@@ -218,9 +218,6 @@ struct aic31xx_pdata {
 #define AIC31XX_GPIO1_ADC_MOD_CLK	0x10
 #define AIC31XX_GPIO1_SDOUT		0x11
 
-/* AIC31XX_DACSETUP */
-#define AIC31XX_SOFTSTEP_MASK		GENMASK(1, 0)
-
 /* AIC31XX_DACMUTE */
 #define AIC31XX_DACMUTE_MASK		GENMASK(3, 2)
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
