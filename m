Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FCE293057
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 23:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6E416FE;
	Mon, 19 Oct 2020 23:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6E416FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603142165;
	bh=hkvDip51bQ4h8yCy3D737fKgholic78Ig9uZxd1DAsA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NvSaS+Nki2SKDNI0CQFfcT8mfE/Qy8Gv28OEN8PtrQqPhvMj63K/7i9X+a46PxJ/9
	 qTXTp2Z+1Zym1MZZwPwvf4kVeH2fnhkOSqGraTS4kYXXniJlP5kq4A2fPngjM+LWs8
	 sGbmoW2XVtPFCYjwy2Nlf/ZUudVafRxRNr8saW2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AFF6F80247;
	Mon, 19 Oct 2020 23:14:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F2C5F80247; Mon, 19 Oct 2020 23:14:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A3E8F8010F
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 23:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A3E8F8010F
Received: by mail-ot1-f66.google.com with SMTP id m11so1115229otk.13
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 14:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AkXg9ywvkN5UzvdgIWgHzBaGiXjXW0zCY62KlslqE20=;
 b=uFzDfHOERT+UoJ8xJ4kxqeZUayxaMkip+LBVMcZ/ZUfe8+CVMV9C8MRNMK/VWHrWUh
 jUZP27t43CIdGaQ2MyTu2cRGei6dnC+MK9x7zknb235gdJXG/DZ7ScYVS3Zg1V7TExC8
 qY16uoK1WHQJtmk+3MCy8YUNY0P2HnXchutT8w8dGq1PcYbLQOkqxMZufVPKLkSApT/2
 ud3WlbpIoz5cSiMTB3A32VS36jResLvcqh0jjPyWZQeUi8J7eXtt52x8Egc+qSzEqyyl
 mGVbgWaZ3PbywYEyD2ypu+GNWn546QdJOea9VSud3ZErPdhr0ZdOM51UkjXRljOoTcPF
 s4Qw==
X-Gm-Message-State: AOAM531Goi3lWe29ETceTJ+EXnhqyCJvzysydXDMIGso7NE8zClCT/bO
 j+JltVVHw3QWvC1rCdisGQ==
X-Google-Smtp-Source: ABdhPJySWGj+x0Hi8zbrlVaFg82BBb5KUi35oGG9P+zK3XUXlyw0S3QakYsFzPn0pzs9rO9TYNDsEg==
X-Received: by 2002:a9d:65d7:: with SMTP id z23mr1380659oth.131.1603142054307; 
 Mon, 19 Oct 2020 14:14:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v11sm221060otj.73.2020.10.19.14.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:14:13 -0700 (PDT)
Received: (nullmailer pid 3612712 invoked by uid 1000);
 Mon, 19 Oct 2020 21:14:12 -0000
Date: Mon, 19 Oct 2020 16:14:12 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_spdif: Add new compatible
 string for i.MX8QM
Message-ID: <20201019211412.GA3612681@bogus>
References: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Thu, 15 Oct 2020 13:28:47 +0800, Shengjiu Wang wrote:
> Add new compatible string "fsl,imx8qm-spdif" for supporting spdif
> module on i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
