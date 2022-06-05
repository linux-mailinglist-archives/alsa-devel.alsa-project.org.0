Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6420153DEB4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 00:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6655190A;
	Mon,  6 Jun 2022 00:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6655190A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654469129;
	bh=W10QYHoI4q5YOWnmyYirMcGbDevOmTVIHghn9ctabh0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lhdi1iT6FUVmXT7WryZfPBEshW0sBoUVf4cR8dXitoUgIdfULK91V+p9A8yuPlGUJ
	 KVC8SOnZaz9mtsiGT+1X3Ii576ZQKvVUptnUtG+H3QZBr2111Eqa9qMBUFiFht0zWG
	 /250Ok8df4dUBzOQbN5AeBNs7LpAbzqNLD7UC0kM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E3CF80089;
	Mon,  6 Jun 2022 00:44:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB00F800D3; Mon,  6 Jun 2022 00:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CEE1F800D3
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 00:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CEE1F800D3
Received: by mail-qt1-f172.google.com with SMTP id y15so9340451qtx.4
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 15:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LFhCaG60xFmD3TWaJ9EwtlMdlcWCG/u3VD55cWqFobw=;
 b=I3ogirni7ARt3zNL2MVkblt9CH0EXK62nrcOZOk5zN4suYE3WokKKpRG/UxYzQLVI4
 jwcwuO4X8l4DWSTxpoPfqmRaSzuFyowQJ0YsOOT7l5FZ9LrGuBYsUjXks3gGk+v/cV3t
 lJFtNnFPlQiFkW1vi94heKfAX3nvqFIWgrWZSGzgNL9n9Z0scnLcWVpjr7ytrJiDLMVL
 ZMClqQCqs9EM90S2kamEcxMRW/4hRAXDeI1R9e2yvbr1zAqMgFYj03eg5UHUhzXJA9DV
 uHFzuUmCPz9Txn/bBNZELkGRkG5t+2zhBXED3E5TyDTjgvRfV38IkEahS6+cAHEGCthb
 lLGg==
X-Gm-Message-State: AOAM533pV5RKYeGNHTAob9S/G9CbNVkEzZvtCM9Vk9llNFCN82gS6o07
 0TZgvV3V2/0pjwTt46KRYQ==
X-Google-Smtp-Source: ABdhPJx90Inmr2t/uBYqmDG90Ua1+4jBi681xj4Vcuup0kVjJ2rGSOsLoVmjdx/DQucQL+eCEtpJGA==
X-Received: by 2002:ac8:5e13:0:b0:304:b452:9ec8 with SMTP id
 h19-20020ac85e13000000b00304b4529ec8mr16434949qtx.356.1654469062534; 
 Sun, 05 Jun 2022 15:44:22 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:1bdb:2e61:f12:452:5315:9c7e])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a05620a29c200b006a6a3ce437bsm6158799qkp.27.2022.06.05.15.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 15:44:22 -0700 (PDT)
Received: (nullmailer pid 3665782 invoked by uid 1000);
 Sun, 05 Jun 2022 22:44:19 -0000
Date: Sun, 5 Jun 2022 17:44:19 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Martinz <amartinz@shiftphones.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: nxp,tfa989x: Add tfa9890 support
Message-ID: <20220605224419.GA3665749-robh@kernel.org>
References: <20220602164504.261361-1-amartinz@shiftphones.com>
 <20220602164504.261361-2-amartinz@shiftphones.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602164504.261361-2-amartinz@shiftphones.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Dylan Van Assche <me@dylanvanassche.be>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Caleb Connolly <caleb@connolly.tech>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
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

On Thu, 02 Jun 2022 18:45:04 +0200, Alexander Martinz wrote:
> Document TFA9890 binding for tfa989x.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> ---
>  Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
