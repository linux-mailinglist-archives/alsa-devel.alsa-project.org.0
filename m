Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED64830BD
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 12:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74EA5177B;
	Mon,  3 Jan 2022 12:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74EA5177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641210590;
	bh=ikXXSRRJjt7ik+6iXsSwhUED8md3a1d44Q/nNePUVio=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqWl0a5ts0tej53gfCYAXbxMOLgxMTYDKFYT5dkbLXeboOmW51u2nQJmOJBZ/3nOJ
	 kejgRkP9eH7RbzcgxD7sVcAjPK3Fb0XOx5a5d9P7p4qtFwUutdrnQx0MtRLBqjttp4
	 +Lzpv5tgJUfkOrLAbauya1g69fGPEGfk0Y78V8/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2ED0F8013F;
	Mon,  3 Jan 2022 12:48:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA47EF80107; Mon,  3 Jan 2022 12:48:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47641F800C8
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 12:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47641F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="tQ8Pkp53"
Received: by mail-wr1-x42e.google.com with SMTP id o3so11200726wrh.10
 for <alsa-devel@alsa-project.org>; Mon, 03 Jan 2022 03:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BwVJFEIXJAs7cfXLTAc4v3VJtoIKYaXcasII/IPNDnA=;
 b=tQ8Pkp53R4ay08iKYAuUNUob8te8wxOiHuXxCjh9te4mjHXBD9UQp7cT0dfz3cosTc
 /8ZUBTaSgN2txppOGh6/+S3O2LHmvJqOjp9vR/k5MqFye9PNMrOf7qZUQBvZc+lH/gUw
 xrnAHNW3ioeJaQzlElLfJZu3YbIZN/ziaWFozkH/oTf8J+aQotXBhfPrDji4+SVuUd2r
 dsKp3txVKL97wU+NKW1XQoyBHSLiz/AEr9KfleHe5YBmXwh8nEyt4vcUVq04HNVF7IW/
 GzBoB4H16VSVdaoWUylEDkK7sQomC7YVyAfFGBWZ6pc/D1eDkZoBWVUJf/IQxxSYpAYN
 RWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BwVJFEIXJAs7cfXLTAc4v3VJtoIKYaXcasII/IPNDnA=;
 b=QEydAK7kdIPrfR8RFgFs2OsnyEXkJzy9bzzj0Q04wETHTVsoL+0IREJB0aK2kaSTbA
 jVLLHvZA9SxPzrIUBdeQah2o0FqOIZKYQgcWeQkDJIkmGNePL8wtfAi+QM6kfqOzI1gD
 uG68Ff5u5M1x2mQ5TqE3Pd9OKT+C33kJ63TD1M2J55KytJeDEDjoafio52XSkhAxhj3K
 LOmCgVFxLRPJyV/u9oy+HPjhIr+9zgCmdFMx55F2mc4BKHwG1KUjzsSBXKWPv//TMb1h
 AECr64uKHUz+0fqsDkzqhylhqPBT1tB8wAURa2GUipKUyQHtXb0W7P6ykedAxvRow/tX
 LoZg==
X-Gm-Message-State: AOAM532+LHtqMaU3tAz94L1Hg0/OycMxC5IHkYv1qc8cyNzmWZQRZMqY
 BJRdvCpbTYio2/GjGL/1+OCVRg==
X-Google-Smtp-Source: ABdhPJw7OwfN6X7S9i007ce/9msto/eRkbkgogLSdqKQSZJPOjh+OhOqu6pcu0mZNBgUNP295XhNYQ==
X-Received: by 2002:adf:f94e:: with SMTP id q14mr14845546wrr.526.1641210512248; 
 Mon, 03 Jan 2022 03:48:32 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id s189sm46137699wme.0.2022.01.03.03.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:48:31 -0800 (PST)
Subject: Re: [PATCH 1/3] dt-bindings: display: meson-dw-hdmi: add missing
 sound-name-prefix property
From: Neil Armstrong <narmstrong@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
 <20211223122434.39378-2-alexander.stein@mailbox.org>
 <c4d5d774-6d9a-410d-b651-e452894e99eb@baylibre.com>
Organization: Baylibre
Message-ID: <8009fd8a-f872-f5e8-c13e-f4717ac9e12c@baylibre.com>
Date: Mon, 3 Jan 2022 12:48:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c4d5d774-6d9a-410d-b651-e452894e99eb@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org
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

On 03/01/2022 12:32, Neil Armstrong wrote:
> On 23/12/2021 13:24, Alexander Stein wrote:
>> This is used in meson-gx and meson-g12. Add the property to the binding.
>> This fixes the dtschema warning:
>> hdmi-tx@c883a000: 'sound-name-prefix' does not match any of the
>> regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
>> ---
>>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> index cf5a208f2f10..343598c9f473 100644
>> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> @@ -10,6 +10,9 @@ title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
>>  maintainers:
>>    - Neil Armstrong <narmstrong@baylibre.com>
>>  
>> +allOf:
>> +  - $ref: /schemas/sound/name-prefix.yaml#
>> +
>>  description: |
>>    The Amlogic Meson Synopsys Designware Integration is composed of
>>    - A Synopsys DesignWare HDMI Controller IP
>> @@ -99,6 +102,8 @@ properties:
>>    "#sound-dai-cells":
>>      const: 0
>>  
>> +  sound-name-prefix: true
>> +
>>  required:
>>    - compatible
>>    - reg
>>
> 
> Fixes: 376bf52deef5 ("dt-bindings: display: amlogic, meson-dw-hdmi: convert to yaml")
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 

Applied to drm-misc-fixes

Thanks,
Neil
