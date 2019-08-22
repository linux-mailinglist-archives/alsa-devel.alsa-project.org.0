Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9D9945A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 14:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 415DB1692;
	Thu, 22 Aug 2019 14:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 415DB1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566478678;
	bh=grcJgJT1zGKd4GnQKX81FoPBL2S5Y9Lt1Y0JFzTdXKU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAYFKcIKXmeRC5mmjQvB1eLDk2jGlQr5XtXzrX3kwyKYWDW9Mupm8w9WLq2xMYSF6
	 nbG1JQDcg18eB6kShE2fg/lm1QRfwAVEwGyeX2UtVQ+WZ1JFO6ezpYmjI3ip8DLAun
	 2QTEOzwb+owBjqlgpCFl66YcO3btpQ1ugxKtHeoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E22A7F8036E;
	Thu, 22 Aug 2019 14:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FA84F8036E; Thu, 22 Aug 2019 14:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00EE4F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 14:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00EE4F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R8OJYPLb"
Received: by mail-wm1-x342.google.com with SMTP id c5so5472288wmb.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rpeKMI/tE6EFW9ANRr1XQ8WE1RGHTA5DL7LclXp1bOU=;
 b=R8OJYPLbiX6PDGAA9Foc4n9BE7hvuMj/LM+laL12+iN3ynxmIPecnk/ZitUnc4yJf3
 x3yeNl4JORj5UUgHXKdgISraJTxl7BWjt7qbqq56euafptc6q109RcFVVow+/WV/JGBb
 vl35AkKxY6R67atF/v4/srrrPrl+H8+oRxfw5grLYXqeGWq467d8+zPk5VMoOzjrwvT8
 doeHMm1kiNrQ0RhCgFTuTbPYwJUOnxnxUCgWv5xoA6lpt74ZG+CYavhEg/iUSqPPcKqE
 vkNtC6asp5ZSmnB9oh+ftJS977O0MXa1MXoCVMt/sv/xu5t3l7D4zcIJfpGPZXBsJntW
 IeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rpeKMI/tE6EFW9ANRr1XQ8WE1RGHTA5DL7LclXp1bOU=;
 b=nnJQNxvHVnVsifeuOLIa3BgZcu3v2cesgogQFVbWgvoFiPsjyaOnKRisJnM0U0WoE+
 +VYrHqLRHX7IK4vBxslVa8Tv7JRSQ7As9R/7MGZ5GCgMhjn6xXrIC/wZwp3o2ti3LeHv
 tF8IyEWUmTQQ/7/KCZcXzuZGWzCf/24/B791/PPrwP8oziy3Q7i4VSDn+7pncKdDPmhD
 jwtaSSXM2NoS5R5Q5hNToPEN+mieOQsehg4NR8KCjbifV5YRvN/+OnAGGUvLH5V3wxCD
 fuSP2RXi6cNqjOojJN71kfHxYTw8TyiqQ3WrlEUyp4XI8OcoP5bqPwTkodGq9tXFvI9s
 K/7Q==
X-Gm-Message-State: APjAAAWtLrDCnZ0s1EwY1Fzegi8bIlHrZW63d04GKLd3p4P47cdXvy8R
 Y37f58B+eh2YdiKuPlizfp/5kKtHHQM=
X-Google-Smtp-Source: APXvYqyO6aZlnWxHGBHK5szK1yStlylHBnKn6CHrS70h7pgw6i72AhORzAUhgOXoWe69T5EmcC2/uw==
X-Received: by 2002:a1c:a481:: with SMTP id n123mr5795028wme.123.1566478567074; 
 Thu, 22 Aug 2019 05:56:07 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t19sm5419487wmi.29.2019.08.22.05.56.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 05:56:06 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
 <20190821214436.GA13936@bogus>
 <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
 <CAL_JsqJJCJB9obR_Jn3hmn4gq+RQjY-8M+xkdYA185Uaw0MHcw@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <90b9fa33-3a49-c414-4352-66e26673a05d@linaro.org>
Date: Thu, 22 Aug 2019 13:56:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJJCJB9obR_Jn3hmn4gq+RQjY-8M+xkdYA185Uaw0MHcw@mail.gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 1/4] dt-bindings: soundwire: add slave
	bindings
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



On 22/08/2019 13:36, Rob Herring wrote:
>>>> +soundwire@c2d0000 {
>>>> +    compatible = "qcom,soundwire-v1.5.0"
>>>> +    reg = <0x0c2d0000 0x2000>;
>>>> +
>>>> +    spkr_left:wsa8810-left{
>>>> +            compatible = "sdw0110217201000";
>>>> +            ...
>>>> +    };
>>>> +
>>>> +    spkr_right:wsa8810-right{
>>>> +            compatible = "sdw0120217201000";
>>> The normal way to distinguish instances is with 'reg'. So I think you
>>> need 'reg' with Instance ID moved there at least. Just guessing, but
>>> perhaps Link ID, too? And for 2 different classes of device is that
>>> enough?
>> In previous bindings (https://lists.gt.net/linux/kernel/3403276  ) we
>> did have instance-id as different property, however Pierre had some good
>> suggestion to make it align with _ADR encoding as per MIPI DisCo spec.
>>
>> Do you still think that we should split the instance id to reg property?
> Assuming you could have more than 1 of the same device on the bus,
> then you need some way to distinguish them and the way that's done for
> DT is unit-address/reg. And compatible strings should be constant for
> each instance.
That is a good point!
Okay that makes more sense keep compatible string constant.
Class ID would be constant for given functionality that the driver will 
provide.

So we will end up with some thing like this:

soundwire@c2d0000 {
	compatible = "qcom,soundwire-v1.5.0"
	reg = <0x0c2d0000 0x2000>;	
         #address-cells = <1>;
         #size-cells = <0>;

	spkr_left:skpr@1{
		compatible = "sdw10217201000";
		reg = <0x1>
		sdw-link-id = <0>;
		...
	};

	spkr_right:spkr@2{
		compatible = "sdw10217201000";
		reg = <0x2>
		sdw-link-id = <0>;
	};
};

I will spin this in next version!

Thanks,
srini

> 
> Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
