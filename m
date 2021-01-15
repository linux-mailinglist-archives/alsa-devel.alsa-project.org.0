Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA32F8113
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 17:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48641816;
	Fri, 15 Jan 2021 17:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48641816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610729230;
	bh=68D9zHyjIVkkbp702BkV+iM+sCcfObPtwPdDLe3eyzo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rx4BeA0S1aDLRt2o7gZnCXpWMHyzT2lp0tOkrjeawzKamtpB/Cv8l7gr/pGIeeWoJ
	 fCMrges4QFbpFbCUm8erzCXZp1HoSnv6aAqHHviTEo7y23psIM82GQKlFpg5S2PPUz
	 bM6r3E1kq718TdnVukOg++WImXrNOEgz1n0g8QFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20CB5F80113;
	Fri, 15 Jan 2021 17:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE45DF801ED; Fri, 15 Jan 2021 17:45:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BIGNUM_EMAILS,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9AFEF80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 17:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9AFEF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SadbQpfF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FGc1c0009828; Fri, 15 Jan 2021 10:45:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=YDOCctuX9TnVbrIi0greBhKgSp79lDmbgwNekmKpaws=;
 b=SadbQpfFEIY8l/+DdisSFTfSn4/PSpjVFdSLYiAlekMtbfBENNaiQUfPnw3ua4yVL/K7
 WYyfJH/0Rd412+LVF20Mk0vXTsDCZeeUwP4zVL2LwS/IwwRJUuAZMVX63SWCMKxbjGDF
 Z3ccJ6eRSx4SN7BF52PNCIY7LXoXhhtmcHpBwlsnMpU0Tq3tRovWDwnePD8p37rkpCCY
 lAG+iSjGTFQYkI0mqtlfTNLT8ZMSpfjedc63U0fMdaIhPSkuDVcDDmcjXaOfS4DaFL8s
 nmdgGGtzbs4w4dn++Fk1Y4B8zbXr4r6Huvum3HGInoQ4xSgOLyh9BOYNe4W7tm9Azaaa Zg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36156kmyse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Jan 2021 10:45:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 15 Jan
 2021 16:15:22 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 15 Jan 2021 16:15:22 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.57])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4C5BC11CB;
 Fri, 15 Jan 2021 16:15:22 +0000 (UTC)
Subject: Re: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and
 sysclks properties
To: Mark Brown <broonie@kernel.org>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-3-rf@opensource.cirrus.com>
 <20210113152225.GA2334778@robh.at.kernel.org>
 <20210113160917.GF4641@sirena.org.uk>
 <ee3d0b75-dc2f-9994-19a4-a3c3f21a2c65@opensource.cirrus.com>
 <20210115131142.GA4384@sirena.org.uk>
 <1ec5e5f4-f672-2c60-23a5-9d985b943379@opensource.cirrus.com>
 <20210115152004.GD4384@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <d67f805f-2813-14e9-0c4f-5948ec73f7b0@opensource.cirrus.com>
Date: Fri, 15 Jan 2021 16:15:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115152004.GD4384@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150101
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 alsa-devel@alsa-project.org, f.fainelli@gmail.com,
 kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de
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

On 15/01/2021 15:20, Mark Brown wrote:
> On Fri, Jan 15, 2021 at 02:42:12PM +0000, Richard Fitzgerald wrote:
>> On 15/01/2021 13:11, Mark Brown wrote:
>>> On Fri, Jan 15, 2021 at 10:35:23AM +0000, Richard Fitzgerald wrote:
>>>> On 13/01/2021 16:09, Mark Brown wrote:
>>>>> On Wed, Jan 13, 2021 at 09:22:25AM -0600, Rob Herring wrote:
> 
>>>> some_codec {
>>>> 	pll: pll {
>>>> 		compatible = "fixed-clock";
>>>> 		clocks = <&audio_mclk>;
>>>> 		clock-frequency = <98304000>;
>>>> 	}
> 
>>> A PLL is not a fixed clock, why would you define a fixed clock here?
> 
>> It's a fixed clock if you are only setting one configuration. Call it
>> compatible="any-other-dummy-clock-type" if you like, it doesn't matter
>> what it is for the purposes of what I was describing.
> 
>> This isn't a clk driver for a pll, it's just a setting to be passed to
>> snd_soc_component_set_pll() using a clock binding to specify it.
> 
> So you're trying to describe a crystal on the board?  Why would this be
> a subnode of the CODEC then?  Surely it's just a standard fixed clock
> which provides some input to the CODEC in the same way you'd describe
> any other input to the CODEC.  The above doesn't look anything like the
> hardware.  But if that's what you're doing how is that related to
> configuring the FLL except possibly as the input clock you'd reference?
> 
>>> Are you confusing the selection of rates on existing clocks with the use
>>> of the assigned-* properties that the clock binding provides?
> 
>> I'm not at all sure what you and Rob have in mind here. Perhaps you
>> could give an example of what you are thinking the .dts would look like
>> to define some pll/sysclk settings for audio-graph-card to apply. An
>> example is worth a thousand emails.
> 
> As far as I can tell you are trying to configure the FLL in the CODEC,
> telling it to take an input clock and produce a fixed output clock rate
> from that.  The FLL is a fairly basic clock, there are examples for both
> that and choosing a configuration for a clock in the clock bindings.
> 
>>> That seems like a *very* surprising requirement - why would the clock
>>> binding have that requirement?  It would seem to create issues for a
>>> single device providing multiple clocks which should be a pretty common
>>> coase.
> 
>> You misunderstand me. What I'm saying is that to do this:
> 
>> 	sound {
>> 		clocks = <&pll>;
>> 	}
> 
>> The node 'pll' must correspond to a clock provider driver. It can't be
>> just a bare node with some properties pick-n-mixed from the clock
>> binding, like this:
> 
> I'm pretty sure I understand you perfectly; again, what makes you say
> that a description of a clock in the device tree has any requirement
> for a separate compatible string?
> 

If I do:
  	sound {
  		clocks = <&clock>;
  	};

	clock: clock {
		compatible = "fixed-clock";
		clock-frequency = <98304000>;
	};

I can clk_bulk_get_all().
But if I remove the 'compatible' from the clock node, clk_bulk_get_all()
will return -EPROBE_DEFER and log:

  /sound: Failed to get clk index: 0 ret: -517

from the error case in _clk_bulk_get() in clk/clk-bulk.c.

>> So the question I'm trying to ask is: when you and Rob said use
>> the clock binding, did you mean pointing to that binding from
>> clocks=<...>, or from a custom property like my audio-graph-card,plls
>> example above.
> 
> When we say to use the clock binding what we are saying is to use the
> actual clock bindings to describe the clocks, not make a custom binding
> that looks kind of like them - making a custom binding doesn't address
> the problem.
> 

But I don't know what you mean by "use the actual clock bindings to
describe the clocks".

What is not clear to me is how you want me to use a clock binding to
describe something that isn't a clk-framework clk. If you know what you
want, then please.. an example would help explain.
