Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7897FA356
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 15:46:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0F00820;
	Mon, 27 Nov 2023 15:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0F00820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701096366;
	bh=k++rS4KJjI7oQEUM44rtMMAlNIs0/JrY4n1kXW7APuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lIv4jIr3B0/OyaRdiZuvpVYRjrLeOuC3/V8tgjKeteEzgcnagfjg4WmM6/1cBdYj5
	 xT95uTi3CFhx6c3o/0XfO9WMdPAu11xIOYSLloc03mWLU65/wdpK9HkQ3giMu7nB9g
	 Hd0Kppl0RPpLNLwNQ/OxBSuZgwHzytX9UKGXBx6c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A7C0F8057D; Mon, 27 Nov 2023 15:45:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E7AF802BE;
	Mon, 27 Nov 2023 15:45:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 628BBF801D5; Mon, 27 Nov 2023 15:45:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 530A9F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 15:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 530A9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fAiI2/XI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701096326; x=1732632326;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k++rS4KJjI7oQEUM44rtMMAlNIs0/JrY4n1kXW7APuE=;
  b=fAiI2/XIH6+U4BuuvV+iYMCiIuels12s7vu3Eg2Tiw3Npw+BYANkSFNN
   Os0LtA3ln5UujN0omqd7OvoLTPQhROxHZUN1/CstHoMG6TOvSh+49C9jO
   EMLsQbYLzGwenW+4BZnUsTHrSNxjI+XJ2DWF1+JFKJEv3o2FoqeDP7t+R
   O1Mpd78XxYb/tga53ALVflvxCzEIaCFZmGHN9wBoL9HwNi3unx/5hgoR6
   2wv2yAey5e7DPaAur+W/NZr9hi/gtHDDNNA0EGk4+9NgGSzVLoEp77kx8
   P9Ls++LXYmqZyO2VHhADu2OmQ0A3g/z9khJUKMjav1ierWAHTdlrsbwPj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="457048482"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="457048482"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="768192520"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="768192520"
Received: from acornagl-mobl.ger.corp.intel.com (HELO [10.252.58.144])
 ([10.252.58.144])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:45:20 -0800
Message-ID: <8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
Date: Mon, 27 Nov 2023 16:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
 <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
 <87jzq3pc6r.wl-tiwai@suse.de>
 <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
 <87cyvvp8t6.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87cyvvp8t6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3KY422P67AGTPWYBAI7RE5W764L5FNQU
X-Message-ID-Hash: 3KY422P67AGTPWYBAI7RE5W764L5FNQU
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KY422P67AGTPWYBAI7RE5W764L5FNQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/11/2023 16:31, Takashi Iwai wrote:
> On Mon, 27 Nov 2023 15:12:51 +0100,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 27/11/2023 15:18, Takashi Iwai wrote:
>>>> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
>>>> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
>>>> +			return true;
>>>> +	}
>>>> +
>>>> +	return false;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
>>>
>>> I'm afraid that this will bring unnecessary dependency on HDMI codec
>>> driver.
>>
>> For HDMI support we anyways need HDMI code?
> 
> But the ASoC hdac-hda driver isn't specifically bound with HDMI, I
> thought?
> 
> With your patch, now it becomes a hard-dependency.  It'll be even
> build failure when HDMI codec driver isn't enabled in Kconfig.

The change in hdaudio.h handles the config dependency, if
CONFIG_SND_HDA_CODEC_HDMI is not enabled in Kconfig then
snd_hda_device_is_hdmi() will return false.

-- 
Péter
