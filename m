Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C772D7671
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 14:24:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEE5C1616;
	Tue, 15 Oct 2019 14:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEE5C1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571142285;
	bh=tYAHwHns6ZfN3dC+AkjnhQfMDtabE4ctUg+BMPVNtZg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y3UJVtFrNAek2tHpmiNujC640Xn1Msg/AgUI0NQMqljnmw4qCo5o2npHU5cpiehDv
	 ArYwthtph0rHp83h/+QfmNGJMqJ5OxjHA6Pr2uz1KbYZAqvMTvzpo+dn6OZ+2s+cpV
	 iLQ/8ez2SYtKjK8MwQxQ0KR0vTNM3yYPDfgyiCEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2109FF804A9;
	Tue, 15 Oct 2019 14:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56613F804AA; Tue, 15 Oct 2019 14:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF66FF80323
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 14:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF66FF80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ha9SgCIw"
Received: by mail-wr1-x443.google.com with SMTP id b9so23632248wrs.0
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bDfGVQjLwucspFf3MSlUAeaaGSMNhHbSYDBFpj+ymqQ=;
 b=ha9SgCIwrZh2MxtJXScwcMKk6Va0RXRm1tLKRoE4JY6yiwQgEzIbYwWG0rpoD+tORx
 jRKFisDpTw3E6Eht/caO/XXZotqXmx/Hp1Gvebglm16WMWdgb5gTyc+qZICe7KHXMy67
 g6/p1arXdEU83/5CuMLwO9Ua3JeFtoGFaziC2CCKVbWEszTcBVKl0W5GnC6J6D4yl39J
 PUKNGXJIlTuxS26cNZmhEBNsd26Ektr83Arl/THp2M/Xf+KJNWKCiqBMmBZ8DhPOQAhU
 BUfGekft5l5pXkNomIK9cN6WGOJa9T4Kp1juWhgDM7PGdwcbZ6g0o4SoPrjwsxXDq8DI
 byiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bDfGVQjLwucspFf3MSlUAeaaGSMNhHbSYDBFpj+ymqQ=;
 b=Z4jg+dgf5Y3KkTZb5P+GMgtmp/WGfjQJmc3vvLYViq17GU7elAQoA+G/2P/WDCtR7+
 7dlrnKKZd6rUtILklhDq0ZmnQGQpcvZnbGsJlueH6IDz+mgp4XgFSvXpqK7FvhiqI6S3
 Nwb7xyp+9I7HISODcHxZOOTbSwg7as18yer2gKWOTBf7oKd/0cM3OGClrtw+BOOavfNV
 OhpxpieudF/V52QP7cuayGCJBDrrd0IOj6Vor9NxjjMR2PmFY2uH4nqKTFzX2uyxbhHT
 y1InmXLwT8JVRxmfRTZ9VLnDOw3uqYuXzYjOPhP2H0T6tWQGUY+vhZ/+YqoRwtBCoNa0
 HFuw==
X-Gm-Message-State: APjAAAWJot+NTGENbRwXmCz3apoMco1pfoL3pDAFOqE7gEioerjYTzdo
 4gZw/mb1WCze+unfe4BpyNPZrA==
X-Google-Smtp-Source: APXvYqw0QWG1LAvYnp2xS0NK5ksIEqdxTKAD+EuCuDvTOJZxyO2DJb/fvjjDXQBy9kl6PqYPyaH4mQ==
X-Received: by 2002:adf:fad2:: with SMTP id a18mr4206443wrs.279.1571142174186; 
 Tue, 15 Oct 2019 05:22:54 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id e18sm30040325wrv.63.2019.10.15.05.22.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 05:22:53 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-2-srinivas.kandagatla@linaro.org>
 <20191014171241.GA24989@bogus>
 <76be1a0d-43ea-44c3-ef6c-9f9a2025c7a2@linaro.org>
 <CAL_Jsq+ZBhh2A3yLtOyReHHAET_bvM-ygBtRXeFihAxf0jvDKQ@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f7977140-c103-7d0d-9523-2212e1029598@linaro.org>
Date: Tue, 15 Oct 2019 13:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+ZBhh2A3yLtOyReHHAET_bvM-ygBtRXeFihAxf0jvDKQ@mail.gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 spapothi@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 1/2] dt-bindings: soundwire: add
 bindings for Qcom controller
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 15/10/2019 12:35, Rob Herring wrote:
> On Mon, Oct 14, 2019 at 12:34 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> Thanks Rob for taking time to review,
>>
>> On 14/10/2019 18:12, Rob Herring wrote:
>>> On Fri, Oct 11, 2019 at 04:44:22PM +0100, Srinivas Kandagatla wrote:
>>>> This patch adds bindings for Qualcomm soundwire controller.
>>>>
>>>> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
>>>> either integrated as part of WCD audio codecs via slimbus or
>>>> as part of SOC I/O.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    .../bindings/soundwire/qcom,sdw.txt           | 167 ++++++++++++++++++
>>>>    1 file changed, 167 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>>>
>>> Next time, do a DT schema.
>>>
>> Sure! I can do that in next version!
> 
> I meant the next binding you write, not v4. However, ...
> 
> [...]
> 
>>>> += SoundWire devices
>>>> +Each subnode of the bus represents SoundWire device attached to it.
>>>> +The properties of these nodes are defined by the individual bindings.
>>>
>>> Is there some sort of addressing that needs to be defined?
>>>
>> Thanks, Looks like I missed that here.
>>
>> it should be something like this,
>>
>> #address-cells = <2>;
>> #size-cells = <0>;
>>
>> Will add the in next version.
> 
> You need a common soundwire binding for this. You also need to define
> the format of 'reg' and unit addresses. And it needs to be a schema.
> So perhaps this binding too should be.

We already have a common SoundWire bindings in mainline for this

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml?h=v5.4-rc3

Should this binding just make a reference to it instead of duplicating 
this same info here?

--srini


> 
> Rob
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
