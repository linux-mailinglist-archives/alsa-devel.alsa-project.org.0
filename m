Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6A600E8E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 14:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F3F6D08;
	Mon, 17 Oct 2022 14:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F3F6D08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666008351;
	bh=vdBoVakrmxcVaXZG11R6BqgPcf2xBevlfJytSL1irk8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eq2jSN4TZOY/6DxMW0Ehv8PRDicx7zgikbPz5H4RoiQS5ivDa51PuH40mUjqj0itW
	 EzauLGuY677Uhi9FcNxSmyLJ1AG1nDpApn/kjdUJ6aHVudCymJJoWM3oYsbHEYezBf
	 cjwa9mg7ua5FjcQTIOJClD1FmwAdcDp5Z5VtISsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D36F80496;
	Mon, 17 Oct 2022 14:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B56F8025E; Mon, 17 Oct 2022 14:04:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D13F9F800E5
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 14:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13F9F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fgqhE3ZU"
Received: by mail-oi1-x229.google.com with SMTP id y72so11852087oia.3
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92eFSiRgtqq3z5EJ8KsBZ5qnISbuSueBoNETN1Cx1TA=;
 b=fgqhE3ZUdXWnC6eM1lNwjXig8oOhKp3MVcCZtIjrn6qBcCKJwAdvo3M7/iELoKQ75Q
 wcGOh5TI2SysmzYZHvYK7jFNSNRsLC+ghzvB1xNDbXB4KL+IuLkKMxvkyRDLjAryPZPw
 uP+6d14Zc7N3UduAzwE88+S21jmVIDXV2AM+s+fa2qYwPaVl2Tsabgxu68/EH0dLgFKh
 S+KYFdYUkTbLUOpgf1P1MkgDE9ohZt+PQ1dnXC2X6kkqhmDwC5CR12Z5PSp7ZFv9VZzn
 vG9zMjGc2nEOVKzYRjg3a58ftU6brAF7oy3W3gjI3Woi5ORevMN3I5fOM7VcZM4chsST
 2WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92eFSiRgtqq3z5EJ8KsBZ5qnISbuSueBoNETN1Cx1TA=;
 b=A4Dt8Ns32JvcmpORR9lXZopQow1C0YdafgctB/03Rwfk1SrcVNg/UOsiwEm1Pj6TdQ
 XgUH7X/0ViDBmyXatp5Q0M6PdJc5XPwbu6/fgpXc8VDX0TxiSWWGN3j9fUyddlWZGsFd
 yl2MiiUNidVSBl224Ycx4J0WomhTWL888Ru0l48FqPfXCkeEVN1bWRTZ+65x0RmcgKAZ
 k200podMKpzzm7S/lFoPwoyNgItp3SAd8KII7p0yP26NISnL2FHT9MY2uQNPuHaGIbER
 6ZMT+/kB73LlCEBlR3GZsF4x9EyyDG8rl6b1tdeh/i67GAJza1c8p6iAS4ltGnM1ggkr
 j91Q==
X-Gm-Message-State: ACrzQf16V9gwzyCa9Eok2fo80VN5USJB9wvP3HDnhW6yv3jiH/U3w+W1
 7+NjrIj+PpXi4RVXHqLm+wo=
X-Google-Smtp-Source: AMsMyM41jg79l77hpZPJFygjLg4+EFIdd+ccp3V91wKu43b1JYHdvyeocYzX/UgKFkPXaOXT8M9lYw==
X-Received: by 2002:aca:30c4:0:b0:355:24e0:8583 with SMTP id
 w187-20020aca30c4000000b0035524e08583mr4567774oiw.42.1666008289194; 
 Mon, 17 Oct 2022 05:04:49 -0700 (PDT)
Received: from geday ([2804:7f2:8002:5105:b46b:dcd9:d624:ab27])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a4ae611000000b00480b7efd5d9sm3292198oot.6.2022.10.17.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 05:04:48 -0700 (PDT)
Date: Mon, 17 Oct 2022 09:04:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit if
 hardware supports it
Message-ID: <Y01E5MvrnmVhnekO@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi Mark, resending this as it failed to apply in my last submission. Added
Neil Armstrong to Cc: as hopefully he will be able to better review this.

Thanks,
Geraldo Nascimento

---

Starting with version 2.10a of Synopsys DesignWare HDMI controller the
insert_pcuv bit was introduced. On RK3399pro SoM (Radxa Rock Pi N10),
for example, if we neglect to set this bit and proceed to enable hdmi_sound
and i2s2 on the device tree there will be extreme clipping of sound
output, to the point that music sounds like white noise. Problem
could also manifest as just mild cracking depending of HDMI audio
implementation of sink. Setting insert_pcuv bit (bit 2 of
aud_conf2 Audio Sample register) fixes this.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

---

v1->v2: SoC->SoM on description, better commenting, minor style changes,
	conditional application of fix for L-PCM only

--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
@@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	struct dw_hdmi *hdmi = audio->hdmi;
 	u8 conf0 = 0;
 	u8 conf1 = 0;
+	u8 conf2 = 0;
 	u8 inputclkfs = 0;
 
 	/* it cares I2S only */
@@ -101,6 +102,28 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
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
+	 * clipping depending on the HDMI audio
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
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
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
