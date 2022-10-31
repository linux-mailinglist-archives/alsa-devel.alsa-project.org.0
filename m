Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4CD613F7B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 22:08:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C5BA166A;
	Mon, 31 Oct 2022 22:07:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C5BA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667250493;
	bh=pBLJQXrwoJ6edIkslBlYorFQNR9EMb74zMOGOLNwMyc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f864h+7diPh6x4L5E9fuScXaH8YWLNGSrSKAOA8bSR4RnpOIZGUpQ+dxD1Tlx1AWS
	 yxoyBZ1hnRhmhDLMH/bMvYVkRs8OoiBcfe894XGEnjVpqdFS4RQsIgpQQlbdIYxkoz
	 rxa6XWgO4+dUT5aiUHqs2gplZNomnqNg11DgrskU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A4DF8021D;
	Mon, 31 Oct 2022 22:07:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77513F80163; Mon, 31 Oct 2022 22:07:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33E56F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 22:07:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33E56F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hefAvQFJ"
Received: by mail-oi1-x22b.google.com with SMTP id c129so2248986oia.0
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 14:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aoGu1LT5tdMCaqSWoG2s2IJixpXTuun6P4SWBtcGda4=;
 b=hefAvQFJmfZtrwkG3wfLF/hqostOYNYo8Neqf03UhmWi6nUi6qRvn77CWrW0t+DrTJ
 Yc7AL4hzkBlQFq0FR8gIM8iBPDjcUMxzrrRgK0tPujo6YR/EK9gk6Kq9EdP5NPCJBu/G
 C3UaQv1J+10p6fHtoeBWrSfuXgaEpC7QKZAvN0NUP6XmqYtECXxoH48jkjhMOWw/t6Nx
 n8jh3h7VVeQu03549dJPPACz5MrKobJYZuyAWZc8Yy4JFaR6G0CrYp+rQgtt4wBv7duC
 +Wu2VY848mRtFROCtG5yAFYvQU0aSdUuhKzVE02wFhVYK81LXxHkzlxBUJeSJ1/2LG3w
 bw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoGu1LT5tdMCaqSWoG2s2IJixpXTuun6P4SWBtcGda4=;
 b=UqJRQhcRwuhbxiCpV//E2H7Taz7PqDvt0ObtQrps5nsrwCetPcv/loQVeFT3cxbimc
 jIk2r3H/MNfCNTfrWGWG6wweRB3n8ut2j/BCu2HQ6Kiuq8D76sh5Z4sAvSdX2+Agxkq5
 ecDD0LmkCBWOEXGNx55yMlwSTWKxwTf+99G2D+jCiY+aq0qRKpGvqLsPfHxNNNDKAt6o
 CNf8ERea/NBuRnsmnDtg/B827evgwi5ugbUDTZ1/KBqqNEYpw3BOBngUJs3AALqM/rCz
 s0ExkgX6iLnLSIukU/h9F1HJmze83YNlyJ373+nG41rlL05RCNgOnVxXmSljOXWctTrd
 5/vA==
X-Gm-Message-State: ACrzQf0ZGNruq1bogjCRmlWVA4iKFY5dEq+mPvcSFfZX1sbkPl7zGm0k
 9Bl0McpuHL8sErHOAHwZ+TI=
X-Google-Smtp-Source: AMsMyM4aOGm4pYEV8uqPuIxeESOzedWxDxSVqjuHMFZSJlWhiCUGgZ19BEd1LXTrLN6nV9bayhuP9g==
X-Received: by 2002:aca:f1a:0:b0:35a:f05:82f0 with SMTP id
 26-20020aca0f1a000000b0035a0f0582f0mr3072980oip.220.1667250426633; 
 Mon, 31 Oct 2022 14:07:06 -0700 (PDT)
Received: from geday ([2804:7f2:8006:16ea:99cb:fa89:7dea:3ae])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a056808057800b00342ded07a75sm2727069oig.18.2022.10.31.14.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 14:07:05 -0700 (PDT)
Date: Mon, 31 Oct 2022 18:06:57 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit
 if hardware supports it
Message-ID: <Y2A48a5ff+SyxqLR@geday>
References: <Y01E5MvrnmVhnekO@geday>
 <e8b6eb23-4968-af6c-c2d3-8e5fa64d9473@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b6eb23-4968-af6c-c2d3-8e5fa64d9473@linaro.org>
Cc: ALSA-devel <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
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

On Mon, Oct 31, 2022 at 09:20:36AM +0100, Neil Armstrong wrote:
> Hi,
>

Hi Neil and thanks for caring.

> 
> On 17/10/2022 14:04, Geraldo Nascimento wrote:
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
> 
> 
> I did some research and this insert_pcuv is already present in the 1.40a version
> of the dw-hdmi databook, so I wonder why suddenly this is needed.

Like I told you, I was unaware of this fact, but I have a hunch this bit
was being set to 1 as default before the 2.10a version of dw-hdmi. It
remains to be checked, I see you added Christian Hewitt to the Cc:,
maybe he can use i2cdump or printk() on older Rockchip  hardware, the
Radxa Rock Pi N10 is the only thing from Rockchip I own.

> 
> The insert_pcuv is documented as:
> -------------------------------------------------------
> When set (1'b1), it enables the insertion of the PCUV (Parity, Channel Status, User
> bit and Validity) bits on the incoming audio stream (support limited to Linear PCM
> audio).
> If disabled, the incomming audio stream must contain the PCUV bits, mapped
> acording to 2.6.4.2 Data Mapping Examples
> --------------------------------------------------------
> 
> 
> What's interesting is this register is only present if thre DW-HDMI IP is configured
> as GPAUD or GDOUBLE, meaning it must have GPAUD enabled. So it has
> something to do with it, so what's value of it when GPAUD isn't present in the IP ?

Would you like me to inject some printk() or dump some memory value
with i2cdump? I'm not sure I follow you because you obviously know much
more about this driver than me, but if you could elaborate a bit I'd be
happy to provide some answers.

> 
> And HDMI2 spec added this, even PCVU were required before:
> --------------------------------------------------------
> Note that PCUV refers to the parity bit (P), channel status (C), user data (U), and validity bit (V) as defined in IEC
> 60958-1.
> --------------------------------------------------------
> 
> So it has something to do with IEC60958-1 stream format, do maybe this
> insert_pcuv should only be enforced when the input stream is _not_ IEC60958-1 ?

Yes, the HDMI2 spec requires PCUV audio bits, and they borrow the idea
from IEC 60958-1 (Digital Audio Interface - DAI), but insert_pcuv definitely
needs to be set for newer Synopsys Designware HDMI hardware when we're
talking about Linear PCM - that's what my patch attempts to address.

Thanks,
Geraldo Nascimento

> 
> Neil
> 
> > 
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > 
> > ---
> > 
> > v1->v2: SoC->SoM on description, better commenting, minor style changes,
> > 	conditional application of fix for L-PCM only
> > 
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> > @@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
> >   	struct dw_hdmi *hdmi = audio->hdmi;
> >   	u8 conf0 = 0;
> >   	u8 conf1 = 0;
> > +	u8 conf2 = 0;
> >   	u8 inputclkfs = 0;
> >   
> >   	/* it cares I2S only */
> > @@ -101,6 +102,28 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
> >   		return -EINVAL;
> >   	}
> >   
> > +	/*
> > +	 * dw-hdmi introduced insert_pcuv bit in
> > +	 * version 2.10a.
> > +	 *
> > +	 * This single bit (bit 2 of HDMI_AUD_CONF2)
> > +	 * when set to 1 will enable the insertion of the PCUV
> > +	 * (Parity, Channel Status, User bit and Validity)
> > +	 * bits on the incoming audio stream.
> > +	 *
> > +	 * Support is limited to Linear PCM audio. If
> > +	 * neglected, the lack of valid PCUV bits
> > +	 * on L-PCM streams will cause anything from
> > +	 * mild cracking to full blown extreme
> > +	 * clipping depending on the HDMI audio
> > +	 * implementation of the sink.
> > +	 *
> > +	 */
> > +
> > +	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
> > +			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
> > +		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
> > +
> >   	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
> >   	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
> >   	dw_hdmi_set_channel_count(hdmi, hparms->channels);
> > @@ -109,6 +120,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
> >   	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
> >   	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
> >   	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
> > +	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
> >   
> >   	return 0;
> >   }
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> > @@ -931,6 +931,11 @@ enum {
> >   	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
> >   	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
> >   
> > +/* AUD_CONF2 field values */
> > +	HDMI_AUD_CONF2_HBR = 0x01,
> > +	HDMI_AUD_CONF2_NLPCM = 0x02,
> > +	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
> > +
> >   /* AUD_CTS3 field values */
> >   	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
> >   	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,
> 
