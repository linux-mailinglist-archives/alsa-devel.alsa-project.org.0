Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D672A6F8B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 22:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DEC216AA;
	Wed,  4 Nov 2020 22:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DEC216AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604524961;
	bh=SM+Vh5PVJhIf5Vs+NvyS5UzELIVmhqk2tU3uRK40pLQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9eEmiE3gPNQIKnGTjdEzoN5y/zZ1G5odnzGxECHpYq1HC3dWqcrGeq0m3+22U+bm
	 SzZFavJhkT8QxsjY0WlJRzvctueNPL6GGjK47PQi3wn1i98/6Vg6kWLJ2xy7c4+Xaq
	 idhIRpn9+pSMi7H2X213kEPtW15/DnW7uvZ515y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC5D0F80259;
	Wed,  4 Nov 2020 22:21:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9699EF80256; Wed,  4 Nov 2020 22:21:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 304D2F8023E
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 22:21:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 304D2F8023E
Received: by mail-oi1-f195.google.com with SMTP id u127so23717131oib.6
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 13:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aZtQfM5KBrbiy+gWC27nrljgHccPhY/KcNRzzbJU6nw=;
 b=PXcP9j827j+IVMR2t+T3umokx+bxi8RmzH10MU6N+2Ao0b8vr1XJzOtygG0Ou3KbBH
 Nhrvwy6i208QeBST0HtT7Dts5xbwfGYXiIEKYBnKyNPZNJwNoTorZ4czoVtzdyQo3Z2E
 n1qYyH02FQXNhSRBLsMR/FuV6vixuEAZlpNUhJkzOc/xk5DSkX3wkvscaIDEP3vg1hhM
 LjV0cLY5GtjGe6PK7VJ0pDZczNNYeI/Fy0Ro5SXjKTFg/N2cQsm4GEo8uu9eWMzhxK5u
 0VeVHzBh8g0chRsEmt/Bjh+3XTitoL/THAw1kJLnRxftS6rE+2fDbuQlp21q2BUuBtRF
 D2nA==
X-Gm-Message-State: AOAM531MKCS5uGqplvy3XJKl8CUoeCPl+JrErbbyKw2HyUyzbPqBdd9K
 CMTLhuAFH2vBJzUzdcGmmA==
X-Google-Smtp-Source: ABdhPJyDaOJViGJX07fUT0WbV67TuFIoZZydDHDeyusO5qHV7wFq9sr1wM5JU41KZujIeBmaTt6tCA==
X-Received: by 2002:a05:6808:91a:: with SMTP id
 w26mr3878979oih.159.1604524877040; 
 Wed, 04 Nov 2020 13:21:17 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m65sm760695otc.36.2020.11.04.13.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 13:21:16 -0800 (PST)
Received: (nullmailer pid 4144464 invoked by uid 1000);
 Wed, 04 Nov 2020 21:21:15 -0000
Date: Wed, 4 Nov 2020 15:21:15 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 4/6] ASoC: qcom: dt-bindings: add bindings for lpass
 va macro codec
Message-ID: <20201104212115.GA4144415@bogus>
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-5-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029110829.16425-5-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org
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

On Thu, 29 Oct 2020 11:08:27 +0000, Srinivas Kandagatla wrote:
> This binding is for LPASS has internal codec VA macro which is
> for connecting with DMICs.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
