Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5902321ABD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 16:06:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 638F71675;
	Mon, 22 Feb 2021 16:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 638F71675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614006363;
	bh=2BqNgs+e2CVx06A6bIz0yGhZKTu8f/qI/ccf/+LYpmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5ehBZW0lX7K9KnI+3JUYpLj1ak6MYgy7Oit9IT1PVBZYnqY8FSomhS30ook0RAU6
	 s1q/c96YT1ODhVylSFXrhgF6OqISQPcrb2Je+1y7TrKq69xfpCvR+V5/y9sZBCoU4g
	 pYj+1Rda1709/6qQau3hLkQdigv7tndL4weWOgdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 936AFF8026F;
	Mon, 22 Feb 2021 16:04:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31FB4F8025E; Mon, 22 Feb 2021 16:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52CD5F80154
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 16:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52CD5F80154
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lECl2-0006oT-RE
 for alsa-devel@alsa-project.org; Mon, 22 Feb 2021 15:04:20 +0000
Received: by mail-lj1-f200.google.com with SMTP id t8so13293216lji.1
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 07:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2BqNgs+e2CVx06A6bIz0yGhZKTu8f/qI/ccf/+LYpmM=;
 b=f4cLOa2VlL4KciZQilX8KKU18GFZFblxW7vXlucMqxQh1OMnqACMBM0ptmCy38Ydr5
 vo39gWOohKGD6JQ/cVXmIHMac3lFMaNNvZpDZJPG4MzYPzE3ngx5PRKz6SbzheuD/KIZ
 OJz9auRzwwRj5IvZLOtWPCMel6IGtqZJbmzJHGNIYZEC7GAlBSOpexEwD3i8yctzbAWM
 fWdnimqDaN2FzzOsswgaX/oUqTSJ/XAWMLSoWLm3yThA7kIAdlNJvcrNyFk5ERAow9yp
 aC5pX9VALzG1aBijHBR+YS7iyjAz3sZN4ojR94FRVQuiMnecM9xDgAQpeWLR0uSrNSxB
 aQAw==
X-Gm-Message-State: AOAM531TTTakKjE74Pn9b7fv5zTipwVADGZ3zVc8Zul/EVZ4jmLLZplj
 IxObcpAIcushE+exvRES0kmxOi/XP8Q11sddKBTtHlCRPi8TskipfUIyh5oBRHJLGk0P5TSR1c8
 Yao8otOJ1rUR26NWHBCt/9mm21CWd1Y25BEfNBUtSQCuf3O08yyAswSXH
X-Received: by 2002:a19:6d09:: with SMTP id i9mr13608917lfc.425.1614006260261; 
 Mon, 22 Feb 2021 07:04:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVTARM9XPEOkojVA6GHQKPMLAFOjmypsoSObX9VQ8oZvKBtvhMhl2ZWOK+kEhq+alH20jef8GkBMyqfgkt8Z4=
X-Received: by 2002:a19:6d09:: with SMTP id i9mr13608891lfc.425.1614006259561; 
 Mon, 22 Feb 2021 07:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
 <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
 <CAAd53p4gqyuFPWX55fnPGHORXXf58++ZRMH9WFYp+QwS1=xDJQ@mail.gmail.com>
 <181c989f-7a4d-3cdd-11be-7378dbc9502c@intel.com>
 <5e970d19-9544-50fe-f140-b66245418c6e@intel.com>
 <CAAd53p4srH6NFwcyUCBnLj=MS8-YBvA9CPjMbcryGgi5CmUUHw@mail.gmail.com>
 <2c93bf65-4996-08c6-5be1-da4b9966e168@intel.com>
 <f20e5e2b-3761-5e13-3166-5f026d088aa1@intel.com>
In-Reply-To: <f20e5e2b-3761-5e13-3166-5f026d088aa1@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 22 Feb 2021 23:04:08 +0800
Message-ID: <CAAd53p6ZyuAzNJWLyONkbFndSRF2HBLn=6HLzb5RUShCmNWdVQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Cezary,

On Mon, Feb 15, 2021 at 11:43 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2021-02-07 3:49 PM, Cezary Rojewski wrote:
> >
> > On 2021-02-02 1:41 PM, Kai-Heng Feng wrote:
> >> On Tue, Feb 2, 2021 at 6:56 PM Cezary Rojewski
> >> <cezary.rojewski@intel.com> wrote:
>
> ...
>
> >> Commit cc2d025a81a9 ("ASoC: Intel: Skylake: Update description for
> >> HDaudio kconfig") removed "DEPRECATED" from the
> >> SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC, does that mean the option is safe
> >> and should be enabled in downstream distros?
> >
> > Skylake driver - sound/soc/intel/skylake - is your only option if you
> > want to enable HDA (dsp) + DMIC configuration on SPT platforms
> > (skl/kbl/kbl-r/aml/cml-s).
>
> Hello Kai-Heng,
>
> I'd like to close the compilation issue which this patch is addressing.
> Could you confirm that the presented change fixes the issue on your end?

No, the SST regression is not fixed.
However, it's not the scope of this patch, which is to fix a different issue.

So please proceed to merge the patch. We can discuss the SST
regression in other thread.

Kai-Heng

>
> Regards,
> Czarek
