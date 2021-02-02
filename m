Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5C430B778
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 06:54:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD2A11770;
	Tue,  2 Feb 2021 06:53:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD2A11770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612245252;
	bh=Lg0j1KYwIYBNS4Uci/e5huAFIsJFfRn5CqE3IFuicn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHF/9mH476GDDcjkzi7xftp8341SvW0BnvemU8B3k3LskBkbzAA0scx1HGjtP1Tjq
	 VKr9ic6hIlX2aSd0i40REe5bzGBygZPMIfCCov3IIxHr9mN24CWvnMFTlI26q8Qvga
	 /HY6I9RsmDDl/Mh2UJb3aLGXpCU3GU0QHz8bBFi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ECDDF801F7;
	Tue,  2 Feb 2021 06:52:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36F52F80171; Tue,  2 Feb 2021 06:52:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B006F800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 06:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B006F800E1
Received: from mail-lj1-f197.google.com ([209.85.208.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1l6obw-0000ku-8T
 for alsa-devel@alsa-project.org; Tue, 02 Feb 2021 05:52:24 +0000
Received: by mail-lj1-f197.google.com with SMTP id s18so10736379ljp.7
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 21:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xAawZJC7H4O4DtPTBsKQCRVHj7GhHPt05S5tP6y198c=;
 b=U98Wlg4iJuFxuArusPk+lIqrbLo3k2OE78MWr+WHPX07ZyaTDk1sJIetmyD4PPir2x
 rRWsC7YtSUnPqy2iGiPEJlc6okpAFMqVgVC7hExbS6zLYDNTdxdAUSiKO7xb/Z1sMVcL
 DJlzPUC40bajt3AD/wbMPKQIQhaRk3D+3LRxnGb2z3ji+bdlLJbNz+jEooerdiZlqock
 juDKqCGXDewIpFLSfcsyhO4p9Ng5SZ/uEPKC6bxp6S5mGLJOrtH1nLk37brmbbNBnFnf
 Fq3lT9fSnHG5mPxP0UYf2ZfBwKzwHLzyhKH7Xhp8DaJ6f+WYpOa1DZhwt3EDVi0fEq71
 uoCQ==
X-Gm-Message-State: AOAM533GgbaYBrHaqQF6dIY94mjXJdworVEx4813zXQMuhel7EbEmxXm
 WJYO0iX5xAcW8hcL7ap0VEF19bhY3e0xPn++pte+tJpqRBNwDBLrY+F192Z3u5BO1ozC1Lz7y9s
 X9hKUc3LM8A9r5QKui+k6zjyOV0VjkYItEG83BXW3qwRbwr2bZdvm8CBW
X-Received: by 2002:a2e:7d11:: with SMTP id y17mr12429417ljc.116.1612245143716; 
 Mon, 01 Feb 2021 21:52:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQEQC8Pi/4DQAshOYlUgOe58MwbfInlHCM22PZaczBEBhslGrMfgTjlMhyCj+BB+T/12VfmrJlIx9kXxOack8=
X-Received: by 2002:a2e:7d11:: with SMTP id y17mr12429402ljc.116.1612245143401; 
 Mon, 01 Feb 2021 21:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
 <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
In-Reply-To: <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 2 Feb 2021 13:52:11 +0800
Message-ID: <CAAd53p4gqyuFPWX55fnPGHORXXf58++ZRMH9WFYp+QwS1=xDJQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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

On Wed, Jan 27, 2021 at 11:22 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2021-01-27 9:03 AM, Kai-Heng Feng wrote:
> > On Mon, Jan 25, 2021 at 7:55 PM Cezary Rojewski
> > <cezary.rojewski@intel.com> wrote:
> >>
> >> Skylake is dependent on SND_SOC_INTEL_SKYLAKE (aka "all SST platforms"=
)
> >> whereas selecting specific configuration such as KBL-only will not
> >> cause driver code to compile. Switch to SND_SOC_INTEL_SKYLAKE_COMMON
> >> dependency so selecting any configuration causes the driver to be buil=
t.
> >>
> >> Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >> Suggested-by: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.=
intel.com>
> >> Fixes: 35bc99aaa1a3 ("ASoC: Intel: Skylake: Add more platform granular=
ity")
> >> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> >
> > Still not working:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1902457/comments/6=
6
> >
>
> Hello,
>
> Thanks for your reply Kai-Heng.
> I believe you're relating to completely different issue than the one
> this very patch is targeting.

Understood.


>
>  From the logs you've provided one can see that snd_soc_skl did attempt
> to probe() so the code compiled just fine. Again, compilation issue is
> the one I've addressed here. While we're here, I'd appreciate kconfig
> being provided along dmesg file. Logs alone do not show the entire
> picture, unfortunately.

Config file here:
https://pastebin.ubuntu.com/p/kGBv6XgHms/

>
> In regard to missing sound, (looks like we're talking about HDA dsp +
> DMIC configuration) kconfig mentioned above will be required. Pretty
> sure HDAudio support for skylake-driver is not enabled on your machine
> and thus driver exists probe() early without registering any sound card.

Do you mean CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC needs to be enabled?

Kai-Heng

>
> Regards,
> Czarek
