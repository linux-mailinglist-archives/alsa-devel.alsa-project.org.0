Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C817D30F458
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:58:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6828C16DE;
	Thu,  4 Feb 2021 14:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6828C16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612447112;
	bh=RVxdmQ8XGLcyY3bvsXcMlq/mzNR1J3rKA5Rum2aWOj4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+QZaSep4XFx8ZEDN05YIlCTfDrmcqtoYEEc0rb5HCqfIKfZwfEUatj7r9HKTj2u8
	 srU557g2gAFJsWlQt12Ut2wsq4o03p2zH+eLxN+oJV+rId8/HR4WCBU7crZC8hdx5v
	 MhD6l/T3LevSA6/QgAzWx2XaE3RalaK/s4Fe3Uy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A3C8F80290;
	Thu,  4 Feb 2021 14:56:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C4B2F80277; Thu,  4 Feb 2021 14:56:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5FA7F80264
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5FA7F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="i5tL/xmN"
Received: by mail-wm1-x329.google.com with SMTP id l12so3205000wmq.2
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 05:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PIhCp8il47YAvxqad9wdbokygqezWUysVvDAkwwnuTQ=;
 b=i5tL/xmNo+KoC4L+J++aT8o9sf0W4gpJ5zTnyIyHO8lfutg+zYLMGr72A2HPstt5ki
 DvBUkuAa0qhUwXb30x6BNaI06P1ROgBYC3Xzp6ovgfbZbqKQGVQHuMz5BkDDRHR7XE/u
 P7YFaJoeJ1OFtsLOZ8U5JgvO3zgSHfxNggH3cD7cuu2gaUBMmbQY/DXZK5x0r9cpX5Od
 i5sFKtVA7sm+QXyr711m6l0lEt4yiaFWzArLzqx4zsy14fu/R1fjwdqQVehbMnjI/3vJ
 RbsqDCJdDmMGGtQ+0pkPkJeL5Z9QYIwyUfzOoTiiBLrxaeeloIJ6meDfX36ZuFhzhp+/
 L3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PIhCp8il47YAvxqad9wdbokygqezWUysVvDAkwwnuTQ=;
 b=Ju3bQe/S1n3q77t78yzNAVTL+WWQAnyfyKVDRHTtVKkYDpQ5dnk1WUWVGR9A4QENQp
 j7j8WAlHJoCVHWlpEkERAxAzHiotCefL21cPMf89VvCCO7BM2EHHkcK1hBhE484SFp2J
 rCQgZpNfdTetdhcEB+iVBuzfQIPoMDQuTv7SKDr9+LVbbYLQ2W4gvIO1kjKztBJ3cfBG
 ph7foXU8N3L+cozo2pHXxg/2+IYIUthx17Hev2hVoh1MC02IJs4cw1krTD5Cb0AU6C9N
 VbLpKFL1gPgtO7w8EWwmzUi/VANy16XwSExk3jcZs8s6alD3zCMSLvWWXibY3r4kOyAW
 IIYw==
X-Gm-Message-State: AOAM532Bvo5Vhr+67fmrJYJXingmDT0gSleJMyk4h+RjdNeFlEJ7uI3Y
 AcY1+wzoM+mO6s6yzaM2idAcCQ==
X-Google-Smtp-Source: ABdhPJzxt85Icg/KGkiKBlSAEikhPnZG1noHL4jUI+b++S85sT5D34hbYN70ykTecBBOWTCPRwpAgA==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr7686696wmc.168.1612446990254; 
 Thu, 04 Feb 2021 05:56:30 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id r13sm6788058wmh.9.2021.02.04.05.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:56:29 -0800 (PST)
Date: Thu, 4 Feb 2021 13:56:27 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 5/5] ASoC: Intel: bytcr_wm5102: Add machine driver for
 BYT/WM5102
Message-ID: <20210204135627.GM2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210120214957.140232-6-hdegoede@redhat.com>
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

On Wed, 20 Jan 2021, Hans de Goede wrote:

> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Add a new ASoc Machine driver for Intel Baytrail platforms with a
> Wolfson Microelectronics WM5102 codec.
> 
> This is based on a past contributions [1] from Paulo Sergio Travaglia
> <pstglia@gmail.com> based on the Levono kernel [2] combined with
> insights in things like the speaker GPIO from the android-x86 android
> port for the Lenovo Yoga Tablet 2 1051F/L [3].
> 
> [1] https://patchwork.kernel.org/project/alsa-devel/patch/593313f5.3636c80a.50e05.47e9@mx.google.com/
> [2] https://github.com/lenovo-yt2-dev/android_kernel_lenovo_baytrail/blob/cm-12.1/sound/soc/intel/board/byt_bl_wm5102.c
> [3] https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel
> 
> The original machine driver from the Android ports was a crude modified
> copy of bytcr_rt5640.c adjusted to work with the WM5102 codec.
> This version has been extensively reworked to:
> 
> 1. Remove all rt5640 related quirk handling. to the best of my knowledge
> this setup is only used on the Lenovo Yoga Tablet 2 series (8, 10 and 13
> inch models) which all use the same setup. So there is no need to deal
> with all the variations with which we need to deal on rt5640 boards.
> 
> 2. Rework clock handling, properly turn off the FLL and the platform-clock
> when they are no longer necessary and don't reconfigure the FLL
> unnecessarily when it is already running. This fixes a number of:
> "Timed out waiting for lock" warnings being logged.
> 
> 3. Add the GPIO controlled Speaker-VDD regulator as a DAPM_SUPPLY
> 
> This only adds the machine driver and ACPI hooks, the BYT-CR detection
> quirk which these devices need will be added in a separate patch.
> 
> BugLink: https://github.com/thesofproject/linux/issues/2485
> Co-authored-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop unnecessary configuring of OPCLK
> - Fix error-msg when setting the SYSCLK fails
> ---
>  sound/soc/intel/boards/Kconfig                |  12 +
>  sound/soc/intel/boards/Makefile               |   2 +
>  sound/soc/intel/boards/bytcr_wm5102.c         | 465 ++++++++++++++++++
>  .../intel/common/soc-acpi-intel-byt-match.c   |  16 +
>  4 files changed, 495 insertions(+)
>  create mode 100644 sound/soc/intel/boards/bytcr_wm5102.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
