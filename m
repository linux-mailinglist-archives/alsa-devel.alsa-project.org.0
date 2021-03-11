Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB7336BC1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F11A5171E;
	Thu, 11 Mar 2021 06:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F11A5171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615441938;
	bh=oj7XLbNR4PtYWzwpzNpL/HNQLD1SxP3mC1EHlb50IaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8FCP5eu/54wQ5QEWzhJz90416r9/K03vV8/LY+MTQH1l3C/mPwKwiy0shlcWvidi
	 CVmZb21w1zLosKgIWLusjcSi9V1Sox9IhFZRBtLYaQR+ykAYGQOCBCKKRgvUC4nA+m
	 8xmfrt7GtdXggipAjBu8O6170/8NG2QDd5Oc92bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CC0BF8015B;
	Thu, 11 Mar 2021 06:50:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F6DF8019B; Thu, 11 Mar 2021 06:50:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23040F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23040F8010D
Received: from mail-oi1-f198.google.com ([209.85.167.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <chris.chiu@canonical.com>) id 1lKEDU-0005Wm-Dt
 for alsa-devel@alsa-project.org; Thu, 11 Mar 2021 05:50:36 +0000
Received: by mail-oi1-f198.google.com with SMTP id m19so9373486oiw.19
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 21:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hhrtXdhcVtzIL3rMgHjbyflZREjwdEPHtqMCZp4XLg=;
 b=RW+OWTdDnPhHcKQLQTMRZUu3v105Ojftq0NIci1qJ7Y3WKH/ahrXJr/DbyzTZyMrTl
 5YgWt57mR9xTjLjEVQ6tzE5yFk2gQufuOb1IN0hugEl1cOoFmm9ihys3nducTQE01j+Q
 S5zlJAtz4HgvNldy0PufujnuSk+y3qHPrHa4ATJYwPyeOJkAphMVGlwLN/Lh/a2+uzDJ
 rnnJRYycXG4hs1D2XOTFVWvgzUcgFjr/ZrKZo+uM3Owp8cN0uJroPQ/Ziwf/W80JVJN3
 z9gayrXvQltXy2pEqM20WAd5by9rJnUIF7tnrWg9RC/zt8BxQWnnlEj2Dct8yywbqyW+
 4+cw==
X-Gm-Message-State: AOAM531NqT6qa4bK64rihsL7KKjSX4BUlODCCjoS9kORXkza4kQuOlRs
 KV5YnOarWJUMTXOzUxUuGYQENGs2+guCfj/bJC3rubS0K+EIcgBVCDYemepkNL1JlcMt7BxQv07
 kgdsAMfGAzOLHL34GoBzm4mqEeZXwZAfNJwisM9LW7Uwdp4K9SzGp8knw
X-Received: by 2002:a9d:6481:: with SMTP id g1mr5478711otl.303.1615441835408; 
 Wed, 10 Mar 2021 21:50:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIXt75ECUfdiHwjMp8yz8OW9UifCOusRUyrBrHzIcwFqbbwvbqu3OG8xiTHHTRJWtdBm5tCHAPWHaoftkEDyA=
X-Received: by 2002:a9d:6481:: with SMTP id g1mr5478695otl.303.1615441835121; 
 Wed, 10 Mar 2021 21:50:35 -0800 (PST)
MIME-Version: 1.0
References: <CABTNMG31sH99P0F7EKhpFwJf99x4U-VjFWrwXVe1wkra6owFLw@mail.gmail.com>
 <dba864a6-1442-1ebc-9de0-8c1511682b70@intel.com>
In-Reply-To: <dba864a6-1442-1ebc-9de0-8c1511682b70@intel.com>
From: Chris Chiu <chris.chiu@canonical.com>
Date: Thu, 11 Mar 2021 13:50:24 +0800
Message-ID: <CABTNMG1bO2AJLY0o58TX2=1QZPnPsZXabtYZA01QyqDS40JORg@mail.gmail.com>
Subject: Re: No sound cards detected on Kabylake laptops after upgrade to
 kernel 5.8
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Takashi Iwai <tiwai@suse.com>, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

On Tue, Mar 9, 2021 at 11:29 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2021-03-09 1:19 PM, Chris Chiu wrote:
> > Hi Guys,
> >      We have received reports that on some Kabylake laptops (Acer Swift
> > SF314-54/55 and Lenovo Yoga C930...etc), all sound cards no longer be
> > detected after upgrade to kernel later than 5.8. These laptops have
> > one thing in common, all of them have Realtek audio codec and connect
> > the internal microphone to DMIC of the Intel SST controller either
> > [8086:9d71] or [8086:9dc8]. Please refer to
> > https://bugzilla.kernel.org/show_bug.cgi?id=201251#c246 and
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117.
> >
> >      From the dmesg from kernel 5.8, the sound related parts only show
> > as follows but the expected snd_hda_codec_realtek and the snd_soc_skl
> > are not even loaded then.
> > [ 13.357495] snd_hda_intel 0000:00:1f.3: DSP detected with PCI
> > class/subclass/prog-if info 0x040100
> > [ 13.357500] snd_hda_intel 0000:00:1f.3: Digital mics found on
> > Skylake+ platform, using SST driver
> >
> >      Building the kernel with the CONFIG_SND_SOC_INTEL_KBL removed can
> > load the snd_hda_codec_realtek successfully and the pulseaudio and
> > alsa-utils can detect the sound cards again. The result of bisecting
> > between kernel 5.4 and 5.8 also get similar result, reverting the
> > commit "ALSA: hda: Allow SST driver on SKL and KBL platforms with
> > DMIC" can fix the issue. I tried to generate the required firmware for
> > snd_soc_skl but it did not help. Please refer to what I did in
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/14
> > and https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/18.
> >
> >      Since the skl_hda_dsp_generic-tplg.bin and dfw_sst.bin are not in
> > the linux-firmware. The Intel SST support for Skylake family is not
> > yet complete. Can we simply revert the "ALSA: hda: Allow SST driver on
> > SKL and KBL platforms with DMIC" in the current stage and wait for SOF
> > support for Skylake family? Or please suggest a better solution for
> > this. Thanks
> >
> > Chris
> >
>
> Hello Chris,
>
> Guide: "Linux: HDA+DMIC with skylake driver" [1] should help
> understanding history behind the problem as well as fixing it.
>
> Upstream skylake driver - snd_soc_skl - is intended to support HDA DSP +
> DMIC configuration via means of snd_soc_skl_hda_dsp machine board
> driver. You _may_ switch to legacy HDAudio driver - snd_hda_intel -
> losing DMIC support in the process. To remove any confusion - for
> Skylake and Kabylake platforms, snd_soc_skl is your option.
>
> Now, due to above, I doubt any skylake-related topology has ever been
> upstreamed to linux-firmware as a) most boards are I2S-based, these are
> used by our clients which we support via separate channel b) hda
> dsp+dmic support on linux for missing until early 2020.
>
> Topologies for most common skylake driver configurations:
> - skl/kbl with i2s rt286
> - apl/glk with i2s rt298
> - <any> with hda dsp
> can be found in alsa-topology-conf [2].
>
> Standard, official tool called 'alsatplg' is capable of compiling these
> into binary form which, after being transferred to /lib/firmware/ may be
> consumed by the driver during runtime.
> I have no problem with providing precompiled binaries to linux-firmware,
> if that's what community wants.
>
> Regards,
> Czarek
>
>

I think the guild [1] is too complicated for normal users to fix the problem.
Given it's not only the internal microphone being affected, it's no sound
devices being created at all so no audio functions can work after kernel 5.8.

Is there any potential problem to built-in the "<any> with hda dsp" precompiled
binary in linux-firmware?

Chris

> [1]: https://gist.github.com/crojewsk/4e6382bfb0dbfaaf60513174211f29cb
> [2]: https://github.com/alsa-project/alsa-topology-conf/tree/master/topology
