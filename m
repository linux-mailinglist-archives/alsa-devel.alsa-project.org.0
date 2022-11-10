Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9756246B9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 17:20:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7385D166A;
	Thu, 10 Nov 2022 17:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7385D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668097215;
	bh=NjJobES+zJqwKLzAsWknbPdzcZ0ibQ8I5NBwpx5fsyM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPltuLkH/M0fO4DngstKLYx8KlOZATYMWeQPmbkij7qtL9WspF8U7QqnLDCDILwuX
	 JOwoHdzrWbTpAHdiOPSUM5/D5NN3BYIEzoat08qBQpr6Hp/mwKm4bovGizZ1LBgQ15
	 gYiHaGti8dMBmTFWmKB0CN4s+taIvY7hNGX9iETI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14FAFF802E8;
	Thu, 10 Nov 2022 17:19:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A3E8F8021D; Thu, 10 Nov 2022 17:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A71E8F80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 17:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71E8F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IftSGYPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668097152; x=1699633152;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NjJobES+zJqwKLzAsWknbPdzcZ0ibQ8I5NBwpx5fsyM=;
 b=IftSGYPl39NXzQs/mK9dvuw+9IKaLcU6p0kzJMYwYbzDNJW9TvYe5Re5
 yq0+DCcuqXmIGIArcQKgOfXNgH/Q6Jh+wvmepGwctfDih9FkfpW2DJ+IH
 KU4lPNm9q5BLiAib3Dkll2wiFThCHjCr2PIQ3rHYgwtCasKXGBlNFf3Kn
 F2ysKmwn42joQtgF1MeR7lbN/uXuJ+pqUbzOmAQykU6/Hu/kRZcRfcbXu
 PL73GW2wuJ13M8ot6uzLeOKbDCjpJdtrUyHyH/hY4+lnv4CZGb6nZhH2Y
 eE/rxUIPeSjQ06N52+msz18ICosZbyxaQpxJpAnnUAY7DpVgjnLMys6yf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291751909"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="291751909"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:19:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="966464929"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="966464929"
Received: from byrons1x-mobl.amr.corp.intel.com (HELO [10.212.85.58])
 ([10.212.85.58])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:18:59 -0800
Message-ID: <d471658b-1c93-ad84-55fd-7c68257bf01e@linux.intel.com>
Date: Thu, 10 Nov 2022 10:18:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20221110141330.740916-1-cezary.rojewski@intel.com>
 <20221110141330.740916-3-cezary.rojewski@intel.com>
 <6f86718b-5d96-3e73-bfc0-321288e2232c@linux.intel.com>
 <8cc5ecbe-8112-2359-aa90-1d5d1b50d89c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8cc5ecbe-8112-2359-aa90-1d5d1b50d89c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 11/10/22 10:06, Cezary Rojewski wrote:
> On 2022-11-10 4:39 PM, Pierre-Louis Bossart wrote:
>> On 11/10/22 08:13, Cezary Rojewski wrote:
> 
>>> --- a/sound/soc/intel/avs/pcm.c
>>> +++ b/sound/soc/intel/avs/pcm.c
>>> @@ -934,8 +934,11 @@ static int avs_component_pm_op(struct
>>> snd_soc_component *component, bool be,
>>>               rtd = snd_pcm_substream_chip(data->substream);
>>>               if (rtd->dai_link->no_pcm == be &&
>>> !rtd->dai_link->ignore_suspend) {
>>>                   ret = op(dai, data);
>>> -                if (ret < 0)
>>> +                if (ret < 0) {
>>> +                    data->substream->runtime->status->state =
>>> +                        SNDRV_PCM_STATE_DISCONNECTED;
>>
>> should runtime->state be used instead of runtime->status->state?
>>
>> A quick grep shows the former seems more popular in drivers,
>> status->seems to be only used in pcm_native.c?
>>
>> Another plumbing question is whether it's actually ok to change the
>> state of the runtime in a driver, are you not going to have locking
>> issues? Very few drivers change the internal state and I wonder how
>> legit/safe this is.
> 
> 
> Unless something new has been added/updated, there is no runtime->state
> field available. All the PCM code works with runtime->status->state.

cd sound/

git grep -c 'runtime->state'
core/compress_offload.c:27
core/oss/pcm_oss.c:21
core/pcm.c:2
core/pcm_compat.c:2
core/pcm_lib.c:8
core/pcm_native.c:50
drivers/aloop.c:2
firewire/bebob/bebob_pcm.c:2
firewire/dice/dice-pcm.c:2
firewire/digi00x/digi00x-pcm.c:2
firewire/fireface/ff-pcm.c:2
firewire/fireworks/fireworks_pcm.c:2
firewire/motu/motu-pcm.c:2
firewire/oxfw/oxfw-pcm.c:4
firewire/tascam/tascam-pcm.c:2
hda/hdmi_chmap.c:1
isa/gus/gus_pcm.c:1
soc/intel/skylake/skl-pcm.c:2
soc/sh/rz-ssi.c:1
usb/pcm.c:2
usb/usx2y/usbusx2yaudio.c:1
usb/usx2y/usx2yhwdeppcm.c:1

git grep -c 'status->state'
core/pcm_compat.c:2
core/pcm_native.c:4


