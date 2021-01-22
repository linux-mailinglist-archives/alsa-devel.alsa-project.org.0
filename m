Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F0300B52
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 19:35:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA9A41B16;
	Fri, 22 Jan 2021 19:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA9A41B16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611340529;
	bh=zfQxaZcUjcadDfzOX5oKig+b2Ulc1bRUV2+i5kKZyc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uB8zHV+Jdu8OnbwnvXCfoYI94rzyPb7sFPfitKWHsTmkQf1k38eJR5XnX0kNKEIvK
	 cQUBOlTzlxrGGj2EhGr+Vpwvzd/j8Ef8nmDPLqSJR46XeiGXWWcuQg4i2VfRc4ApWA
	 5jHhLod968qGpFvrmSOmMp0zhh/zz0fwm/TytOy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B871F80129;
	Fri, 22 Jan 2021 19:33:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81593F8016E; Fri, 22 Jan 2021 19:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6F84F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 19:33:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6F84F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QE7HBkzg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E8CB23ABA
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 18:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611340424;
 bh=zfQxaZcUjcadDfzOX5oKig+b2Ulc1bRUV2+i5kKZyc4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QE7HBkzgFzidqdXPuPPJLRZgaJNsbyOCn6RMZZaEG55CiYogi5Fx0IH0ggGtgouYU
 3LNuQjH7OxlbdmZ+/Xwe0uxQVyVUEtNL1VR/GfgdsA/QGsaVvofl+befmZHjLeuRQW
 Wagxv8+8hDUCqGo8Y2krCQ39icJSDel34VZ1ZR6PbtkG3J3GJfSUVCC06+oMJa1mP3
 Jv7l3rsudpune8GbB39S/pYwn7FLmAZX/ud3DyU+w28dPu2BBPN9r261Ly4FPuCKWm
 t66Ryt/2voq5IwjnsBU21a+WVF4J4OibGCGOoWpoQkGJAdqPPidVmadfb67G8Dn56g
 +kzjFbKhTWCNg==
Received: by mail-ot1-f47.google.com with SMTP id n42so6008076ota.12
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 10:33:44 -0800 (PST)
X-Gm-Message-State: AOAM530XHTPsdFbY9VxR3u0GMwwuxDNeci9p/JCcCYBnuZw562vQ48pr
 EN2JQuxIYlZrDPResalsoCmXk5/Fd/qo7NOmESw=
X-Google-Smtp-Source: ABdhPJz2CVpb+WkBucfda8DXjOQ52bnCBbABT3cvj8fBOJcAT8Msp8JWz5bUyBsQfxecydVaL5hoQTFqa/sSqIaBpV0=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr4358072otk.210.1611340423783; 
 Fri, 22 Jan 2021 10:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20210122005725.94163-1-pierre-louis.bossart@linux.intel.com>
 <20210122005725.94163-3-pierre-louis.bossart@linux.intel.com>
 <s5hwnw58i1y.wl-tiwai@suse.de>
 <b84e78cb-b8a7-f62a-79ef-dab4e67decdc@linux.intel.com>
In-Reply-To: <b84e78cb-b8a7-f62a-79ef-dab4e67decdc@linux.intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jan 2021 19:33:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1R3PPmjncmpjcWDHiMOw_LbK=s7Wqn6RQRkSB0RUaJ9Q@mail.gmail.com>
Message-ID: <CAK8P3a1R3PPmjncmpjcWDHiMOw_LbK=s7Wqn6RQRkSB0RUaJ9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: SND_INTEL_DSP_CONFIG dependency
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
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

On Fri, Jan 22, 2021 at 4:38 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> >> The sof-pci-dev driver fails to link when built into the kernel
> >> and CONFIG_SND_INTEL_DSP_CONFIG is set to =m:
> >>
> >> arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
> >> sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'
> >>
> >> As a temporary fix, use IS_REACHABLE to prevent the problem from
> >> happening. A more complete solution is to move this code to
> >> Intel-specific parts, restructure the drivers and Kconfig as discussed
> >> with Arnd Bergmann and Takashi Iwai.
> >>
> >> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
> >> Reported-by: Arnd Bergmann <arnd@arndb.de>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >
> > This might not be good enough.  The code may still refer to the
> > snd_intel_dsp_probe() symbol even if IS_REACHABLE() is false
> > (although, practically seen, gcc should optimize it out).
> >
> > You need #if IS_REACHABLE() instead of the plain if.
> > Then you don't need to change the indentation, and the patch will be
> > eventually smaller, too :)
>
> I used the if() on purpose since in the past you mentioned #if/#endif
> are ugly. There are plenty of other cases in the kernel code where if(
> IF_REACHABLE(CONFIG_XYZ)) is used...

Dead-code-elimination in both gcc and clang is reliable for all supported
versions (there were problems in gcc-4.1 and before), and generally the
"if (IS_ENABLED())" form is nicer than the "#if IS_ENABLED()" form
because it produces better compile-time coverage.

        Arnd
