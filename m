Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD53D6539
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 16:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 875BB166E;
	Mon, 14 Oct 2019 16:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 875BB166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571063557;
	bh=bgRQy+hUnfaMnIK+CNPPK32uZepYTQjFNbIQha8qXDA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KuoaNf9mNqlMSivTMjNYyaSKtTtwJQavo/z9DllRQFVYSeswuyqPZM2c+LtbLniZI
	 9FQ6tShP1PpvLK8qg1Cdti0afqavMxQ9cSWmc3f1Bu7u/OUaUL5H3BIg+beH/wJqGh
	 B4qoYBOsf++cGuQRFvpq37T4uAA6MGXi3dTLpt/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B85A7F80362;
	Mon, 14 Oct 2019 16:30:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B7AF80362; Mon, 14 Oct 2019 16:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6528EF8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 16:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6528EF8011D
Received: by mail-ot1-f65.google.com with SMTP id 41so13943017oti.12
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 07:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HR3huzkuSWxPZVSOCKU/OYZ7oGhSKM9tpzzRco69LJE=;
 b=lFHxmx9V6uPstpTsz1PSr7bHhlQ4MSDet040f8tMTN0Kamxz1U8qpxVHnsY98C6mq2
 9IyLgpABX9P6sxr8PARhcAQ9PliiD2kITJ6fhCFRRu3+eR9Y2JJ3QGR9ok1UXK2s4l11
 wwOmD6EjuOHRC+RE8er7HSAFkKgI8f+4tfHK3K1Ix6h92nvFMeoDfJEfz9nlhnZ/POJ3
 ZjpdImoUpMd6obGLu8o5xM0BOPs1tXJ4P40FOBAquD0T3Gzbd7BO6GrJyTzGfIFBwVj7
 lTIS1AelKG4kk3bHaojFzuXsgwIK0Axom5YGQNzNce/k9wEO+4AtMZOffYwwiu/wnDEQ
 jImg==
X-Gm-Message-State: APjAAAV2qK9M4oH0pmJAU+BE5PyL4voEeJdd7Q0veo89QACP78786Czs
 /KX3XGybzGrBqNi55d8bqw==
X-Google-Smtp-Source: APXvYqw9ImRBqzlINO9s91H2FSHo+R+tT1+eHKHHA+suePeHiQnrNqr2rvcwLGTi+eKpR/d9WdHdEQ==
X-Received: by 2002:a9d:70c3:: with SMTP id w3mr18187499otj.246.1571063443729; 
 Mon, 14 Oct 2019 07:30:43 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u141sm5553575oie.40.2019.10.14.07.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 07:30:42 -0700 (PDT)
Date: Mon, 14 Oct 2019 09:30:41 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191014143041.GA5564@bogus>
References: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
 <20191011152446.5925-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011152446.5925-3-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, spapothi@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [alsa-devel] [PATCH v8 2/3] dt-bindings: ASoC: WSA881x: Add
 missing #sound-dai-cells
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 11 Oct 2019 16:24:45 +0100, Srinivas Kandagatla wrote:
> As this codec now exposes dai, add missing #sound-dai-cells.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
