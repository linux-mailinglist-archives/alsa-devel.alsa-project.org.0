Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248435A311
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCB8B167D;
	Fri,  9 Apr 2021 18:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCB8B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985478;
	bh=yE1b+zl2yBNhiDEkmwvEuieBxAS9Wbr5fu10/9yqLLs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4xOs1SyNCpg26gBFd/OLkkPYeYcGtsqr26Q5I0T7AB5ysCr6EVXvn6I3TOvGDlfR
	 m/nQyR4c4RSDmVr4zQtBh477+kZxz4NCsoJUDTyj80g9Zpp4yWI9qlcMv54s2Niqv/
	 XFgiHJr+K31R2LZnjNSmJU2FzOLKSU782/UU6ivU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12812F800EE;
	Fri,  9 Apr 2021 18:22:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E272DF80113; Fri,  9 Apr 2021 18:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C0C6F80168
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C0C6F80168
IronPort-SDR: Hfl9Qr8vYfLmr8gp759sUJiBW1Yya4vdO4eEdEvYsIvlShtxiGhIrswR8P6dtDyW9Vol8BNVgd
 9SHvVBUHi0TQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="173272835"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="173272835"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 09:22:34 -0700
IronPort-SDR: CRY68+GKTTSQ4AUANnOX9YWZtKuWJHpPBAYUKQ6r9qxoBY8W3GADjQDuafnZ1shC4hZiKWXLd5
 HXO/G3H72edw==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; d="scan'208";a="380705489"
Received: from ravikira-mobl1.amr.corp.intel.com (HELO [10.212.11.141])
 ([10.212.11.141])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 09:22:33 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.de>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <s5hv98v6h5a.wl-tiwai@suse.de>
 <9195f83a-28c4-d028-8f1e-c3beaa88d891@perex.cz>
 <05551192-57dd-2541-94a3-57d40a37e3bf@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8f33d7f9-50af-db15-8fb2-01d55bb0b413@linux.intel.com>
Date: Fri, 9 Apr 2021 10:55:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <05551192-57dd-2541-94a3-57d40a37e3bf@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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


>>> Couldn't the driver probe the firmware files with some device-specific
>>> string suffix at first?  e.g. the driver can issue request_firmware()
>>> with $base_file-$dmi_board at first, then falls back to the generic
>>> $base_file.  A similar method was already used in Broadcom WiFi
>>> driver.
>>>
>>> Also, the driver may do request_firmware() with a fixed path for the
>>> custom firmware at first (e.g. "intel/sof-tplg-custom"); then a system
>>> integrator may set up a specific configuration even that doesn't match
>>> with DMI or whatever identifier.
>>
>> And when we have two firmware files which differs just by functionality
>> requested by user? Although your method will work, I won't close the
>> possibility to configure everything in udev rather using a hard coded 
>> fw load
>> scheme only.
>>
>>                         Jaroslav
>>
> 
> I've slept on it and now I think I see what you are trying to do.
> 
> 1. Load FW dependent on platform/user settings
> 2. Load appropriate topology for FW
> 3. Have UCM for the FEs and controls exposed by driver
> 
> 
> As for 1. I would say that FW should be loaded from one location
> if there is some platform that requires special FW just add quirks, like 
> it is done with every other driver, and if someone wants to build their 
> own special FW, they just replace it. We can't possibly support hundreds 
> of possible FW modifications if users want them by putting them in 
> separate files. Alternatively allow override via kernel parameters.
> Overriding FW files via udev would only make sense to me if it was 
> possible to upload new FW at runtime.

No, replacing firmware files is not viable.

Let me give you a practical example. In the course of SOF development, 
we routinely copy new test firmware+topology in the location of 
distribution-managed files. It's classic that when there is a 
distribution update in the background to install the latest SOF release, 
our test files are overwritten and it's not usual for developers to lose 
time trying to figure out why the functionality changed. We do need to 
have multiple paths and NEVER override what is provided by the 
distributions. it's the moral equivalent of /usr/bin v. /usr/local/bin.

Likewise, if an OEM has a custom version of firmware+topology, they may 
want to place it in their own packages that install *separately* from 
the default distribution. The udev rules provide a means to select the 
custom firmware, and if no rules are provided the default firmware with 
no customizations is used.

We are not talking about hundreds of configurations, but typically one 
directory per OEM. What they do internally is their problem, it's not 
for us to debate. The key point is that the custom files shall not 
interfere with the distribution baseline firmware, they have to be 
handled as separate packages that have their own release cycle and are 
possibly installed only in OEM custom images.

> I would say that same applies for 2.
> 
> This leaves number 3. which would require kernel exposing some kind of 
> information about loaded topology, so user space can use proper UCM.
> In topology manifest there are few reserved fields 
> (https://elixir.bootlin.com/linux/latest/source/include/uapi/sound/asoc.h#L382), 
> so we can add some information there which should be unique per topology 
> and then expose it in userspace on topology load, it can be the name of 
> UCM file topology wants to be loaded for example.
> 
> For example do something along those lines:
> 
> struct snd_soc_tplg_manifest {
>      __le32 size;        /* in bytes of this structure */
>      __le32 control_elems;    /* number of control elements */
>      __le32 widget_elems;    /* number of widget elements */
>      __le32 graph_elems;    /* number of graph elements */
>      __le32 pcm_elems;    /* number of PCM elements */
>      __le32 dai_link_elems;    /* number of DAI link elements */
>      __le32 dai_elems;    /* number of physical DAI elements */
>      __le32 ucm_files;    /* UCM files to use with topology */
>      __le32 reserved[19];    /* reserved for new ABI element types */
>      struct snd_soc_tplg_private priv;
> } __attribute__((packed));
> 
> struct snd_soc_tplg_ucm_files {
>      struct snd_soc_tplg_ctl_hdr hdr;
>      __le32 size;    /* size of struct in bytes */
>      __le32 count;    /* UCM entries */
>      char ucms[SNDRV_CTL_ELEM_ID_NAME_MAXLEN][];
> }
> 
> And then expose it somewhere under sysfs after parsing topology.

Yes I had a similar idea that we could expose in sysfs information taken 
from parsing the firmware (e.g. list of module UUIDs) and topology.

But it's not enough. The point is that you may use the same 
topology+firmware for different platforms, only the tuning varies. I 
think that's at that level that we should allow the OEMs to set a rule 
defining what the platform is and what tuning should be applied.







