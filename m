Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E125136F5
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 16:33:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 890721634;
	Thu, 28 Apr 2022 16:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 890721634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651156386;
	bh=za25vWYtJMHWPMlHlJb5OE9jYl6XHpRkJCLemAOTtpU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AvcIGx0rv3D1I8KBt3LT7wa1dlXSauha2t0YlHc4tdHoQBQrq7HQvhUgJPl2hEMhb
	 JLn+hpkmc0nDDggXSTwnXlAK1twYY9PcEYGnB5e5GbJDXjpByN2ZI/BhAd3lEy0xQs
	 5k03+7YCM+RyNeiO94xrDvHCnrW+lhOp45LoJ69U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC97CF80311;
	Thu, 28 Apr 2022 16:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A960F800F2; Thu, 28 Apr 2022 16:32:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 247D7F8016E
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 16:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 247D7F8016E
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so5296332fac.12
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 07:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EFB95ppsemYVokN3gYO95lpxo39WR8kyQdqON1ZHZnQ=;
 b=HJ3LUhg3bsFrgg9Uyo73H0mE+ro8UD4o8HjYGuPx1AIlDM7uEBd76JwlkS2dW2hC1L
 Ftd1U6/u7vD3/vSJDyKzUNvaVW/AFb5sbuHTJ5JvOD1tnOFoq+OKiMnOXST0yXZFUbrF
 IK8q8WiL126+1lGCv+H3Udg06H4cFcntyR0AaGlqowDzJXELVzH4Qlete7nqMre3zLa8
 aEgvIRV3C4KGLYq25/2/qfZ2rW51u4lvk1U1Xm5Z/5cWyN5GotX2KDo8/ywh8Tx5T30k
 wgjaN9XSENo/9UukPPfxiqtO+W3FVRaJe6k42v1vjDzH6YAo51wlekQKB+xiOfXjoiii
 1RMA==
X-Gm-Message-State: AOAM53219RCpZPXeNKst5+P3OHLg/+m4qQW33Znm8HqHeFgL8d590Kww
 eyVNRjh+qI9PsK940bXaqA==
X-Google-Smtp-Source: ABdhPJw235998b030Ovpn3X4h/3URvpBnssiViFzusdjem+i4RpxdZR+j/0DQd7KDFfgjXtOmKRTVA==
X-Received: by 2002:a05:6871:809:b0:e9:1bc3:9c5c with SMTP id
 q9-20020a056871080900b000e91bc39c5cmr11214584oap.289.1651156318117; 
 Thu, 28 Apr 2022 07:31:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o64-20020acad743000000b002ef3b249b9esm63207oig.58.2022.04.28.07.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:31:57 -0700 (PDT)
Received: (nullmailer pid 2185535 invoked by uid 1000);
 Thu, 28 Apr 2022 14:31:56 -0000
Date: Thu, 28 Apr 2022 09:31:56 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v4 18/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Message-ID: <YmqlXNGAQLKb5LLO@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-19-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-19-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, Apr 28, 2022 at 05:33:55PM +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, rt1019 and rt5682s.

Same comments apply to this patch too.

> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
