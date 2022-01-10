Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99225489DDF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 17:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 252C918AE;
	Mon, 10 Jan 2022 17:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 252C918AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641833437;
	bh=RD9okIjLSTH7xkAaitQ8zmG3R2QSjQPLZHJurvli5Ng=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f3p+nAIK6GPlk+X0gBDvPbYgbfKZ446Vgxz7VH63ncV4X+IX1GAGMnZpqf+19jWQ4
	 En5UW8DHwzP3L+pmvD4976PfsxoFOcxgm6pWy2mzwYER9FrLu4kcxAwn0fc8S4pBtc
	 u0xhJfLXB/GX1prUiHgu8b2mGBw57Ra74rXADjv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A7ABF80134;
	Mon, 10 Jan 2022 17:49:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DEBDF8012E; Mon, 10 Jan 2022 17:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19E3F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 17:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19E3F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="K98WA4uS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641833358; x=1673369358;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RD9okIjLSTH7xkAaitQ8zmG3R2QSjQPLZHJurvli5Ng=;
 b=K98WA4uS5fkzFUfPmCNzJlDmsUR4G+Fjljz+uSGlzhCtE6UYPd5rNfbS
 9xeWN8I6MpvJtkvEFzbru7y21Ui/auNeL1wNLnrk4IBpNyWedGfp+tV8u
 1yVQHYKJEUZHFahqxijMTQHeTDaUhaioL0mqbu+2OivDlDvv2thC/AvCw
 3yAim7p2yS5WxHcv5TkG5OZQel22q9tYMlhnx+tmJjQynbksXyy+GHqNZ
 Bs292srCc0uP++FtwEZpHBaPMeARpRSzYc05cAeXJzho3+7rXRLWvtdKM
 Dqp31CN/WY3KoFO3m9WRey1WgbZ3nkOsrgtfDbDEP0w5J+ElJ/YH9XlRD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="223249027"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="223249027"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 08:49:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="472123479"
Received: from boviedox-mobl.amr.corp.intel.com (HELO [10.212.36.191])
 ([10.212.36.191])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 08:49:11 -0800
Subject: Re: [PATCH 7/7] soundwire: intel: remove PDM support
To: "Liao, Bard" <bard.liao@intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
 <20211213054634.30088-8-yung-chuan.liao@linux.intel.com>
 <YcQeRJ060/u4n6fR@matsya>
 <DM6PR11MB4074FEE19010B83F0CDDE8A9FF7E9@DM6PR11MB4074.namprd11.prod.outlook.com>
 <YcRX4ehgXZIWx3jf@matsya>
 <DM6PR11MB407458F1824D52BFD0D9ED96FF7E9@DM6PR11MB4074.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0cb18de1-dcff-e3c8-414e-b5b96b30b387@linux.intel.com>
Date: Mon, 10 Jan 2022 10:32:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB407458F1824D52BFD0D9ED96FF7E9@DM6PR11MB4074.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


>>>>> While the hardware supports PDM streams, this capability has never
>>>>> been tested or enabled on any product, so this is dead-code. Let's
>>>>> remove all this.
>>>>
>>>> So no plans to test and enable this? Do the DMICs not use PDM?
>>>
>>> The point is that this code is unused/untested. We can re-add it after
>>> it was tested.
>>
>> That does not answer my question. Do the DMICs not use PDM?
> 
> I will leave the question to Pierre. 😊

traditional digital microphones using the Nokia spec with two
microphones using opposite clock edges do use PDM.

PDM over SoundWire is possible as well, it's e.g. used by Qualcomm for
amplifiers. This patch does not make a statement on whether PDM support
makes sense or not in general.

As mentioned above on Intel platforms the hardware is in theory capable
of supporting PDM, but that capability has never been deployed, all
existing devices we connect to are PCM based and all the PDM references
are essentially untested - and likely broken.

