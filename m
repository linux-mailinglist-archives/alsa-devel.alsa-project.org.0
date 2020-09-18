Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3B271DE7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F01D17F7;
	Mon, 21 Sep 2020 10:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F01D17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676822;
	bh=nfpUa/qdzM7Qrs0dHMukzvUEOS1W/bPmQ8VChQGd1lI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1EeFSJf4e37q5dQsli8m5ZH89KgzfPJLoldWenfK1gV1kXF9zVwxs9ZBe4hUml4Y
	 Vgobh3MNxDel3xmpIcBPnvErfvkUop18lQliPMp1yVmctJeR0frdWiK6Ppp3Ua5ZV3
	 zl2qs+r0AA1iOPx5sSE8QDQyP0I4qTJmKPO/Ukbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5185F803B2;
	Mon, 21 Sep 2020 10:11:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0602F8012D; Fri, 18 Sep 2020 13:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0834F8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 13:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0834F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="VZsF46ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=615; q=dns/txt; s=axis-central1;
 t=1600428472; x=1631964472;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=h4YCEEeTnq5wqR3bOx8qJ07wGEpA+/95zKv+vF6jvJo=;
 b=VZsF46akfDhGF2j2QrqQa1xsMiVOSVHsnlESQvC4GN4tk4l2Z52yeFyw
 mw/my6HEz52WRCltGb/JyIz/dpMMqBNkVjjdu+nMo4xd6PDmnEn+pIJJk
 XRphNFVHTogFsu1bAlu/HMQT6AnJGooy4Agp55RJZLWjWmYIRT1l33hN9
 +8+157Godm9jFR/KafUooHUswpHOpTtoPOLnFYM4jpj+hAzjts5wOHdLb
 xrCs0fZYbqAHC1GzVlGfy7wfZMiFxK96hLiPZzY4FvHwrAmM/TcY6Wq0n
 aViu7dniBaBDe4EmmTPH2wGMIqbKWEVHY2X2Vqkn9VhX4zrxt7Z8x0vYM g==;
IronPort-SDR: JB/JZc/kR1SsBLT+S5n9ea8zW0Ip7fomSAUGq5decezV3v+Y4jEOZH0IqoyV25Ka3Khnom4nXz
 4g0qSTrB5dUaEQMXQVbjU+QHmLjPYe/+vVhO9Apj5po4/9EECOw+EIL4TWjn70d7nOhz81aZq4
 J7Muo4VsnamotHR0J1zGHaBC8ZWJL1/lgftE56e2akx43sQ9i8IlBhPFerlU/69LitN5iHudtl
 zIz5pX6iq4VqcuoUqMDW2Ql7PQ0VI541A88MD88D9CrXDbt62JwKs2iE7kcJ6oaZsGnRZ7NyQu
 ycE=
X-IronPort-AV: E=Sophos;i="5.77,274,1596492000"; d="scan'208";a="12636837"
Subject: Re: [PATCH v4] ASoC: tlv320adcx140: Add support for configuring GPIO
 pin
To: Mark Brown <broonie@kernel.org>, Camel Guo <camel.guo@axis.com>
References: <20200918073229.27348-1-camel.guo@axis.com>
 <20200918111823.GE5703@sirena.org.uk>
From: Camel Guo <camelg@axis.com>
Message-ID: <b5cc9041-62ea-d578-db28-c1ab8ec50842@axis.com>
Date: Fri, 18 Sep 2020 13:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918111823.GE5703@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To xbox06.axis.com (10.0.15.176)
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:22 +0200
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, kernel@axis.com, dmurphy@ti.com
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

Mark

On 9/18/20 1:18 PM, Mark Brown wrote:
> On Fri, Sep 18, 2020 at 09:32:29AM +0200, Camel Guo wrote:
>> From: Camel Guo <camelg@axis.com>
>>
>> Add support to configure the GPIO pin to the specific configuration.
>> The GPIO pin can be configured as GPO, IRQ, SDOUT2, PDMCLK, MICBASE_EN,
>> GPI, MCLK, SDIN, PDMDIN1, PDMDIN2, PDMDIN3 or PDMDIN4 and the output
>> drive can be configured with various configuration.
> 
> This needs a DT bindings update for the new property (I thought there
> was one in prior versions)?
> 

That patch for DT bindings has no change at all. Now I resent it anyway.
