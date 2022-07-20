Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09FC57BAFC
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 18:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5E91731;
	Wed, 20 Jul 2022 18:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5E91731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658332899;
	bh=Jl3Uf1ihM+4b+/JWWlQi6Xyaw33LQA2M76nVC9ett7I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a0peFkC5zvP9YjStiu14bbqyvzGKXArX2/m3klg0v+FAb1+7kwuZN5OLE/3z5O2An
	 KRoQFkeEW+MTbe6i7cGvtAoyuM/hGL7ONdjjVf4Qw4pg400m6rngnLIIvZ0WpFVFxE
	 CbdX9PtR2IJit8f0Qq2myyAJfETGcqcjv5ChNLs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E34EAF80125;
	Wed, 20 Jul 2022 18:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAC7F80125; Wed, 20 Jul 2022 18:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1507CF80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 18:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1507CF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ttj1XqWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658332830; x=1689868830;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Jl3Uf1ihM+4b+/JWWlQi6Xyaw33LQA2M76nVC9ett7I=;
 b=Ttj1XqWWWb2tZysRCWYBMf8J41KUA+3EngOAK/IS5DKAWpo1dpzAZQNH
 mdNS++mbctQRi/TS13toiLr9iZWC7mWsUvCjJBJWo9sOMgZHXOTz4kDBM
 aXIZUWYSRvkVeQymNO2QaCcpBmmRaNweW9MFnnzPnD+z4A+HlGR5V3df0
 AmkJYRG7RpFyFVfTR5WoVc848Hrf7KsoN2dxrzhPJyHZ7Qpp/n0e4E7aX
 pADWM436+GvBXKTr7Xv9a0bajvTC/t/OiNIgacFziqmcfWbrh/pWpTVut
 fgXl3MaCRc4tHR0L/4gj2RxknP4i0v2Qx9vm+AChnLxqTKANKwcia49W0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="284373280"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="284373280"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:00:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="573360986"
Received: from tgeorge1-mobl.amr.corp.intel.com (HELO [10.212.79.208])
 ([10.212.79.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:00:23 -0700
Message-ID: <3c3a453a-a9be-94f9-c7a0-4936fba5182d@linux.intel.com>
Date: Wed, 20 Jul 2022 11:00:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] ALSA: hda: Make snd_hda_codec_device_init() the only
 codec constructor
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20220720130622.146973-1-cezary.rojewski@intel.com>
 <20220720130622.146973-3-cezary.rojewski@intel.com>
 <875yjs53l6.wl-tiwai@suse.de>
 <8ff14178-7e81-68ff-71fa-7a31adef5cd5@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8ff14178-7e81-68ff-71fa-7a31adef5cd5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, peter.ujfalusi@linux.intel.com
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



On 7/20/22 10:39, Cezary Rojewski wrote:
> On 2022-07-20 3:13 PM, Takashi Iwai wrote:
>> On Wed, 20 Jul 2022 15:06:20 +0200,
>> Cezary Rojewski wrote:
>>>
>>> Refactor snd_hdac_ext_bus_device_init() so that it makes use of
>>> snd_hda_codec_device_init() to create and initialize new codec device.
>>> Causes the latter to become the sole codec device constructor.
>>>
>>> Users of the refactored function are updated accordingly and now also
>>> take responsibility for assigning driver's private data as that task is
>>> no longer performed by hdac_hda_dev_probe().
>>
>> Hrm, this doesn't look really right.  It means you'll introduce a hard
>> dependency chain in a reverse order: snd-hda-ext-core ->
>> snd-hda-codec.
>>
>> Originally, the ext bus code was written completely independent from
>> the legacy HD-audio implementations, and hdac-hda driver was a kind of
>> wrapper / bridge for the legacy codec over the ext bus.  If we want
>> change this rule and make the legacy HD-audio codec always tied with
>> the ext bus, a likely better way would be to call
>> snd_hda_codec_device_init() in the caller's side (e.g. skl or sof),
>> then pass the newly created codec object to
>> snd_hdac_ext_bus_device_init() for further initialization.
> 
> 
> Agree. That or drop the snd_hdac_ext_bus_device_init() entirely. Will
> send an update soon.
> 
> In regard to the other subject, my plan:
> - separate code used by both ALSA/ASoC into sound/hda (this includes
> many hda_codec functions)
> - combine hda_bus and hdac_bus
> - combine hda_codec and hdac_device
> - drop HDA_DEV_ASOC
> - drop hdac_hda/hdac_hdmi (once skylake-driver is gone; sof will be
> updated accordingly)

the skylake driver cannot be removed until you have evidence that users
have switched, and SOF has other priorities that will likely conflict
with that goal. I don't even know what this 'drop hdac_hda' idea means
in detail, we need to keep an ASoC-based codec and the split between
platform/codec/machine. We are not going to move the HDaudio codec
management logic inside the SOF driver if that was the intent. The SOF
driver will focus on host/controller/DSP handling.

> <story does not end here>

I strongly recommend that we add no dependencies between hdac_ext and
hda_codec. To be clearer, we don't want to limit the hdac_ext bus and
stream management to platforms with HDaudio codecs.
