Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF242A29EF
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 12:50:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB30016FF;
	Mon,  2 Nov 2020 12:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB30016FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604317833;
	bh=KgFqapV+Cu6tFMxNsSM3eceq1FFpME9E+TDtfiXer58=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tQB+b42OP0XmAUxZUoi0qxUva+OG0J5vQdga7VPUUbBcRrmORA0jp4MSygXzKQB/L
	 Bnlmq7r6MHm2HUiXYZN5YI55xROeROp38IR3c28UjP3CjPC2QZwFafkOecq2BA6/m+
	 bttajyQ8uxwq4zxTlDVc79VWFPnh7s3GLHCgoQuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21554F8012B;
	Mon,  2 Nov 2020 12:49:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 101B4F8012B; Mon,  2 Nov 2020 12:48:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14BBAF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 12:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BBAF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Kk8Qhq7o"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0A2BkvlE018820; Mon, 2 Nov 2020 05:48:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=s2A7WUt4Mr2xZx6mptd12oJEYonECrMm+g5WqblPk8k=;
 b=Kk8Qhq7oIq9XW5JVR1719vqTkwUv97A/zoUkr7lXLamP/+2HEGD10pHb+42I5R8JUzvH
 aSEv7MpSvpvYNwO0bQKHBS6GeVk47R7yHmDQpqZ6sxr0KQGEr3VQRpbp+/d62FoMysBi
 oyqd6lOekpNFNEIFAHCnn7nGFfLX32wOwGC1UAKITgxBxG8VVjwnxXwLxYUGhhW5H2+7
 p4ejePmdXC9G6qPTTNNCVkcqE0WgDNVpMsAFOUrnw12QdCn6XiLlbBUW3YSn97nXA/LA
 C6FkK+PkmbcVDBniBEr0FFHBvOBpRzRr44ysocQB0pIsZr44ZT8wXJaJxOcUf2p3yjGp Qw== 
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
 by mx0a-001ae601.pphosted.com with ESMTP id 34h5b226hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Nov 2020 05:48:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 2 Nov 2020
 11:48:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 2 Nov 2020 11:48:46 +0000
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.191])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0769B2A1;
 Mon,  2 Nov 2020 11:48:45 +0000 (UTC)
Subject: Re: [PATCH v2 2/7] ASoC: audio-graph-card: Add plls and sysclks DT
 bindings
To: Rob Herring <robh@kernel.org>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
 <20201016173541.21180-3-rf@opensource.cirrus.com>
 <20201026132704.GA19204@bogus>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <c4630b44-b242-5ca9-3d7c-8da41f13e1f1@opensource.cirrus.com>
Date: Mon, 2 Nov 2020 11:48:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026132704.GA19204@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020095
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de, linux-rpi-kernel@lists.infradead.org
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

On 26/10/2020 13:27, Rob Herring wrote:
> On Fri, Oct 16, 2020 at 06:35:36PM +0100, Richard Fitzgerald wrote:
>> This adds the two new properties 'plls' and 'sysclks' to the dt bindings.
>> These add the ability to set values that will be
>> passed to snd_soc_component_set_sysclk() and snd_soc_component_set_pll().
> 
> I worry this looks like Linux implementation details leaking into the
> binding.
>

I guess what you mean is referring to a function to explain the cells.
I thought it would simplify the description but it yes, it does mean
that the binding is tied to details of the kernel APIs. I can rewrite
this description to be explicit about the cells instead of being in
terms of kernel APIs.

>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>   .../bindings/sound/audio-graph-card.txt       | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
>> index d5f6919a2d69..59bbd5b55b59 100644
>> --- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
>> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
>> @@ -32,6 +32,19 @@ Required properties:
>>   Optional properties:
>>   - pa-gpios: GPIO used to control external amplifier.
>>   
>> +- plls: A list of component pll settings that will be applied with
>> +      snd_soc_component_set_pll. Each entry is a phandle to the node of the
>> +      codec or cpu component, followed by the four arguments id, source,
>> +      frequency_in, frequency_out. Multiple entries can have the same phandle
>> +      so that several plls can be set in the same component.
> 
> Where do the values of id and source come from?
>

They are specific to each codec driver, and ultimately depend on the
hardware inside the codec. Compare with for example GPIO numbers being
specific to hardware. I didn't say that because the description refers
to the underlying kernel API, but if I update to not be in terms of an
API I'll also add some more info about the fields.

>> +
>> +- sysclks: A list of component sysclk settings that will be applied with
>> +      snd_soc_component_set_sysclk. Each entry is a phandle to the node of
>> +      the codec or cpu component, followed by the four arguments id, source,
>> +      frequency, direction. Direction is 0 if the clock is an input, 1 if it
>> +      is an output. Multiple entries can have the same phandle so that several
>> +      clocks can be set in the same component.
> 
> Are these really common properties? They seem kind of Cirrus specific
> and perhaps should be located in the codec node(s).
> 

I'm not sure what about this description makes you think it is Cirrus
specific. They are standard ALSA ASoC subsystem APIs. I can find them
used in drivers for Analog Devices, Dialog, Realtek and others, and this
binding could be used for an audio-graph-card driver using those codecs.

It is the ASoC machine driver (in this case audio-graph-card) that
handles this stuff so makes sense for them to be in its node, not the
codec driver. The ASoC structure is somewhat complex but in short the
codec driver provides an implementation for setting the hardware
registers but doesn't know about use-cases or other audio components, so
can't decide clocking. The "machine driver" sits above all the audio
drivers and has a view of the whole audio subsystem so can decide on
use-cases and clocking.

Having said that, we wouldn't need to do this if the kernel clock
framework could support clock controllers on I2C/SPI buses. But years
have gone by and nobody has managed to fix that yet.

>> +
>>   -----------------------
>>   Example: Single DAI case
>>   -----------------------
>> @@ -335,3 +348,34 @@ Example: Multi DAI with DPCM
>>   			};
>>   		};
>>   	};
>> +
>> +-----------------------
>> +Example: Set component sysclks and PLLs
>> +-----------------------
>> +
>> +	sound {
>> +		compatible = "audio-graph-card";
>> +
>> +		sysclks = <
>> +			&cs47l15 1 4 98304000 0
>> +			&cs47l15 8 4 147456000 0
>> +		>;
>> +		plls = <
>> +			&cs47l15 1 0 24576000 98304000
>> +		>;
>> +
>> +		dais = <&cpu_i2s_port>;
>> +	};
>> +
>> +	cs47l15: codec@0 {
>> +		...
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			cs47l15_aif1_port: port@0 {
>> +				reg = <0>;
>> +				cs47l15_aif1: endpoint {
>> +					remote-endpoint = <&cpu_i2s_endpoint>;
>> +				};
>> +			};
>> +	};
>> -- 
>> 2.20.1
>>
