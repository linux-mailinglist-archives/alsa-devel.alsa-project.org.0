Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1E31515C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 15:16:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F0D84B;
	Tue,  9 Feb 2021 15:15:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F0D84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612880167;
	bh=Ro3QOrE1X8DfbzhGy/CLFErzBN4fzmzj7o0ouVPqFb4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2qbnAZBKKT8Q8rnwSFxJjNlmZ2n/aMFbYqY+p8V5xevweV09PRDUxA36rS0grkul
	 iwnzPlM6SJZCKnRynQTbf6/yRKIm3pt8m7N0oIpXRQ6bAPrqL3PRtG9/iFSWKvMEhz
	 uMh7/oYgZzQZuXPQU+zaY+oeK+AAV11PAAGVgwag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B80F801EB;
	Tue,  9 Feb 2021 15:14:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE126F801D5; Tue,  9 Feb 2021 15:14:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1279EF80165
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 15:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1279EF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="i6yAEp9f"
Received: by mail-wr1-x433.google.com with SMTP id r21so5765603wrr.9
 for <alsa-devel@alsa-project.org>; Tue, 09 Feb 2021 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hUh/wcUnUiqWLSuZNUcSG49hoBmdkF7bh0pKMix4LK4=;
 b=i6yAEp9fsEQMPTs1jK5sCt2+BjobvrhRaHbWpE75MODFwS+yEZchD4VACw7QMIIiN6
 QuHtxzioIQRtMRVVV3+3+LKHV+UNhWY2ecwdq4iA+KXPR8ewMv2cUHPeGs5yOltgw5gE
 Fj1eyS7FOaOWnNLK7Eo+pjKEgDrwyWqWuxUkNtQbMU7GMJYFKhutN8P2pX2qfJFYWFbS
 hXyRsoS3gk73nRV4AaE6RUrnowQx1tZdJeDPoi222cEew74atJCtuqiT/Hj+bF0KFZOE
 IGyIgfowfy69HxtyqCV4o3+BBEyveBhw7Ltm/HCkIclkhU2sPFKmLUCwKtOYfZWxhp6V
 gUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hUh/wcUnUiqWLSuZNUcSG49hoBmdkF7bh0pKMix4LK4=;
 b=hTlin9ChRlWFRZ5J0No1CmCLSDLGm5JDaAa1kmSPlcxfBIYpScsst8HvXCYeHSKn2S
 qr3uyL1vvWuK51K0VqPThzu+ZnpLAmMCPnxpsonKCeJIB6Smgb7QkjBstjv3yuw0rfsa
 xJr6PWMZ3/Evi19fd2K63jzZgfbgeH4s6zS9NRMRYyO81saoOXf9JITyL6XYBaolZmmV
 X3/okm1EykZSrQk1SW+TFbQ15BqwUsA0QP9q9SGX5sIDnm5Jr5Op5pJLtY5J68/2Ne0I
 Reis88G4TarMlnQRGCwGu1/KODT08RbjWrxniQt0rnhRcHMcCA4FxP/0ScXi3EsySEsW
 aEEQ==
X-Gm-Message-State: AOAM530c4mYPNdeVdyGrmSeTTrtlMCYwAAYwb09Mu2f7VdyKZJs+zFgB
 H1xMXeM0IzABJCy0R54ANabHHA==
X-Google-Smtp-Source: ABdhPJwmnXMhwytoTjOqdn/JsfTqEJ8zMkMFFECn7aCIS0nMMnpkSDd9rrqcgUZNL/CR9gPjIlvyYw==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr25947457wrt.269.1612880062687; 
 Tue, 09 Feb 2021 06:14:22 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id h207sm5096569wme.18.2021.02.09.06.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:14:22 -0800 (PST)
Date: Tue, 9 Feb 2021 14:14:20 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
Message-ID: <20210209141420.GE4766@dell>
References: <20210204112502.88362-1-hdegoede@redhat.com>
 <ba9c1add-8ac0-766b-4577-1c2769c0e5e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba9c1add-8ac0-766b-4577-1c2769c0e5e6@redhat.com>
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

On Mon, 08 Feb 2021, Hans de Goede wrote:

> Hi Mark, Lee,
> 
> On 2/4/21 12:24 PM, Hans de Goede wrote:
> > Hi all,
> > 
> > Here is v4 of my series to rework the arizona codec jack-detect support
> > to use the snd_soc_jack helpers instead of direct extcon reporting.
> > 
> > This is a resend with some extra *-by tags collected and with the extcon
> > folks added to the "To:" list, which I somehow missed with the original
> > v4 posting, sorry.
> > 
> > This is done by reworking the extcon driver into an arizona-jackdet
> > library and then modifying the codec drivers to use that directly,
> > replacing the old separate extcon child-devices and extcon-driver.
> > 
> > This brings the arizona-codec jack-detect handling inline with how
> > all other ASoC codec driver do this. This was developed and tested on
> > a Lenovo Yoga Tablet 1051L with a WM5102 codec.
> > 
> > This was also tested by Charles Keepax, one of the Cirrus Codec folks.
> > 
> > This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
> > support for Intel Bay Trail boards with WM5102 codec" series and there
> > are various interdependencies between the patches in this series.
> > 
> > Lee Jones, the MFD maintainer has agreed to take this series upstream
> > through the MFD tree and to provide an immutable branch for the ASoC
> > and extcon subsystems to merge.
> > 
> > Mark and extcon-maintainers may we have your ack for merging these
> > through the MFD tree ?
> 
> Now that the pre-cursor (1) series to this has been merged, I guess it
> is time to decide how to merge this series. 
> 
> Chanwoo Choi has given his ack to merge the extcon bits through the MFD
> tree and since Mark has expressed a preference for merging ASOC patches
> directly I guess that it would be best to merge 1-6 through the MFD
> tree and then Lee can send Mark a pull-req and Mark can apply the others? :
> 
> 1/13  mfd: arizona: Drop arizona-extcon cells
> 2/13  extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
> 3/13  extcon: arizona: Fix various races on driver unbind
> 4/13  extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
> 5/13  extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
> 6/14  ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c
> 
> 1 is:    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 2-6 are: Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> Note patch 6 renames drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c
> but it does not touch any other files under sound/soc (including NOT touching
> sound/soc/codecs/Makefile that is done in a later patch). So it cannot cause any
> conflicts.
> 
> Mark, would merging 1-6 through the MFD tree, and you applying the rest
> (which are all ASoC patches) work for you ?

What a faff.

I still don't see why they can't all go in and a PR provided.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
