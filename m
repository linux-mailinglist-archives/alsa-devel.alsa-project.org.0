Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D468F5807CB
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 00:50:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17BC083A;
	Tue, 26 Jul 2022 00:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17BC083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658789432;
	bh=f7/1yMi08UKHHCWUXme3CogzSM2Js1Cup0/Jo2DtgZY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PsBgrLexx5+lFHdupdu8Vi4HOLJsZqWtB0LJ224l/pGJyqv55XTgfFp+cwR8YvpwM
	 ICeArFrxs6gjuCcKb4s3vqIwByKsmZ90/w3DZdLJSCsVJzoDD+b/z/2/XVG1JdKlqA
	 QMFXqmdPiskQ1tjDWgHgIXNr8utFmDHTznXeRqPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F06FF80212;
	Tue, 26 Jul 2022 00:49:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43EC9F80163; Tue, 26 Jul 2022 00:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C056BF80088
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 00:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C056BF80088
Received: by mail-oi1-f174.google.com with SMTP id n133so5073975oib.0
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 15:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TgUuXeWJcaehJrrMLTlRkyapBEtuUEW7JJ0JnUiAPkw=;
 b=G31X+Nr1w65kndXRu2m2x4Ij7zHB5LYtcFyHB6N3Fd94hs4l2PGqj33fiIFRZqwt/F
 lbDZ5VOhYbSLWalRiwNSLxIOKZWAMJiLLVMquY2IU/6zHBybQ50zU52Pj84u5B+dij6t
 W5LsUzfvMnGtmdnfiLaODeKWTuXaTnueJs2P0w4U4oRKkrES3yFvk0zoBnImR+mPVQhs
 8gYcXqNCc39oiFmTySmyJ9bw1Y16KOz5CkIgMLyX9177pILKsBQ+Mz9rxZOAAOe0fnA+
 LBBK7SoOhdjbbAMo+r8YdMiHd8V48KNdRG7hp6aOFf2MkRFoFYN15SONJPCJrjQO/pI9
 wiAg==
X-Gm-Message-State: AJIora+n604QUCqL4r21aJjUo6Nl6QAL8wNYA3yh18yL+CZSeuzHo1Sb
 aKoz8wQgvdh356ozN/mXpA==
X-Google-Smtp-Source: AGRyM1tgZhX6yC7nnRB0VbUfHcyJH9KvLE3/hLtyL5h70qDAYE1NoQtIjsp5w2vpu0Fe/gPfsLGSMg==
X-Received: by 2002:a05:6808:1446:b0:33a:c7e0:e88d with SMTP id
 x6-20020a056808144600b0033ac7e0e88dmr5472956oiv.123.1658789362039; 
 Mon, 25 Jul 2022 15:49:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a056870d25100b0010c3655967csm6645187oac.40.2022.07.25.15.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 15:49:21 -0700 (PDT)
Received: (nullmailer pid 2893036 invoked by uid 1000);
 Mon, 25 Jul 2022 22:49:19 -0000
Date: Mon, 25 Jul 2022 16:49:19 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v7] ASoc: dt-bindings: tas2780: remove tas2780 and will
 merge it to tas27xx
Message-ID: <20220725224919.GA2887013-robh@kernel.org>
References: <20220722105345.175-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722105345.175-1-13691752556@139.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, kevin-lu@ti.com, broonie@kernel.org, raphael-xu@ti.com
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

On Fri, Jul 22, 2022 at 06:53:45PM +0800, Raphael-Xu wrote:
> remove tas2780

Your commit message needs to answer 'why'? Write complete sentences.

Though as this was just added, you should do 'git revert' and send that 
patch.

And this is not v7.

> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas2780.yaml    | 75 -------------------
>  1 file changed, 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/tas2780.yaml

However, Mark took the original patch with the same issues, so:

Acked-by: Rob Herring <robh@kernel.org>
