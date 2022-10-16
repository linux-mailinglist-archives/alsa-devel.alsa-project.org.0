Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658B95FFFA4
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:29:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEEEA61A4;
	Sun, 16 Oct 2022 15:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEEEA61A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665926970;
	bh=xMWR5+J01xpRRN/VYdoVF9ZJ1/tLH1hznGXJwjP4VQI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G1GL0E0HRf0uNhDqbs4QOjim1AwsVzxBYz00HxvNr5PGs+ZJg1UU1pG8iACyQdevI
	 toPq/eHlks3FpG/kcee3P7L2/BUlQJkB2NTUhL0dVktceLngTkhJ4Y1f35bJv9XuzL
	 jCk/9RuI2HA5SguPRSF/Bugn+JPqHvIaFHpEm9o8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BEDAF80542;
	Sun, 16 Oct 2022 15:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5190F8027C; Sun, 16 Oct 2022 15:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODYSUB_16,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33FE6F804B4
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33FE6F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kJ4NshSV"
Received: by mail-ed1-x536.google.com with SMTP id a67so12611960edf.12
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQsANxIEHACjEO789UfrDxMr8VcVkScq/x+QZ4UQMEA=;
 b=kJ4NshSVOAuSzJGz7Jj9SJ0xMOEi4H/WlYotPjjJejZwXBfKwe4D3mFeklshKLJi8L
 6lKCCypWJrFHTNrH127vr77kV0vifbz2zlgt2b37KKhI0PzdAGn5VLNDFaaTuqmbrX5e
 x+7riGpjdchVyrlR2P8JgHKB0T87pb/xCaiV4GPgAN5uxNwNs6njn9Rqhjo+We4mBKgv
 W2dof6GFySiw0JHaFysHlrhWFeVydnAUY5zHs+yAv9wvzIcc68Z4E5f3RXBPgf/jWPe2
 Sp3tXYuXlgzwm497Zx/EzipZu3TjEOLazm4vW3m24a6k6nQ3RUrR8WeLrThXidy9tvtJ
 nOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQsANxIEHACjEO789UfrDxMr8VcVkScq/x+QZ4UQMEA=;
 b=3FrJ+nkUaPm8SnPVef3ai8KB7DZI5voc2uDbu6TysV/NMtPxqc4chCddQqJIOumNhw
 lQRm9Rhmmo13GTvTLDKiupHOr5YHEnzglkB72/OscnC5QMX0LO07KxwXJgdnO5rvGIql
 nyzw16SlW8e5IzRGW4lb6t3NRczi/GoD3i/Dpz4EDu39OXMYLAfLwFIhdJy/HYXPh/S0
 qyZ1YvlSVMjpiUsMFjqH5OmyQjbwVYFlxvaURepa8zoH2gY/IJ2cSLMAyMd5hsulu1Bc
 2/koJZ2LWwUu3L9aflyEXj2SX8s7VCxMXoraXTIfOzBufT+SR+76q3L2s78Ms0HyrViU
 x51Q==
X-Gm-Message-State: ACrzQf0xCFPv5rnI0s/gZmgbenTW1w31G3pqbiU+OX7FBtofg8Eb4lxj
 za3qneFY2xH2m9NPcb4WC5c=
X-Google-Smtp-Source: AMsMyM5GojADR3ig+RebZhArnx0qPJhabSJNCjSJnR1XJOqXg7ij25ZKfZGxwZkQ/3Rv0Iw6v5sMmg==
X-Received: by 2002:a05:6402:35c9:b0:45c:de2e:ae1c with SMTP id
 z9-20020a05640235c900b0045cde2eae1cmr6163562edc.393.1665926866448; 
 Sun, 16 Oct 2022 06:27:46 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:45 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 2/7] ASoC: codecs: jz4725b: fix reported volume for Master
 ctl
Date: Sun, 16 Oct 2022 16:26:43 +0300
Message-Id: <20221016132648.3011729-3-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221016132648.3011729-1-lis8215@gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

DAC volume control is the Master Playback Volume at the moment
and it reports wrong levels in alsamixer and other alsa apps.

The patch fixes that, as stated in manual on the jz4725b SoC
(16.6.3.4 Programmable attenuation: GOD) the ctl range varies
from -22.5dB to 0dB with 1.5dB step.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index cc7a48c96..72549ee2e 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -142,8 +142,8 @@ struct jz_icdc {
 	struct clk *clk;
 };
 
-static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(jz4725b_dac_tlv, -2250, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(jz4725b_line_tlv, -1500, 600);
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_dac_tlv, -2250, 150, 0);
 
 static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 	SOC_DOUBLE_TLV("Master Playback Volume",
-- 
2.36.1

