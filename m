Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B850360D8BE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 03:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F06C4426;
	Wed, 26 Oct 2022 03:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F06C4426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666746648;
	bh=wwvsr9k2i+Lczc0imEyVrvi/z3IKbXuJgUCZgEbBuUk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0lwlNDSExyHpYK4mKslLJRTpyJyytVEQB4KS+iMYlmZOY/fzRrbVh9LwRJ7ltsN7
	 6aj5QcoU7FOrLQr0o2Xbd76H0dCB16wwrNfwnmc6d0xA6VxBnZzNLK6XG+2u6XTlRP
	 GTJ+PdBAp8nzmQnKfLzQBGQvx4zBqRRKuoO/EzxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C6EF80115;
	Wed, 26 Oct 2022 03:09:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C91A6F80431; Wed, 26 Oct 2022 03:09:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD841F80115
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 03:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD841F80115
Received: by mail-oi1-f172.google.com with SMTP id p127so16741232oih.9
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 18:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HG4VVkS24N9P28wqi2fW2XTbUe425KORd603IoTp6S0=;
 b=ydStNJDc5Ke8bZiYYW58ElWV1zqkFUoFqfFMXEc5dCuWBg+VJwcY/6U5JLXWCNrlQL
 Lt+Cr+rTJAkzPqKULoAzFN2xC9T7I6iJRzV1hirafCzUm+uTR7dbD7wU20xMhUFNpdnh
 D0FGL0F3esgvafAj35A8VbnzMBgQd4v/8PmaCDBioyBpqqe+/YySFV3BNm1l/HuvbGvY
 IYAypcEm+FoLTewcZp0tbwsCtz1DkGIMBY9X6Eis2EYTsgLIjbmjspM9NtfWIL9sYatq
 xzgAWeNhpejcCYQRbHPE/yyhk7Wd3RD7bnmXTd7K1Q3sYg0/iI3ezgj3J+SRKIPASYIy
 FGoA==
X-Gm-Message-State: ACrzQf1YvsdTGMArUKoUCF4TOKkR45FM4hIH19FZcgRkLTP/1pREsJTA
 XtBPVFhyAm0lwySHtCk2Gg==
X-Google-Smtp-Source: AMsMyM6ZtYFMnBkpqKM2x3pzwsH/yh/j7SGFOypJpp0NROCfS3lVPoCuxyWMxk5quff+xl9pBCy9rw==
X-Received: by 2002:a05:6808:1893:b0:354:b5bc:cd0d with SMTP id
 bi19-20020a056808189300b00354b5bccd0dmr598596oib.244.1666746584580; 
 Tue, 25 Oct 2022 18:09:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6259000000b006619533d1ddsm1603477otk.76.2022.10.25.18.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 18:09:44 -0700 (PDT)
Received: (nullmailer pid 3525382 invoked by uid 1000);
 Wed, 26 Oct 2022 01:09:45 -0000
Date: Tue, 25 Oct 2022 20:09:45 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not
 type, for sound-dai
Message-ID: <166674658480.3525343.6807644531936287296.robh@kernel.org>
References: <20221024230658.1772907-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221024230658.1772907-1-nfraprado@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Shane Chien <shane.chien@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
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

On Mon, 24 Oct 2022 19:06:57 -0400, Nícolas F. R. A. Prado wrote:
> sound-dai is a standard property whose type is already set to
> phandle-array by sound-dai.yaml, so there's no need to set it (and
> wrongly so for headset-codec) in this binding. What should be set
> however is the maximum number of items, which for headset-codec should
> be 1.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
