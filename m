Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81D75C0AF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:02:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0811EF;
	Fri, 21 Jul 2023 10:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0811EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926547;
	bh=B/wkicaUvd7cyO3AUH9zd+w0EAiPAvu9OUwEnEXC4cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AktZE9Qj/3ntr08lARxdYyXxiSdkNGNv9LfqZevCf8FyVr0WGWZoSG2/1ekwa/21o
	 jjCdObMzOxqFgX9D0AijMC65W2B1PjagbFXO4KhgTH+jBwGVrRVBgOripbYbvYnRMy
	 BbPC1qLsmaIelJI40eBRgg/CPCuFljhvByaZPVRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A7D5F8027B; Fri, 21 Jul 2023 10:01:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D50A5F8032D;
	Fri, 21 Jul 2023 10:01:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35675F8032D; Wed, 19 Jul 2023 17:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6A82F800D2;
	Wed, 19 Jul 2023 17:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A82F800D2
Message-ID: <a913df90-174c-7132-bbfa-bf30f0664d9c@linux.intel.com>
Date: Wed, 19 Jul 2023 17:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/7] ASoC: Intel: avs: Move snd_hdac_i915_init to before
 probe_work.
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-4-maarten.lankhorst@linux.intel.com>
 <18fb40b9-f5b4-60d8-79df-e0719cf48231@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <18fb40b9-f5b4-60d8-79df-e0719cf48231@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XRKF33OL6NTEBFTWPMT7Z5TTFA4EA6YW
X-Message-ID-Hash: XRKF33OL6NTEBFTWPMT7Z5TTFA4EA6YW
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:01:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRKF33OL6NTEBFTWPMT7Z5TTFA4EA6YW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

On 2023-07-19 17:26, Cezary Rojewski wrote:
> On 2023-07-18 10:45 AM, Maarten Lankhorst wrote:
>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>> the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
>> can be destroyed, but I don't have the means to test this.
>>
>> Removing the workqueue would simplify init even further, but is left
>> as exercise for the reviewer.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   sound/soc/intel/avs/core.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
>> index 3311a6f142001..d3a7f42387e9b 100644
>> --- a/sound/soc/intel/avs/core.c
>> +++ b/sound/soc/intel/avs/core.c
>> @@ -191,10 +191,6 @@ static void avs_hda_probe_work(struct work_struct 
>> *work)
>>       pm_runtime_set_active(bus->dev); /* clear runtime_error flag */
>> -    ret = snd_hdac_i915_init(bus, true);
>> -    if (ret < 0)
>> -        dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
>> -
>>       snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
>>       avs_hdac_bus_init_chip(bus, true);
>>       avs_hdac_bus_probe_codecs(bus);
>> @@ -465,10 +461,19 @@ static int avs_pci_probe(struct pci_dev *pci, 
>> const struct pci_device_id *id)
>>       pci_set_drvdata(pci, bus);
>>       device_disable_async_suspend(dev);
>> +    ret = snd_hdac_i915_init(bus, false);
>> +    if (ret == -EPROBE_DEFER)
>> +        goto err_unmaster;
>> +    else if (ret < 0)
>> +        dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
>> +
> 
> While our tests are currently passing I have my doubts about 
> EPROBE_DEFER. We do want to have audio functionality there even if some 
> problems with HDMI arise along the way - some audio is better than no 
> audio. Here, i915 may ruin the day for a platform equipped with 
> hda/hdmi/i2c/dmic chips simultaneously.
> 
> Also, why call snd_hdac_i915_init() _after_ setting drvdata?

I wanted to make the most cautious change. The previous flow called the 
function immediately from probe_work, so I moved it to right before the 
scheduling of probe_work

>>       schedule_work(&adev->probe_work);
>>       return 0;
>> +err_unmaster:
>> +    pci_clear_master(pci);
>> +    pci_set_drvdata(pci, NULL);
> 
> Not a fan. It's hard to grasp entire error-step within name of a single 
> label. Thus I'd suggest "err_<cause>" naming pattern instead. Even here, 
> under "unmaster" you hid clearing master and drvdata both. Let's do 
> "err_i915_init" instead.
> 
Ok, will rename.

~Maarten
