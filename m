Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E8295C85
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 12:14:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6A117CC;
	Thu, 22 Oct 2020 12:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6A117CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603361677;
	bh=cnXLdqzAS+P8tgCKypEPdz461PiPoyfnsA6erLXbFBs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGDqSodfGco/yNTvh5+VOoSopqsqdc6fi2/69IpsWvYuyH73Iod7tCQYIG0Vmcl2E
	 ZvTKb2s71hbIUfTh55n012rB2TZ5XRbbIg3iI3w818xBnuYKxWlEDnDHKwH5tFuz2i
	 2YUtrLFOC7+gFX4cHSc/WO34MzR9S5DBbmsM6jdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD06CF804AA;
	Thu, 22 Oct 2020 12:13:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9990F804A9; Thu, 22 Oct 2020 12:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54C3EF800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 12:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C3EF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FHx9aWm9"
Received: by mail-wr1-x442.google.com with SMTP id n6so1493827wrm.13
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 03:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AVYqBwFNeS8pknHZcG1tJcoDoQAS4sJ1OEwl1v423e8=;
 b=FHx9aWm9FktJEtNY/lWrc3MGLVVQTVRPkaKpE/BrIvI65HE1/l83fZFIYH41tRBW5/
 HKpKCopsEU3q8T3e3RTCblClXa64BkmrSnDKUmEoPNCVOcIgrYGplAj9LWAKZ+88ul3F
 lShjw/BQ54t6I7EfHNGaZ+p78XcoqGFpJD0s1hDHX1X/G8PgJdwsSPIC6OZyB6i5yCqL
 gdjFYC4gh/xNnO8/pYQEZW78XHILWr7IPoR8M97YTNxfst2lz5YZ+orcSJCZTZA7XUgH
 eyA+LqsmkQUZMZWg3e26x9FmT7iYAi3exYSCwVAw2BYim7sgprHx7allxCYqNPMTgCdF
 vp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AVYqBwFNeS8pknHZcG1tJcoDoQAS4sJ1OEwl1v423e8=;
 b=QZpnb6isasHoF/fqfjyrNbQa96sHXSK+vnzaTM0lUptI3pz1ZX9obA7rODlv22V+Us
 +hfcoLL8gJcr9arP7cY7EZu7/ysAOX019M6ThmLYUztKp+0OIGuk/XHFsyu7FxZdsXRv
 yNLdnQiNmHxaSBOp6g5HeNiYuW7MJGp/RgDOxpUsumbyByJ4wGnVQneiTqGofL0Iy0jT
 fmlysPHyliZLhRvX82LAuWeZ8/KABf1XGCufs0DqJl5+NxgMMZh+UYKz1YMpcvwhkw8H
 2AFPqA7510jQcq7+FgqQ/jVMJT0d6Y5hPB775GgwIeb/Km+d1Phltrcq6TW8iTYNB/Xu
 NS3Q==
X-Gm-Message-State: AOAM531HFNVyOhO5yZTcQtjmuUg3mcCTYJsbty0CUZubjsXVCBQpKK+C
 BfTvyl8Qf13esjF+oAmIyF/vBA==
X-Google-Smtp-Source: ABdhPJynoIRUVGmbBNtiBqCFMZFtDduY5X7CJApEBX+q08WHFZubdBFJCCYOFMWx5UVgG0TeQNEdlA==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr1777892wro.381.1603361574107; 
 Thu, 22 Oct 2020 03:12:54 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j13sm2935385wru.86.2020.10.22.03.12.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2020 03:12:53 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
 <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
 <20201021123913.GD4497@sirena.org.uk>
 <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <14e7db29-4825-6e9d-22a0-5121bb7006e2@linaro.org>
Date: Thu, 22 Oct 2020 11:12:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Cheng-yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
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



On 22/10/2020 04:29, Tzung-Bi Shih wrote:
> Hi, sorry for jumping into your discussion but I am trying to
> summarize them to make sure we are on the same page.  Pardon me to
> manually copy-and-paste partial sentences to quote.
> 
> ACK:
> - Don't expose DAI connections in compatible strings.
> - Use "model" DT property to make the card more UCM2-friendly.
> - Expose new DT properties to distinguish different DMIC models.
> 
> NACK:
> - All the board variations using exactly the same compatible string.
> => This is less realistic.  Although the CODECS information can be
> retrieved from DT, it is inevitable to have some custom code for each
> CODEC.
> 
> Per Mark's words:
>> a different CODEC is something that often justifies a separate compatible
> I think we should use different compatible strings for new CODECS
> combinations.  And we should try to reuse the machine driver if they
> share the most code.  In the worst case, introduce a new machine
> driver for the new CODECS combinations.
> 
> - Srinivas's suggestion to set driver_name.
> e.g. card->driver_name = "SM8250";
> => This sounds like a new DT property should be parsed in
> sound/soc/qcom/common.c.  For example: "qcom,family"?  But as we do
> less care about UCM2 for now, I would prefer to just leave it as is.
> 
No, you can just hardcode this driver_name in your machine driver rather 
than getting it from DT, this is how everyone does!.
So need of adding anything to common.c

The thing that I suggested to add to common.c is setting card->long_name 
from "model" property.

> 
> I would expect the following variants in DTS (just for example):
> 
> sound {
>    compatible = "qcom,sc7180-trogdor";
Make sure that vendor name is correct here, am not sure if trogdor is 
qcom board or Google own board!

>    model = "sc7180-rt5682-max98357a-1mic";
> }
> 
> sound {
>    compatible = "qcom,sc7180-trogdor";
>    model = "sc7180-rt5682-max98357a-2mic";
>    dmic-gpio = ...
> }
> 
> sound {
>    compatible = "qcom,sc7180-pompom";
>    model = "sc7180-adau7002-max98357a";
> }
> 
> 
> Please correct me if there is any misunderstanding.

Looks good to me!
thanks for doing this!

--srini
> 
