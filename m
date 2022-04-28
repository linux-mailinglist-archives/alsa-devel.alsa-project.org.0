Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F56513378
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 14:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5BB1632;
	Thu, 28 Apr 2022 14:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5BB1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651148382;
	bh=SIhXekKKnLhBSGoI0GYjRmEEOgQPCr6CvaqqGxEWhME=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZreT+9chN8SBRWh5Fm0/3/jFzLhBEcdJNflPJBV4S5aRnRakSAHoYemWuNiH8sdzH
	 y/Wcx8Qir05m/3JrFfa+sL5+LWvCD97F4SiYm+JoO2YhOO/l05AtyoBa87PIogK7xx
	 jDQgU+BE/FBLBCp7IYVXyQr3w1b5c1io0EuzgMvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD49F804BD;
	Thu, 28 Apr 2022 14:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2E07F80311; Thu, 28 Apr 2022 14:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79D6AF8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 14:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D6AF8012B
Received: by mail-oi1-f182.google.com with SMTP id 12so5083827oix.12
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 05:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=oqNXD0idBs6+FKIlnsEQo6osQwhhpCXlDbeX0RQIYO0=;
 b=m22zchsoWTkfhIRsbIUFFXecunL6lzJwG4LndmDLHEgnVvC92f4Sq9oQyJKBfNrC0I
 1FAYY+JaYbq2tVwiGrySM9U0N2s7hZiGBEP6nSy633Kp4QJEH56Q1fy+Mf8QUjaKHtf6
 cAN3xBhM7trwwSXmxKIWGdAi/cF4KwG6nuUiKwFcJ1gx4xUXP+Bzk2N07wt0PZkajXID
 U1w1DDvfLBELu8sdaDUZFb36Uut0bWz/Ran8AWHGvhbmkslUuoeOHmXFtCBOjPp0Qu/0
 bCk/kYWl+CJKmlZSENDS57GrI5wRCcP5MO1tUQ80MCR0+jNSXexGVyIwXkG13I+49hcL
 xDXw==
X-Gm-Message-State: AOAM532Oc9rWSzxAR/EOVRqoTAhMUpUr9Hzxt0EG8m4ebNg7BCu6n4z7
 QvImB4SORtghXSf8pZRKZA==
X-Google-Smtp-Source: ABdhPJz79Uyli5XuXZ/YbldCnIdSvSISWDE5Fl8O5kQTkx6KQr64F68etKJsVQXHaxzZGCB40WZDIg==
X-Received: by 2002:a05:6808:1589:b0:322:9102:5503 with SMTP id
 t9-20020a056808158900b0032291025503mr15696224oiw.68.1651148279242; 
 Thu, 28 Apr 2022 05:17:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j17-20020a4a92d1000000b0035ea6671d8esm999857ooh.35.2022.04.28.05.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:17:58 -0700 (PDT)
Received: (nullmailer pid 1999481 invoked by uid 1000);
 Thu, 28 Apr 2022 12:17:57 -0000
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <20220428093355.16172-17-jiaxin.yu@mediatek.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
Date: Thu, 28 Apr 2022 07:17:57 -0500
Message-Id: <1651148277.902080.1999480.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
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

On Thu, 28 Apr 2022 17:33:53 +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml:30:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
./Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml:40:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

