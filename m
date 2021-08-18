Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6E3F089A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 17:59:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E0616A3;
	Wed, 18 Aug 2021 17:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E0616A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629302352;
	bh=Al3BltZ4/e59dOfCbPW4v146HmHcTTI059+bhxobTLU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TufMgNw3xQJwBwvrWB6Txjx5pdTG081Jzx6vF309B5ITEYvlPea0ywOSyO/KNLQe6
	 wEQ9dl/F0XHkYlizFitRkmWEq6dKydig/8Y9fe4seUrX/epIK/0m03xAjyPfmp9cM3
	 cpjTfdzsGfew1TEzRg1mFG+P3LgFGAP8LEB+7S9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB25AF800EC;
	Wed, 18 Aug 2021 17:57:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0906F800EC; Wed, 18 Aug 2021 17:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3E3DF800EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 17:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E3DF800EC
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="195940707"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195940707"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 08:57:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449810907"
Received: from ksawchu-mobl.amr.corp.intel.com (HELO [10.212.83.236])
 ([10.212.83.236])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 08:57:41 -0700
Subject: Re: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add support for HP Elite
 Pad 1000G2 jack-detect
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210815154935.101178-1-hdegoede@redhat.com>
 <20210815154935.101178-6-hdegoede@redhat.com>
 <f29d3c63-05ef-73f6-760c-e1b715d96651@linux.intel.com>
 <2ea10f32-8810-8257-845e-ec16835fbf19@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c611bc89-124f-0d83-15d6-4e04e9b4d8c8@linux.intel.com>
Date: Wed, 18 Aug 2021 10:57:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2ea10f32-8810-8257-845e-ec16835fbf19@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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




> But I guess things won't be so bad wrt err-exit-path complexity as for
> them to really be a problem, so if you prefer I can also:
> 
> 1. Remove the second acpi_dev_add_driver_gpios + acpi_dev_remove_driver_gpios
> pair from the dai_link .init/.exit.
> 2. Remove the acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev) call here
> moving it to snd_byt_rt5640_mc_remove()
> 3. Introduce a acpi_dev_remove_driver_gpios() remove in the error-exit paths
> of snd_byt_rt5640_mc_probe where necessary.

that sounds good to me, it's probably better to do things once with a
bit of additional error handling.

>>> +		if (IS_ERR(priv->hsmic_detect)) {
>>> +			ret_val = PTR_ERR(priv->hsmic_detect);
>>> +			dev_err_probe(&pdev->dev, ret_val, "getting hsmic-detect GPIO\n");
>>> +			goto err_device;
>>> +		}
>>> +	}
>> Does this part need to be part of the machine driver probe, or could it
>> be moved in the dailink .init function?
> 
> The idea here is that the gpiod_get may fail with -EPROBE_DEFER and then I want
> to fail as early as possible, so right in the probe function.
> 
> This is also why the error is logged with dev_err_probe() which does not
> log anything for EPROBE_DEFER as retval.
> 
>> Is this because you wanted to use devm_ function?
> 
> No, I did consider adding the gpiod_get() for priv->hsmic_detect to the
> dai_link .init function and then I would just use a normal get, combined
> with an explicit _put in the dailink exit. I put this gpiod_get in
> the platform_driver probe to handle EPROBE_DEFER early on, rather then
> having it happen deep inside the devm_snd_soc_register_card() call-graph
> (when it calls the dailink .init).
> 
> I would prefer to keep the gpiod_get inside snd_byt_rt5640_mc_probe for this
> reason, but as mentioned I can removed the second acpi_dev_add_driver_gpios +
> acpi_dev_remove_driver_gpios call pair from the dai_link .init/.exit.
> 
> Please let me know how you want to proceed with this.

ok with the suggestion above. Thanks Hans!
