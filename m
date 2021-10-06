Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A64246A4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 21:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E606822;
	Wed,  6 Oct 2021 21:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E606822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633548211;
	bh=mWjr9vBWSyIwiLnGi9gKziBMW/aEOAcCskKNL4Mo57w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+GZRvog1TUXK8xePVQiH7zLy1PfAXfG+gWV9Kwti2FehkFA1IOk/XE//GAyH7zTC
	 0YpX15MNkcB7yYaidIR5uAsM5iQE3k9rMtQi5VeUL5MuRAFhtJvztkdM7JrSrytLXS
	 qT71YDJqz7s/loF9TV7nLZC/Mq2J/pLKmqNAxLuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8ED1F80249;
	Wed,  6 Oct 2021 21:22:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9606F80240; Wed,  6 Oct 2021 21:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5721DF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 21:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5721DF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gZfxWS+j"
Received: by mail-qk1-x72d.google.com with SMTP id 138so3648032qko.10
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 12:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FnP39XDqwUDKj+L29KvHYvVj6TkVRcAAokzYN+iUggs=;
 b=gZfxWS+jqL9gtoJjT6lfE5zR038UOUAf7kNBsMgig+N+zJ/tqvsCUPzzEuYUyT5leG
 7VfGasx6WcAwyTAQrYWTLFpR+W5mp2bBf0+oWBcKUOgMdLS+2V/McWT0dEb7rndA3Hjr
 hUSseCiGIan9Zstcrha2TUnSkEskjxA/3IijYfmn8Wt2PlAZpiDmGzdhR0eiIRVHYgIi
 LVWj/qvuJWDhn0fvcWwIoqC1in5qkrVSovl5x9RLMMPa54bWO4W9ytOJXQwOe8mK2IE1
 hg2bgQcARtfGrWkvXCD9Vk09nfIdKC2QifQZMhF/10hxluVhaa3Yo0TXsBHPa93pHqMf
 mupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FnP39XDqwUDKj+L29KvHYvVj6TkVRcAAokzYN+iUggs=;
 b=LnEsub+vKMKRhYBB5SrYTfD6rbwqbK8JCBbi//kFiffFtlr0V8ivJKtBT0svEnrvHA
 DE0Y1H2MssxP8mBHbJF5Eoj66nQVZ6uXw4eelgxJbjm1ugrx/koiyeGbT61XeKinbeOi
 2WCbOy5gl3iWr/SIVcHNjiJJCOLtjIXFUri+r+OG5kzgijMuefLbEr5FxdjQ1XoP2lH3
 2+DEgOhXBuguNXHCMBa3QPetnjwSYNfX7Oat+OACwRefq7hq76aVUygMuyN3ODAUeRgv
 YAJPYB4C4/PgeiGZ1skcIou/QvYRgkDrQQEmLNgRHreLVdC4zSb/m8s2Jn146KAAvE4z
 r/aw==
X-Gm-Message-State: AOAM530nwEnaOV2Fek0LyGjsycPc4rkIyvCNS3JzYBhnn032K4GxEsmP
 ly78e3w+bO/iCFbKgOVlybZIW1pUQZaUbyN87VOeBg==
X-Google-Smtp-Source: ABdhPJyIgUgRYybHDmpu2/QLxzAOSr3kKCKcfPSAgIULu5tkrjY78F21WLqcRrlUu2pol//2JXPt/SjKtfFowD6vejM=
X-Received: by 2002:a37:43d6:: with SMTP id q205mr474410qka.4.1633548122106;
 Wed, 06 Oct 2021 12:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
 <CAOReqxjGX6fwqNjX0i31JiQJ+vRCMNTTFBhn7L=iPzYvVMk9mQ@mail.gmail.com>
 <0482534d-46c4-5cee-25bd-8739e80a00f0@linux.intel.com>
In-Reply-To: <0482534d-46c4-5cee-25bd-8739e80a00f0@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 6 Oct 2021 12:21:51 -0700
Message-ID: <CAOReqxisH_9TuP_v77JzdQ+v+duPvvyHNHBxXzGJZ3dMoyMczQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Bard Liao <bard.liao@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Brent Lu <brent.lu@intel.com>,
 Libin Yang <libin.yang@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>
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

On Wed, Oct 6, 2021 at 11:43 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 10/6/21 1:34 PM, Curtis Malainey wrote:
> >>  };
> >>
> >> +static struct snd_soc_acpi_codecs adl_rt5682s_hp = {
> >> +       .num_codecs = 1,
> >> +       .codecs = {"RTL5682"}
> >> +};
> >> +
> >>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
> >>         {
> >>                 .id = "10EC5682",
> >> +               .id_alt = &adl_rt5682s_hp,
> >>                 .drv_name = "adl_mx98373_rt5682",
> >>                 .machine_quirk = snd_soc_acpi_codec_list,
> >>                 .quirk_data = &adl_max98373_amp,
> >> @@ -296,6 +302,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
> >>         },
> >>         {
> >>                 .id = "10EC5682",
> >> +               .id_alt = &adl_rt5682s_hp,
> >>                 .drv_name = "adl_mx98357_rt5682",
> >>                 .machine_quirk = snd_soc_acpi_codec_list,
> >>                 .quirk_data = &adl_max98357a_amp,
> >> @@ -304,6 +311,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
> >>         },
> >>         {
> >>                 .id = "10EC5682",
> >> +               .id_alt = &adl_rt5682s_hp,
> >>                 .drv_name = "adl_mx98360_rt5682",
> >>                 .machine_quirk = snd_soc_acpi_codec_list,
> >>                 .quirk_data = &adl_max98360a_amp,
> >
> > Is there any way we can collapse this and the primary id into a single
> > list to avoid having 2 locations to track for the IDs?
>
> I was thinking about that too, but in that case we would want to have a
> list of strings, rather than the address of a structure which adds one
> layer of indirection.
>
> Something like
>
> .id = { "10EC5682", "RTL5682" }
>
> and the .num_codecs removed and some termination added.
>

I don't see an issue with still using a struct since we are using the
same list across multiple machines, but this makes me wonder if maybe
we should refactor this into another layer, having the ids at a top
structure and then the speaker matches a layer down. E.g.

 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
        {
                .drv_name = "adl_mx98373_rt5682",
                .machine_quirk = snd_soc_acpi_codec_list,
                .quirk_data = &adl_max98373_amp,
        },
        {
                .drv_name = "adl_mx98357_rt5682",
                .machine_quirk = snd_soc_acpi_codec_list,
                .quirk_data = &adl_max98357a_amp,
        },
        {
                .drv_name = "adl_mx98360_rt5682",
                .machine_quirk = snd_soc_acpi_codec_list,
                .quirk_data = &adl_max98360a_amp,
        }
}

struct machine_driver adl_rt5682_driver_match {
  .id = { "10EC5682", "RTL5682" }
  .instances = &adl_rt5682_machines
}
