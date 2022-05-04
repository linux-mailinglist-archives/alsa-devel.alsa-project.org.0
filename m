Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DBB51AF7E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 22:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E4F2179F;
	Wed,  4 May 2022 22:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E4F2179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651696841;
	bh=yqcbOoVeqwYCnrFrJ9p6ibi5fUpNu9LsQht1wAvChMI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3lhPyH8oLQekOz65qswxX4EPUFmhQ6tDy7e0r+866VgCd2Cb8xKP+uBIv28Ea9MO
	 HyZpo1QcuyiOghoRlgOUCHXDM2UeCLxoVe48SnFjUpQ2i1VVKqxUmx4wnAT2iPcgqR
	 x4Uov/mO7eW+bqwLoGojtPO0BKrJIZSJUNnucDyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA0DDF80141;
	Wed,  4 May 2022 22:39:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64CD1F80431; Wed,  4 May 2022 22:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08060F80141
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 22:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08060F80141
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so2397862fac.4
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 13:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S4POjd6sez9oc9aUZY3gXfVuFYOsA352dcoVpMWV9Qo=;
 b=fD3Noq2XIxUkUzlmy8Tm+c7U1sjnPyG2FCCieXOvrncsiPRQrHylMs08W9s+6H3vIX
 ETa76+j8a1cgiRGANxdGtVKwfy2J9W83zleJTaayNWBxyJ6FWVv1MDcTmcVrc68ceWmy
 kmxA0QhKDYX4SeV2eFBV3frq5aL7huW6wMo37MLha9auNlSyUBUwInAUWTcirXHLlG+x
 Ju0ZZOI0Ze9O8/2wIYlNNJ3lctuTo1yTgxlCfczzo7lY28w7hR/g5LYbd0oAzBAHPTI9
 5quJ+pV30s6JbXwjvmEoAUsUHiwmuoUjJih0izKHbye1Vl0irAfKyI0X5NZRpLjmS/Us
 Pirw==
X-Gm-Message-State: AOAM531sf58870t17NucpszgELvV4ZnJApXO0T7E+dZJ3/WVIxiXWxok
 YDAA0RLnFeySZdCbshQ7HQ==
X-Google-Smtp-Source: ABdhPJxFuyd/aXmgVJNfTzeAlb5W8QgkzRYxK7rdQuOk1wYb+Q5RtOkuQoOPEWwEq/vnwU4scBvAqQ==
X-Received: by 2002:a05:6870:a107:b0:ed:9a88:88b8 with SMTP id
 m7-20020a056870a10700b000ed9a8888b8mr718350oae.298.1651696770246; 
 Wed, 04 May 2022 13:39:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05687073c400b000e90b37d2f5sm8373047oan.24.2022.05.04.13.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:39:29 -0700 (PDT)
Received: (nullmailer pid 2188096 invoked by uid 1000);
 Wed, 04 May 2022 20:39:29 -0000
Date: Wed, 4 May 2022 15:39:29 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: rt1015p: Add #sound-dai-cells
Message-ID: <YnLkgd95msrSPpVe@robh.at.kernel.org>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429203039.2207848-3-nfraprado@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Fri, 29 Apr 2022 16:30:38 -0400, Nícolas F. R. A. Prado wrote:
> The rt1015p codec can be pointed to through a sound-dai property to be
> used as part of a machine sound driver. dtc expects #sound-dai-cells to
> be defined in the codec's node in those cases, so add it in the
> dt-binding and set it to 0.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
