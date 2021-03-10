Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4FC3341BF
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 16:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE65D175E;
	Wed, 10 Mar 2021 16:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE65D175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615390901;
	bh=8r/mqdzkMk0RKG/CDQ/G7xGmr9wyHGyAbP8FWpOtNx8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ks3E4VYhlJ1oYjZ2IuF+7UhYklBM8jUZFDtaPh092fqS0TxNofa1vQct2qJ3GLoQV
	 cKRrBCdiMtzU+PI9B3chs71gayllIn00eTgONqS4v1n6UWfU/QU0ClxqE5wG6eQTLV
	 S2hBAhsUq4T7Rvy48CbsvI0zo4Wj04it/XZEJdzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C84D9F801ED;
	Wed, 10 Mar 2021 16:40:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2A2AF801D8; Wed, 10 Mar 2021 16:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65340F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 16:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65340F8012F
IronPort-SDR: wxggidJMx4WWXk8mK53xPq7n0plUVrmWmCYbjd2dpDlMKDzZJEfCz7mSdLE1ZLIM+doM1YoyEB
 lOfpBuxEY+IQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188588167"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="188588167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:39:55 -0800
IronPort-SDR: hQye4YkLpyycLpfbC8PEFBUx7bpb+7xC+fo5lUDYfsjEzfr9D0JQTsF7VA3FJxpEaLcj+g/fw3
 uIu6LYMnMQFQ==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="403720567"
Received: from huiyingw-mobl.amr.corp.intel.com (HELO [10.212.214.84])
 ([10.212.214.84])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:39:54 -0800
Subject: Re: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>, 
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20210226020517.17124-1-jack.yu@realtek.com>
 <b4af8c40-d1c6-35f2-0f70-3032fd04697f@linux.intel.com>
 <2e2eaa61cdcd44529f379085c615a4c9@realtek.com>
 <f4327b67-7202-0a4c-69af-93a4a1982dfe@linux.intel.com>
 <eeb69d18b3a5449a9a3497777afda052@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1125129a-7d23-5556-961e-cdd51f5fabaf@linux.intel.com>
Date: Wed, 10 Mar 2021 09:39:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eeb69d18b3a5449a9a3497777afda052@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, =?UTF-8?B?6Zmz5pi25b+X?= <kenny_chen@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


>> It seems that the options are limited. The HID needs to be made of two parts,
>> vendor ID and part ID.
>>
>> For the vendor ID, you may use the PNP ID (RTL) or the PCI ID (10EC).
>>
>> For the part ID, you are limited to 4 hex-digits. I didn't get any positive answers
>> on how to support '1015P', the only solution seems to be to create a new part
>> number, or detect at run-time which of the '1015' skews is actually used.
>>
> 
> Actually this driver is also used for rt1015 IC, the only difference is that rt1015.c is for i2c mode
> and rt1015p is for non-i2c mode of rt1015 IC, so I think it's ok to use the same part ID (different vendor ID) for two drivers.
> How do you think if we use "RTL1015" instead?

that would work indeed, e.g. 10EC1015 refers to the I2C version and 
RTL1015 to the non-I2C version. Thanks!
