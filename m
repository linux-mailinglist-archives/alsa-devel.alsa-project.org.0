Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8F154B3FB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 16:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE801896;
	Tue, 14 Jun 2022 16:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE801896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655218620;
	bh=xHTGtaLw2DcnGzwyP7TMGez2Dljy9WLjCHMsdYusOy4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9/PpxAXbF+mPgbuW7IuhwWkNktvD0OtziddzpS902IghaLJGIoAFuJ+anVjamjQM
	 gvZHR8uPCkOP1K+69MqZZV6fADNnRTuDfikZ175JpgOWJymHUMPsLUUnkVOttj4ZV6
	 8r9nimfLNldezW4UVX7v6zD+0iBevAQtTOhBu/u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 008B2F80165;
	Tue, 14 Jun 2022 16:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DACEF800E1; Tue, 14 Jun 2022 16:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A653DF800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 16:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A653DF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="m/afBSt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655218555; x=1686754555;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xHTGtaLw2DcnGzwyP7TMGez2Dljy9WLjCHMsdYusOy4=;
 b=m/afBSt5sITDoM3VyxPcrsj6TjEHLiytBaiX0Uotk4RNzHXPqMN6JI3V
 1bP+dYAMTWug55Bt7G7+OCTfL1CcAhlY0KcqjmamU6bezB3HcBU6enpNu
 Wti+xaj/iQEQCk2wI/+HhrOdnRqkqoONMkbJnyOz0+FsPrj7ubi4hlZ6p
 SYBzRSqj6MWvVjyFB/rktOJtxMM9Xg0WhFu4X6bcZrS6ocUE0u3sUFBSZ
 hogeEnZR+gaEHNOcrspTJvAVtL4ElWKyCMWVahdlzaLkW85YjsyzmQ193
 V9QyYm1MjocYtoNwRk0ZZSXc/06wRgbEl6SgXsgStHGZIzhpkNAB5wQo9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="304055016"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="304055016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 07:55:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="652081167"
Received: from mburny-mobl1.amr.corp.intel.com (HELO [10.213.163.91])
 ([10.213.163.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 07:55:43 -0700
Message-ID: <3fd14acb-1de9-3fd8-81ab-27fee4a42b84@linux.intel.com>
Date: Tue, 14 Jun 2022 09:55:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: add trigger callback into
 sdw_callback
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
 <20220614070817.2508-3-yung-chuan.liao@linux.intel.com>
 <Yqg01aSixhBq9d4+@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Yqg01aSixhBq9d4+@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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


>> @@ -809,6 +814,10 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
>>  		if (!hda_use_tplg_nhlt)
>>  			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
>>  
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
>> +		sdw_callback.trigger = ipc4_be_dai_common_trigger;
>> +#endif
> 
> #if should not be in .c files if at all possible.  Surely there's a
> better way here...

we could use

if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))
    sdw_callback.trigger = ipc4_be_dai_common_trigger;

would that work?

We try to keep this driver configurable, not all platforms require
SoundWire or HDaudio, and that 'sdw_callback' ops structure is
conditionally declared.
