Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 358057486BF
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB14203;
	Wed,  5 Jul 2023 16:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB14203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688568361;
	bh=s0GWJM5gFoud1+XZjR2N78Pc/ZDBarybll1Oke7Rovs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JqOLKHp5rzqiWe8VQmgBlqIdL+v5tQYURFAgyt3YON/fPRCMzFWFf0dm+eaaf+cHT
	 NV4v7vfQZRHAobgcAlhQ1VouU5qc9JZsAh0wt56t1ozLJYsDTcXTWAzNXoo36PwV3L
	 xC/KvUwUwweZ7QQypvKMxJmFjiF0UGjIqIXPkHjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45E74F80124; Wed,  5 Jul 2023 16:45:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00FD7F80124;
	Wed,  5 Jul 2023 16:45:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31A2AF80125; Wed,  5 Jul 2023 16:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4842F800E4
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 16:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4842F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eQV30L4a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688568304; x=1720104304;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s0GWJM5gFoud1+XZjR2N78Pc/ZDBarybll1Oke7Rovs=;
  b=eQV30L4acNYbYCOAWgms8c8pEdGOWyrhoj1Wmx/0VDfH5W33l8XBp5VP
   NjmzgERhJcq9O5b+kUF7DJldJFVAMO4t1VplHTVUjh3ajYQf9Vge4OE7M
   fOiqlUQmS4sFkSc8ZApiYW722aLxh1pSUL83Qz7C8XX3Yho39cmILOxHo
   eEFMogtHKBfJEtbPjKoOhOqyF8bxhREuywbeJWAAiv78nWDR51CTEV9N8
   RnBPc5PLOoEJONv1eqHftT5KKqvGzZzBZv11VgRTh19LyF18ynYBPxwrL
   Ub/7kQYW8HQEdFjlwjAD1G3fGdhpovYjMuLj4R87RCy+W5rVj86AbmXgr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362226709"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="362226709"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 07:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="722430589"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="722430589"
Received: from meggieha-mobl.ger.corp.intel.com (HELO [10.252.48.235])
 ([10.252.48.235])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 07:44:57 -0700
Message-ID: <14395e2a-db0b-8f26-3356-741945478eb0@linux.intel.com>
Date: Wed, 5 Jul 2023 16:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/8] soundwire: fix enumeration completion
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rander Wang <rander.wang@linux.intel.com>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-2-johan+linaro@kernel.org>
 <907ad7a3-3384-c0c4-90a9-5beab4cc45e0@linux.intel.com>
 <ZKV-oXAWzRXnjXus@hovoldconsulting.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZKV-oXAWzRXnjXus@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DZRB3JYYJXOORNNRG56UP4E23PEZ3WO2
X-Message-ID-Hash: DZRB3JYYJXOORNNRG56UP4E23PEZ3WO2
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZRB3JYYJXOORNNRG56UP4E23PEZ3WO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/5/23 16:30, Johan Hovold wrote:
> On Wed, Jul 05, 2023 at 02:53:17PM +0200, Pierre-Louis Bossart wrote:
>> On 7/5/23 14:30, Johan Hovold wrote:
>>> The soundwire subsystem uses two completion structures that allow
>>> drivers to wait for soundwire device to become enumerated on the bus and
>>> initialised by their drivers, respectively.
>>>
>>> The code implementing the signalling is currently broken as it does not
>>> signal all current and future waiters and also uses the wrong
>>> reinitialisation function, which can potentially lead to memory
>>> corruption if there are still waiters on the queue.
>>
>> That change sounds good, but I am not following the two paragraphs below.
>>
>>> Not signalling future waiters specifically breaks sound card probe
>>> deferrals as codec drivers can not tell that the soundwire device is
>>> already attached when being reprobed. 
>>
>> What makes you say that? There is a test in the probe and the codec
>> driver will absolutely be notified, see bus_type.c
>>
>> 	if (drv->ops && drv->ops->update_status) {
>> 		ret = drv->ops->update_status(slave, slave->status);
>> 		if (ret < 0)
>> 			dev_warn(dev, "%s: update_status failed with status %d\n", __func__,
>> ret);
>> 	}
> 
> I'm talking about signalling the codec driver using the soundwire device
> via the completion structs. Unless the underling device is detached and
> reattached, trying to wait for completion a second time will currently
> timeout instead of returning immediately.
> 
> This affects codecs like rt5682, which wait for completion in component
> probe (see rt5682_probe()).
> 
>>> Some codec runtime PM
>>> implementations suffer from similar problems as waiting for enumeration
>>> during resume can also timeout despite the device already having been
>>> enumerated.
>>
>> I am not following this either. Are you saying the wait_for_completion()
>> times out because of the init_completion/reinit_completion confusion, or
>> something else.
> 
> It times out because the completion counter is not saturated unless you
> use complete_all().
> 
> Drivers that wait unconditionally in resume, will time out the second
> time they are runtime resumed unless the underlying device has been
> detached and reattached in the meantime (e.g. wsa881x_runtime_resume()).

Makes sense. The default on Intel platforms is to reset the bus in all
resume cases, that forces the attachment so we never saw the issue.

For this patch:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


