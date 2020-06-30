Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04920F53E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708B6168D;
	Tue, 30 Jun 2020 14:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708B6168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593521938;
	bh=Dee884CwudQ4Vp0WOR0GFwZwO63Qzfttr/zlLVEdFn8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPr59hTToSU5qCMX4lFfAqPXnXj0VpAvn0kKr07S3lpY2++nkAnLRDgwENzCLWVxR
	 Nk33yPbul+1Ca+aNcyLwPeZkBsTI5khRWt6VtEWdefzn9xZqihbVetJfsrWXF31ZJ/
	 OmdsTWF3HTJ/XeafwoI4kPHmwMTvzYiDQr4DoX8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F34F800EA;
	Tue, 30 Jun 2020 14:57:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F780F801F2; Tue, 30 Jun 2020 14:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FC0FF800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC0FF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Jn0m7rcG"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efb36430000>; Tue, 30 Jun 2020 05:55:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 05:57:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 05:57:10 -0700
Received: from [10.25.97.62] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 12:57:02 +0000
Subject: Re: Re: [PATCH v4 08/23] ASoC: soc-core: Fix component name_prefix
 parsing
To: Mark Brown <broonie@kernel.org>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-9-git-send-email-spujar@nvidia.com>
 <20200630104514.GE5272@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <187db7de-51cc-0607-9178-cfca59ef6714@nvidia.com>
Date: Tue, 30 Jun 2020 18:26:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630104514.GE5272@sirena.org.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593521731; bh=Dee884CwudQ4Vp0WOR0GFwZwO63Qzfttr/zlLVEdFn8=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=Jn0m7rcGseZLTd7KPQKTe/UcR5Yx3lEDSYweTJjMJf8PrKzX/EiA2n53MSk+DdZYy
 W9oUjqN5kR6NXtscOUmAkgAv+vHxgdkAx33IxYpffk2yyDQVYF19ALPVdi5Vh7smBl
 xqOMup6YhiaJ1IKOZ5QoBper9KxWBVjOSPMAC7AEKNsV5HX2L2ZvzMNY9KWD3ATmqS
 i29y2MMx1ODPUadtVfZYyH4fHFeTZ8NP4Gr+1yBUnbTtzMGXvvCF5RyJZTZFlPzIzY
 CdwPtQ02TSC6qDrdKLGC5TgKSuT8nef4qqDc6BKcyeYhLbPcgsiegVGTm2PnvzBYdi
 BjolkeUw+Pw1Q==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, nwartikar@nvidia.com,
 lgirdwood@gmail.com, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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



On 6/30/2020 4:15 PM, Mark Brown wrote:
> On Sat, Jun 27, 2020 at 10:23:30AM +0530, Sameer Pujar wrote:
>> The "prefix" can be defined in DAI link node or it can be specified as
>> part of the component node itself. Currently "sound-name-prefix" defined
>> in a component is not taking effect. Actually the property is not getting
>> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
>> "prefix" is missing in DAI link Codec node.
> Any fixes should go at the start of a series so they can be applied as
> such without needing to pull in the rest of the series.

OK. I will re-order the patches accordingly in the next revision.

