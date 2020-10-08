Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF52877BC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 17:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EB11673;
	Thu,  8 Oct 2020 17:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EB11673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602171848;
	bh=x0Rvh1Y2bX5J2MM6qDTNfr6mlD2OlLqGlOCl9rq+UD4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BbBU//a0t0EVHEoUFAM5r0Dw0qemnP+6kamext/25Cx4D3t4PD4PogJENBBFRdq3b
	 73+uCNoksmko+tHukgQi360ytxMsVyl5QlzROzogv47Dt4qoudVRGgQ7Ry6zJWI21N
	 SK+HH0cTdm20DIazg5oZZauqapDWjxjsWGjyU1YI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D767DF80163;
	Thu,  8 Oct 2020 17:42:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABC5EF80164; Thu,  8 Oct 2020 17:42:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81038F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 17:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81038F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="jf46YP+h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=PzPeTkz+HOsEOFS/yxyvWphBJN7PMUtczwyfBNslq+k=; b=jf46YP+h82bP8P3fqHNjpa/2Na
 L+cewkptommyglm7duHNrinbG7vgNPrh55GCQRu1A0HbIyV88pxZFClaSKLn7aiJpWKTExgXd7GJk
 Z3Me35GA1yio8aEvTdFiSyu8l5DdFZ+Mgcigl4edToAR3zVmNPY3q9XaeIzTMAgug6UbVbMtRBfsG
 F+RnQ618YUzPPi7+5UJLHlbm0wCazXpBluKAtoSN1Z7oYTzyf/x2sR3M/8N6lVKpebDY4rPLVKxTB
 jVnvUSMsJzGLLw6sm/uoGY6Bxg6EfDmSk2D0seTwEQ+Ie0hqFmT0xAtMGj5TjM573ieXNGRmU10y/
 pm22VSew==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kQY3Q-0008HS-F3; Thu, 08 Oct 2020 17:42:07 +0200
Received: from [2001:a61:2478:ca01:9e5c:8eff:fe01:8578]
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kQY3Q-0002ty-Ap; Thu, 08 Oct 2020 17:42:04 +0200
Subject: Re: (Optional?) DMA vs. PIO
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Stephen Warren <swarren@nvidia.com>
References: <20201008150539.GQ4077@smile.fi.intel.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <4e7e32a6-4f7d-ae57-533f-cadfdf91299c@metafoo.de>
Date: Thu, 8 Oct 2020 17:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008150539.GQ4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25951/Thu Oct  8 15:53:03 2020)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Sit,
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

On 10/8/20 5:05 PM, Andy Shevchenko wrote:
> Hi!
>
> During internal review of one patch I have been puzzled with the following code
> and Pierre suggested to ask mailing list for help.
>
> My main concern is what was the idea behind? Does it mean we support optional
> DMA in such case? If now, why not to return an error code directly?
>
> ---8<---8<---8<---
>
>> Why ASoC core has the following code in the first place:
>>
>> 387              chan = dma_request_chan(dev, name);
>> 388              if (IS_ERR(chan)) {
>> 389                      if (PTR_ERR(chan) == -EPROBE_DEFER)
>> 390                              return -EPROBE_DEFER;
>> 391                      pcm->chan[i] = NULL;
>> 392              } else {
>> 393                      pcm->chan[i] = chan;
>> 394              }
>>
>> (note lines 389-391).
>> If PIO fallback is not okay, why not to return an error there?
> no idea, the code has been this way since 2013
> (5eda87b890f867b098e5566b5543642851e8b9c3)
>
> It's worth asking the question on the mailing list, I don't know if this is a
> bug or a feature.
>
This is to handle the case where a only TX or only RX is supported. In 
that case it is not an error if only one DMA channel is specified.

