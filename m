Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EEA2C99F2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 09:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C889F16F0;
	Tue,  1 Dec 2020 09:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C889F16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606812660;
	bh=vITJA6tY1SsPIiEoBsmgLT2GTcIniX6Yrqu8I/GOESI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mn2T7DI4QwXaWt5UmeThc7XEM8X96wr0vtM6lP6Tr8fldnjvmnSjeRP93umxaC0Zc
	 AwQBNJzGCphwzHLtz4GjiM6Z4n5lDROLl6D+fXjAaAOaabKx+Wy9tLNuT/tlY8ozIP
	 5osHrntUbDQxnD68LqUiDG6qq2l+fFiZ0RpbwpYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 040B6F8016C;
	Tue,  1 Dec 2020 09:49:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6EA6F8016D; Tue,  1 Dec 2020 09:49:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACD8EF80158
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 09:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACD8EF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="jDaECR9A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=wlhTi2vRc8OQsX48Xuggh9y4u/DbRIrhubCVEYrXTzk=; b=jDaECR9A3yzBEeJFpqQ99yVnm/
 n+21ZEWpCfS3Q0GL0ib0ICjWIh8GWspMrvZ6HCzKfjKukKEfgV19PM6i/Csm/JB7Wc6yfrC2vY76d
 CmnGqAYFgX6hfvFHylzO8gcTqJhELovVEO/ID7L0RA/0tNC1n6okn+MG3bZhYqEx7+vTKwdoCERQh
 V9RNCqZzyzwt3EiFHSupGEWSN2hcsvoy+bAmesBl9peK81Fw1Ef/VPz9FjZh8mMIgSgQxUJsrqv2Z
 9yumd3demQTyzzM1mLtlS/JWLWICedHAsKv7DTDXvkHHRvYlGtWMYiJIOrluCTwwhZWVjuobfv7oV
 klhP3BLQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kk0vX-0004BZ-1D; Tue, 01 Dec 2020 09:22:23 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kk0vW-000TKz-Qz; Tue, 01 Dec 2020 09:22:22 +0100
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118145055.GW4077@smile.fi.intel.com>
 <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB30465A81744EA686D2502DB69DF50@BYAPR11MB3046.namprd11.prod.outlook.com>
 <e9bae9eb-6b8b-5a8c-eba0-d7f5da955987@metafoo.de>
 <20201130110915.GI4077@smile.fi.intel.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <74ed61e1-67d9-d7b7-0619-fbe61ad7a583@metafoo.de>
Date: Tue, 1 Dec 2020 09:22:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130110915.GI4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26004/Mon Nov 30 15:29:06 2020)
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Sia, Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
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

On 11/30/20 12:09 PM, Shevchenko, Andriy wrote:
> On Mon, Nov 30, 2020 at 11:45:17AM +0100, Lars-Peter Clausen wrote:
>> On 11/30/20 10:57 AM, Sit, Michael Wei Hong wrote:
>>> Is there anymore comment on this RFC?
>>> We will be using the ASoC framework to split the linked-list, since resplitting the linked-list in DMA is a no go.
>>> If there isn't any more comments, we will push these patches for review and merging.
>> Why is splitting the list in the DMAengine framework a no go?
>>
>> The whole idea of the DMAengine framework is to hide hardware specifics. It
>> offers an API with certain semantics and it is up to the driver to provide
>> an implementation that implements these semantics. There does not
>> necessarily have to be a 1-to-1 mapping to hardware primitives in such an
>> implementation.
> I would say it's not desirable.
>
> Why should we split than resplit if we may do it in one go?
> Why then we have DMA capabilities returned to the consumers.
>
> So, I have that we need to optimize DMA SG list preparation in a way that
> consumer gets SG list cooked in accordance with DMA limitations / requirements.

The API that the audio drivers use request a period DMA transfer for 
length N split into M segments with the callback being called after each 
segment.

How that is implemented internally in the DMA does not matter as long as 
it matches those semantics. E.g. if the segment is longer than what the 
DMA can handle it can split it into two segments internally and call the 
callback every second segment.

The way this API works there isn't even really a possibility for the 
client side to split periodic transfers.

Btw. 1024 beats per segment seems excessively small, I don't understand 
how somebody would design such an DMA. Was the assumption that the DMA 
will never transfer more than PAGE_SIZE of contiguous memory? Or do we 
not understand the documentation correctly?

- Lars

