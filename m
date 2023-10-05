Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4E77BB40D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E39826;
	Fri,  6 Oct 2023 11:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E39826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696583800;
	bh=mpsTz++DaZJss3EYK4Hw0W0Qu8a0Xgrlxd9n/8GHMUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YXwrQpvo72L8iMAHWk5WNfsmfMxI4V0ng96E8tpx8MHsBn7r0Lmho/Nv7SleVOwPM
	 c2bpqtaOcRH3Y+gd5FoHLMCGQLklgPHnO1LjjUcqeXYuoF6H8D2nTdK9X739uQlXPw
	 Qrg0Tx6j9GOLlXCrvaoV4/6SHVPkRQwVjurRzjnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80F88F80310; Fri,  6 Oct 2023 11:15:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3BD9F8047D;
	Fri,  6 Oct 2023 11:15:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E5FEF8047D; Thu,  5 Oct 2023 13:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.5 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 738F1F801EB;
	Thu,  5 Oct 2023 13:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 738F1F801EB
Message-ID: <ee92964c-c277-a258-5081-cf0a19ccff79@lankhorst.se>
Date: Thu, 5 Oct 2023 13:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 11/12] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Alsa-devel <alsa-devel@alsa-project.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
 <20231004145540.32321-12-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2310041953090.3390143@eliteleevi.tm.intel.com>
 <b4a010aa-b547-42ad-844f-849f287abd54@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <b4a010aa-b547-42ad-844f-849f287abd54@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: dev@lankhorst.se
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CYCCV2ET3D4PIZDXGK2G3ZRQ2ID4KALC
X-Message-ID-Hash: CYCCV2ET3D4PIZDXGK2G3ZRQ2ID4KALC
X-Mailman-Approved-At: Fri, 06 Oct 2023 09:15:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYCCV2ET3D4PIZDXGK2G3ZRQ2ID4KALC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023-10-05 12:58, Péter Ujfalusi wrote:
> 
> 
> On 04/10/2023 19:59, Kai Vehmanen wrote:
>> Hi,
>>
>> I'm good with rest of the series, but one patch requires work.
>>
>> On Wed, 4 Oct 2023, Maarten Lankhorst wrote:
>>
>>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>>> the snd_hdac_i915_init into a workqueue.
>>>
>>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>>> probe function.
>>>
>>> The previously added probe_early can be used for this,
>>> and we also use the newly added remove_late for unbinding afterwards.
>> [...]
>>> --- a/sound/soc/sof/intel/hda-common-ops.c
>>> +++ b/sound/soc/sof/intel/hda-common-ops.c
>>> @@ -19,6 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
>>>   	.probe_early	= hda_dsp_probe_early,
>>>   	.probe		= hda_dsp_probe,
>>>   	.remove		= hda_dsp_remove,
>>> +	.remove_late	= hda_dsp_remove_late,
>>>   
>>>   	/* Register IO uses direct mmio */
>>>   
>>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>>> index 86a2571488bc..4eb7f04b8ae1 100644
>>> --- a/sound/soc/sof/intel/hda.c
>>> +++ b/sound/soc/sof/intel/hda.c
>>> @@ -1160,6 +1160,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
>>>   		return -ENOMEM;
>>>   	sdev->pdata->hw_pdata = hdev;
>>>   	hdev->desc = chip;
>>> +	ret = hda_init(sdev);
>>>   
>>>   err:
>>>   	return ret;
>>
>> I don't think this works. The hda_codec_i915_init() errors are ignored in
>> hda_init() so this never returns -EPROBE_DEFER.
>>
>> So something like this is needed on top (tested quickly on one SOF
>> machine and this blocks SOF load until i915 or xe driver is loaded):
>>
>> --cut--
>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>> index 9025bfaf6a7e..8b17c82dcc89 100644
>> --- a/sound/soc/sof/intel/hda.c
>> +++ b/sound/soc/sof/intel/hda.c
>> @@ -863,13 +863,20 @@ static int hda_init(struct snd_sof_dev *sdev)
>>          /* init i915 and HDMI codecs */
>>          ret = hda_codec_i915_init(sdev);
>>          if (ret < 0)
>> -               dev_warn(sdev->dev, "init of i915 and HDMI codec
>> failed\n");
>> +               dev_warn(sdev->dev, "init of i915 and HDMI codec failed
>> (%d)\n", ret);
> 
> we should not print anything or maximum dev_dbg in case of EPROBE_DEFER.
There's dev_err_probe, which is dev_err on error, or sets the reason for 
deferred probe to the arguments if the error is -EPROBE_DEFER.

~Maarten
