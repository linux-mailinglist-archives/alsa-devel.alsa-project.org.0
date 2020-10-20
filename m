Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B03293F19
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 16:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CC61720;
	Tue, 20 Oct 2020 16:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CC61720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603205857;
	bh=+RVX4b8B9a0PTXNSim83hRWmrjf6URtR5fzGQj2Ddns=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPORVf2z2p/2Rb1jSW8oKKzSJtq+eL/OzgO+tSEnQPQGZoSBFDkJ03oKNce8S1qyo
	 6wmTDrZs51oCTQIftOVILeJviTxFupNo7dG4anlRTgjRZmsFBSTy9gN+UpHtydqdep
	 wlOzxbJSC5zwOFFA9QRHmG3VVuyyqUiyjKJfq7nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB435F80216;
	Tue, 20 Oct 2020 16:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1422F801F2; Tue, 20 Oct 2020 16:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E46A2F8010F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 16:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E46A2F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cK9G7+OH"
Received: by mail-wm1-x344.google.com with SMTP id a72so2106597wme.5
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uf/L+N0SXiT5GxWzSMpW76s8MjBMaRe3gnVIlCSIR5M=;
 b=cK9G7+OH/TUQCyR8rfJv0QoQ3SjEQsnF9XCjVN6xqr/O8yU3IlDfbvmsbTfkhxQ06f
 q4IpVZ8VlQ3fVXlWWHGSfLpylD2IH5P4NE25315km3BTplz4wROeM/cLeRnrZhnHb/v5
 PyAaPitLsRWmdVTipbLqX4Out+F21VmQJ/X09y763klLznhk8Wjph5Dm6ltToTwu1GKi
 6cF9SRXzSOe+CnDRgo2LkN4n5tkvfZ7EpQsA7EkHbGt3NkoE1mD/PmAfdxkXt8UbFE9X
 RN1mqjge119zJMoJpTqXMa+rN2apg4iQxVK+dpL4RLHKRIlCnNkTt3EAvl5wmXLl4Uz1
 eT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uf/L+N0SXiT5GxWzSMpW76s8MjBMaRe3gnVIlCSIR5M=;
 b=ZKTVmCjd1q/O81awJm36hwyfU6Gz4aQJmfRdPXD9G4LwRZ4Si2nkceSUB03iYES98i
 m2vyADZM5MxGtSpLm3652wpFLa4nern7eWcZxwa/7f2JExEhss1Woa3dQWa/EsGMBaHU
 HVompljNzfN9Oq+5onBz7ezin8h2wv2rcEt9wvqpw5Nw773L0wsBfLhB5sVD4HP4HjaH
 S915kmvO8R5PYboio/9hi+OJ/b/fgwbk5XxjtzsxM/BRaJew/+JYam5sFWS12+R/PWx3
 dNFWTZUg1FEg88GBmt2xVmF+FeWlDbJ1KsawvqEPIQuyZIXpMjOIM7+q0q31wy1pDPWw
 fbMw==
X-Gm-Message-State: AOAM531Cg86ohqaJJ7ayCxiQR43m5KRX0C1+BPbtVdygfziUSOh34e1n
 rcPD8MyWuAn08jMMwKPVm8eE8w==
X-Google-Smtp-Source: ABdhPJwZTIfXIjPLWWjL97y1NfJTXN0Y2s/to/X10G0kOS41vqvGeaVeSXPhf5OZA0t9DHJLkiPgNg==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr3351776wmj.88.1603205747699; 
 Tue, 20 Oct 2020 07:55:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 1sm3868599wre.61.2020.10.20.07.55.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 07:55:46 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>, Cheng-yi Chiang <cychiang@chromium.org>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
Date: Tue, 20 Oct 2020 15:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201020143711.GC9448@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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



On 20/10/2020 15:37, Mark Brown wrote:
> I don't understand what "logic scattered in various dtsi files" means,
> sorry.
> 
>> Yes, that should work to describe the dailink we are using.
>> But a more tricky issue is how to do calls like setting PLL in dai startup ops.
> ...
> 
>> I think that asking a generic machine driver to do configuration like
>> this with only a limited interface of device property
>> might be too much of an ask for the machine driver.
> Richard was looking at some basic configuration for PLLs.
> 
>> Would you mind if I simplify the compatible string like Srinivas
>> suggested, and send a v12?
>> As for other two kinds of variations that I am aware of:
>> 1. front mic / rear mic
>> 2. replace alc5682 with adau7002
> The CODEC change is going to be described in the DT no matter what -
> you'll have a reference to the CODEC node but it may make sense if
> there's enough custom code around it.  For front vs rear mic the
> simplest thing would just be to not mention which if this is a hardware
> fixed thing, otherwise a control.
> 
>> We can set different board names and different compatible strings to
>> achieve such variation.
>> So that it would make sense to describe configuration in compatible
>> strings like you suggested, and also provides UCM a way to distinguish
>> different boards.
> I don't recall having suggested distinguishing these things with a
> compatible string, especially not the microphones.  UCM can already use
> the display names for the boards to distinguish things.


Not with the compatible string!

Currently card name, and long name are exactly same in all Qualcomm 
soundcards, which makes it very difficult to identify how those boards 
re wired up at UCM2 level. So the plan is to properly populate card long 
name with "model" property which can include details on how things are 
wiredup on that board.

--srini
