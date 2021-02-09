Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B531531F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 16:46:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A0D82B;
	Tue,  9 Feb 2021 16:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A0D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612885617;
	bh=TIplwA8jhzQmB2KSN2szZ2AM5FVLD0I/kQm2Hb/6+Pg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFycU8KDr1w36zt4r8oF6CoB97VBoOjrAJWbIIx15qrm1BAaQ9YKsYFLipEsY1b+R
	 msKZXE4eRGScln7iH4smKD0cGxFsrakSVX8VTNYC4dXbjXnETD2RRXUcE5aBQ5aYll
	 gwg5dg69NlCx/kS5rfgeCzxrSOJHJG7+Lhzfwhb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E800FF8016B;
	Tue,  9 Feb 2021 16:45:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2762AF801D5; Tue,  9 Feb 2021 16:45:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C57EF80165
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 16:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C57EF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n3IxSzeG"
Received: by mail-wr1-x429.google.com with SMTP id u14so22560023wri.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Feb 2021 07:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8UmYKdautktnyhtXZt7SR3qiMojJQABIb1BLVU3KsZA=;
 b=n3IxSzeG4KUHNL/FZSS1D7Bp32ztBEiqdZ7XJLy45DDh/0ecacUkX/P3aezgjuKv5b
 cv4CUWXiNDORvDGNfm1+lNsCrjtMPgAhzeU4fk/9IZg9lmbpNMeolLYGuIcF4GsiGK2g
 9Tm82rGpBgoUkc29pL1sCtIqMr0MZKH/zEUQSwQ+rBzfzdB4gLaHdq60AcPAd31Z+zsK
 1RLQoLCbso5VpGbJ5iVR7aYC/2oVdcwjgQqbmgWrdtyXD3C9IRF8KOWiyrBfNY9r1wzR
 lqMbXDzRXaz0ARnN3O1nJ0f5VtWTjfG9atCgQhFwUnHc18FewElSX1zOx+qMabBL6iHO
 kR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8UmYKdautktnyhtXZt7SR3qiMojJQABIb1BLVU3KsZA=;
 b=qLBQSj1K7/eN8vAkRrzjJQBOnRLY/DhkPRfAcOMSrnzX643p2VUOCLK6tgd2Wa5v09
 NC3Rf7YZonFgMUAw+nKhkkyve3BN1BdUGVuHVUAGLbSmWYENCVt+S0Hm0hbw674QBNSR
 yYsYrXlQY4ZJA55Kq1gARMQ/o55gfsVxcwNUqBPkZFikQBi/6pHEnDMx8ZttIpostvzY
 mLGb/wc3avtl1QHolJTu2L/IW1Z/3kiGIMesYn42TVFIHugV5eL9tNk1JyU1XAASgGVY
 4x7gW5qH36Pu/fFb5oVQst4gYx+CLzuzGxrO1DvS597k/jXEDU0WG3FNrFWtibO+jvHd
 /ePg==
X-Gm-Message-State: AOAM532IMGG2kb5kcE77mVYtI+MCbgXK2gVvfh6slNR63O1L86Vr+5bh
 LU4v/nlF0TgCK3BS3eTOjEbxgg==
X-Google-Smtp-Source: ABdhPJwbmuODUhCMLdvsomvpBOKmyBl74mOfYZjL505MquFwMEgxnVyHlDb1SSESQcbwd5lvXEaUVg==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr25840512wrm.277.1612885514170; 
 Tue, 09 Feb 2021 07:45:14 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id t126sm5345969wmf.3.2021.02.09.07.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 07:45:13 -0800 (PST)
Date: Tue, 9 Feb 2021 15:45:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
Message-ID: <20210209154511.GC220368@dell>
References: <20210204112502.88362-1-hdegoede@redhat.com>
 <ba9c1add-8ac0-766b-4577-1c2769c0e5e6@redhat.com>
 <20210209141420.GE4766@dell>
 <c0b4c612-7f60-5126-4c4d-b7085bd356d0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0b4c612-7f60-5126-4c4d-b7085bd356d0@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
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

On Tue, 09 Feb 2021, Hans de Goede wrote:

> Hi,
> 
> On 2/9/21 3:14 PM, Lee Jones wrote:
> > On Mon, 08 Feb 2021, Hans de Goede wrote:
> > 
> >> Hi Mark, Lee,
> >>
> >> On 2/4/21 12:24 PM, Hans de Goede wrote:
> >>> Hi all,
> >>>
> >>> Here is v4 of my series to rework the arizona codec jack-detect support
> >>> to use the snd_soc_jack helpers instead of direct extcon reporting.
> >>>
> >>> This is a resend with some extra *-by tags collected and with the extcon
> >>> folks added to the "To:" list, which I somehow missed with the original
> >>> v4 posting, sorry.
> >>>
> >>> This is done by reworking the extcon driver into an arizona-jackdet
> >>> library and then modifying the codec drivers to use that directly,
> >>> replacing the old separate extcon child-devices and extcon-driver.
> >>>
> >>> This brings the arizona-codec jack-detect handling inline with how
> >>> all other ASoC codec driver do this. This was developed and tested on
> >>> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
> >>>
> >>> This was also tested by Charles Keepax, one of the Cirrus Codec folks.
> >>>
> >>> This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
> >>> support for Intel Bay Trail boards with WM5102 codec" series and there
> >>> are various interdependencies between the patches in this series.
> >>>
> >>> Lee Jones, the MFD maintainer has agreed to take this series upstream
> >>> through the MFD tree and to provide an immutable branch for the ASoC
> >>> and extcon subsystems to merge.
> >>>
> >>> Mark and extcon-maintainers may we have your ack for merging these
> >>> through the MFD tree ?
> >>
> >> Now that the pre-cursor (1) series to this has been merged, I guess it
> >> is time to decide how to merge this series. 
> >>
> >> Chanwoo Choi has given his ack to merge the extcon bits through the MFD
> >> tree and since Mark has expressed a preference for merging ASOC patches
> >> directly I guess that it would be best to merge 1-6 through the MFD
> >> tree and then Lee can send Mark a pull-req and Mark can apply the others? :
> >>
> >> 1/13  mfd: arizona: Drop arizona-extcon cells
> >> 2/13  extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
> >> 3/13  extcon: arizona: Fix various races on driver unbind
> >> 4/13  extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
> >> 5/13  extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
> >> 6/14  ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c
> >>
> >> 1 is:    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> >> 2-6 are: Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> >>
> >> Note patch 6 renames drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c
> >> but it does not touch any other files under sound/soc (including NOT touching
> >> sound/soc/codecs/Makefile that is done in a later patch). So it cannot cause any
> >> conflicts.
> >>
> >> Mark, would merging 1-6 through the MFD tree, and you applying the rest
> >> (which are all ASoC patches) work for you ?
> > 
> > What a faff.
> > 
> > I still don't see why they can't all go in and a PR provided.
> 
> Well patch 13/13 of this set relies on 5/5 from the previous set which is
> only in Mark's ASoC tree and not in the MFD tree, so splitting things over MFD + ASoC
> again makes the most sense here too.

Right, this is what can happen when patch-sets are split up.

> The alternative is Mark doing a PR from ASoC to MFD to get 5/5 from the previous set
> in MFD first, which seems less then ideal.

Well this set isn't likely to go in this cycle anyway, so actually the
problem should just go away.  Best to let the first set get sucked
into v5.12, then send this one up subsequently for v5.13.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
