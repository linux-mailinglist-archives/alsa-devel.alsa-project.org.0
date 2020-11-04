Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 289732A6F88
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 22:22:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D35168D;
	Wed,  4 Nov 2020 22:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D35168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604524950;
	bh=s7sqY1Z8Ap8gx1jy0vNimWakML1jxIILauHIK1/+Zl8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L09nB1pXQiYkQNu8KEhrFrRkM0I9g9729rt+sinHPR6i3BOTF+geZsAGwqz06EarU
	 kmUoTkcZxsE2JMEnUnUbHWY88rfWUdo9owNVcU1spyNf3tcNsGAApsBLZ/r99vblDC
	 gLx/v76kskrgTm02IzXUEcSwN5O6pZ65g+93GT8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03C1CF80229;
	Wed,  4 Nov 2020 22:20:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D8C4F80234; Wed,  4 Nov 2020 22:20:56 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 98DFEF80229
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 22:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98DFEF80229
Received: by mail-oi1-f195.google.com with SMTP id t143so12155280oif.10
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 13:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TmGKQaM8NbX4Apyre6CwXX87WW/CQm3JJBjPFFR/Jdw=;
 b=o1B6bDxjiojjY26fbGf7hZGTjAM8uXgb4Tk++erKXOQbhCIRyqNYN2+TTdaVuKVEQW
 wlvLgMfLry98VU2ZshQEPdJawVQARvakEimhdt9ywDV8aF0O0+PfjWAix1VKpqYeNrps
 jJPTEPaV0MEnhYeqn05pK49xIdxpXwrtV2i25vn/cUH+MLLyEitHtnkWxZ88YJ5fBDHZ
 y4M8GMDbLX7xTPOKiPLUWTLS27P3F+YZgfST6JFp90YLi2uUP5kH99eW9Bf0g1oDkp6j
 qFiGAUgrh1RUgVvUCboAOJMno/ZWNPZDO7VmaSiQ25y6PDfC/qFUbuW66Ct6Ehcxo1H/
 2IAA==
X-Gm-Message-State: AOAM5317Qx2lijJ8UQKXkrHAWBAJgDU3jTYmmpl6pgnauAMU6KC/d3Tn
 90w/U3ZxwZiFA7u8yC7gHA==
X-Google-Smtp-Source: ABdhPJzAiDR3F9PdJQBRdF9PaBCZnqE8Qk/J6u5jSUzcXJOA7Y+oQ+kHikaUZqCFJpe8DWCtufvn9g==
X-Received: by 2002:aca:2810:: with SMTP id 16mr3980189oix.166.1604524847617; 
 Wed, 04 Nov 2020 13:20:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l19sm728056otp.65.2020.11.04.13.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 13:20:47 -0800 (PST)
Received: (nullmailer pid 4143657 invoked by uid 1000);
 Wed, 04 Nov 2020 21:20:46 -0000
Date: Wed, 4 Nov 2020 15:20:46 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/6] ASoC: qcom: dt-bindings: add bindings for lpass
 wsa macro codec
Message-ID: <20201104212046.GA4143597@bogus>
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029110829.16425-2-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org
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

On Thu, 29 Oct 2020 11:08:24 +0000, Srinivas Kandagatla wrote:
> This binding is for LPASS has internal codec WSA macro which is
> for connecting with WSA Smart speakers.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
