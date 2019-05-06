Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E071520B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 18:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E56818E3;
	Mon,  6 May 2019 18:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E56818E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557161765;
	bh=0ty4Z9Yg7fnwW+xPMtdDhGZDjnqXEUHUIqPr95c4Zjk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=johg+Mr8WroVdUhsU0LMWq3cSbFFVPSajT9rWvwHFVlEpN6P35UEJ64PdtOd4iUzj
	 ZGwZGzOgYJEqIwOnjVlZQr8atIiQZWGSKEEE/xlJyOrcF31fjVPMEPPGtFXv1tO0sf
	 dOAar9t9T0KPTe7OY3DjwMB3678Ufj0GFL3z1QpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 517E4F896FD;
	Mon,  6 May 2019 18:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A4BF896F0; Mon,  6 May 2019 18:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F983F80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 18:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F983F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 09:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="171358620"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 06 May 2019 09:54:13 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 5F620580238;
 Mon,  6 May 2019 09:54:12 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-6-pierre-louis.bossart@linux.intel.com>
 <20190504070301.GD9770@kroah.com>
 <a9e1c3d2-fe29-1683-9253-b66034c62010@linux.intel.com>
 <20190506163810.GK3845@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f1b632e7-e62d-bbd4-e160-36009ee57249@linux.intel.com>
Date: Mon, 6 May 2019 11:54:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506163810.GK3845@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 5/7] soundwire: add debugfs support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 5/6/19 11:38 AM, Vinod Koul wrote:
> On 06-05-19, 09:48, Pierre-Louis Bossart wrote:
> 
>>>> +struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d)
>>>> +{
>>>> +	if (d)
>>>> +		return d->fs;
>>>> +	return NULL;
>>>> +}
>>>> +EXPORT_SYMBOL(sdw_bus_debugfs_get_root);
>>>
>>> _GPL()?
>>
>> Oops, that's a big miss. will fix, thanks for spotting this.
> 
> Not really. The Soundwire code is dual licensed. Many of the soundwire
> symbols are indeed exported as EXPORT_SYMBOL. But I agree this one is
> 'linux' specific so can be made _GPL.
> 
> Pierre, does Intel still care about this being dual licensed or not?

Debugfs was never in scope for the dual-licensed parts, we've already 
agreed for SOF to move to _GPL.

> 
>>
>>>
>>> But why is this exported at all?  No one calls this function.
>>
>> I will have to check.
> 
> It is used by codec driver which are not upstream yet. So my suggestion
> would be NOT to export this and only do so when we have users for it
> That would be true for other APIs exported out as well.

It'll just make the first codec driver patchset more complicated but fine.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
