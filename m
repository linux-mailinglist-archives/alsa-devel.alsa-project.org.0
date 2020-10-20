Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A6293492
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 08:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC74A170D;
	Tue, 20 Oct 2020 08:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC74A170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603173945;
	bh=No/x2dkGRbgjL+q6iMjWCSMbrm1yVAmFsj5NrGnqZCk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/fDxL93hPh3ojcvPlpK5+A4NDMWADtXpCgTh43QEHFOYSu+SvNZj+ENDJg1c6jMd
	 LBG4i1cZ2nhEL/aomZdVyu01Anw4HJJgYqoteNlTZi3l4coTTbhI51EAQpHgBlCFzt
	 FLyQZdYV7Uq1E6haFgYTjjSS7uSo2Y/ssOpjX5iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D34F801A3;
	Tue, 20 Oct 2020 08:04:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F16BF801F2; Tue, 20 Oct 2020 08:04:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 095E4F8010F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 08:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 095E4F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="G9fw4FIs"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8e7d6b0004>; Mon, 19 Oct 2020 23:02:19 -0700
Received: from [10.25.98.225] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 06:03:41 +0000
Subject: Re: [PATCH v4 10/15] ASoC: dt-bindings: tegra: Add graph bindings
To: Rob Herring <robh@kernel.org>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-11-git-send-email-spujar@nvidia.com>
 <20201019221105.GA3679866@bogus>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <741b6ffe-a2b3-c657-4113-d0c6316a4050@nvidia.com>
Date: Tue, 20 Oct 2020 11:33:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019221105.GA3679866@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603173739; bh=BiUKj9cP/yQT8cx2ubZAZ1aX0UMw0lA+ciOeajWUPVg=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=G9fw4FIscUh231vtUhUS7Zp7vgk4ElJPav83qReqGsFuyzTZZlZUbVhVIHB4ZjBB3
 D7oh58seobnJ5UZc9JAiDlvubyovDaE5rduZg+/mDcCtfBJfWuoT6yFhBLrhg3A9zr
 gwvuOT8grfuhLxGGJfu+E3mQU8IzlRrEgZTdQqzpeGvwaaGpAiwXbNMiFhsuHj0QB0
 i7PjCaCnipn1tcwvzyfSp/zY6jPW+sSssT7nyXcC3gDQJQnSRuIKExQN2n7LWXMKf6
 01KCH/XO83RJYuXX2E7BhasM+sqUKFmOb8oGEYIn013Z7zRADUd8drHM6Rce9YL/gL
 EiBkdA4fKCOWw==
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 rlokhande@nvidia.com, swarren@nvidia.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com, viswanathl@nvidia.com,
 lgirdwood@gmail.com, nwartikar@nvidia.com, p.zabel@pengutronix.de,
 sharadg@nvidia.com, dramesh@nvidia.com
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


>> Add device tree binding properties of generic graph to ASoC component
>> devices. This allows to define audio ports out of these components or
>> DAIs and audio graph based sound card can be realised with this.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml  | 7 +++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml          | 7 +++++++
>>   Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml  | 7 +++++++
>>   Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml  | 7 +++++++
>>   Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml   | 7 +++++++
>>   5 files changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> index ed2fb32..23875b1 100644
>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> @@ -55,6 +55,13 @@ properties:
>>         The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>>         available instances on a Tegra SoC.
>>
>> +  ports:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
>> +

>> +patternProperties:
>> +  "^port(@[0-9a-f]+)?$":
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
> You should have either 'ports' or a single 'port' (yes, the graph
> binding allowed multiple port nodes without 'ports', but that should be
> deprecated IMO)

OK, will drop this and just use 'port' here.
