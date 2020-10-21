Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E939294C27
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 14:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4AD1742;
	Wed, 21 Oct 2020 14:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4AD1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603281722;
	bh=+2yDPugTaTLuIxWRyOQM/rg5hTIBFV1anfNHgSk9cD4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aC7luxR5548q57YQVBJq1eduE+AVce8FvkTpwdYzpiN1fd9EjTutqcYf3f03d9wKF
	 Dsd+yXBh0XpG3qq4nYUTP7UbJLCJwsfa3YxT1+3Zj+G7tr8dabar3PLiiXd/8wtPXx
	 u3uAGbswmCd1Akm2BdlSrvYwLd8r6FqnifECH62E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DAA6F80272;
	Wed, 21 Oct 2020 14:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E793FF80272; Wed, 21 Oct 2020 14:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBBB4F80253
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 14:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBBB4F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SenAqoql"
Received: by mail-wm1-x341.google.com with SMTP id c77so1800594wmd.4
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2fJBIpEa92kQMJ5/9beWt+N555m7+v1D1vPnkJrcT60=;
 b=SenAqoqlLi2aW37fpwhuD9srFzhLzrEbBnol9BebPsYEEI+KDFkpx8T7/egwqBcrXA
 VKXMHj3+b41FIQ4eI7Myj0Na0a6bAyVKcAbDSlj32qMfgAeqpfHG++isqgO4Ii89gzJ4
 JdpTeaZZGUhg4QPD0sGFy9Z/DF5jWisVimMRkRKV/T6oPAt4/20N1owP7yvOCZriHz6X
 MlMQSoxh+Jwwv/iMBlIRdYWmeReU1RJKhiIFKPGCzvTcp2zrd+oHDfQmGvVCJFr7YPR+
 vQuoHN7O+rf4SXzK+HkSZwxDxt11IINm8k11O5XS/rsp4h9RtxIkDu8YGDJoy3daSq3j
 kHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2fJBIpEa92kQMJ5/9beWt+N555m7+v1D1vPnkJrcT60=;
 b=IZNmb8c6QsHrXoZI5siuAdrQnWdnsaWbLQw3kZgOPd1dMvimRWXi7HQ5/BGKmGFRR+
 8Rbht2cwjfQz8jz9VT+SkZ6asUcW/uyP2bm0r67+tHVP10+SvYjhx5KQu/JGYuF+cqXK
 731ydk6lrIv5mI5H5zafuNmcayTo4q0bBk16rODOnHJLJ98NnkLw7J0OcMsgUMSAYcae
 r3pislDhlxMiiH2Q6UGGPNp0O3MYGMrK70uS3ptiAByG71+gxH9egX7xl6BcI9KfD+2Y
 Y1sKN9SGnAJtJRQhYrrcQY5mB1aWM7beafo0QZpl+8vDC6IhZ85w0ktsghLpPNypd9rW
 Aw8w==
X-Gm-Message-State: AOAM5331Bxczg4UpISuB8NOd6g/Z43f2rMbGUw8esQGtXbmU3RPmg+l9
 /gHtc2euhVEELO8GEZld/wtcxQ==
X-Google-Smtp-Source: ABdhPJyBuNQJw//BB7VhJ/IyfJhB0D0zjEufDlMEYNH8dKwZxjKPNA+bODFYfmYhr9qj+l9595JgRg==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr3261018wmm.150.1603281657485; 
 Wed, 21 Oct 2020 05:00:57 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h16sm3896356wre.87.2020.10.21.05.00.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 05:00:56 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Cheng-yi Chiang <cychiang@chromium.org>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
Date: Wed, 21 Oct 2020 13:00:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
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



On 20/10/2020 19:54, Cheng-yi Chiang wrote:
>> Not with the compatible string!
>>
>> Currently card name, and long name are exactly same in all Qualcomm
>> soundcards, which makes it very difficult to identify how those boards
>> re wired up at UCM2 level. So the plan is to properly populate card long
>> name with "model" property which can include details on how things are
>> wiredup on that board.
>>
>> --srini
> Hi Srini,
> Thanks for taking a look.
> Let me try to clarify your comments in case there is any misunderstanding.
> 
> I understand your request on having different board variations using
> different sound card names through model property, and I totally agree
> with that.
> As for compatible strings, do you insist on having all the board
> variations using exactly the same compatible string ?


For example if we set below property for sound card in Device tree
model = "RB5";

We will end up with

#   cat /proc/asound/cards
  0 [RB5            ]: RB5 - RB5
                       RB5

This is totally not very useful w.r.t UCM2 and makes it very difficult 
to common up parts of the configs.


My suggestions are.
1. set card->driver_name to something more sensible in your sound card 
driver.

ex:
	card->driver_name = "SM8250";

2. set long name in model DT property and set it as card long name
ex:
in DT:
	model = "Qualcomm-RB5-WSA8815-Speakers-DMIC0";

in sound driver or common.c:

of_property_read_string_index(np, "model", 0, &card->long_name);

With this set:

now
#   cat /proc/asound/cards
  0 [QualcommRB5WSA8]: SM8250 - Qualcomm-RB5-WSA8815-Speakers-D
                       Qualcomm-RB5-WSA8815-Speakers-DMIC0

This also means that in UCM2 we can have a top level SM8250 directory 
which can contain other board variants something like:

ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf
ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8810-Speakers-DMIC123.conf
and so on!

Finally Only comment I had regarding compatible was not to encapsulate 
the connection details in it!. these can be made more sensible, 
something like
"qcom,sc7180-trogdor-v1", "qcom,sc7180-trogdor-v2".. and so on.

This compatible has nothing to do with driver or card short and long name.

Does that makes sense?


Thanks,
srini


with




Currently if
