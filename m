Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7965F385
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 19:10:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E20B11C31;
	Thu,  5 Jan 2023 19:10:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E20B11C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672942250;
	bh=cH7I8K9n1mPh2vJSYs6UTHZP6VRhETkKheYKIaIvimM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A/4dR4ShmbqehkbTkL8QowpTxca+THqoj8PShQRV7+IzWyDUaocOHFWQ7LcprKn2W
	 MVvYaGlQybyokilwMMdn1trSg1ZiEhRvpWo85YjfjkptUyqjvLjzwHMlb4chPjw/By
	 8hlQxQoYFopG2nC/1qIPICO/jdR4ujmZ9C2u4728=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6765AF80542;
	Thu,  5 Jan 2023 19:09:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAD78F8053D; Thu,  5 Jan 2023 19:09:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F810F8053A
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 19:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F810F8053A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BUgdp574
Received: by mail-wr1-x42b.google.com with SMTP id h16so36886696wrz.12
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 10:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aCNkMnPSRswrB4/cN/tNytIZs+wuZf7VPA/RAMeEvis=;
 b=BUgdp574Abl4d6f7mAU7ICKWQyO3CKfC1WalR3KSuX6qMylVBgHByF66a/g6HUBtTT
 M0kOyHyE+AMKAJa+TTNk08cczF6ITHY7X9oSXM729aCP5Z5sgaCxVPXsQOmqhtJVJ1Pu
 59KE00iEKTALzNVm9hZNxAWBnKdVWUYceEx48OaTukjFwMRF4F6jAP6z9QNol4Zgg0Dj
 YeoRl9IcNv6S/nPITHSQPTRhQ7E31zmKrDi8uBPlt+svHf14gkKn2ag61jrai3bWQ9WO
 ueLCGDsaBLAhJEwCb9JD0yFtciHOwtnT5GlwWp6CJN0TwEuFBZHrmxonPXg53suffGS2
 bbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCNkMnPSRswrB4/cN/tNytIZs+wuZf7VPA/RAMeEvis=;
 b=Tl4BMFKVf9O5VZnHwnrUIt971+gxYRLeWTY4/abnnUK6dcQfcHMi8bYzvlRRDMS1R/
 5LJ3BncvAVGcMtSUoeVRXMUyIpovKv4QUIJPe+HFa6pn1BVG1389vMtOLrertIU24lwD
 ERr3m01lF6hWgOBNkDVZYjvDHQAO7I/GaeOyqm2kL9ljzSqCvWTWQNVyIfjAiUKns/mA
 DLrvlAr6v0YHlTwflQhuERxhYSpQDO9HIcI9mSLVSeDPj/5i1JS7eKm12NzWWUxvEoLr
 LvXHQSyh9USs7KJtw2IN8zdDJfyFqbcEPRIUn6rODMHl6EN+snDypvJPQvlQuiW2qbxq
 ZYug==
X-Gm-Message-State: AFqh2kpnoAEezDz14B0gqxpm+venXUxwsQ2K2GQzOCZEj34sz0KDrWQK
 iplIWxq/nCHYILlh1ro6lZnHSA==
X-Google-Smtp-Source: AMrXdXuKJS4KYFfBIofRQW2C+0hVHSnszXj4FBaa7hFjC+VGRdw29Xt18QQAGVNmA1dTF+5JauVMlA==
X-Received: by 2002:a5d:58fa:0:b0:28e:46bc:3256 with SMTP id
 f26-20020a5d58fa000000b0028e46bc3256mr14579011wrd.8.1672942181384; 
 Thu, 05 Jan 2023 10:09:41 -0800 (PST)
Received: from [192.168.1.100] ([178.197.217.234])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12714459wrb.24.2023.01.05.10.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 10:09:40 -0800 (PST)
Message-ID: <afde9ca3-40e2-4332-fc8e-41a1176cd37e@linaro.org>
Date: Thu, 5 Jan 2023 19:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 14/14] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-15-quic_wcheng@quicinc.com>
 <f57d8d44-651e-b51d-dd72-bdf15801958f@linaro.org>
 <Y7RqEM+GvBQbmBTb@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y7RqEM+GvBQbmBTb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/01/2023 18:46, Mark Brown wrote:
> On Mon, Dec 26, 2022 at 01:27:21PM +0100, Krzysztof Kozlowski wrote:
>> On 24/12/2022 00:32, Wesley Cheng wrote:
> 
>>> +            link-name = "USB Playback";
>>> +            cpu {
>>> +                sound-dai = <&q6afedai USB_RX>;
> 
>> Hmm, that makes me wonder if you really tested the bindings before
>> sending? If yes, where is the USB_RX defined?
> 
> It was added in patch 2, it's in include/dt-bindings.

Thanks, indeed, I was looking for another bindings patch but this was
squashed with a driver.

Best regards,
Krzysztof

