Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38997489672
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 11:34:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8BA91843;
	Mon, 10 Jan 2022 11:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8BA91843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641810889;
	bh=2RUQqzhkgeAucXj7HYfBKT/y4bikX1Eg7oMd4pMt5ZE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYeZ3Z6DUXAfPB0lTEXh12BqNe+sPtt8E3GPvvYFtXjNlVi6iNNCQFZ7Ri+XTct0C
	 oVltptRvOp+NyMqv+7aeiGy5R7b1wjYxQ3VoxRO3X1gomOwXDFeYqWWS/Qp+kz0Ofe
	 9NnSnSSBq3KXlTWjTIMzyquf5fyafjgUJp63Y6p4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46CC1F80134;
	Mon, 10 Jan 2022 11:33:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02566F8012E; Mon, 10 Jan 2022 11:33:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 512AEF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 11:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 512AEF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uXYTgRqN"
Received: by mail-wr1-x42a.google.com with SMTP id a5so21882791wrh.5
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 02:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ux09BdvBfy5otBeH83si9wqeKjp8gHNJ9Zt3Er9zFxE=;
 b=uXYTgRqNTmPW/huo6KEYGPOM4ISUhPLQBff/OQu1mryKVB8bfEA9SMGpAzs8WENMSr
 fuyNQuevmAkNaM1DIBs9B5ePOxvg6kIQUNCfH4GFaXO0BAGjC6GgZqB5Fa+1alU087Z8
 P+Vm7f+/pCXvExKs6et7iTpYsEWdwEv98+Oj1Ut/3CLURBSYQn8BBRcI2i4huO0Nyhig
 jAh0PzBKkTaun4SPlD9rbsylUIDBnG5CqjHmWput0432gybnuR4m4QvkFs0RSDDvlb27
 XDCH8P8FAS/PXCOIbQZcLNaqtzSULbKkPi6r/pLPsz//6OCjXG/9tpB7zbwtR5B9wtSf
 7hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ux09BdvBfy5otBeH83si9wqeKjp8gHNJ9Zt3Er9zFxE=;
 b=o2lLjc3uG5zh/cG7uwpu92GuVMADSz5f+weJO9Qz3kMu8n+PTO4DL45cLRqed3p2wc
 6lyYh0OdEb6E1iH6oVefPqBhikBWIoPwR+afMIqUVjeY8AS/6+C/ahdjBFmR66ACp+W2
 l6c4uKMG1PLTkLfWBmWV+4y9ENGl3NGTUYPT82EbSG+rBtuS76fhx77Y7lerFyaFDMU0
 tXQ+aLIC0/aA+sZdsZLefvbB+0FTZlKXK6yLxsxXWWaAd4hAPo7IlawH0Ze2vxmUBXdW
 JrKDZ4pn3p6U2qoiutaeCPqRqjOTGKwpFZ4oS5L6HOFIesTDDHwX3gj8yLFGWbplsbJV
 A2rQ==
X-Gm-Message-State: AOAM532+Z8LWrCiG4SbWTEmig28eIsKFXESSHjbzt7o5jAj493UqkRkl
 nXAcEmufotR+W3FePEFKiRiFkg==
X-Google-Smtp-Source: ABdhPJzMfF4X4m8rqBSMupPmJ6wMSv1HcNXmy8LWfHPif6guaPAHOVr+QYANksWrPaZREcLyZVwvuQ==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr63672846wrq.273.1641810799760; 
 Mon, 10 Jan 2022 02:33:19 -0800 (PST)
Received: from google.com ([31.124.24.179])
 by smtp.gmail.com with ESMTPSA id ba18sm6324269wrb.40.2022.01.10.02.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 02:33:19 -0800 (PST)
Date: Mon, 10 Jan 2022 10:33:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
Message-ID: <YdwLc2ZTERBoXgxR@google.com>
References: <20220107031905.2406176-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220107031905.2406176-1-robh@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Suman Anna <s-anna@ti.com>, linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jakub Kicinski <kuba@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, John Crispin <john@phrozen.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, 06 Jan 2022, Rob Herring wrote:

> 'interrupt-parent' is never required as it can be in a parent node or a
> parent node itself can be an interrupt provider. Where exactly it lives is
> outside the scope of a binding schema.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -

Acked-by: Lee Jones <lee.jones@linaro.org>

>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
>  7 files changed, 15 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
