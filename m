Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE25F15C0
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Oct 2022 00:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6824216BD;
	Sat,  1 Oct 2022 00:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6824216BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664575614;
	bh=oV9XbKH9T7rc5Aq3ByoeJ5a/oX4VYMUGWPU4T3s1N8w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lUQfNkpJt2ADhFhL3Dk2pHWnvB9QiLWMvH7zTVJ2ISoJKa/hLmdAsYZqSs97sF4S7
	 pCuK8ZFVuFbX+1VioeczS/YtPsAR7P4524Jm19yOW+dfbymNWxVjnWWO71FdvsgckK
	 5BTN38CYCaie1vp7CWtwjp9OHWh0PbWeVIeX5w/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29E16F800AA;
	Sat,  1 Oct 2022 00:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12BF8F80155; Sat,  1 Oct 2022 00:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0B01F800AA
 for <alsa-devel@alsa-project.org>; Sat,  1 Oct 2022 00:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0B01F800AA
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-12c8312131fso6991167fac.4
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 15:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=OCha88PaYgifgFcd4uvVIztgcK5zt4FhzTG/3Ul1xes=;
 b=FFEcs3OUmDTYTtJUg2N4gbxgQpnIn50nstpcCbmU+Mc1vycSEC2PvvNrvnTg4gleZ3
 x2FunVPHSJiGu8N7GnxO9Iv55rEOL4zfACtY4mzI1vlOpVuVjtbwGwsiNDzg5OzXef2g
 aN2YM2tYbQXZg0BXEHYN9I66JRSTIfF1CTQHDRnbtExtCOAlbgdaCtJt1P6SdybBlru1
 Wo5w1sAYQ/GqyBfMRYVQgODBaK03gm3uMNZcUm7z5mnPztP8xqARAiLlyeIzALY67Is7
 6tiH6lvu1SJK17GLKvpN6kQhSVw8/7GG8LsUu7MbP/zDbBFOzIj4Uag6B3a05FNNG+WJ
 qTfg==
X-Gm-Message-State: ACrzQf3Z2vVQ+zmDtQ5/aGSBtsYvwKNbdOW4kIhJOxsMRgV14niVtb1L
 +wFpp6ZbHUxAc8iMLRjXYQ==
X-Google-Smtp-Source: AMsMyM6wQkdkeuoMwiXngdbVWbO8gt78XK6h82limIVmKAdjhVl1fZtjFwbcpx8NGI3tyLKuDBDMyQ==
X-Received: by 2002:a05:6870:523:b0:131:2d50:e09c with SMTP id
 j35-20020a056870052300b001312d50e09cmr144209oao.129.1664575545273; 
 Fri, 30 Sep 2022 15:05:45 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n22-20020a056870241600b001317413344esm992413oap.47.2022.09.30.15.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:05:44 -0700 (PDT)
Received: (nullmailer pid 1129749 invoked by uid 1000);
 Fri, 30 Sep 2022 22:05:43 -0000
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20220930145701.18790-11-trevor.wu@mediatek.com>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-11-trevor.wu@mediatek.com>
Message-Id: <166457526101.1112313.13428811477972046652.robh@kernel.org>
Subject: Re: [PATCH 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Date: Fri, 30 Sep 2022 17:05:43 -0500
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 30 Sep 2022 22:56:59 +0800, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-afe-pcm.yaml        | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.example.dtb: afe@10b10000: clock-names:17: 'adsp_audio26m' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

