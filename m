Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B10403128
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 00:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C1A1719;
	Wed,  8 Sep 2021 00:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C1A1719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631054470;
	bh=xMBwDv9FPxJuTyxDTzNibu6VZ/E465hSHS8xecIbccU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eg4V2waniiRO1i8x8cqKw9N6pWl5y/EgUs/na4WD9alvc+64Cqwj+GvcW40t/IMaZ
	 hAmtqNlC+j+m0hFfLXHkpIVhlXdBkOgBVXFbbdG9e1Kg3PHHliq6zC19Ulha+rImpc
	 zkgVJOm4JhczWPz3/3fnL9UotGcvweS5rpTAPH0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F4AF80253;
	Wed,  8 Sep 2021 00:39:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 191F7F80224; Wed,  8 Sep 2021 00:39:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0A15F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 00:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A15F800C7
Received: by mail-ot1-f45.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so358730otf.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 15:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4wkCFIT3SlNF5Cbm4QBSLEGhQxdIzIBSRij4eklDOHQ=;
 b=H++AoRx1YJA+Cbx21G2BaLaWwuPCi4zDgq+xZv9Z8JENF53CMPnXkfryNoWEjBEiV4
 sZ5YVWTfn9dJxeP0tf5SDTh56gvaBLd6OwUyBdtl8N59BYGFwAAMxZE4oQnwEeSWSNGP
 wh8cGsOlRBLAfGXYGQ6p1ZO0tM4C80rGkQ25DxtkMj2RdgLVI4k06JRDegIyvUTaIbsP
 fTrffc4mrIxaN8Vuxt6taVcnMVhj+472/nfiJ9WF4XUD8KpKGl0GbatCUFOe8NqgfjIp
 1m7hXqvdMnqC4LWBihp08mfk/scQgdmEyX1DflqYIYJNoZiRDNR1wD6FmhEko+XFm2qX
 d+gA==
X-Gm-Message-State: AOAM532JMbJWCVf34e7GRJ5ukqVDQvhKamysru29N4tMmsdNF+zh9yxG
 nRlkb5Na2+8EonJcVH3sqg==
X-Google-Smtp-Source: ABdhPJy2lW6IrRoj7MYwE2I4GQU8N0WEstukF0wn4QFdf9jGFHdiGcUQfHGIPdO22Fa5cm6tliCavw==
X-Received: by 2002:a9d:615e:: with SMTP id c30mr617229otk.134.1631054385180; 
 Tue, 07 Sep 2021 15:39:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x1sm61084otu.8.2021.09.07.15.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 15:39:44 -0700 (PDT)
Received: (nullmailer pid 492596 invoked by uid 1000);
 Tue, 07 Sep 2021 22:39:43 -0000
Date: Tue, 7 Sep 2021 17:39:43 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 02/21] soc: dt-bindings: qcom: apr: deprecate
 qcom,apr-domain property
Message-ID: <YTfqLyXQxto7raAz@robh.at.kernel.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903112032.25834-3-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
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

On Fri, 03 Sep 2021 12:20:13 +0100, Srinivas Kandagatla wrote:
> replace usage of qcom,apr-domain property with qcom,domain property so
> that bindings and driver can be reused.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
