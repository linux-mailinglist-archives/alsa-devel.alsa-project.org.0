Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E991B4ADFDD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 18:48:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B09B17A0;
	Tue,  8 Feb 2022 18:47:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B09B17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644342487;
	bh=4ls4ZuVj/iLgGQcszM4Ra3zLFEJi3YjBa888PyvATLo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HtNpda3uZ3xoII3PYOMZWXnSRBspvES+s9tPQr0cPhSSzXp0mogNSOr5YWDAkjYia
	 cxkymEcZE5R/tN/CxT3pdnCJQ086xYXAWdR4eqJBrEQdjG6CiV12yGt+R+hzdiujos
	 OpbC1AX1GNqtRypP0oI0Qf3v8VtjTFxbGPWOCnKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0124F80154;
	Tue,  8 Feb 2022 18:47:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC2F7F800F0; Tue,  8 Feb 2022 18:46:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5622DF800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 18:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5622DF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VMUKkxVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644342417; x=1675878417;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4ls4ZuVj/iLgGQcszM4Ra3zLFEJi3YjBa888PyvATLo=;
 b=VMUKkxVB53RPk5oTyNw30s3e0xMjb9hQ4AmUU6I7E239wFubAvkIj0bQ
 pUw3o5dVLwUoG6pvJ5ZBwjIgoJ/KwoWie3a6nuZsZcv81Ghog2TDhX69d
 PDdUCfZo1iE2oyy8iPfyaxZzbE8N3JZkdYMvcfkNOfUm8a9VERC1eVWJk
 23fUpmWquA0YsdvDY+H3gmFDg+pFWXNRx139K9Pun5KvuQrCJW/PhVtmX
 pXbpxBiIuS//BXbSDz7FwPFC+/k98Ejabe309sG01hK3qptllDwvzjV/b
 o9ebqFIWQHx0Tp3FYW6xo8YyR4Yc7hLwrzBcW0174HAJkyVW3EbZrXDKy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249214856"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="249214856"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 09:46:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="499644674"
Received: from anaygan-mobl1.amr.corp.intel.com (HELO [10.209.155.254])
 ([10.209.155.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 09:46:49 -0800
Message-ID: <41671a26-bd27-78ab-3440-eb9cb22c1ad1@linux.intel.com>
Date: Tue, 8 Feb 2022 11:46:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 cujomalainey@chromium.org, lma@semihalf.com
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


>>> Due to ALSA-device vs ASoC-component organization differences, new
>>> 'snddev_managed' argument is specified allowing for better control over
>>> codec registration process.
>>
>> Can you maybe clarify this? The existing code to handle the different
>> paths is already quite hairy (e.g. code in
>> hda_codec.c:snd_hda_codec_dev_free() that does different actions
>> depending on whether "codec->core.type == HDA_DEV_LEGACY) is true or
>> false), so we'd need to have very clear semantics for the
>> "snddev_managed".
> 
> It's rather straightforward - ASoC does not provide you with pointer to
> struct snd_card until all components are accounted for.
> snd_hda_codec_device_new() in its current form needs such information
> upfront though. As we want to create only as many DAIs (and other ASoC
> components like links and routes) as needed, codec's ->pcm_list_head
> needs to be built before codec's probing can be completed. But in order
> to have hda codec to fill ->pcm_list_head for, you need to create it.
> And in order to create it you need snd_card pointer which ASoC won't
> give you before you complete component probing.
> 
> Typical chicken and egg problem. And that's why additional option is
> provided - it solves that problem.

New capabilities are always welcome, what I am missing is how important
your suggestion is for end users or OEMs.

The main reason for using a DSP-based driver on a HDaudio Intel platform
is when DMICs connected to the PCH, since this link cannot be handled by
the legacy driver. Those sort of form factors typically have analog
playback and capture only. UCM exposes only analog playback and capture.

Desktops without DMICs generally rely on the legacy driver and have
different sorts of problems with jack retasking and other time-consuming
problems.

Exposing additional DAIs in a DSP-based driver when supported by the
codec is a good idea on paper, but it's far from straightforward.

a) it assumes that there are indeed additional DAIs. Is this really the
case on the SKL/KBL devices you are targeting? It's not on newer
CML..ADL devices we've been supporting with SOF.

b) it assumes that what is exposed by the codec actually does work - and
the number of quirks tells us to be cautious. We routinely get reports
that even Intel NUCs don't have the right quirks in the kernel...

c) and then it creates new problems for the topology that may expose
paths that may or may not be supported by the codec. I am not aware of
any existing APIs to take down or enable a path conditionally - though
it's been a problem for a very long time for SSP and DMIC enablement
that are not always correctly described, and any suggestions to improve
this limitation would have my full support.

FWIW, in our latest SOF work we went back to handling ONE DAI with
analog playback and capture and ditched the 'digital playback'. Trying
to do more led us to too many issues of 'works on platform A' and 'does
not work on platform B', and sometimes with different answers depending
on which BIOS version is used.

IMHO what's really problematic for HDaudio is the support for amplifiers
located behind the HDaudio codec, for which we more often than not are
missing the I2C configuration sequences. Suspend-resume is a recurring
problem as well.

I am not saying no for the sake of saying no, I have just never heard of
anyone complain about restrictions on the number of DAIs in the HDaudio
world.
