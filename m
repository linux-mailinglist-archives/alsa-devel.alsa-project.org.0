Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D972D48EA35
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 13:57:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 598B91AC8;
	Fri, 14 Jan 2022 13:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 598B91AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642165053;
	bh=YWPfUO/kufq5CuBm+VoYcrVjBp3OReouMpYCOM9mVQM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RkwtK8ORfI7Zo386eBDQymLHroUcKnTdNB+IDTj0HG8NA3NhwMg47YZgwTSktQPWb
	 mTDtpSbYOyBMZO3jqj9+Q/L1G2tAo7S8eDI/twG45Ug06TAax2RLqQ+18gd9Ys5slZ
	 SoNJ8qjH18t63rUX2kF5Cn8V/CPwXTFJbNHGUnEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CADDF80310;
	Fri, 14 Jan 2022 13:56:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 955E2F8030F; Fri, 14 Jan 2022 13:56:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC72F800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 13:56:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC72F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fb5npDbI"
Received: by mail-wr1-x434.google.com with SMTP id o3so15434677wrh.10
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 04:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d3ibwPAPVt4HA/SbrQ1xEvUJPH+rbcSyYMnJxKURgvY=;
 b=fb5npDbIVbXCAmGa3aSg1k8zmuohBbb7KypbIegherNH93fveoZq8HcfrgdsuNvXz8
 CDw9aC3OJl/FCnBGvwgMykySe9jqF3hjX6uVUTPOGTork74gr4LptbeOXg08D4FANiN4
 m8uPEJXzq0ezfHyXFI8iPMWd6idfe7hf+JY5QpD66LC7d0MXsfE9Ghd81R/poIn9XgZa
 aZ+6o7lhptWt3VmwrOFdjmES0DdKYFnKYEFl7Y2Pbve5Qp/2x9SlYO4Y1AM7Ejq6Mgvg
 hzG7CLkkWKgGMP6j+arp8RUt0N9V2cVDdsz3waJaB/vNQgiuNQ/ZWDdROzQuPi0Ykuxa
 0+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d3ibwPAPVt4HA/SbrQ1xEvUJPH+rbcSyYMnJxKURgvY=;
 b=GABmneCV1x6G95X1gYqr8p2RXslDm4MeTgRfyDTzZ5fzBDSkzIeTiLaP5tJ9NhHDcp
 tZDKh6TZa5RougVP4+SKEipK3H0Q7PldvfYCKSfy8R4Jgb4q3N7hg1ME43+8nnCkjRAN
 AaSj/dGH+KyF16X10jTSAW33bayZmAOK2HFxOBshp2MD4T/78W6h6N7QlxT4pEARQTTZ
 fJimEBUdSCzNIbj2IUedRTYM98A6p4KS7dVPsnZlz86peTFgbNHT6paVPPBKgqOz+N/b
 KJvUy85c7O/eLU0MgTokc5ApzWwx/RzP7tnSHXx6WLVebV4014TPBS90m3GCZBzSJwPJ
 W2YA==
X-Gm-Message-State: AOAM532xLjRfcvVcD6/Qbr189WI3RjT9MYKqGXizkSgik5Es9Wa2rygS
 p0yW/SVgIyd96oqJLnJbuyc=
X-Google-Smtp-Source: ABdhPJxo8QEjs5Q0X+ZWAwcHSYac8AQTrcqIp/pFDeME41NkNSzQHoy2PCkOg4lwKdONf8ZqSIFXjA==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr8741857wrz.520.1642164973553; 
 Fri, 14 Jan 2022 04:56:13 -0800 (PST)
Received: from [192.168.0.22] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id g15sm5358083wrm.2.2022.01.14.04.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 04:56:13 -0800 (PST)
Message-ID: <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
Date: Fri, 14 Jan 2022 13:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, YC Hung <yc.hung@mediatek.com>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, cezary.rojewski@intel.com, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org
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



On 12/01/2022 02:43, Rob Herring wrote:
> On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
>> From: "YC Hung" <yc.hung@mediatek.com>
>>
>> This patch adds mt8195 dsp document. The dsp is used for Sound Open
>> Firmware driver node. It includes registers,  clocks, memory regions,
>> and mailbox for dsp.
>>
>> Signed-off-by: yc.hung <yc.hung@mediatek.com>
>> ---
>> Changes since v3:
>>    Fix patch v3 error : v3 only provide difference between v3 and v2.
>>
>> Changes since v2:
>>    Remove useless watchdog interrupt.
>>    Add commit message more detail description.
>>
>> Changes since v1:
>>    Rename yaml file name as mediatek,mt8195-dsp.yaml
>>    Refine descriptions for mailbox, memory-region and drop unused labels
>>    in examples.
>> ---
>>   .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105 ++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Rob, it seems we don't have a maintainer for this bindings. Shall I as MediaTek 
SoC maintainer take them through my branch?

Regards,
Matthias
