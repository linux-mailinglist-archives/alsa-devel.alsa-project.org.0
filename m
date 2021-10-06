Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A2742479C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 21:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5119844;
	Wed,  6 Oct 2021 21:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5119844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633550390;
	bh=/M+e2/H31e/RTFRjfOb+e0kOSe+C8eWjHKEXHFFWKsk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hx30txeDNFuB01tq7rACh3KDGGA8gJc08fUt4VqRrvS9G2TWglGgtJ4lFhFMfkeLi
	 MQ4tEXiih0GvTfB18hzxk5XsEDNcT42EN9XYjDYPThVb7l5VBlks5PLj+Jr8piK9m6
	 AmJEKhNt7WF5ltrck/0Z/Wv0y+akPtZd6wma/TrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BED8F80249;
	Wed,  6 Oct 2021 21:58:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8355F80240; Wed,  6 Oct 2021 21:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 866DCF800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 21:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 866DCF800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="286972861"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="286972861"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 12:58:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439247446"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 12:58:21 -0700
Subject: Re: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
To: Curtis Malainey <cujomalainey@google.com>
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
 <CAOReqxjGX6fwqNjX0i31JiQJ+vRCMNTTFBhn7L=iPzYvVMk9mQ@mail.gmail.com>
 <0482534d-46c4-5cee-25bd-8739e80a00f0@linux.intel.com>
 <CAOReqxisH_9TuP_v77JzdQ+v+duPvvyHNHBxXzGJZ3dMoyMczQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dfd23e78-b7c8-fa77-035e-19c9af595719@linux.intel.com>
Date: Wed, 6 Oct 2021 14:58:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxisH_9TuP_v77JzdQ+v+duPvvyHNHBxXzGJZ3dMoyMczQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


> I don't see an issue with still using a struct since we are using the
> same list across multiple machines, but this makes me wonder if maybe
> we should refactor this into another layer, having the ids at a top
> structure and then the speaker matches a layer down. E.g.
> 
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>         {
>                 .drv_name = "adl_mx98373_rt5682",
>                 .machine_quirk = snd_soc_acpi_codec_list,
>                 .quirk_data = &adl_max98373_amp,
>         },
>         {
>                 .drv_name = "adl_mx98357_rt5682",
>                 .machine_quirk = snd_soc_acpi_codec_list,
>                 .quirk_data = &adl_max98357a_amp,
>         },
>         {
>                 .drv_name = "adl_mx98360_rt5682",
>                 .machine_quirk = snd_soc_acpi_codec_list,
>                 .quirk_data = &adl_max98360a_amp,
>         }
> }
> 
> struct machine_driver adl_rt5682_driver_match {
>   .id = { "10EC5682", "RTL5682" }
>   .instances = &adl_rt5682_machines
> }

We probably need to experiment various options, on one hand the proposal
removes duplication but in a lot of cases outside of Chromebooks/rt5640
there is none, so that table rework adds an indirection with no real
benefit.
