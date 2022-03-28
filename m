Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0464EA3C7
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 01:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6AD17EA;
	Tue, 29 Mar 2022 01:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6AD17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648510590;
	bh=LtV0+JEr1vy1Fw22kzlPUf7y2fNBj8YPfE+w7QY/BIc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6oRgvDoUppKBDba4+PX6JSRMCX3DvwLjo3tkc+rJ9hcBIdz24/X0/C7GbQ/9Rpk9
	 efGVtiRGhNWo8RyBucEKZQSOdvnoohbVinTD5HrERZlYTTEPqTVyIvIhzFCYwD9apb
	 /25m4sKJE6s6BqJPPFF7yDzitDYv103bKdq/uyj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46C68F800CB;
	Tue, 29 Mar 2022 01:35:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A90EBF8024C; Tue, 29 Mar 2022 01:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 323C4F800CB
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 01:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 323C4F800CB
Received: by mail-oi1-f175.google.com with SMTP id v75so17413550oie.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 16:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SroNa1s30omGiI5Y9VrYvsu2x7qDgV7jwDVANE4sovM=;
 b=CqzzNPidbKM1ZjeyxRa7iFmCPBJipXD1fV1WymYT1JC+fV7p1uG17R3Hwm+1L1B1kr
 czGVF1QSminwkhFynApIqi/nB7EdSRQG5koIq5jxvhuokLm1bDefWuzfo3KE7vzG4Rl0
 BBajd5xgJ25riv7fkmqlaFTHG85hs4pN9wgft9kbkj2KQD+wAJ3dHRB8x07bH5Ptkkt7
 bEz3UQ9oSxtKIkr3nOAAPEHDW7c1TfCyPjGfr+yea4Vfb6kQDAayG/S1CaidM8QrKhCy
 wDS+A6b/rYdu18rv/aOzrPulZQTL0deXP2I4NLru5JqzReRUgMspfmxmG2uBkiJEw8yT
 7gTA==
X-Gm-Message-State: AOAM532D8jujcto5wxcdY9VlvP6VNO/3mPt9RRcpmaOV00/V7rnU8VLj
 Kbh55U3Xt7iFt/irO7YFbw==
X-Google-Smtp-Source: ABdhPJwkSu1O1DKPbpe99hnvB1lz+rBg9kLNZGBXNnWcQE2xKETugXJz1gq3e0uO5Ff/4VU0Ceh4iA==
X-Received: by 2002:a54:4714:0:b0:2ec:f566:8da5 with SMTP id
 k20-20020a544714000000b002ecf5668da5mr801500oik.97.1648510511483; 
 Mon, 28 Mar 2022 16:35:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r19-20020acaa813000000b002ed02ca6a3fsm8015753oie.1.2022.03.28.16.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 16:35:11 -0700 (PDT)
Received: (nullmailer pid 3257819 invoked by uid 1000);
 Mon, 28 Mar 2022 23:35:10 -0000
Date: Mon, 28 Mar 2022 18:35:10 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 4/5] ASoC: dt-bindings: cs35l45: Cirrus Logic CS35L45
 Smart Amp
Message-ID: <YkJGLo/dAAO3QMq5@robh.at.kernel.org>
References: <20220318162943.1578102-1-rf@opensource.cirrus.com>
 <20220318162943.1578102-5-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318162943.1578102-5-rf@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org
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

On Fri, 18 Mar 2022 16:29:42 +0000, Richard Fitzgerald wrote:
> This adds the schema binding for the Cirrus Logic CS35L45 Smart Amp
> and associated header file.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs35l45.yaml        | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  include/dt-bindings/sound/cs35l45.h           | 20 +++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>  create mode 100644 include/dt-bindings/sound/cs35l45.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
