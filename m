Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB292240254
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 09:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F18E15F2;
	Mon, 10 Aug 2020 09:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F18E15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597043977;
	bh=QrJKmU4zFzWAGyaWqOruSOgBF9+duxzuyHSAIXtbvRo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jmrvCvTRkcAYBbyiD+S7FjOqm34fHcsLVknkg9N88+xqlIL3cVGAbcoEuzDJAmRZD
	 lzJ4aF+NrSNO2aQtDnCU+jVNCfby51O3siEgMVB2v8lS86e/UdqBLZewI2YZThrqeS
	 dUBIk2l+e3T455hXouAr1RwUdYbeJ5BGRYUhSRoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA4CBF80245;
	Mon, 10 Aug 2020 09:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07FF4F80247; Mon, 10 Aug 2020 09:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5258CF80085
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 09:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5258CF80085
IronPort-SDR: jigUOxsy4s+oHIuMt/ZlPM44WwYCnvGQaKBkoVGkY5hMgE17TCn7+anpZ4LNzIvkIS5cozXci+
 UginlfFdtd0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="151180662"
X-IronPort-AV: E=Sophos;i="5.75,456,1589266800"; d="scan'208";a="151180662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 00:18:04 -0700
IronPort-SDR: 6Ld4Es2ThoLo+B7QDYozfEcfYUQfTtAduPPLeTYkB+Dc9f5h6m8OoUumUZujrEdS9pyNZ6SOhW
 SydzFo+9LPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,456,1589266800"; d="scan'208";a="275935261"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.154.188])
 ([10.249.154.188])
 by fmsmga007.fm.intel.com with ESMTP; 10 Aug 2020 00:18:01 -0700
Subject: Re: [PATCH 08/13] ASoC: Intel: catpt: Simple sysfs attributes
To: Mark Brown <broonie@kernel.org>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
 <20200807110649.17114-9-cezary.rojewski@intel.com>
 <20200807150058.GM5435@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3bdc0af0-5b12-cc4e-1d67-7db70e97e035@intel.com>
Date: Mon, 10 Aug 2020 09:17:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200807150058.GM5435@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On 2020-08-07 5:00 PM, Mark Brown wrote:
> On Fri, Aug 07, 2020 at 01:06:44PM +0200, Cezary Rojewski wrote:
> 
>> +// SPDX-License-Identifier: GPL-2.0-pcm
> 
> I'm not able to find any references to what license this is - it's not
> in https://spdx.org/licenses/ for example.
> 

Indeed. this is a mistake. Will fix in v2.

>> +	struct catpt_fw_version version;
>> +	int ret;
>> +
>> +	pm_runtime_get_sync(cdev->dev);
>> +
>> +	ret = catpt_ipc_get_fw_version(cdev, &version);
>> +
>> +	pm_runtime_mark_last_busy(cdev->dev);
>> +	pm_runtime_put_autosuspend(cdev->dev);
>> +
>> +	if (ret)
>> +		return CATPT_IPC_ERROR(ret);
>> +
>> +	memcpy(buf, &version, count);
> 
> This will copy count bytes from version regardless of the size of
> version - this allows userspace to read the stack and won't truncate the
> count to the size of the data read.
> 

Good catch Mark. Ack.
