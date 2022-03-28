Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88284E8EA5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 09:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582B5170D;
	Mon, 28 Mar 2022 09:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582B5170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648451074;
	bh=ZMzDku3JIeGypOPUQah7gNTKltqH/mQnUjeP6LwnW+4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRgJ0D/mj+DYFv9yOwVXjTrE6uE2T5wSu9fif3t1vu12StWacPsxWmGPomYZJHZJQ
	 7PDkq/0UyDb1fWsnAcN2RZ6CJNT3socaumL9AGj5b2HNTkLY2nmaQSNYBQAZPcl0c7
	 669BzPtabp+UJ57gzNhTf/2rfhtmj6nkvEBFNP2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E69F804CF;
	Mon, 28 Mar 2022 09:03:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70DD9F80271; Mon, 28 Mar 2022 09:03:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80958F800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 09:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80958F800CB
Received: by mail-wr1-f41.google.com with SMTP id m30so18958699wrb.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 00:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pkiElRGcYMgqGO+15AWzkYL63nI4vFLbBIBuyFUuyGM=;
 b=vuYsAKE+CT+kaMQ2LpfkIk5sJtmXuLic6yjxfxo1iZuvcQqx9LyNwZiFbpNGMbZH0W
 Jtikgke40oTBmfGJY3iaYP9Bvzf5R7jOoLCYSpVGn6aha/AHl2FWADU6XAZB7Lbj6dWd
 JIHtGD8XcwmepZId8UXlyHmdjn/hDaEaeqzJ8xvihHPUkG2hJRNbz+9n1RrHmokE9tOu
 P2+8kpwuKhXSj8Dy2WO3Mq6BDR6yqQ4L/+XRbzK5xb+szsp/syIeYxEtMYC0iwmyvayi
 PxbUoU5hIK1O/iPbeKQZyqH/jTcq9BImr23FQiBczX6o2yCq9GaXyEws0eQb8IdKGmJE
 Ef1w==
X-Gm-Message-State: AOAM531K/slRuGnaI54NfnjzSxbdjXDGI9bhBe4Lab6dOHXmQnnWA9pH
 2q45ihFhrgJLquDzf3CNjFU=
X-Google-Smtp-Source: ABdhPJwy/cOClG5uWIA9JX2AxfXLLjzon9aoQtRw5DDcKvCEtvAdLnaCcFAucyDOibo1MjviWfbGPg==
X-Received: by 2002:a5d:64e7:0:b0:205:8b74:8db7 with SMTP id
 g7-20020a5d64e7000000b002058b748db7mr21770989wri.34.1648451005144; 
 Mon, 28 Mar 2022 00:03:25 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 w5-20020a5d5445000000b00203f8c96bcesm11097375wrv.49.2022.03.28.00.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 00:03:24 -0700 (PDT)
Message-ID: <95cb1ea9-a737-7d01-f81f-f94ea92c7a4d@kernel.org>
Date: Mon, 28 Mar 2022 09:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 2/6] ASoC: dt-bindings: Add audio-graph-port
 bindings to rt5659
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzk+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-3-git-send-email-spujar@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1648448050-15237-3-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On 28/03/2022 08:14, Sameer Pujar wrote:
> To use rt5658 or rt5659 audio CODEC with generic audio-graph-card machine
> driver, the CODEC requires "port" bindings. Thus add "audio-graph-port"
> reference to the rt5659 binding.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> ---
>  Documentation/devicetree/bindings/sound/realtek,rt5659.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

This should be squashed with your previous patch, otherwise that one is
not a complete conversion.

Best regards,
Krzysztof
