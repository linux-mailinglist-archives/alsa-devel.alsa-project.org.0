Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B62238D6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 12:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB9F71662;
	Fri, 17 Jul 2020 11:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB9F71662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594980028;
	bh=YWm0BBZQlVLcR88Aqvxgp5AVZidngiXYDb3MmrelhdQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ld6xVuxPbA/QlZJB9JFVZF6KAFhaOZApqQVaFA5MXMEzXRaattZS2Xms6DWR+jBxv
	 DBoTCFphpqiHCaodvuaA522c144EXRLzYdHoAX9wD14Jyk7cDDGAyIESUOCbmRgB7H
	 CHYbGrTVQYxV43Ix5ctMew7RqOK+adOA7yPEBC90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10741F8021D;
	Fri, 17 Jul 2020 11:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39742F80217; Fri, 17 Jul 2020 11:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEF41F800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 11:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF41F800E4
Received: from [IPv6:2a01:e35:2fb5:1510:c567:382e:1974:9868] (unknown
 [IPv6:2a01:e35:2fb5:1510:c567:382e:1974:9868])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EA4562A4F66;
 Fri, 17 Jul 2020 10:58:35 +0100 (BST)
Subject: Re: [PATCH v2 2/2] ASoC: fsl_asrc: always use internal ratio
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200716145201.186270-1-arnaud.ferraris@collabora.com>
 <20200716151352.193451-1-arnaud.ferraris@collabora.com>
 <20200716151352.193451-3-arnaud.ferraris@collabora.com>
 <20200716233742.GA27376@Asurada-Nvidia>
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Autocrypt: addr=arnaud.ferraris@collabora.com; keydata=
 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
 xZQG6fKWuIur3RI=
Message-ID: <e4d96e1f-b988-bb24-b784-b4198d172e40@collabora.com>
Date: Fri, 17 Jul 2020 11:58:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716233742.GA27376@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
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



Le 17/07/2020 à 01:37, Nicolin Chen a écrit :
>> @@ -507,8 +507,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
>>  
>>  	/* Enable Ideal Ratio mode */
> 
> The code is against the comments now -- need to update this line.

It isn't, the following code still enables "Ideal Ratio" mode (see below)

>>  	regmap_update_bits(asrc->regmap, REG_ASRCTR,
>> -			   ASRCTR_IDRi_MASK(index) | ASRCTR_USRi_MASK(index),
>> -			   ASRCTR_IDR(index) | ASRCTR_USR(index));
>> +			   ASRCTR_IDRi_MASK(index), ASRCTR_IDR(index);
> 
> The driver falls back to ideal ratio mode if there is no matched
> clock source. Your change seems to apply internal ratio mode any
> way? Probably would break the fallback routine.

Strictly speaking, internal ratio is only enabled when we have matched
clock sources, and is used in addition to the calculated dividers
(allows the ASRC to better adjust to drifting/inaccurate physical
clocks). "Ideal Ratio" mode is different, and still enabled as a
fallback when no clock source is matched.

Ideal ratio requires both USRi and IDRi bits to be set, and that would
still be the case if there is no matched clock source.

The only difference my patch introduces is that USRi is always set (was
previously cleared for "normal" mode), and therefore only IDRi needs to
be set in order to enable ideal ratio mode.

Regards,
Arnaud
