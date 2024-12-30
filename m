Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1976F9FE216
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2024 03:54:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8A8604DD;
	Mon, 30 Dec 2024 03:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8A8604DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735527297;
	bh=NvgY9XnDCdrDJIJE3XugzNRdBqJYwXldW+nX5bZhU54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HTdrUADyuDbFCzL6ZBwuG1LJlu1qGIfUqIP+hnBAiUWyM9EwJnRo5Egarq/ptApd8
	 UxCbZwOe0us5lK/bsJRQAEy1xWxJPjIhakH0gMcSGOZT5+oBUm06FXanj1pxL4Qvgp
	 K72+wKhWkfUTYDw2xv/m2JNGQtgv7QpwFXuTSMq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EB68F805BA; Mon, 30 Dec 2024 03:54:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63058F805BD;
	Mon, 30 Dec 2024 03:54:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FCC7F80508; Mon, 30 Dec 2024 03:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL_A
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D55C1F800FE
	for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2024 03:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D55C1F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MxilkXIL
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21644aca3a0so13648725ad.3
        for <alsa-devel@alsa-project.org>;
 Sun, 29 Dec 2024 18:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735527255; x=1736132055;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hOCNzn1u26zfwC5EVmnNPt6JsnGAZAdQcQkczE5MOI=;
        b=MxilkXILFLyjG6oy/bipsLi3ut+4niEZbpW0wOT7GnFtaKvncpPr2P2+yTH6R+H0AR
         mXwwN6Suh9Lvfd6SugaPe60l+piVzCk877Pn/djp9hMcTkUOfMJkzyCKytpOdXg87hjR
         2dvaDf7j9ejUTZhA5l2IXdV+3y1Fgv0vaW37/XEJISZSLCx/1c56/FzzHg7GVlt+3gXY
         hkC5pT+zNiCoUZl5OwXuLw1PZItLBVpPcYE+Yj2iR2Z76c9Z8Mis7c8f6DGbFGgJFas8
         /ndlzgCzp2FoitFc1dsdINtlAZlP80Z9jysiU+KBc83crByMqeB2EAFgCcZbd/xbMGDl
         neRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735527255; x=1736132055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hOCNzn1u26zfwC5EVmnNPt6JsnGAZAdQcQkczE5MOI=;
        b=eFT1iTkd8gxF2PQmbUTZEJp1aUOmrRmFlWz4rcHGaBGvgq8GfevMEGXCJXrkvZm/dc
         zUPyLMmmGMuzkrLUZO+BrwgDadSw9qqJlkJWyEriKlWJGiaExUONEfUCE+O42w2jxO0Z
         V2X1F8+MMA40PgtHOJajneU2JD3GNeTYwyzD/v8/hN0t/JmH3zT+4+WXorEAnn7r8Cfd
         sCbawBjjQmByvV2MU9tYmPMZUJobhUA78n+F4gOPsMf6m0q4TowJQV98QWcALLbNFeAF
         78citICvCJEYrnnJASfkhDw/jzyx+lMc7p1onw2RrHyDXm4tNxuKAbhtZM6cCALM4vQp
         Lpmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjKAWz5XQ5tN4CGpWfh5bYOy2UWH8GQ9Sk3Z+dbeDTvAoSm6P9Iwj6w0zATwkd0cp3l8B8id5RjiI5@alsa-project.org
X-Gm-Message-State: AOJu0Yx8h+Dyqv28fJvQpl+PgLDs1T/H80zBVaBdZ/P1ygolv0t/Lqfh
	KZpPK9RomnAVmyJ4+CtnejoqUJC8wHm7MjDTu8rtkmHtVpKngPkL
X-Gm-Gg: ASbGnctIHp8AzqvkabUas6uRO0QDta7NOO3CpxDQlUxiN6v7iukAU8CO9+RC9LXREox
	z0Ym47IAXKjs1fyikWHiyK972g9hF0TsAaAw5T6EEnkziH0Ul4A2FbSMeR6UxNmH2GBp791cSC4
	JGj6BlL/yoQo6tmm9uoYV/IoQD664y2iK0wGVtSWET6pxb1FIRgy5r37nS4v89S350tIO0INgj0
	OUGy+nsP+E5wWOe2wtkKTW7SxXI3npkLe2W57kKq0OSLkfY/Ad/BPPJ
X-Google-Smtp-Source: 
 AGHT+IHj/Byn6Z/TryL91PlljX3v7lj8d0vU2WTjSaQqQP3l1D7Zl9YFQte4EjHg13nicR1o+Va6Sg==
X-Received: by 2002:a17:902:d2c9:b0:215:a3fd:61f5 with SMTP id
 d9443c01a7336-219e6e8917fmr452694535ad.5.1735527254984;
        Sun, 29 Dec 2024 18:54:14 -0800 (PST)
Received: from geday ([2804:7f2:800b:1740:5148:eadd:af21:83dc])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc964f09sm169823335ad.26.2024.12.29.18.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 18:54:14 -0800 (PST)
Date: Sun, 29 Dec 2024 23:54:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	ALSA-devel <alsa-devel@alsa-project.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sound <linux-soundl@vger.kernel.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <Z3ILTUU-t6Pb2x8O@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
Message-ID-Hash: CTO5TLJWFDUUXAR3DLB2KHVGISE4HXG6
X-Message-ID-Hash: CTO5TLJWFDUUXAR3DLB2KHVGISE4HXG6
X-MailFrom: geraldogabriel@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CTO5TLJWFDUUXAR3DLB2KHVGISE4HXG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 13, 2024 at 10:12:39PM +0100, Hugh Cole-Baker wrote:
> Hi Geraldo, and apologies for resurrecting a 2 year old thread...
> 
> On 17/10/2022 13:04, Geraldo Nascimento wrote:
> > Hi Mark, resending this as it failed to apply in my last submission. Added
> > Neil Armstrong to Cc: as hopefully he will be able to better review this.
> > 
> > Thanks,
> > Geraldo Nascimento
> > 
> > ---
> > 
> > Starting with version 2.10a of Synopsys DesignWare HDMI controller the
> > insert_pcuv bit was introduced. On RK3399pro SoM (Radxa Rock Pi N10),
> > for example, if we neglect to set this bit and proceed to enable hdmi_sound
> > and i2s2 on the device tree there will be extreme clipping of sound
> > output, to the point that music sounds like white noise. Problem
> > could also manifest as just mild cracking depending of HDMI audio
> > implementation of sink. Setting insert_pcuv bit (bit 2 of
> > aud_conf2 Audio Sample register) fixes this.
> > 
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> 
> I also had the HDMI audio clipping issue described here, on a RK3399. This was
> on a 6.1.23 kernel based on the one used by LibreELEC.tv with their out-of-tree
> patches for video decoding, 4k HDMI support, etc. When testing this patch I
> also updated my kernel tree to 6.10.3, and found that even without this patch,
> on 6.10.3 the problem no longer happens.
> 
> I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
> value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
> the value is 4, i.e. insert_pcuv is already set.
> 
> According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
> so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
> but before this driver sets the hw_params, and this patch sets it back to the
> correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
> no longer necessary (but is a harmless no-op).
>

I found out that for my hardware even with 6.13-rc5 I still suffer from
really distorted audio if I don't apply this patch.

>From 2cd8a7432afa9a02b4498832c912b8f90e347a5d Mon Sep 17 00:00:00 2001
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sun, 29 Dec 2024 23:26:47 -0300
Subject: [PATCH 7/7] drm/bridge/synopsys: dw-hdmi: enforce PCUV bits for newer
 versions

For some strange reason my hardware boots without this set to
the default, testing has shown mixed results with different
kernel versions on different hardware, truth is, I need
this patch or more compliant sinks will misbehave when the
PCUV bits are not set

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 13 +++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h           |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index f1c5a8d0fa90..fc45d10c7d42 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	struct dw_hdmi *hdmi = audio->hdmi;
 	u8 conf0 = 0;
 	u8 conf1 = 0;
+	u8 conf2 = 0;
 	u8 inputclkfs = 0;
 
 	/* it cares I2S only */
@@ -101,6 +102,17 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
+	/*
+	 * dw-hdmi introduced insert_pcuv bit in version 2.10a.
+	 * When set (1'b1), this bit enables the insertion of the PCUV
+	 * (Parity, Channel Status, User bit and Validity) bits on the
+	 * incoming audio stream (support limited to Linear PCM audio)
+	 */
+	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
+			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
+		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
+
+
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
 	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
@@ -109,6 +121,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
 	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
 	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
+	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index af43a0414b78..d7cbdc42d501 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -931,6 +931,11 @@ enum {
 	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
 	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
 
+/* AUD_CONF2 field values */
+	HDMI_AUD_CONF2_HBR = 0x1,
+	HDMI_AUD_CONF2_NLPCM = 0x2,
+	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
+
 /* AUD_CTS3 field values */
 	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
 	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,
-- 
2.47.1

