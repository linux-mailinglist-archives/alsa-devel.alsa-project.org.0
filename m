Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 990104247BC
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 22:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1326F844;
	Wed,  6 Oct 2021 22:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1326F844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633550948;
	bh=GwJKa3HWq8WLg2BfuYMmFEt7zedPU3kH6RLDEzBHmlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ORkAkBvbEBxtGbsKX/4AdDydHub4T1/76kHM+KcpAlltt01TSOV2ygVLALGE9EHLE
	 e8+2SSpBkoBU+6heTwvpmyidIKzhA5JUUO/e90k+oiX1RRYZSmZr/LkQrCfvH4hbxv
	 7J4XZEsT+kCT8tr33w1EWOqKobUpbR17Dy19f2ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FEE6F80249;
	Wed,  6 Oct 2021 22:07:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 705F7F80240; Wed,  6 Oct 2021 22:07:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77E72F8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 22:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E72F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Yic4R7P/"
Received: by mail-qk1-x730.google.com with SMTP id b65so3771579qkc.13
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdJ09V/pcQE6r3HiadtvxvIguyjALgPrkh/XKOwV7Jk=;
 b=Yic4R7P/hfuCQhHrbkUgWVJS89QccJE249K19g3fzSPI4hTMrWOZ2lxkWwE5NY7hQ/
 t5kl2K2VTy5LkXfREvMJTBt6lkxVIKEnRwzUsM4mz28ZyOPo60Fc6gtYV+ya0ZZ2LBdE
 FIcfsrvB/70ElBECtyZ/FXg7iDQVsFcamXc3fdZv7XhaTLlX9uu4/5/MRHqNY9EIJIMZ
 XnuPxNR1tYCKrUTY2TRDOQf4pYa6mmiD0SdvgyqR53AghrTii4QY6V2sX3lvlwJyrEN+
 KZG8Jik+Vzx++AtwcQC2PuiP4Ybzub3x3Fw2y+o78dAhpRDYqLJB0Pa1bhb6+zD+UQZ9
 UWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdJ09V/pcQE6r3HiadtvxvIguyjALgPrkh/XKOwV7Jk=;
 b=NrJfogpgqPSUhzAKfepbyDCf8NF6O4T4AcZ+rH/pOsIyqYHYOmHT1KsqKO4SranUYQ
 zEOLO1xtZ/r+9qRv8Va7wQIS7XDn8aySxwdSgasPG5PEQiPoaT4GdiLCg2hiLJemUZJl
 Qn/q3Ajgs6ThLr82snI/QUzmySj43kAcQ/dGHBcI7X7TpiQaq2v+xB21qnOhxeQFoq9W
 GGZAkA+kuSjkE7pz6sH/nQ0p6+sKj8dxKCilQKFgSwkecGOccTCMP8yceSHDpbN1e3Ph
 dsE6gP5km2lX4CGK1yAbuJ9Vigzxi1i0S0P0HfdHT1aKs7H/cISbsnzXmoImLaAeEWZ2
 Xm+A==
X-Gm-Message-State: AOAM531VIGHFSlO6UOjvBCRoeo09FBiI2it1SpbE3RNV7cmqN1NzIJGK
 BlgT6EvQB3NHmXSiIqgVDR4UtlBMiqJx+duN5OJfKg==
X-Google-Smtp-Source: ABdhPJwXdoCb5tl7ZEp7CnIq1HAWDaj0IstOTAg0lznv3mEsLUPCwmAmCxkokdL/lnD30jYUW8BSJPEYZFLPEHJuhTY=
X-Received: by 2002:a05:620a:638:: with SMTP id 24mr73965qkv.333.1633550856863; 
 Wed, 06 Oct 2021 13:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
 <CAOReqxjGX6fwqNjX0i31JiQJ+vRCMNTTFBhn7L=iPzYvVMk9mQ@mail.gmail.com>
 <0482534d-46c4-5cee-25bd-8739e80a00f0@linux.intel.com>
 <CAOReqxisH_9TuP_v77JzdQ+v+duPvvyHNHBxXzGJZ3dMoyMczQ@mail.gmail.com>
 <dfd23e78-b7c8-fa77-035e-19c9af595719@linux.intel.com>
In-Reply-To: <dfd23e78-b7c8-fa77-035e-19c9af595719@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 6 Oct 2021 13:07:25 -0700
Message-ID: <CAOReqxjAO0DpOvfpUwXH4ad+7Bx22TBxQUopBJKAwO8DpGJ20Q@mail.gmail.com>
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

On Wed, Oct 6, 2021 at 12:58 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > I don't see an issue with still using a struct since we are using the
> > same list across multiple machines, but this makes me wonder if maybe
> > we should refactor this into another layer, having the ids at a top
> > structure and then the speaker matches a layer down. E.g.
> >
> >  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
> >         {
> >                 .drv_name = "adl_mx98373_rt5682",
> >                 .machine_quirk = snd_soc_acpi_codec_list,
> >                 .quirk_data = &adl_max98373_amp,
> >         },
> >         {
> >                 .drv_name = "adl_mx98357_rt5682",
> >                 .machine_quirk = snd_soc_acpi_codec_list,
> >                 .quirk_data = &adl_max98357a_amp,
> >         },
> >         {
> >                 .drv_name = "adl_mx98360_rt5682",
> >                 .machine_quirk = snd_soc_acpi_codec_list,
> >                 .quirk_data = &adl_max98360a_amp,
> >         }
> > }
> >
> > struct machine_driver adl_rt5682_driver_match {
> >   .id = { "10EC5682", "RTL5682" }
> >   .instances = &adl_rt5682_machines
> > }
>
> We probably need to experiment various options, on one hand the proposal
> removes duplication but in a lot of cases outside of Chromebooks/rt5640
> there is none, so that table rework adds an indirection with no real
> benefit.

Fair point, given the current situation this would benefit RTK boards
only. I have no idea if we will end up in the same boat with any other
boards, but given the current supply chain status I would expect this
(multi-sourcing) to be a way of the future. So maybe an idea we pocket
for now and deploy when we end up in this situation  with more
drivers.
