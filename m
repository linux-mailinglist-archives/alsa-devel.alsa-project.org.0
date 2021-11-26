Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441C45EB84
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 11:27:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04FE18FE;
	Fri, 26 Nov 2021 11:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04FE18FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637922428;
	bh=wvSdEtz/Lz7qxpB6MLnp4HoTpp+qAAGaLUoFjPs02/M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GX4Hbg9BoJ87hTd8cBYraXbsTkDIk+iB8qiYOUc2xMnEwxXzhFHBuvq4QsvDidC2Y
	 OHrnFfo3M3zEsm0Bcs34uQLe3461b8sLJJ55k0S8gOHWsJe7Au/Ksm91eB5QY8bkYy
	 ADp0b/Pu11rmjwNIgkJWC+Ro4KUx54LTd7jDw/6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29138F80245;
	Fri, 26 Nov 2021 11:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1056F80212; Fri, 26 Nov 2021 11:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BA9BF80166
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 11:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA9BF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="Z8HoQGni"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AQALNMb003409;
 Fri, 26 Nov 2021 11:25:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dbwGfIwnUU/8KIQMSbt8DZOHk6GsjPaWZ736Ald/Wn8=;
 b=Z8HoQGniG4HFI+CncknYRDT1NE32SATiqwbJ9fiZToFiMRRCkGNjUK08Cyd55X+Qdl13
 rC2YuJy0WHbJKk2WjAT2IJGIDxbqhXPEM+U+Ae7BUxqkHoegh/O9cStSfNQjJozxsNZ2
 qArwUdqAkr4gpVTOXfxl+1J7Mqwg6RCiwDu+g7VJRI5FZRLPzDBE2I8sMqwtv4XVKvY4
 bv5yaKMJOsKoV7hLa8wpd2hF7sktJQ58aaXEhrmcN3A339xFPklnQrlU7BBXCTu/KrX7
 WomZvZxPYEc9ULWqkzwdt5hGPVatG9OZXcRiL4r3Hab949H7OkNeYULb894UAphueMqm Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cjqsk9ywf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 11:25:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F18710002A;
 Fri, 26 Nov 2021 11:25:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EEEB222C80;
 Fri, 26 Nov 2021 11:25:30 +0100 (CET)
Received: from lmecxl0577.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 26 Nov
 2021 11:25:28 +0100
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
To: Rob Herring <robh@kernel.org>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
Message-ID: <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
Date: Fri, 26 Nov 2021 11:25:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 amelie.delaunay@foss.st.com, fabrice.gasnier@foss.st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alain.volmat@foss.st.com,
 arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

Hi Rob,

On 11/25/21 10:26 PM, Rob Herring wrote:
> On Thu, 25 Nov 2021 15:40:50 +0100, Olivier Moysan wrote:
>> The STM2 I2S DAI can be connected via the audio-graph-card.
>> Add port entry into the bindings.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> ---
>>   Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1559750
> 
> 
> audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
> 	arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
> 

This warning is not a new one.

The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
port:
	$ref: audio-graph-port.yaml#
	unevaluatedProperties: false

However the spi binding requires to introduce a unit address:
patternProperties:
   '^port@[0-9]':
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false

The warning can be removed by re-ordering the bindings patches in the 
serie, as "additionalProperties: true" makes the check more tolerant on 
extra properties.
The patch "ASoC: dt-bindings: stm32: i2s: add audio-graph-card port" can 
even be merely dropped.
So, I suggest to resend the serie without audio-graph-card patch.

Does it sound too permissive to you ?

Thanks
Olivier
