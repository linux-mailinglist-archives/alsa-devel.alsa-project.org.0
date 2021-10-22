Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0464380B6
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 01:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD49E166E;
	Sat, 23 Oct 2021 01:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD49E166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634945925;
	bh=KPfA4jBjOQZBM4cMVZZP+1/0Ts/2Xo9HE0vogSTWXZ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NAnoI7XtlbXZkmbrxm+3Ux76Sjn1nW6wVsXDq6nNnBVs2T8WG6QYGvemP8GkUCJY+
	 C9hqXWpOg7l56kK3hwzPcWpkFXohaiBZS5l6ADq3bIRgKiPg/K5EdzirZpJZo1mxpl
	 9jtQiKDlt2R3YjHsLnxMGBKwAGsClv0hjZWpA/yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F20B8F80086;
	Sat, 23 Oct 2021 01:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D14EF80229; Sat, 23 Oct 2021 01:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E341F8011C
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 01:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E341F8011C
Received: by mail-ot1-f47.google.com with SMTP id
 y15-20020a9d460f000000b0055337e17a55so6230738ote.10
 for <alsa-devel@alsa-project.org>; Fri, 22 Oct 2021 16:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aHPsIxbcapvVWGDgzw9OJ7HXmoNqDvSGbV9691jEUzA=;
 b=5UJ95e7JNIMEcqS/LeYlGHTamkQgtramD8alvc0IgxYlphRCmsuui0n2vQekqYwqDP
 PQ+Hcg6KEzpsvlYwbkAalhwNRoH9D68o6ADZqDHnowuS4s2kHifP0jsAi6GvbI0Ytye6
 GD8L7qVWjgkwMpKOdQEjCPYtZGY7oFziJjQ3sgVx2xgWP3TPkWQvZKDlgL3drK2IJtO3
 1A1UiLmbpueHB1yKyulnDuPl0wzM1FF0MD9QTn0IL9icJPUqtLMQflCqfUfRXpfWEEJJ
 Kn99yfJVHyUxsQUiqsX9AUp9uDzaY8FQLhy2aVZ6UszdiKHZaXv3wMmtrRfoX9Lax8e8
 dZQA==
X-Gm-Message-State: AOAM532XUrCGskcCturJ23Co5YsTZv4YPQW+DlzvHhf0i/qXmTO4CcmJ
 3cROnK+qNYeSnCMCHZQ2bg==
X-Google-Smtp-Source: ABdhPJyGusuG3Xe+ltcV2VNUzn3Q3aEqUebx3PD43lBIOljUnppVJu/jWBiZYCDU0fTKidHQi4V0IQ==
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr2153509oth.176.1634945832350; 
 Fri, 22 Oct 2021 16:37:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bj14sm2376387oib.3.2021.10.22.16.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 16:37:11 -0700 (PDT)
Received: (nullmailer pid 3385679 invoked by uid 1000);
 Fri, 22 Oct 2021 23:37:10 -0000
Date: Fri, 22 Oct 2021 18:37:10 -0500
From: Rob Herring <robh@kernel.org>
To: George Song <george.song@maximintegrated.com>
Subject: Re: [v5 1/2] ASoC: dt-bindings: max98520: add initial bindings
Message-ID: <YXNLJkzWTBoqVa1n@robh.at.kernel.org>
References: <20211020083055.23625-1-george.song@maximintegrated.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020083055.23625-1-george.song@maximintegrated.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org
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

On Wed, 20 Oct 2021 17:30:54 +0900, George Song wrote:
> add initial bindings for max98520 audio amplifier
> 
> Signed-off-by: George Song <george.song@maximintegrated.com>
> ---
>  .../bindings/sound/maxim,max98520.yaml        | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98520.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

