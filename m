Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0AC4735C8
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 21:23:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC11618AC;
	Mon, 13 Dec 2021 21:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC11618AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639426989;
	bh=RtimEoYKlS7lmkMei7ySAEWgrPHZD0UU9wMoR5vCano=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQLl+/dBPT0cdN4iywLE9OyEmb5zJqg27Mf9Cv1Vgm7FHZOD+3rSNfeYFCYQ/HQu8
	 S42JG3vomCmctVfevH/y6xr9hMm77yeRTlZ+uAnHsLOd9C50NzRwm+vGPFrDLWp3zj
	 qaKaogLshNstIDnwa+r6/EMC3RAdcH15HZ+CtNcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C53F8027C;
	Mon, 13 Dec 2021 21:22:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D063F802E8; Mon, 13 Dec 2021 21:21:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B628F8025F
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 21:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B628F8025F
Received: by mail-oi1-f172.google.com with SMTP id t19so24740654oij.1
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 12:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bnuzIOJ2kdxbRDKBRQuo3lx9OKEj/3aSoA9HnE3CprM=;
 b=EIhwMT9xNwvDb3jtrb5AODPnPLL0fINwHgg2xBdZOikFpg/sJV/xPD2qrqYpsuRQ0i
 PN0vf8c3uITjWNMKwGS1r5THCC4e9EGRusTLuxI48XnkZfNzavkdeW2cCdzhlKGHS71+
 rijIBOwOMdAgoNhdQXI4UMPj5edXPZPBseUbJM3gLApLBFmMRuaxF8nRQGUBKkG/oIpG
 v147IowtI9JKv2PR6+7uuxn9ZKesCSu4mMqsT95uwI1BjYee+PQKMu/TWTGn/tpzD1HT
 MPpxCwWdR3gxo7X6EJTyI/LbRnvpk6TYQxENw5dfcCOw+f49XT76ZXxlgCsOA/RmfWdF
 +9qg==
X-Gm-Message-State: AOAM533LLnDpBGH0ANVfL068c45/ZegpoVXwOsXMRg5WXPt598P1ZYr9
 wDmp/l5M4U1ccfBYe5c7OA==
X-Google-Smtp-Source: ABdhPJwvOnLZzWJ0KZK5wqvP/kLsevP+mX+pIDEGAdPoaRc02evNqqmQjUTBWNM1Vv6GSmsZYRT4xw==
X-Received: by 2002:aca:ab86:: with SMTP id u128mr757856oie.41.1639426906747; 
 Mon, 13 Dec 2021 12:21:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bk41sm2954433oib.31.2021.12.13.12.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:21:46 -0800 (PST)
Received: (nullmailer pid 1505869 invoked by uid 1000);
 Mon, 13 Dec 2021 20:21:45 -0000
Date: Mon, 13 Dec 2021 14:21:45 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
Message-ID: <YberWWoxK3hR8hHu@robh.at.kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202145505.58852-3-stephan@gerhold.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

On Thu, 02 Dec 2021 15:55:02 +0100, Stephan Gerhold wrote:
> The sm8250 audio driver uses the common Qualcomm device tree parser and
> therefore already supports the "aux-devs" property that allows adding
> additional auxiliary devices to the sound card (e.g. analog speaker
> amplifiers that can be connected using "audio-routing").
> 
> Document the property in the DT schema for sm8250 as well. The description
> is taken from simple-card.yaml which has a very similar property.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
