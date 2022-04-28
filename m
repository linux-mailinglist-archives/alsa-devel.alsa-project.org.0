Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E3513377
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 14:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B167315DC;
	Thu, 28 Apr 2022 14:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B167315DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651148348;
	bh=hFSiRZPH896WXHNSI290k1z00Is4xLce1Qum+pRYNLI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbB5xVjSXLQDe0oHGr8ipzHAR9xdSYKvLY/vGWnKGOnN/oujMjuVSNmlyQIu0YhuP
	 5pOExSuoGgvoC2lwHa7RGiAekxuuBy3xCnZFXILh8XWG97dt/tDy/o0gL+O9GNHlAY
	 nDPDEsFcjEDlRQTX/X/+zDnS9dlCzBQga8hqC7c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 307F5F804B0;
	Thu, 28 Apr 2022 14:18:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87A08F800F2; Thu, 28 Apr 2022 14:18:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5746DF800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 14:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5746DF800F2
Received: by mail-oi1-f173.google.com with SMTP id s131so5149407oie.1
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 05:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AvrAp2pIkyvrhsFnFXmihXOHIOjqivUkysQhFCJ6/TY=;
 b=E8Sx3zuNOPm/xC1Mw9wGFIWTL1eraFOWbnnBrzVzG0PlDiwvoOi5kWdYOBiN5+4rgv
 d3QNygJHr49Is3+Mq0wvx0cRS25UV8jTJhZYCOkkdG3DXN431yIKOSRrBcDkyCv/cPA3
 pBuK2Zbn2L0rdAB7ezxm5OM721ZCyIdXwX812voA199nUhmguaUuPFaDVDy0siaC+Lcw
 9XwtM4fG0HHEhAOczEqOeGCussm/VpEaQiua3uOx26UjFBbl6o+ssuxZzZfFpcsOhutQ
 Kw8ViMfYhS7o4w7O+da6s0S78h4kv1j5KRGAjHPIJ06FVWv6B5HBm+Ox59grKKzT5wY+
 id2Q==
X-Gm-Message-State: AOAM530UBrLDlv9D+KsoyykQZTA5ZOf6Tlzp4+eJYbAlYoRt/STrYw5E
 2MtdJTR3aZJ3AAa1uLjYmQ==
X-Google-Smtp-Source: ABdhPJz5RdYfwKUkJdq1T6ujFTPXJ1ox1QGJz4/fi/sFX1cbTyqNh8f7bmsrs3RFEOL8ECJg0cOobg==
X-Received: by 2002:a05:6808:10d4:b0:325:20c3:557f with SMTP id
 s20-20020a05680810d400b0032520c3557fmr10474972ois.39.1651148280653; 
 Thu, 28 Apr 2022 05:18:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y18-20020a056870381200b000d6c86ea98dsm1778714oal.1.2022.04.28.05.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:18:00 -0700 (PDT)
Received: (nullmailer pid 1999484 invoked by uid 1000);
 Thu, 28 Apr 2022 12:17:57 -0000
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <20220428093355.16172-19-jiaxin.yu@mediatek.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-19-jiaxin.yu@mediatek.com>
Subject: Re: [v4 18/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Date: Thu, 28 Apr 2022 07:17:57 -0500
Message-Id: <1651148277.911772.1999483.nullmailer@robh.at.kernel.org>
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

On Thu, 28 Apr 2022 17:33:55 +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, rt1019 and rt5682s.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml:30:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
./Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml:40:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

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

