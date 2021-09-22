Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D1414E01
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 18:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11059847;
	Wed, 22 Sep 2021 18:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11059847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632327634;
	bh=d6aSW+kkPBhaoHaKbW76Ye/2mDCR+dvfeHXFZQ5YVRA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txnfNqvItFX8hraQiH5K2Sr1X65Nw67dXTjdbopxu8DUcIygSv+U0QWzJW8J1dw1T
	 WC350uav6W5qbHYzun90VctCiyXtKojpjQiYZl90bybR4ZLGcdSaGWr7H/ZnsDP7TU
	 wDDN4aPS/vWG1sUo+bAYfTbHhJOgMMyD3GRetbHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A33EF80279;
	Wed, 22 Sep 2021 18:19:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 879D1F8025D; Wed, 22 Sep 2021 18:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 232C6F8014E
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 18:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 232C6F8014E
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203788303"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="203788303"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 09:18:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="702313896"
Received: from kjgomez-mobl1.amr.corp.intel.com (HELO [10.209.164.106])
 ([10.209.164.106])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 09:18:03 -0700
Subject: Re: [PATCH v7 18/22] ASoC: qdsp6: audioreach: add topology support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
 <20210921133709.4973-19-srinivas.kandagatla@linaro.org>
 <7021cdec-382b-faa9-cf6c-ee06edbf19a7@linux.intel.com>
 <9ea759db-f2ae-8b26-eff9-8557267803d2@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c03cedad-971d-2eee-a1a5-7f2d6c105682@linux.intel.com>
Date: Wed, 22 Sep 2021 10:40:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9ea759db-f2ae-8b26-eff9-8557267803d2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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



>>> +    /* Inline with Qualcomm UCM configs and linux-firmware path */
>>> +    snprintf(tplg_fw_name, sizeof(tplg_fw_name),
>>> "qcom/%s/%s-tplg.bin", card->driver_name,
>>> +         card->name);
>>
>> use kasprintf instead of fixed 128-char array?
> I moved this to kasprintf in next version.
> 
>>
>> Also you should use a qcom/audioreach/ prefix to possible interference
>> with other parts of qcom...
>>
> 
> So Qualcomm linux-firmwares are arranged something like
> 
> qcom/sdm845/*
> qcom/sm8250/*
> qcom/sm8150/*
> 
> and UCM something like
> this:Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf
> 
> Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf
> 
> 
> Atleast in Qualcomm soundcard case we have driver name set to SoC name
> and we tend to reuse this driver across multiple platforms.
> 
> second part card name actually is from model device tree property, in
> this case which is "Qualcomm-RB5-WSA8815-Speakers-DMIC0"
> 
> so we will endup looking for
> /lib/firmare/qcom/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0-tplg.bin
> 
> AFAIU, it should not interface with any other qcom parts.
> 
> for Other qcom parts this model will change so the topology file name.

that should be fine.

>>> +
>>> +    ret = request_firmware(&fw, tplg_fw_name, dev);
>>> +    if (ret < 0) {
>>> +        dev_info(dev, "loading %s failed %d, falling back to
>>> dfw-audioreach-tplg.bin\n",
>>> +             tplg_fw_name, ret);
>>> +        /* default firmware */
>>> +        ret = request_firmware(&fw, "dfw-audioreach-tplg.bin", dev);
>>> +        if (ret < 0) {
>>> +            dev_err(dev, "tplg fw dfw-audioreach-tplg.bin load
>>> failed with %d\n", ret);
>>
>> the dfw prefix isn't very helpful...Intel's example of "dfw_sst.bin" is
>> a historical reference, not something you should reuse.
> 
> Rethinking on this once again, Am not sure if it even makes sense to
> support this default setup. It will be very hard to get a working
> defalut tplg on every platform. So am planning to remove this in next
> version.
> 
> Do you see any issues?

No, I don't think it's practical to use this default name either. We
don't have it for SOF.

Even for developers who modify a default, it's better to place a new
topology with the same name in /lib/firmware/updates/qcom and let
request_firmware() find the updated file with the existing paths [1]

[1]
https://www.kernel.org/doc/html/latest/driver-api/firmware/fw_search_path.html
