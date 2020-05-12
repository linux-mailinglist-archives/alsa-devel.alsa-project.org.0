Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056711CEE21
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 09:34:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A22451681;
	Tue, 12 May 2020 09:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A22451681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589268883;
	bh=bY9imBKmdN5exRNl5zsEAmhsTZ++2GcU4h/h4sb/U7Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIrrhxg4HwCBSWnZ8PizW+MwPgZykfOqhDkiKTlYaEOONO7wxULA3xx+wzwnlFv8m
	 MpoeeS1isOEbFt1ULPAgmCrJKdL0Y6ONNXJbW6bYHW3snpX3PYojWspnd5K+71hGxy
	 i9kEVtjTKjY4HxdE/7MAqrRGe0MAF6mprwCZ1Jyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A464F800E3;
	Tue, 12 May 2020 09:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B816F8015A; Tue, 12 May 2020 09:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A82B8F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 09:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82B8F800E3
IronPort-SDR: KpXXV0JV1uHiIoaGjjv7LpJ26ZjUtH3SgQ13gYPzqZWFyNtHHRQk2H6QT7GVhgKPET2VxtuVe4
 fGuCjUfvXihA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 00:33:16 -0700
IronPort-SDR: mOnhCYrI/hwbSJ6Rz5F8io09W6qWJabrV2NlQKxofM+IqC5c+4DH1bE8mlTPrl4sZg9a5w7Ngt
 H1uAKuXKx6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,383,1583222400"; d="scan'208";a="280037391"
Received: from mgleba-mobl.ger.corp.intel.com (HELO [10.213.17.239])
 ([10.213.17.239])
 by orsmga002.jf.intel.com with ESMTP; 12 May 2020 00:33:13 -0700
Subject: Re: [PATCH 1/2] ASoC: Intel: baytrail: Fix register access
To: "Lu, Brent" <brent.lu@intel.com>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20200507133405.32251-1-amadeuszx.slawinski@linux.intel.com>
 <BN6PR1101MB2132B47AE82281E17C9CD78B97BE0@BN6PR1101MB2132.namprd11.prod.outlook.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <1de7ea69-1a87-5a0b-45f1-ea38aff85d9a@intel.com>
Date: Tue, 12 May 2020 09:33:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <BN6PR1101MB2132B47AE82281E17C9CD78B97BE0@BN6PR1101MB2132.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On 2020-05-12 8:19 AM, Lu, Brent wrote:
>> -----Original Message-----
>> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
>> Amadeusz Slawinski
>> Sent: Thursday, May 7, 2020 9:34 PM
>> To: Rojewski, Cezary <cezary.rojewski@intel.com>; Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com>; Liam Girdwood
>> <lgirdwood@gmail.com>; Jie Yang <yang.jie@linux.intel.com>; Mark Brown
>> <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>
>> Cc: alsa-devel@alsa-project.org; Amadeusz Sławiński
>> <amadeuszx.slawinski@linux.intel.com>
>> Subject: [PATCH 1/2] ASoC: Intel: baytrail: Fix register access
>>
>> Baytrail has 64 bit registers, so we should use *read64* to read from it and
>> then use proper mask values to check status.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> 
> Tested-by: Brent Lu <brent.lu@intel.com>
> 
> 
> Regards,
> Brent
> 

Thanks Brent!

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
