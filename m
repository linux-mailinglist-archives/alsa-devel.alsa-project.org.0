Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6E2F9D22
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 11:49:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EB9B17DF;
	Mon, 18 Jan 2021 11:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EB9B17DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610966941;
	bh=lYxgT7aQ1m0uJquOF0DifNIYVFcdSPBmtbrpbNqEP4g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SRHolLk04AiCkkobFKqGWHxnciYuKNVSzsaqEVHr2+weFjOebN+Q+OeayCuvjrhxX
	 xENmB7yOVmRqOYKb+KgVmBe7OdDwFxNdWXpHDGWSD41jOWE2oKoILvtf7yP4Xbzgbk
	 BLF5PIUgcDZeLRzUBKG6fGyfXXgNBOFnKoAcQrFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F04AF80137;
	Mon, 18 Jan 2021 11:47:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD0A1F8016E; Mon, 18 Jan 2021 11:47:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D675F800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 11:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D675F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GIDQCTkW"
Received: by mail-wm1-x32d.google.com with SMTP id o10so5632554wmc.1
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nHf20OOCMo8x4Qdkj9BcWGoZ1gfgVypLNOIWfvt4zr0=;
 b=GIDQCTkWdAQcVU5Y65kMWYXGOSSZ6ywq+wJSQGrBn28lZM3s438IHY/LWhXAc3zsPK
 fhYbP0Ev37Ve0xrjNZInpO1RAuuc/ffmthMvZnnVU/2JtZ/vkp6+3SZWAq1oH8e/W+Oh
 oOa7MpT0iKokhtW2+8rVyShUiYTbrI4O5RYahLFt21kK7lbX9KNDojzOSspNyGXTXr9V
 TlHawqeTvr3VRoSEsCPX2xnmlVjTrowr1QkPAube3MF5ahZks6FwjYA7IGT2gSKLQvDb
 kQ9s152UkO1YFgk44pvdQ0ZrHCnB9iFweh1swp8kyj14o5j/kt3PkkB2qHBNnMtJkDXK
 AWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nHf20OOCMo8x4Qdkj9BcWGoZ1gfgVypLNOIWfvt4zr0=;
 b=iER1hnAmB4YSK0Kc3KHXbwv+yOH3qS//nkseKlcASKJcPSvu6c65/+BzBbPXS71nlt
 n50zp702s7aFndM1O2UvLWT4Y+ZSVzEs1npSff7rWwqryyEjGTkYPLsH2BrLywJGLbso
 zRPRQgaPITJvNf3D9oJstXi7tU94AcRT0uMPQ5eJQWH4ET8jWP4alP5MD0BB1rvfTF/Y
 CIs98yTW7Ro7WkOPLLG3TmezRSmAIBbVBW4hl4j6k9lrcHUbhFZ4d8WgSf/UcAae+lk/
 +fJmz/UKAgPA0lCLS9IvjK6cFP/sIwSmKl454j2zIiDvCwIVRM7L/WoPBz/okKZ3XdLb
 F3bg==
X-Gm-Message-State: AOAM530Ht9VSRzAskBFkJ0802DWJc7vqIUHaOYf6/7hrBSDpX7DZE3TU
 1w3PyRWSS5Of6cR1hb2BUA0VIQ==
X-Google-Smtp-Source: ABdhPJx2SuIaE0os9zlqBPDDM6QMp5/GqngUcm6CMXsxuZJeI3DyE+gGaJ44JUHFhPAomftdX+aSow==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr20124727wmb.135.1610966834579; 
 Mon, 18 Jan 2021 02:47:14 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id p12sm1868057wmi.3.2021.01.18.02.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 02:47:13 -0800 (PST)
Date: Mon, 18 Jan 2021 10:47:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 00/12] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
Message-ID: <20210118104712.GD4903@dell>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210118095509.GA4903@dell>
 <8905f9f2-1c1c-1b64-d70d-374f84568ccb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8905f9f2-1c1c-1b64-d70d-374f84568ccb@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Mon, 18 Jan 2021, Hans de Goede wrote:

> Hi,
> 
> On 1/18/21 10:55 AM, Lee Jones wrote:
> > On Sun, 17 Jan 2021, Hans de Goede wrote:
> > 
> >> Hi All,
> >>
> >> This series reworks the arizona codec jack-detect support to use
> >> the snd_soc_jack helpers instead of direct extcon reporting.
> >>
> >> This is done by reworking the extcon driver into an arizona-jackdet
> >> library and then modifying the codec drivers to use that directly,
> >> replacing the old separate extcon child-devices and extcon-driver.
> >>
> >> This brings the arizona-codec jack-detect handling inline with how
> >> all other ASoC codec driver do this.
> >>
> >> This was developed and tested on a Lenovo Yoga Tablet 1051L with
> >> a WM5102 codec.
> >>
> >> The MFD, ASoC and extcon parts can be merged independent from each-other
> >> although that could lead to a case where both the extcon driver and
> >> the new arizona-jackdet library will try to do jack-detection. If we
> >> end up with a git tree in that state then one of the 2 will fail to
> >> load because the other will already have claimed the IRQs, so this
> >> is not a problem really.
> >>
> >> Or the entire series could be merged through the MFD tree if people
> >> prefer that.
> >>
> >> Note that this series also paves the way for some further cleanups,
> >> removing some jackdetect related variables like hp_ena and hp_clamp
> >> from the arizona data struct shared between all the MFD child devices.
> >> I've deliberately not done that cleanup as part of this patch-series,
> >> since IMHO the series is big enough as is. These cleanups can be done
> >> in a follow-up series once this series has landed.
> > 
> > Would you mind using `git format-patch` to create your cover-letters
> > in the future please?  This one is missing useful information such as
> > the diff-stat and patch list.
> 
> I never heard about that git feature until today, so I learn something
> new every day :)
> 
> I just tested it and it seems useful. I will try to use it next time.

After all these years... That's so funny. :D

Happy to be of service.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
