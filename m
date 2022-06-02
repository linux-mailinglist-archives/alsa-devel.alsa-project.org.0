Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6C53B9E7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C40791768;
	Thu,  2 Jun 2022 15:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C40791768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654177016;
	bh=zxMHYDMz92Hrcrjy/V8ShyfcM9HVnEeVEetLof/G7bM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2lW3ApChdr+uI39pZrzM9tLy7NZt6ByumdRU+2Vu/ShKuy0mECDM5MnYrnOSibOu
	 LUhzF+rz/vR2viEvk72W/RNSXlUMCQlmePV+j6uaDHf8JxagWAJSS/x8I+zNOv8eWU
	 6KuMU1rkmttOCHN2NNtviFTXlXJ4bc9bhaanVE7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 652ABF80272;
	Thu,  2 Jun 2022 15:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55F0EF80149; Thu,  2 Jun 2022 15:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DA1CF80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA1CF80149
Received: by mail-oi1-f178.google.com with SMTP id k187so6573924oif.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 06:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1e7vrj+7vWIZv19NYkOjmP4n2WgkFN1YBD1LvqayGbs=;
 b=ocQRiMQIhDnKZC+g1SGR+vDeIj803XyIJx4cBLPSPXMfc4w/wPrpUMOrrUCQFzWthQ
 2X7TTyUZyHV8Nlsvwkb7TUTpTPvC9dkRmEF3jVybrbPyZ7SXt7j6F2JAbXvraGnnyPfq
 Bq1kzfggost7sBYg9IrQdAKbv7Yjdjk7jS5Rxw6BlOb9B4yhDq0PEvgv155Jb1lX6x2g
 FMVh8mJzCCH44q4Aoc1h4YEc5qzbopirnmmb2hOdkDUTKlDMj91pcGPfq7f9RXkVYDzH
 nPJ90Y+nTRsJ5WFooUdYEZ0aNZmbGD3pVNX/Y+wPxMVeDNZ5qjqoJrPXFPy5KOrdq97S
 SWTw==
X-Gm-Message-State: AOAM531fZaLgZ0N43TyTchJA5hIHdbpArv3Qe0VyegTq2nzoV9vdN5Xb
 9FGcNdhR4FObssvwzZE8/g==
X-Google-Smtp-Source: ABdhPJw6a8FuQ9JaLsqEzJHEmn2bKk+7WmqtRJ9dxbKbk2AHD0Zmxl5oga/5I8UwAGxardvLDEfNEg==
X-Received: by 2002:a05:6808:bd1:b0:32e:431c:2c4f with SMTP id
 o17-20020a0568080bd100b0032e431c2c4fmr737749oik.269.1654176956472; 
 Thu, 02 Jun 2022 06:35:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l16-20020a056820031000b0040ed6225457sm2196143ooe.47.2022.06.02.06.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:35:56 -0700 (PDT)
Received: (nullmailer pid 2162006 invoked by uid 1000);
 Thu, 02 Jun 2022 13:35:55 -0000
Date: Thu, 2 Jun 2022 08:35:55 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v5 20/20] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Message-ID: <20220602133555.GA2161972-robh@kernel.org>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
 <20220523132858.22166-21-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523132858.22166-21-jiaxin.yu@mediatek.com>
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

On Mon, 23 May 2022 21:28:58 +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, rt1019 and rt5682s.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
