Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E86859ECE8
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 21:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1AB786E;
	Tue, 23 Aug 2022 21:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1AB786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661284394;
	bh=BqMgt3InfDXcCa8tdgJBdYUE7HoildIkpPvdNoLPefo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RxJzQyNyslReUGjiQ0sGnsJGG6XAXTKZPUVdh7OKCYTHj3FpnZlQpYZlydt7z0GIZ
	 V0QqA9i1/RziaEw1yUo3oTr/AGMntc1kX7izh8wKFkwrCicsdv1/Px/GCyaCJZJncr
	 5RxndH4bbH7E+3M63Co8IxLNkWOlYxaUtPHmTLcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EE4F8014E;
	Tue, 23 Aug 2022 21:52:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F6BF8020D; Tue, 23 Aug 2022 21:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42BB1F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 21:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42BB1F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WIPeZM9C"
Received: by mail-vs1-xe35.google.com with SMTP id p6so15137831vsr.9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 12:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=Z8bLHSnfZm9JzvfyfFzFFlipQ5tNIVzzJYTjVAylFsw=;
 b=WIPeZM9C9okS3CiDumAtk/8PhRfyxnvt8ov1bZXIyOuQJM7psNnkrBNpd6lkCznT+d
 VK/B0g3n7ZASEQ10eOBDpFDSodAHC11SXTEkzQughTYjd6D7A3YLheyWCb93vxrHjaNQ
 SX3+8q5aO/KziUpX+5pB1yu/oYN3n2aI/qEteDLR53YrYRza0C/0LAALsLGp3uWgdOA/
 iCJr43e9eYyvjwGiiNgrcW5V1l4OHcTqR21cvKJLrkhETo/z8Mg1JnKQPd7ZUVyyoOv/
 aGpNrSRReB3zCSLtZihVbs8rO0xiEMDGvAj3+cNgGQVU5kpxPdDfvEa8QKZ6/eN0MN8a
 iREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=Z8bLHSnfZm9JzvfyfFzFFlipQ5tNIVzzJYTjVAylFsw=;
 b=Ss2zqf3mWpf8e9NlgbriQWSt7bW/NdI+0B9ScGBanmFrNiHlcgTR4zRAOL/+DgNaQI
 Fx4CUCXCOjnOCIxsjCu98i3m681IDbUhGzthTOcydxpphbFLtYK8988wQLhF7sPYqvEC
 yuzPNI0shKph7gscD9N5mF4k6VlkiWOdt+AH5Yp9eL/bM5pjQiOGIkcQyW+N4fEsT++K
 bmDnKNlMtARt96o5GF3WWAYilPKkuyTBtBcgH7EiW6fXEDBqmDJbRBTFo17y2g492v7f
 2SO7MvR/tYCKAiPR5Q4wd0NscrjfmQUdkqg4ddsYRwFFagztbj/M4iVWw5VDN0xngSeZ
 bYrw==
X-Gm-Message-State: ACgBeo3ezMpqW/IVufrOiS4XkF9dcvBSL26acaDl+HZ+NlzgVzQH0rLV
 +X4FcS2mwuEyCElWLEXUbW0=
X-Google-Smtp-Source: AA6agR4+0jpxzSAjufkwF8VAhfClNp0hKtN5QZ0GL0hdBn8Mh6nKsbIPMacPfiefrj3AukvmPBWDuw==
X-Received: by 2002:a67:fd55:0:b0:390:66fd:d7d7 with SMTP id
 g21-20020a67fd55000000b0039066fdd7d7mr3924825vsr.53.1661284326313; 
 Tue, 23 Aug 2022 12:52:06 -0700 (PDT)
Received: from geday ([2804:7f2:8006:f71:a581:5947:7302:d05f])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a056102066300b0038abb8f3164sm10988801vsf.10.2022.08.23.12.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 12:52:05 -0700 (PDT)
Date: Tue, 23 Aug 2022 16:52:10 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit if hardware
 supports it
Message-ID: <YwUv6qMUlb9WZBm7@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>, Takashi Iwai <tiwai@suse.de>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Starting with version 2.10a of Synopsys DesignWare HDMI controller the
insert_pcuv bit was introduced. On RK3399pro SoM (Radxa Rock Pi N10)
for example if we neglect to set this bit and proceed to enable hdmi_sound
and i2s2 on the device tree there will be extreme clipping of sound
output, to the point that music sounds like white noise. Problem
could also manifest as just mild cracking depending of HDMI audio
implementation of sink. Setting insert_pcuv bit (bit 2 of
aud_conf2 Audio Sample register) fixes this.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

---

v1->v2: SoC->SoM on description, better commenting, minor style changes,
	conditional application of fix for L-PCM only

--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	struct dw_hdmi *hdmi = audio->hdmi;
 	u8 conf0 = 0;
 	u8 conf1 = 0;
+	u8 conf2 = 0;
 	u8 inputclkfs = 0;
 
 	/* it cares I2S only */
@@ -101,6 +102,16 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
+	/*
+	 * dw-hdmi introduced insert_pcuv bit in
+	 * version 2.10a.
+	 *
+	 * This single bit (bit 2 of HDMI_AUD_CONF2)
+	 * when set to 1 will enable the insertion of the PCUV
+	 * (Parity, Channel Status, User bit and Validity)
+	 * bits on the incoming audio stream.
+	 * 
+	 * Support is limited to Linear PCM audio. If
+	 * neglected, the lack of valid PCUV bits
+	 * on L-PCM streams will cause anything from
+	 * mild cracking to full blown extreme
+	 * clipping depending of HDMI audio
+	 * implementation of the sink.
+	 *
+	 */
+
+	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
+			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
+		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
+
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
 	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
@@ -109,6 +120,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
 	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
+	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
 
 	return 0;
 }
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -931,6 +931,11 @@ enum {
 	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
 	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
 
+/* AUD_CONF2 field values */
+	HDMI_AUD_CONF2_HBR = 0x01,
+	HDMI_AUD_CONF2_NLPCM = 0x02,
+	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
+
 /* AUD_CTS3 field values */
 	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
 	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,
