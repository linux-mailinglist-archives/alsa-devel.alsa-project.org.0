Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672137617B4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 13:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55B31507;
	Tue, 25 Jul 2023 13:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55B31507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286051;
	bh=XUKOZQeLBW7kgaR9Ww++9u71TXdB2qXHA0yT42XGoao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cxd7+veiaqi1tra/8khNmhfrdJdlpGP+9nfEerejBu/x7pv//+kInP2TxtjUlFqKf
	 7D8ZHieSGRoG5K77RPlkc6FlP7q7y+b1ZofBt3NqkNwZxjN2CFkhk3eZHr5au/yH5W
	 WAmqtnO3NsZieDcXNtjH2vwwRkdZh+QLD5bLWYEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B98DF805AC; Tue, 25 Jul 2023 13:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6154F805A1;
	Tue, 25 Jul 2023 13:51:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF241F80163; Tue, 25 Jul 2023 12:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F948F80149;
	Tue, 25 Jul 2023 12:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F948F80149
Message-ID: <35720f76-e8b0-578b-e326-ebfce536be04@linux.intel.com>
Date: Tue, 25 Jul 2023 12:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/9] ALSA: hda/intel: Move snd_hdac_i915_init to before
 probe_work.
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-8-maarten.lankhorst@linux.intel.com>
 <a895de13-5320-953b-3d1c-34cee259d1d2@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <a895de13-5320-953b-3d1c-34cee259d1d2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KGTJ7DKYNTTEJK67OAIDXY2PADJVD34N
X-Message-ID-Hash: KGTJ7DKYNTTEJK67OAIDXY2PADJVD34N
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:51:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

On 2023-07-24 12:58, Pierre-Louis Bossart wrote:
> 
> 
> On 7/19/23 18:41, Maarten Lankhorst wrote:
>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>> the snd_hdac_i915_init into a workqueue.
>>
>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>> probe function.
>>
>> Changes since v1:
>> - Use dev_err_probe()
>> - Don't move probed_devs bitmap unnecessarily. (tiwai)
>> - Move snd_hdac_i915_init slightly upward, to ensure
>>    it's always initialised before vga-switcheroo is called.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   sound/pci/hda/hda_intel.c | 59 ++++++++++++++++++++-------------------
>>   1 file changed, 30 insertions(+), 29 deletions(-)
>>
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 11cf9907f039f..e3128d7d742e7 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -2147,6 +2147,36 @@ static int azx_probe(struct pci_dev *pci,
>>   
>>   	pci_set_drvdata(pci, card);
>>   
>> +#ifdef CONFIG_SND_HDA_I915
>> +	/* bind with i915 if needed */
>> +	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
>> +		err = snd_hdac_i915_init(azx_bus(chip), false);
>> +		if (err < 0) {
>> +			/* if the controller is bound only with HDMI/DP
>> +			 * (for HSW and BDW), we need to abort the probe;
>> +			 * for other chips, still continue probing as other
>> +			 * codecs can be on the same link.
>> +			 */
>> +			if (CONTROLLER_IN_GPU(pci)) {
>> +				dev_err_probe(card->dev, err,
>> +					     "HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
>> +
>> +				goto out_free;
>> +			} else {
>> +				/* don't bother any longer */
>> +				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
>> +			}
>> +		}
>> +
>> +		/* HSW/BDW controllers need this power */
>> +		if (CONTROLLER_IN_GPU(pci))
>> +			hda->need_i915_power = true;
>> +	}
>> +#else
>> +	if (CONTROLLER_IN_GPU(pci))
>> +		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
>> +#endif
> 
> Is it intentional that the display_power() is left in the probe workqueue?
> 
> this piece of code follows the stuff above in the existing code?
> 
> /* Request display power well for the HDA controller or codec. For
>   * Haswell/Broadwell, both the display HDA controller and codec need
>   * this power. For other platforms, like Baytrail/Braswell, only the
>   * display codec needs the power and it can be released after probe.
>   */
> display_power(chip, true);

I think for the binding itself, there isn't any harm. We are not poking 
any hardware when binding,
only software. This appears to be true on the i915 side as well.

Cheers,
~Maarten
