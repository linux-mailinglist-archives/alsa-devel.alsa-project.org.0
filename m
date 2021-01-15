Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34FC2F7E6F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 15:44:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FEDA17CA;
	Fri, 15 Jan 2021 15:43:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FEDA17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610721841;
	bh=hWbZrUgTdVNee5+seHx4zaoH96K24XXYV0S03eoCgc8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7IaJw5AYZG11cGRtOI/JUUbKFBWEzqTStFrVL72T6fFVsLJHl5GZ5HPO5d2aqyYF
	 kfRfSV8b2GT1IgWJeEef1/WQZGTaG5AkEcLOdWi29H8Juxu44IIDcdjeg0b54wke7B
	 W7yAeC9q0KSKQCS1SgZcQAapzWCJrwJIXI+EWB8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9613F80254;
	Fri, 15 Jan 2021 15:42:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF07CF801ED; Fri, 15 Jan 2021 15:42:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BIGNUM_EMAILS,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D8BF80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 15:42:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D8BF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bf5scJoM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FEb3p7015653; Fri, 15 Jan 2021 08:42:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=UCqd0nfi3jYn7t3HzDEdBbfO8As7XK0/wje7LItu+eA=;
 b=bf5scJoMYYE1dZUmw8hy4+691YTAfgtufVNSav9wxrPxxPqZoZ524rVHyPL25fh39eMT
 5CKpDc0Qr+MgzlqjVGnYH5ZJhAL8jffASqFQXa3MbxVhXIBqVs+T3pT3T9T5+o5Rr0d4
 AEQKr3pt59eveMg4kI+pFywT3W9kaMwPEmYL5VYrJhhVPGV9eeydUSWFJtJEPgvu+9EF
 dI0PtAiYYKjSCGB4rlgzuM1nBrPrYnwCUKUGjugBAy/njN/kaRb4mqAQJW7tNFHSYdx0
 J0dRrPJvMqsAZBgxLIFWFLUop/2R/aagCQZ5fMU3LYLI7mz9YMXhodIYZh4DUJjUml32 UA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36156kmu1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Jan 2021 08:42:16 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 15 Jan
 2021 14:42:13 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 15 Jan 2021 14:42:13 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.57])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DD0A45;
 Fri, 15 Jan 2021 14:42:13 +0000 (UTC)
Subject: Re: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and
 sysclks properties
To: Mark Brown <broonie@kernel.org>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-3-rf@opensource.cirrus.com>
 <20210113152225.GA2334778@robh.at.kernel.org>
 <20210113160917.GF4641@sirena.org.uk>
 <ee3d0b75-dc2f-9994-19a4-a3c3f21a2c65@opensource.cirrus.com>
 <20210115131142.GA4384@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <1ec5e5f4-f672-2c60-23a5-9d985b943379@opensource.cirrus.com>
Date: Fri, 15 Jan 2021 14:42:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115131142.GA4384@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150092
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

On 15/01/2021 13:11, Mark Brown wrote:
> On Fri, Jan 15, 2021 at 10:35:23AM +0000, Richard Fitzgerald wrote:
>> On 13/01/2021 16:09, Mark Brown wrote:
>>> On Wed, Jan 13, 2021 at 09:22:25AM -0600, Rob Herring wrote:
> 
>> some_codec {
>> 	pll: pll {
>> 		compatible = "fixed-clock";
>> 		clocks = <&audio_mclk>;
>> 		clock-frequency = <98304000>;
>> 	}
> 
> A PLL is not a fixed clock, why would you define a fixed clock here?

It's a fixed clock if you are only setting one configuration. Call it
compatible="any-other-dummy-clock-type" if you like, it doesn't matter
what it is for the purposes of what I was describing.

This isn't a clk driver for a pll, it's just a setting to be passed to
snd_soc_component_set_pll() using a clock binding to specify it.

> Are you confusing the selection of rates on existing clocks with the use
> of the assigned-* properties that the clock binding provides?
> 

I'm not at all sure what you and Rob have in mind here. Perhaps you
could give an example of what you are thinking the .dts would look like
to define some pll/sysclk settings for audio-graph-card to apply. An
example is worth a thousand emails.

>> For this to work the clock binding must be a real clock object (so needs
>> a valid compatible=). But I need to somehow specify the PLL ID and
> 
> That seems like a *very* surprising requirement - why would the clock
> binding have that requirement?  It would seem to create issues for a
> single device providing multiple clocks which should be a pretty common
> coase.
> 

You misunderstand me. What I'm saying is that to do this:

	sound {
		clocks = <&pll>;
	}

The node 'pll' must correspond to a clock provider driver. It can't be
just a bare node with some properties pick-n-mixed from the clock
binding, like this:

	pll1 : pll1 {
		clock-frequency = <98304000>;
	};

which doesn't define a compatible= to match it to a clk driver. An
attempt to bulk_get the machine driver clocks here will fail.

To use a bare node with pick-n-mixed useful clock binding properties,
that doesn't represent a real clk provider driver, it would have to be
pointed to by a custom property that is not treated as a clk framework
object, e.g.:

	sound {
		audio-graph-card,plls = <&pll>;
	}

In this case pll is a node parsed by audio-graph-card that just happens
to use properties from the clock binding.

So the question I'm trying to ask is: when you and Rob said use
the clock binding, did you mean pointing to that binding from
clocks=<...>, or from a custom property like my audio-graph-card,plls
example above.
