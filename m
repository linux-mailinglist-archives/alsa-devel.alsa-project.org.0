Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2113B340
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 20:54:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C93617C5;
	Tue, 14 Jan 2020 20:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C93617C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579031682;
	bh=Ir2YM5PqxfqtlLVNrfOSQFwnOS0o2hzK9aJm6ukT398=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gq8/+gkxGnt6ffq3MWjBRQ+X0powz5DGk0VC8FS9I4EMebB7CpJUanPEIV92Z1WIM
	 b3s+dvsyRfjtMH8mAShvcHVmPAir981f3QEgdge/qBUuaFohWvjU4QpG00Bv7NG3pR
	 qpseND0p3kAgnboU4JXYxkgYFiVcA/jIZ/Q/lpTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C19F8014E;
	Tue, 14 Jan 2020 20:52:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D52F5F8014E; Tue, 14 Jan 2020 20:52:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D5AFF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 20:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D5AFF800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 11:52:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="213450054"
Received: from emkilgox-mobl2.amr.corp.intel.com (HELO [10.251.0.151])
 ([10.251.0.151])
 by orsmga007.jf.intel.com with ESMTP; 14 Jan 2020 11:52:48 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20200110214609.30356-1-pierre-louis.bossart@linux.intel.com>
 <20200110214609.30356-5-pierre-louis.bossart@linux.intel.com>
 <20200114061441.GB2818@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0f9e36f1-2cc7-d9e2-8d35-985b409d9e3a@linux.intel.com>
Date: Tue, 14 Jan 2020 12:55:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114061441.GB2818@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 4/5] soundwire: intel: add sdw_stream_setup
 helper for .startup callback
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



>> +	name = kzalloc(32, GFP_KERNEL);
>> +	if (!name)
>> +		return -ENOMEM;
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +		snprintf(name, 32, "%s-Playback", dai->name);
>> +	else
>> +		snprintf(name, 32, "%s-Capture", dai->name);
> 
> How about use DAI_SIZE instead of 32 here and above few places? Lets not
> code number like this please

Yes, thanks for spotting this. kasprintf seems like a better solution I 
guess, will send a v2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
