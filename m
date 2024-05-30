Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9088D5583
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 00:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C343112;
	Fri, 31 May 2024 00:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C343112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717108755;
	bh=Fjzer8QqLFsATl8glp0AAGSY40jW8Spt85gruSjFpBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=st/BF6Bs7ubZgLu94POSk4QiyeR3AkuVuVWOwiPtRavsOU8pIwZSGeqd+zakBc5XZ
	 zDiNFiIQMioAt4CUgAUB2oVKUHaoBr5Gw11WIOcasbbY46kHJu8eLeNrNDYDtNprD8
	 ZwvuGaIzwczIYwczyELBU8K6pkVN5t1kF3HT39hg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB1D4F8051D; Fri, 31 May 2024 00:38:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F880F804B2;
	Fri, 31 May 2024 00:38:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CBB3F80149; Fri, 31 May 2024 00:38:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0C8EF8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 00:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C8EF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AsfMuwEd
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b840a001dso936312e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 15:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717108706; x=1717713506;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXlCq0DJxkxxyKLvV8+ZkZTnpl2ZObVXFmhWlTC2CL0=;
        b=AsfMuwEdJL7Y/HgGGg+mVtD7ipLYGIohTPMyXs493uIAAcRKDu9TZi+UPZP/7MrmDw
         sxH3Pfvrb73N3cBDYgYu1dLrXg/j9t0f0ZT6LHI+hs2VDVKZdbgxdEptYOC6teHCKpxX
         ogSuSoXAsXZVKW4Tedbg5LPKp066sCxmJS1XDAWCaLj86OoxRj+Omtwjc2mE/WN7Pf6G
         jCLdG4p8ci9RCzWzrFYuclnp+IFDYKZUjM73dCm9hbd+vitafF8Y+KZZJFau2nX+jr3H
         hzFUfsE+8LBl0Y8slTSEVZxx8i9spAHmxpfn7gVvqy+W0VO2G12fa3apaAgPdSPyXLY1
         wPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717108706; x=1717713506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXlCq0DJxkxxyKLvV8+ZkZTnpl2ZObVXFmhWlTC2CL0=;
        b=AdFGX2NKu+3mjBgSuCXhXnEmsJrkwSxKKBDDCxCm0fmQuKenUwnEtpvP4LynMzlQbZ
         VO711CLrSbvJEdnAHuoArZx+MZwUojoU+xKHDTA3h2WH5r0qJ4SaAW0Kx3DnNNGEfXbB
         4YkZrpbvxMlABwtAwhMedq/qrqLpij1Cf0bSEbSxUcM0kY3x9uWkS5S4n445bNKdUZnJ
         zw1DI7qYt4GoyMPPtQu3GEIHgE0Wr9gY5/9PD/iEa5fjM2LM+NlzFe4gHUAalEowjB2d
         8CsHFmBKJXm5l+TjZoJDPZeRGmEeIFf91BPmizsm39tmKkwbkucffVZaXLVuKdHPclhi
         Q5hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwYq3ll7lDsgbGWuGjyw2AkEKib0E8jW5n2uSY/lAOXJwd1WWXOuOfRlKXNwekmSX1KXMJy2JnJimp/0mqHCIp908npFM+DxzgFPI=
X-Gm-Message-State: AOJu0Yy6G53wHZYd4zgyAbKJ7nflTbmqQfGVO+/Ri1fTbapFZf1x2ylO
	a/qMpVNhdnh1o8Qeh8GQmB3us+QGn3abURd68D+Pk6c/6Qmv5/j/z5oJIndbyqc=
X-Google-Smtp-Source: 
 AGHT+IFnEBYJSgU24AbKOGM7TJ91eoG+D0UNGLi9QDLuQI6tXBLo5Sj9AYbvSSfIx8nFWe1bYC8zEg==
X-Received: by 2002:ac2:5a07:0:b0:51e:fc99:d6ef with SMTP id
 2adb3069b0e04-52b895a11d9mr12829e87.18.1717108706187;
        Thu, 30 May 2024 15:38:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d7ff1csm112527e87.209.2024.05.30.15.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:38:25 -0700 (PDT)
Date: Fri, 31 May 2024 01:38:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
Message-ID: <Zlj_4IuZqnC3gESL@eriador.lumag.spb.ru>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
 <ZiejT5yddioQ8upR@hovoldconsulting.com>
 <b9d0e2fd-069c-439c-a85f-1e99bf9018c3@linaro.org>
 <Zi-0kSU6TMcev05r@hovoldconsulting.com>
 <a980d7a5-0d80-4ff1-93e1-b5f5806980c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a980d7a5-0d80-4ff1-93e1-b5f5806980c3@linaro.org>
Message-ID-Hash: YVOJXH2JGHS5MNSZSIZQCDZQC7T4LTZC
X-Message-ID-Hash: YVOJXH2JGHS5MNSZSIZQCDZQC7T4LTZC
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVOJXH2JGHS5MNSZSIZQCDZQC7T4LTZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 09, 2024 at 09:59:40AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 29/04/2024 15:54, Johan Hovold wrote:
> > On Tue, Apr 23, 2024 at 04:55:32PM +0100, Srinivas Kandagatla wrote:
> > > On 23/04/2024 13:02, Johan Hovold wrote:
> > > > On Mon, Apr 22, 2024 at 02:43:52PM +0100, Srinivas Kandagatla wrote:
> > > > >    static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
> > > > >    	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> > > > >    	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> > > > > +	SND_SOC_DAPM_SPK("HDMI/DP0 Jack", NULL),
> > > > > +	SND_SOC_DAPM_SPK("HDMI/DP1 Jack", NULL),
> > > > > +	SND_SOC_DAPM_SPK("HDMI/DP2 Jack", NULL),
> > > > 
> > > > Shouldn't these be split in dedicated HDMI and DP jacks too? What if you
> > > > have a machine with HDMI and DP jacks which would otherwise both claim
> > > > "HDMI/DP0"?
> > > 
> > > These map to the Jack's added as part of qcom_snd_dp_jack_setup and
> > > belong to DISPLAY_PORT_RX_0, DISPLAY_PORT_RX_1, DISPLAY_PORT_RX_2.
> > > 
> > > If its going via USB-C DP controller it will be either DP or an HDMI ?
> > 
> > It will always be DP out of the machine even if an adapter can convert
> > to HDMI internally.
> > 
> > The DRM ports are called "DP-1" and "DP-2" so it seems we should match
> > that.
> > 
> > > This is the most common naming for the USB-C DP/HDMI jack events.
> > 
> > It looks like some Intel machines use names like "HDMI/DP, pcm=%d Jack"
> > (with a pcm device number), but we also have "DP Jack". Not sure which
> > are are used with USB-C, though. (Or if the former actually support HDMI
> > altmode.)
> 
> I checked this on my machine which has usb-c and I can confirm using HDMI/DP
> naming for these jack.
> 
> Either way I don't mind having any names, but my point here is to be more
> consistent across.

I fear it is till not consistent. On the Intel laptop I see following
jacks:

numid=18,iface=CARD,name='HDMI/DP,pcm=3 Jack'
numid=24,iface=CARD,name='HDMI/DP,pcm=7 Jack'
numid=30,iface=CARD,name='HDMI/DP,pcm=8 Jack'

On the other hand Mediatek and RockChip use just 'DP Jack'.

I'd suggest settling on the latter option. We are closer to MTK and
RockChip rather than Intel.

BTW: a platform can easily have 4 (x1e8100) or even 8 (sc8280xp) DP
outputs. Could you please point out why there are just 3 jacks?

> --srini
> > 
> > > Qualcomm LPASS in some older SoCs had a dedicated HDMI interface which
> > > is different to this one.
> > > 
> > > Usual Other ways to connect HDMI is via external HDMI Bridge using I2S
> > > interface which totally different to this DP interface.
> > 
> > Sure, but if there's ever a design with such a port then it will be
> > called "HDMI Jack" and then the "HDMI in "HDMI/DP0 Jack" is unnecessary
> > and confusing when it is always DP out.
> > 
> > Johan

-- 
With best wishes
Dmitry
