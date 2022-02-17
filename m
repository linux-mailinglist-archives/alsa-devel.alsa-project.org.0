Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6465F4BA065
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 13:53:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0AEB1865;
	Thu, 17 Feb 2022 13:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0AEB1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645102389;
	bh=LGj0nrm+3GRdaBgcl8ATm06NdF4QOvl3roOLtv5/aXU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ijtpo/CgL5W5Hv0RPuTXqhOyEuNpWtMr2ji2ADYMklWQMAm21nJtaXshS9r0KYCwK
	 BrVl+LjHS5PTptkwHJN3UDRaAyMAGOF7HLh5/AR0Tm+AvNABF+dbsZao9uYOcNuYML
	 bQsnxp0r3g3bjoePFnHAoIVKTQfgDH98yg6+qg9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E911F800CE;
	Thu, 17 Feb 2022 13:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3FA1F80240; Thu, 17 Feb 2022 13:51:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_84,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D78D6F800CE
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 13:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78D6F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Isa/yu2W"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21HCNFEV030051;
 Thu, 17 Feb 2022 06:51:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=hbRL+GXRFDweLRaYt0Z5YOa4T9eSAOcGOHkpzVK4Cn4=;
 b=Isa/yu2W8XnNGKd+4kFtY2O7KAfNckBrerQ+EWIDJTc8NfO7sIgvTUjrO3lUQTNFPKL9
 P5wKX8+ECBmE9L+a/ZcNhv0hQdNK/I/xK/69zOkxXI1BWj+xHB3EK9PutC835YRqj6OO
 RUevkZAWVNeqT4fuuTW//FItD7Q/4v8stE/Vosw+JViyX/RvSKxJyKx7FO84AeFrU4lE
 DbU7t59cHeeVqu7NhCFGbffUvRhwpkTLuxVKtmtRKicL3W52GKrM8B1C7k1tc7bpODdP
 0KT/R2Ydc1VCd/1OeGDcSqX/o/u9/UlPjPdwxiORA2dsDvszToWPogFoIk+SXGFzXS0w tA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e8nyda699-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Feb 2022 06:51:52 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 12:51:51 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 17 Feb 2022 12:51:51 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.199])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AE88146B;
 Thu, 17 Feb 2022 12:51:50 +0000 (UTC)
Subject: Re: [PATCH 2/2] ASoC: audio_graph_card2: Add support for variable
 slot widths
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20220216171408.265605-1-rf@opensource.cirrus.com>
 <20220216171408.265605-3-rf@opensource.cirrus.com>
 <87a6eq49yq.wl-kuninori.morimoto.gx@renesas.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <0ba5f63c-44a4-1949-60dd-f5debd706caa@opensource.cirrus.com>
Date: Thu, 17 Feb 2022 12:51:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87a6eq49yq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: COEC_n5rfu52TJYRPUMDIj3hJP3bf618
X-Proofpoint-ORIG-GUID: COEC_n5rfu52TJYRPUMDIj3hJP3bf618
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
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

On 17/02/2022 00:23, Kuninori Morimoto wrote:
> 
> Hi Richard
> 
> Thank you for your patch.
> One comment from me.
> 
>>   struct asoc_simple_dai {
>>   	const char *name;
>>   	unsigned int sysclk;
>> @@ -26,6 +31,9 @@ struct asoc_simple_dai {
>>   	unsigned int rx_slot_mask;
>>   	struct clk *clk;
>>   	bool clk_fixed;
>> +	struct asoc_simple_tdm_width_map *tdm_width_map;
>> +	int n_tdm_widths;
>> +	struct snd_soc_dai *dai;
>>   };
> (snip)

(snip)

> (snip)
>> @@ -386,6 +479,8 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
>>   	if (!simple_dai)
>>   		return 0;
>>   
>> +	simple_dai->dai = dai;
> 
> Indeed the relationship between asoc_simple_dai and snd_soc_dai are
> very mystery, and current utils is using confusable naming.
> We want to have some better solution about there.
> 
> Having snd_soc_dai pointer inside asoc_simple_dai itself is not bad idea.
> But we can get snd_soc_dai pointer without it.
> 
> Please check asoc_simple_dai_init().
> Not tested, but we can replace the code like this ?
> 
> =>	struct snd_soc_dai *dai;
> 
> 	for_each_prop_dai_codec(props, i, pdai) {
> =>		dai = asoc_rtd_to_codec(rtd, i);
> 		ret = asoc_simple_set_tdm(dai, pdai, params);
> 		if (ret < 0)
> 			return ret;
> 	}
> 
> 
I first thought about doing it like that. But I was not sure whether it
is safe to assume [i] is the same entry for both arrays. If it is ok,
then I can use that and do not need to add the snd_soc_dai * to struct
asoc_simple_dai.

I will look at this and send a V2 set if it is ok.
