Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE41063F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 11:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA14F16CD;
	Wed,  1 May 2019 11:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA14F16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556701590;
	bh=J7Iyd3jYJ7ndrr/EilZ8S814REgzf60apAXWA0XLNtE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AY7tF21UxGnGiZA77rSrGeCdqnfkn0NRNGEJa+PCJirY8icDyHYeAkmaZezjVF8+0
	 o8osAWIrV3uEc3Hu6ie60of8FG4LRceMM9i4EmNEn8W5+CHgzwJAMtmpmuXRJSsgrP
	 PdQOEDINE8H9/5IpSjOGKMuuATpLQ7Qx70H6Th6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10DC7F896B6;
	Wed,  1 May 2019 11:04:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 956B3F896B7; Wed,  1 May 2019 11:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2575DF8065C
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 11:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2575DF8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com
 header.i=@timesys-com.20150623.gappssmtp.com header.b="JDPD1J3+"
Received: by mail-qk1-x741.google.com with SMTP id m137so9861962qke.3
 for <alsa-devel@alsa-project.org>; Wed, 01 May 2019 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qoj+Gg0Ie+V2P3vdKcUMBKk9Ht4HM0XQ72NvNmgC6k=;
 b=JDPD1J3+a4YeIuGvGMAoqmYEA5npUqAW61TV1IUuFuKdv8/Kfvk1fUxt3vUDSnR2AQ
 lCPhm0cdA04neXkMxUyLtixjjaqWLS4+xdvOG5cUx2dxILtHVmewYzAx9am6ZjivhAsS
 kmBVsuSjuHiSNeO12VGK3Y+Ce09Amgc9B1TvUh5Cze6+MsEso/x+PwclTAld53iPDcYa
 31TGfRdmMhBSURYdYPQL0sMzyXYFLkj64ldCMMuYRHcd6qd9KnRLN0ZmmvrvOaeqD1zi
 AVJPZ+b79EWruZo8sXiCDE4D8kkMhmdPA093YN8vjTKiMyQWPxoyBAjNiPjjWBkdltqw
 vv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qoj+Gg0Ie+V2P3vdKcUMBKk9Ht4HM0XQ72NvNmgC6k=;
 b=Jb+tptRt5EtBrjL+AQv6c6qbAqmvvPmiF7rjd0RMWJmfxM5oxb7RYTfNF4Uorg7Yl7
 O8n6DPMQzpXOqMX1SULs9qIfc8RGU28Qgq+pfdZLvh1qAz3bJsR4fbwu/ZWuyuNq8jDS
 4qsJMuqSD8DLFaYD6hgDeOtw48bie1CQ/9Q2wWHNhnVRhFejJoBd0l5Psm4NdZwIoOp4
 saMeapp+e7otOveIkpPGjYO01ecVCs8gh4SjY29ELZlYlmlgmelxvhTjheZYDMc6csZE
 nRYmTDcxiJYRcIpkycERb27jKFT6pHrJ6v+3nyW40fgIugzmbMTyMr3Q5JnNPC8/Am2P
 wwYQ==
X-Gm-Message-State: APjAAAXzJ2/nraNzplE82LVGPLfpbwjCrEfIs3XqYvHamKXYvA2kyEbh
 lJn+6I5xm1SDWlpYg3+9Wj7+Tg==
X-Google-Smtp-Source: APXvYqwWtu0OPXTZRNoHqHJOZ0MQiw4981/F7mq00OKu19obOvhOzJapf2aq4cJqA7r6h4cQuXnLrQ==
X-Received: by 2002:a37:5a46:: with SMTP id o67mr53956614qkb.31.1556701474032; 
 Wed, 01 May 2019 02:04:34 -0700 (PDT)
Received: from ts-system.timesys.com ([49.204.220.208])
 by smtp.gmail.com with ESMTPSA id l15sm11000984qti.12.2019.05.01.02.04.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 01 May 2019 02:04:33 -0700 (PDT)
From: Logesh Kolandavel <logesh.kolandavel@timesys.com>
To: support.opensource@diasemi.com
Date: Wed,  1 May 2019 14:34:24 +0530
Message-Id: <20190501090424.28861-1-logesh.kolandavel@timesys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, logesh.kolandavel@timesys.com,
 Adam.Thomson.Opensource@diasemi.com
Subject: [alsa-devel] [PATCH v2] ASoC: da7213: fix DAI_CLK_EN register bit
	overwrite
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

From: Logesh <logesh.kolandavel@timesys.com>

If the da7213 codec is configured as Master with the DAPM power down
delay time set, 'snd_soc_component_write' function overwrites the
DAI_CLK_EN bit of DAI_CLK_MODE register which leads to audio play
only once until it re-initialize after codec power up.

Signed-off-by: Logesh <logesh.kolandavel@timesys.com>
---
Changes in v2:
-Include the mask DA7213_DAI_BCLKS_PER_WCLK_MASK

 sound/soc/codecs/da7213.c | 5 ++++-
 sound/soc/codecs/da7213.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 92d006a5283e..425c11d63e49 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1305,7 +1305,10 @@ static int da7213_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	/* By default only 64 BCLK per WCLK is supported */
 	dai_clk_mode |= DA7213_DAI_BCLKS_PER_WCLK_64;
 
-	snd_soc_component_write(component, DA7213_DAI_CLK_MODE, dai_clk_mode);
+	snd_soc_component_update_bits(component, DA7213_DAI_CLK_MODE,
+			    DA7213_DAI_BCLKS_PER_WCLK_MASK |
+			    DA7213_DAI_CLK_POL_MASK | DA7213_DAI_WCLK_POL_MASK,
+			    dai_clk_mode);
 	snd_soc_component_update_bits(component, DA7213_DAI_CTRL, DA7213_DAI_FORMAT_MASK,
 			    dai_ctrl);
 	snd_soc_component_write(component, DA7213_DAI_OFFSET, dai_offset);
diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
index 5a78dba1dcb5..9d31efc3cfe5 100644
--- a/sound/soc/codecs/da7213.h
+++ b/sound/soc/codecs/da7213.h
@@ -181,7 +181,9 @@
 #define DA7213_DAI_BCLKS_PER_WCLK_256				(0x3 << 0)
 #define DA7213_DAI_BCLKS_PER_WCLK_MASK				(0x3 << 0)
 #define DA7213_DAI_CLK_POL_INV					(0x1 << 2)
+#define DA7213_DAI_CLK_POL_MASK					(0x1 << 2)
 #define DA7213_DAI_WCLK_POL_INV					(0x1 << 3)
+#define DA7213_DAI_WCLK_POL_MASK				(0x1 << 3)
 #define DA7213_DAI_CLK_EN_MASK					(0x1 << 7)
 
 /* DA7213_DAI_CTRL = 0x29 */
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
