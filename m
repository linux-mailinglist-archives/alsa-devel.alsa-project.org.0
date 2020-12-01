Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8EF2CA5CB
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 15:37:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA6F172A;
	Tue,  1 Dec 2020 15:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA6F172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606833458;
	bh=D0f/8oxEWlWJXgkWfZGcUiJ3MUsZeoWJZPE58OwKZig=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KdT5m7uCqoh/qo/ukjJlqhu9IJTvMU6HXvTd+SiO5S5s/2CDZM4J8j0cOEOoZb9+M
	 zZ0QGtY03V49y/ER3v2OwJg/sr/CYJ3z1e6tHfHWItxw/zUHSMPEb+uCKZH1lY11bT
	 lX26FSUlc6e1RuSDF3ZAfxG46yTnCH9IssoTkY+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E0C6F80254;
	Tue,  1 Dec 2020 15:36:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 661FCF8016D; Tue,  1 Dec 2020 15:36:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A579CF80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 15:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A579CF80139
IronPort-SDR: YMEvWe2kWRxwnvQhJuFkYjOla2TiLJ2j67d0Gw1ZLEGq/m6Zim5wsr1qvohiPJWNb2cEOZR+b7
 Yor57bXYY34Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="160605399"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="160605399"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 06:35:46 -0800
IronPort-SDR: temaf+ahoFTQk7464VYz82vE8GVBgjV5ccgi9dSbQLc1h7rh1xDUBG0uhQf8X/7p2X4lElG6cW
 PdR5CiHYfF3w==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="364762445"
Received: from griver2-mobl.amr.corp.intel.com (HELO [10.213.191.92])
 ([10.213.191.92])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 06:35:44 -0800
Subject: Re: [PATCH v2 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
To: Vinod Koul <vkoul@kernel.org>, "Liao, Bard" <bard.liao@intel.com>
References: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
 <DM6PR11MB4074311B4E0B70F24383E754FFF40@DM6PR11MB4074.namprd11.prod.outlook.com>
 <20201201041138.GY8403@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e9478e45-2a24-05f9-eb56-5905d54ab6a4@linux.intel.com>
Date: Tue, 1 Dec 2020 08:35:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201041138.GY8403@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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



On 11/30/20 10:11 PM, Vinod Koul wrote:
> On 01-12-20, 02:42, Liao, Bard wrote:
> 
>> Hi Vinod/Mark,
>>
>> Could we take this series into Vinod's tree with Mark's Acked-by?
>> It failed to build on Mark's tree.
> 
> I see Mark has already applied 1-3 ..

Sorry, I thought Mark had reversed the entire series.

Vinod, would you mind providing a tag for Mark then? The following 
commit is needed to compile:

b7cab9be7c161 ('soundwire: SDCA: detect sdca_cascade interrupt')

Thank you Sir!
