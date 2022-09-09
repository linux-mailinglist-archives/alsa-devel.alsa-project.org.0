Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D685B4D1A
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Sep 2022 11:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CFC16BE;
	Sun, 11 Sep 2022 11:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CFC16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662890249;
	bh=Huvf4jUlfqAE0S3jajz5bFrVu/CfyNFpABu20WmrTOQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGm8iLZ0J6UPRTbfdGm6da6qghRFA0iTj2zxtY4+vEDHkMH+/TNcVH4Atorq1OW24
	 Vv7NGRscPgNzqLu0EI48BnO7qf7swUZC8ILK+xMuBWY2rFrb38sezAywJEk6x3W2Co
	 keqBSzowZw9ip7D8DpkH+jrr9oLTBiWo2wMq9d1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12045F80425;
	Sun, 11 Sep 2022 11:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00088F8023A; Fri,  9 Sep 2022 09:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 712C1F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 09:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 712C1F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="FLKN6r+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662707812;
 x=1694243812;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DsDCmJm5QnmY/iwJKHdd96PQQQIC67/EgZ6usBBX7d8=;
 b=FLKN6r+4gHYUDjaDFoK97ZUZuYUpOiZtuucN7p+o+MtwzigtMNIAor0H
 444Exip80DQZZObafdi3we8vv6A05/5kfnMUQVHzgQqsDP+wueV0iO1AP
 Y40UPbBtA36VCcfzs0k0Q1xssyA2yYauiWhbNCFM0OE+zopQdJNYV7uLh
 S8Wn9adU7bd9pSA3xMdIUVdW1QnFboH0EMP79jikYI4dA+T5PnMXiymgq
 4HSyng/O7Bk/Bq+mQ7zE7AWgx6L/sONuvhVT765wcP/Aoq7cXZDsKN+H9
 x1skOH4MhQu+4VulDn1E7OQsqULgBuhoXNORBqM+7ZNHe57fQ5mTHqWej g==;
Message-ID: <b42e7fe4-9e1b-fdda-44f2-aa87b06425c8@axis.com>
Date: Fri, 9 Sep 2022 09:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
From: Astrid Rost <astridr@axis.com>
In-Reply-To: <Yxn9o1MVMPnFO3PM@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail05w.axis.com
 (10.20.40.11)
X-Mailman-Approved-At: Sun, 11 Sep 2022 11:56:28 +0200
Cc: devicetree@vger.kernel.org,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Astrid Rost <astrid.rost@axis.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 kernel@axis.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

Hello,

 > Use standard property units "-ms".

I made it in exactly the same way as it is done for the "ti,micbias:".

- ti,micbias:   Intended MICBIAS voltage (datasheet section 9.6.7).
       Select 0/1/2/3/4/5/6/7 to specify MICBIAS voltage
       2.1V/2.2V/2.3V/2.4V/2.5V/2.6V/2.7V/2.8V
       Default value is "1" (2.2V).


?> Anyway new properties cannot be accepted. This has to be converted to DT
?> schema (YAML).

 > Doing a whole binding conversion feels like a bit of a steep requirement
 > when people are just adding a simple property, it's a lot of stop energy
 > to figure out the tooling, do the conversion and deal with all the
 > bikeshedding that the tools don't catch.  It's definitely nice if people
 > want to look at that, for more complex binding changes it gets more
 > reasonable but for trivial properties it's disproportionate.

Thanks, I am not really sure how yaml works. But I can have a look.


Astrid
