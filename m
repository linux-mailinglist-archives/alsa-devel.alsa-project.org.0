Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E875246866
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 16:32:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57C016D7;
	Mon, 17 Aug 2020 16:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57C016D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597674723;
	bh=x1mPW2IlbzKPi21BeGGjuXFp+W8qBk7GLahgZuqMOSw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmfwTnPAXTAIWZOFAUchfaomBOUF1toFZy/GdhTfZMQvfHA/0TnWMi3onswmdhUhx
	 GAss8bbc11gx9hJ6m0fTRXGqnCqQ/UaP/7WqTWU8v/v9ZX9u59geQ5EiJO49ObbIkD
	 Se0iSamfiqTWCEoQuEjFaE4zpwzckS++lBuFwKjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D44F0F800EF;
	Mon, 17 Aug 2020 16:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43E51F80218; Mon, 17 Aug 2020 16:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BC0AF800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 16:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC0AF800EF
IronPort-SDR: /OoT8e+cEP/zfmGFyfs6FPXRC/3uExvjdccauOHVCcfAx7ePCl/zZszqL6/vkcuMHswfXbkKeQ
 wsp/CfM3xFmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="142340537"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="142340537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 07:30:06 -0700
IronPort-SDR: rb9oDKBZ7Q6nZ+8PBCrPMVYTd0fot1WnZvQ1lnkpz12w55ZRqXvdhKbos46SyzTXYT2iT4PLxf
 tiCRjcbDK3zQ==
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="292450642"
Received: from abhishik-mobl1.amr.corp.intel.com (HELO [10.212.204.20])
 ([10.212.204.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 07:30:03 -0700
Subject: Re: [PATCH 09/13] soundwire: intel: add CLK_STOP_BUS_RESET support
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
 <20200721203723.18305-10-yung-chuan.liao@linux.intel.com>
 <20200817114729.GP2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8aac898f-92d3-c907-ebb8-4642a618645b@linux.intel.com>
Date: Mon, 17 Aug 2020 09:30:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817114729.GP2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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




>> +	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
>> +		ret = sdw_cdns_clock_stop(cdns, true);
>> +		if (ret < 0) {
>> +			dev_err(dev, "cannot enable clock stop on suspend\n");
>> +			return ret;
>> +		}
>> +
>> +		ret = sdw_cdns_enable_interrupt(cdns, false);
>> +		if (ret < 0) {
>> +			dev_err(dev, "cannot disable interrupts on suspend\n");
>> +			return ret;
>> +		}
>> +
>> +		ret = intel_link_power_down(sdw);
>> +		if (ret) {
>> +			dev_err(dev, "Link power down failed: %d", ret);
>> +			return ret;
>> +		}
> 
> no cleanup on all the error cases here?

See above the 'else if' test, the clock stop on suspend will be followed 
by a bus reset on resume. this is essentially a complete bus restart.

The only open here is whether we should actually return an error while 
suspending, or just log the error and squelch it. We decided to return 
the status so that the pm_runtime suspend does not proceed: the state 
remains active which is easier to detect than a single line in a dmesg log.
