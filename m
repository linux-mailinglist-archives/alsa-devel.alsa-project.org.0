Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9C12F222
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 01:22:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D650D16CB;
	Fri,  3 Jan 2020 01:22:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D650D16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578010972;
	bh=v/ciAtoeddWneUHL+u8lU8Ukz029nXdWoV5kZWWgUDI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4FfnfNEgljeW89SlX/Z0LYshDVkCRTBTcZ5HzWUoE6R1z2bvsEYGY0XFyA4ox+A5
	 sUNdAd5/1uRBcUgQav3AND0t1Gpyf+N+JO+xj6HyxdfL2AmF8ImX7pjWljt5HMvnwR
	 YesBpe2G2X60aTPuw4zEVGNp0JEwTvzmyX6v0HWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA873F8014F;
	Fri,  3 Jan 2020 01:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F263EF8011E; Fri,  3 Jan 2020 01:21:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F83F8011E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 01:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F83F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KzOw1b7W"
Received: by mail-wm1-x343.google.com with SMTP id a5so7068879wmb.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Jan 2020 16:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PRPBkou+uS1zWNSOaxrecr/7LWg1sY/IJLNmSa72PP0=;
 b=KzOw1b7W+dgKGAThSM9EsvLpjbfAF32G6nByR78jmSLIj8CsDCnVA+3qESaq9lo/Mz
 tlp9GPLePItxsfN3nNTGPHtReAGQMwMxGwKDT8ZOpX1rOSgrWQte8t5TFTPm7CjZRVld
 MghGWqE/AP95QTb63M2Vc9Uh0tOBGjV4KG2So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PRPBkou+uS1zWNSOaxrecr/7LWg1sY/IJLNmSa72PP0=;
 b=F32it2SuI91Pc+OPCoIi9qtPfETdGw+JwidI3iMiWw0VatQYxt68KMjNu3Nj1lGX/C
 nzrE6V+6jtjicadA/j0uoIbMXB+tyx46J92zeW2OZhGdaAh4Wp0M+XicM277LiiNmT0h
 FjL7IT94dM52GPzpZD8WQR/7udYC/ZQlZ5VVjE7WYAsOSt0m9IC5DKu6TTMxdbSv7nja
 GJ284ERWtDGzG7yDe0xbc+PHqqUp+/Zv8hDR9TmwHrlCc0NLr16HICB2lMdhwyfnWqIA
 uAxwEg4oSHtw0ItZb57XnND7FCODPTR0pAxoV1BHx1hZny8t86UO9pf2nO8xUg5eD3Vg
 Yr+g==
X-Gm-Message-State: APjAAAXKtg5PEm1wwkiWpqWRZNMPsFgHmwv8OGY0+9ljnc0ThYuLLyef
 vD/jh/A78jP/0xtW/T5agOIacD07+t9rB8QPiQ9LkQ==
X-Google-Smtp-Source: APXvYqx/ci/jx8coSHWX+oaIRR3IFz+Cjzk8IQk58kJAwAjteJC9NLM2626yzxODf7N/9szk6OapKxvCqzDrMEwxIGc=
X-Received: by 2002:a1c:7715:: with SMTP id t21mr15944147wmi.149.1578010864658; 
 Thu, 02 Jan 2020 16:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20200102112558.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
 <a7ab606a-1e35-29aa-ea60-7c31374eb7b4@linux.intel.com>
In-Reply-To: <a7ab606a-1e35-29aa-ea60-7c31374eb7b4@linux.intel.com>
From: Sam McNally <sammc@chromium.org>
Date: Fri, 3 Jan 2020 11:20:27 +1100
Message-ID: <CAJqEsoDxuKs7EufU-FwZzkipgw7dXpP1=7nSDqOy2oNB4hq6fg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Xun Zhang <xun2.zhang@intel.com>, alsa-devel@alsa-project.org,
 Jairaj Arava <jairaj.arava@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: sof_rt5682: Ignore the
 speaker amp when there isn't one.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 3 Jan 2020 at 08:18, Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 1/1/20 6:28 PM, Sam McNally wrote:
> > Some members of the Google_Hatch family include a rt5682, but not a
> > speaker amp. When a speaker amp is also present, it matches MX98357A
> > as well, resulting in the quirk_data field in the snd_soc_acpi_mach
> > being non-null. When only the rt5682 is present, quirk_data is left
> > null.
>
> Sorry, I don't get this last sentence.
>
> There is a single entry for 10EC5682 in sound-acpi-intel-glk-match.c and
> quirk_data is assigned - thus can never be NULL.
>
> I wonder if your Chrome kernel has an extra entry in
> snd_soc_acpi_intel_glk_machines[] ? What I am missing?
>

I was referring to the duplicate 10EC5682 entries in
snd_soc_acpi_intel_cml_machines[]. Sorry for the confusion. I'll send
a new version with those details in the description.

> >
> > The sof_rt5682 driver's DMI data matching identifies that a speaker amp
> > is present for all Google_Hatch family devices. Detect cases where there
> > is no speaker amp by checking for a null quirk_data in the
> > snd_soc_acpi_mach and remove the speaker amp bit in that case.
> >
> > Signed-off-by: Sam McNally <sammc@chromium.org>
> > ---
> >
> >   sound/soc/intel/boards/sof_rt5682.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> > index ad8a2b4bc709..8a13231dee15 100644
> > --- a/sound/soc/intel/boards/sof_rt5682.c
> > +++ b/sound/soc/intel/boards/sof_rt5682.c
> > @@ -603,6 +603,14 @@ static int sof_audio_probe(struct platform_device *pdev)
> >
> >       dmi_check_system(sof_rt5682_quirk_table);
> >
> > +     mach = (&pdev->dev)->platform_data;
> > +
> > +     /* A speaker amp might not be present when the quirk claims one is.
> > +      * Detect this via whether the machine driver match includes quirk_data.
> > +      */
> > +     if ((sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT) && !mach->quirk_data)
> > +             sof_rt5682_quirk &= ~SOF_SPEAKER_AMP_PRESENT;
> > +
> >       if (soc_intel_is_byt() || soc_intel_is_cht()) {
> >               is_legacy_cpu = 1;
> >               dmic_be_num = 0;
> > @@ -663,7 +671,6 @@ static int sof_audio_probe(struct platform_device *pdev)
> >       INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
> >
> >       sof_audio_card_rt5682.dev = &pdev->dev;
> > -     mach = (&pdev->dev)->platform_data;
> >
> >       /* set platform name for each dailink */
> >       ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_rt5682,
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
