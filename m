Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41C30EB17
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 04:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5FD116EF;
	Thu,  4 Feb 2021 04:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5FD116EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612410061;
	bh=iTlzeYuBjVDVGzhou9wBRq06M2UjHJEC1PRUmEYuBwg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYq9nYwgAT8CTnawNZvIEiShypfTFwiXzq0ETh7Y1WkyYg2MDuuzMtd1Vsg83IvtX
	 57wCBGOKxtYR0ADaSynJtoJXey43D6klciutHHGSDFsWcOxLos3yyIGipxKNtFq86X
	 jdl2p5ZBsvJdbOZZqM7z5pH4G26D7lPqo/W2yhNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0235BF801F7;
	Thu,  4 Feb 2021 04:39:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 805F7F80171; Thu,  4 Feb 2021 04:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0135F80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 04:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0135F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ov9XZCg0"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601b6c620003>; Wed, 03 Feb 2021 19:39:14 -0800
Received: from [10.25.102.154] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 03:39:11 +0000
Subject: Re: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
 <1612368575-25991-2-git-send-email-spujar@nvidia.com>
 <87zh0k94eo.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <691678f3-d0da-2320-ef6f-82090b9d8f9d@nvidia.com>
Date: Thu, 4 Feb 2021 09:09:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87zh0k94eo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612409954; bh=3Lj3YB24wWeojwA714T0pgTPArxLvGfmTOgyy4fsztg=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=ov9XZCg0goglyOSfH20N2P+qSa+DoUpUvCaxtRnUo+CCqWYEQGi1yZiQ+Tb6L/ltk
 lNXpRqJdCjOVw3qxT5dWUfHWkO+C71ehTjj0QwLTRAgyLG816doZ5d87Cqqyq3Yxx9
 fanXnNdWV4f8XzJkh7Rwg4rNMojU50nySwW+dwee/gsYomNgmnM+betuWJLOUn9cjZ
 vkVaXMrfJvFoBLw9AVingzVOe7v3l46pYp8GH+/bFTxKuIFDym+OjU8EaF+TxtKzee
 dj098Zs0S3y7PKZSAWgST/DmKKc7dWUZ246QBbrKZbAsKKcUInVF2jyfgY3AYkEksa
 vg+B7Bgw4D6Og==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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



On 2/4/2021 4:01 AM, Kuninori Morimoto wrote:
>> Audio graph based sound card drivers can call graph_remove() function
>> for cleanups during driver removal. To facilitate this export above
>> mentioned function.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> (snip)
>> -static int graph_remove(struct platform_device *pdev)
>> +int graph_remove(struct platform_device *pdev)
>>   {
>>        struct snd_soc_card *card = platform_get_drvdata(pdev);
>>
>>        return asoc_simple_clean_reference(card);
>>   }
>> +EXPORT_SYMBOL_GPL(graph_remove);
> Not a big deal, but
> it is just calling asoc_simple_clean_reference() which is
> already global function.

Yes that is true, but idea was to put dependency on graph_remove() so 
that any additions/changes here in future will be automatically taken 
care for Tegra graph card.
