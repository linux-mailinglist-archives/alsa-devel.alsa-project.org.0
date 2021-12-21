Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75747C7D7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:55:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2AFC1852;
	Tue, 21 Dec 2021 20:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2AFC1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640116521;
	bh=EbJpA3wr36yuYqv/6J8o3j3iJTt19yhiUdaDxYLXURU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LtT6Ci+FsgHNGx3T8ikQasRRdhGVeF5UZxop/e0MmfCgaR5OztUzzBdHvTNbdGMRU
	 dnBstQTSDgLwVw0gNiqaiJmFiZdfp/kyYc+lxR1dN7gwZd+KMEgLjorr6HdXwxvwCM
	 wbHVsmNKstkhM0uJmiQg9ksAzFnF0xGTyP3ihHDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0667F804D9;
	Tue, 21 Dec 2021 20:53:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EC2CF8032B; Tue, 21 Dec 2021 20:53:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF1C7F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 20:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF1C7F800E3
Received: by mail-qk1-f173.google.com with SMTP id t83so121390qke.8
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 11:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NGzh+u9zgih1OilNpGRfn3efB9d9f7H/SjN4hU57YBw=;
 b=DmFnb3ER/m2dymvsoRWlEb3Vr1mQ/uCZ+MItV6xPlvl8qIZCYP66P8bD0W7nD6MR04
 RSyEu2lvT8DLT2OUqoSrQyWxYgssggQOEyLXuXoevS9GULrIrN1gKXS+bpb/XlIvXcHX
 uPcuTNGLLZVf8ObFQziiDdHz/qcZdDTG1RlztUDDa+YFak1DVhA/qXaLPAOl/U/8mRwr
 yHGTpgCw773mTqQdQ8U0/uQ8qEDbdJ95gSe4BTvLaf6fua7zSEQd97rPyfi96uVMGbnr
 t/TZWDPY7L83kVZZVbggZ94uGN1/1+oZV3SY7JoUom0DCKoofC4pGiwxu8APd4yX6EL5
 5c3Q==
X-Gm-Message-State: AOAM531aYoZwQEfYlJ/Kdv4EPZEDawr4zdUw30O6JGO2Hv0M8Pdmalsb
 JXTahArTqhqTFbF/zllDrg==
X-Google-Smtp-Source: ABdhPJwHl3YGCDYjAcPybldSWY0QQVSEU5strTejd2EPK6i0gzZO2JWr3IuXP0Dtlk1/M3yYtwBO2Q==
X-Received: by 2002:a05:620a:2942:: with SMTP id
 n2mr3214929qkp.608.1640116416864; 
 Tue, 21 Dec 2021 11:53:36 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id h1sm1222061qta.54.2021.12.21.11.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:53:36 -0800 (PST)
Received: (nullmailer pid 1642505 invoked by uid 1000);
 Tue, 21 Dec 2021 19:53:34 -0000
Date: Tue, 21 Dec 2021 15:53:34 -0400
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@mailbox.org>
Subject: Re: [PATCH v2 2/3] ASoC: meson: t9015: add missing sound-name-prefix
 property
Message-ID: <YcIwvvJm/kq1jX65@robh.at.kernel.org>
References: <20211218143423.18768-1-alexander.stein@mailbox.org>
 <20211218143423.18768-2-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218143423.18768-2-alexander.stein@mailbox.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
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

On Sat, 18 Dec 2021 15:34:22 +0100, Alexander Stein wrote:
> This is used in meson-gxl and meson-g12-common .dtsi. Add the property to
> the binding.
> This fixes the dtschema warning:
> audio-controller@32000: 'sound-name-prefix' does not match any of the
> regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> All users have set this to "ACODEC", but I am not sure if this value is
> mandatory, so I opted to not set a pattern for this property.
> 
> Changes in v2:
> * None
> 
>  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
