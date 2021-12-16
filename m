Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05410476856
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 03:53:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874A41838;
	Thu, 16 Dec 2021 03:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874A41838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639623212;
	bh=sGm5QFKkbyo+f7gSqrV08/i/3Lfvst7G8QwRPmRgTiQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PhVIC8cR4L21XrlbIM0le1ole+kQLD4x0+MyGWJjsIyl/VI3EhbDTtd/uNCcgVysa
	 z1zPcW51vtlp5H/UkvKQWzTCOXL0OOJlDqsZZMgLFFInC5vJoJujBr0YBgb0fjHaMr
	 vTs2aP6j6Y2kAGqdN+HUNgWu0nN1wDqXYcNsf6Io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E776CF8015B;
	Thu, 16 Dec 2021 03:52:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46463F80116; Thu, 16 Dec 2021 03:52:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB08DF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 03:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB08DF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JdzpyixQ"
Received: by mail-lj1-x22c.google.com with SMTP id l7so36261667lja.2
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 18:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xdliTs2c7a14RuIv4fQ6Gv/2gRZUaewMh1986gMRzTU=;
 b=JdzpyixQ2xNOQp1kobBa6dmn34VWHrmMYTVwUXGQSaVyVj5QVJDy4JjSTrjFE296mQ
 CqhG/ZJHjvykbtD8aRhdXgHW+5EnEpakNZxH9tupm40iWsE97QvdLlsriAmDxbK3YSCn
 EvcJw/ioGVLXy9UBVUwa/Hq8EGUxqaU08tz9K0liPFw8/3XP5+M2PwAypuru9/AtxXKN
 cOdyxo4xygp8Lgkp8e4AJBW0beG0Q9Cy8S6ZEYIEq+LcT5QmoNNxNZAash2TxA8QMJlE
 UvChP3emDP0SncFNgecakH5na4BlgfREMcuwDHzdWMp8tifU1OIZeYZ+jgSRIDl0pTPR
 /NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xdliTs2c7a14RuIv4fQ6Gv/2gRZUaewMh1986gMRzTU=;
 b=KqGmTfBZvehd4RCOlGdwegq92tZDd4Cp3T+wpN0dBz0zJEvCQ6INynIZSxrGLkX57n
 yLBGgIRMzlYuh1oypXNkbs07qsyZETFTVUyoq4wZkh360YUmzeIndqZonY+KhXnMuBTL
 tCLBxmzRyT8YqLN4S3cFLg+ipWoN+M+VouoW1+2JQlAZQBEfckAFJagqUMLnx/8a2NU8
 TKmdVRh/RiUCg0dzdEeNuDYdsU3cysQp9MhmdiSvAZRPXqCVxd7ZxTEL65oNHWDQjJCQ
 I6lXnyaToeo+WVs1Lv6hqt/nO/E5uV1CfD3y9GuCS6hc2NAhHISw+8W0dJRCignMzQ1v
 YfHQ==
X-Gm-Message-State: AOAM530MU01nPedJDh/tx9RQ24LUZIrNYy64wujg5S6ilh7KOe0a79JY
 kChuBmDdGRm755T43b7jeIk=
X-Google-Smtp-Source: ABdhPJxJTPdnQvFSNjW8VJ5MEa46UwKjQZuqfN3F0CKc5MARIiUKTXKvc2vfpEjqqHJMYASZmKS6Gw==
X-Received: by 2002:a2e:8e88:: with SMTP id z8mr12924139ljk.197.1639623133561; 
 Wed, 15 Dec 2021 18:52:13 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id k8sm613103lfv.179.2021.12.15.18.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 18:52:13 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: sound: nvidia,tegra-audio: Convert
 multiple txt bindings to yaml
To: David Heidelberg <david@ixit.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20211211224946.79875-1-david@ixit.cz>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a84213cb-272a-f1b2-338f-ed8ed0bf133d@gmail.com>
Date: Thu, 16 Dec 2021 05:52:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211224946.79875-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ~okias/devicetree@lists.sr.ht,
 linux-kernel@vger.kernel.org
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

12.12.2021 01:49, David Heidelberg пишет:
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "nvidia,tegra-audio-rt5677-ryu",
> +                     "nvidia,tegra-audio-rt5677";
> +        nvidia,model = "NVIDIA Tegra Ryu";
> +
> +        nvidia,audio-routing =
> +                "Headphone", "LOUT2",
> +                "Headphone", "LOUT1",
> +                "Headset Mic", "MICBIAS1",
> +                "IN1P", "Headset Mic",
> +                "IN1N", "Headset Mic",
> +                "DMIC L1", "Internal Mic 1",
> +                "DMIC R1", "Internal Mic 1",
> +                "DMIC L2", "Internal Mic 2",
> +                "DMIC R2", "Internal Mic 2",
> +                "Speaker", "PDM1L",
> +                "Speaker", "PDM1R";
> +
> +        nvidia,i2s-controller = <&tegra_i2s1>;
> +        nvidia,audio-codec = <&rt5677>;
> +
> +        nvidia,hp-det-gpios = <&gpio 143 0>;
> +        nvidia,mic-present-gpios = <&gpio 132 1>;
> +        nvidia,hp-en-gpios = <&rt5677 1 0>;
> +        nvidia,dmic-clk-en-gpios = <&rt5677 2 1>;

I spotted that nvidia,dmic-clk-en-gpios is undocumented, but DTs and
binding are passing the validation. We will make another patch to fix it.

Rob, could you please tell whether this is because unevaluatedProperties
doesn't work yet or we're missing something?
