Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA48303B7
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 23:02:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D11167E;
	Thu, 30 May 2019 23:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D11167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559250126;
	bh=jDuCq6MpV3b0v+J+BdV8EnWjM5L48Mh6aJI3HOqYaAA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpkDxEy06IOKWu5N57jXSfXLlV31cT0NvgSoXPIWWT5jVfsAcL8SjzHZBdgPr/pOG
	 rH2VTdFH0V3h65+wTiP6nsl7DkmhMQGkzJVuzUStvGKjAk5tT7o+Ol6JTyLpxoFTDD
	 oYYLSIO/o5xogWFfaVbaIqPdZCfHB0/DHD8z5nXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A04E2F896EB;
	Thu, 30 May 2019 23:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF714F896F8; Thu, 30 May 2019 23:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 183FAF8072E
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 23:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 183FAF8072E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 14:00:11 -0700
X-ExtLoop1: 1
Received: from vsharm9-mobl.amr.corp.intel.com (HELO [10.251.144.84])
 ([10.251.144.84])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2019 14:00:11 -0700
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190530201828.2648-1-ranjani.sridharan@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <684fe069-d2fb-f716-bd3e-67f0c7a52de0@linux.intel.com>
Date: Thu, 30 May 2019 16:00:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530201828.2648-1-ranjani.sridharan@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: hda: increment codec device refcount
 when it is added to the card
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/30/19 3:18 PM, Ranjani Sridharan wrote:
> Calling snd_device_new() makes the codec devices managed by the card.
> So, when the card is removed, the refcount for the codec
> device is decremented and results in the codec device's kobject
> being cleaned up if the refcount is 0. But, this leads to a NULL
> pointer exception while attempting to remove the symlinks when the
> codec driver is released later on. Therefore, increment the codec
> device's refcount before adding it to the card to prevent this.

Ranjani, you should add a bit of context for the rest of the list...

This patch suggest a solution to a set of sightings occurring when 
removing/adding modules in a loop, and the current analysis points to a 
difference between the way the HDMI and HDaudio codecs are handled.

https://github.com/thesofproject/linux/issues/981
https://github.com/thesofproject/linux/issues/966
https://github.com/thesofproject/linux/pull/988

Since it's not SOF specific it's better to get feedback directly from 
the large ALSA community/maintainers. We probably want to focus on the 
platform-specific/vendor-specific stuff on GitHub and use the mailing 
list for such framework-level changes.

> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>   sound/pci/hda/hda_codec.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
> index b20eb7fc83eb..0d5d95b07e19 100644
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -985,6 +985,14 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
>   		codec->core.subsystem_id, codec->core.revision_id);
>   	snd_component_add(card, component);
>   
> +	/*
> +	 * snd_device_new() makes the codec device managed by the card.
> +	 * When the card is removed, the device reference count is
> +	 * decremented. Therefore, increment it here to prevent removing
> +	 * the codec device's kobject when the card is removed.
> +	 */
> +	get_device(hda_codec_dev(codec));
> +
>   	err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
>   	if (err < 0)
>   		goto error;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
