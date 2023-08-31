Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC66791720
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 782E53E8;
	Mon,  4 Sep 2023 14:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 782E53E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693830796;
	bh=Yun5X9T9+HnywGIcjOuXjIT92QS/FS0Ffu2qEslGeDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k3IkCHkh3atqQ4QM+ETCpxZSC20xT1RpIzezY3rwuZNjWoRti98+RACXnXOmbuxZj
	 6hem24CBlGp97ZVfawJgkkxbOIuqhy+t8bSgh67LGvtBxFs+Y9BGgyz6/ppXiHfmKd
	 VDO/Dmcl7m88ruhfQTpAxONorc5Pv1ha2HCYkVzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21F0FF80431; Mon,  4 Sep 2023 14:32:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD263F8047D;
	Mon,  4 Sep 2023 14:32:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992F8F80155; Thu, 31 Aug 2023 12:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D1BEF80094;
	Thu, 31 Aug 2023 12:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D1BEF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H+XuX0EX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693478667; x=1725014667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Yun5X9T9+HnywGIcjOuXjIT92QS/FS0Ffu2qEslGeDk=;
  b=H+XuX0EXPi134Z8hIQ6uQmBoNhvQdncDys7RN6vvfEHYzT4GfABZeGem
   Oet1qotWxIBVhCu476OlGrpw+rQomvZtT3gMLEfGLk/FumL1ZEKR9VaEg
   OKzhnsDgMzTuQQk6yJQs+n3/EQzx6qZiCJQFLIF+3srGRXsRfnpN8ZFRu
   ZmrLM20aE17ukK6z8cGS3siuEq9wyy8rlMdEwFblGnIQC1DvofJH0Ya2w
   n9zPe1+D3yAWEX3k0H8k2i2s+7wuFWDg0gM+IZop6lVLxaMy2tjMCfrCj
   aFtDNr6xP8zHQOD2L8NBqXF5GdpNGeC3CCy8xVRqe3s568sLcbSD4k7wu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373298448"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000";
   d="scan'208";a="373298448"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716293357"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000";
   d="scan'208";a="716293357"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO [10.249.254.108])
 ([10.249.254.108])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:44:15 -0700
Message-ID: <d0aeae4e-0766-4879-9b06-46c78ffdb165@linux.intel.com>
Date: Thu, 31 Aug 2023 12:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
 <ac21f644-dedc-289b-3783-0cf2db8c0a73@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ac21f644-dedc-289b-3783-0cf2db8c0a73@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SSBWXHSIINOCO7UVBI74WINOUKPPJNUL
X-Message-ID-Hash: SSBWXHSIINOCO7UVBI74WINOUKPPJNUL
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:32:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSBWXHSIINOCO7UVBI74WINOUKPPJNUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

Den 2023-08-30 kl. 19:13, skrev Pierre-Louis Bossart:
>> +static inline int snd_sof_remove_no_wq(struct snd_sof_dev *sdev)
>> +{
>> +	if (sof_ops(sdev)->remove_no_wq)
>> +		return sof_ops(sdev)->remove_no_wq(sdev);
>> +
>> +	return 0;
>> +}
>>   	/* probe/remove/shutdown */
>> +	int (*probe_no_wq)(struct snd_sof_dev *sof_dev); /* optional */
>> +	int (*remove_no_wq)(struct snd_sof_dev *sof_dev); /* optional */
> My initial PR didn't have this remove_no_wq() callback.
>
> For symmetry it could be useful if it is meant to undo what the
> probe_no_wq() did, but conceptually the first thing we do in the remove
> is make sure that workqueue is either not scheduled or we wait until it
> completes.
>
> int snd_sof_device_remove(struct device *dev)
> {
> 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
> 	struct snd_sof_pdata *pdata = sdev->pdata;
> 	int ret;
>
> 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
> 		cancel_work_sync(&sdev->probe_work);

That is exactly what I was using it for later on.

I had to have a counter to hda_init() in patch 10/11.

Cheers,
Maarten



