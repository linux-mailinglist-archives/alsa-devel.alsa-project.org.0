Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE352E0D60
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 17:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526A416D5;
	Tue, 22 Dec 2020 17:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526A416D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608654543;
	bh=TL0OpA64GzFmwToXJLX0r9Oq1tR4MpAMJvZ6vZ0Fdyg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVJqsezHT5/LwaoHXvsYgTyh7UlUPp1yoEWkxTC6giayUWGwida2a7VzN/qIdPT+L
	 7W4ToWnPs7RX7cPphhBly4sjhqFjsoQieE+L7OATgC5kLQy88xM8pgs2Ekzj0VCmfp
	 QdmwUAsN0u4BNOiqmXt5etg9ToQDPNp+8b5U9qXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4941BF80232;
	Tue, 22 Dec 2020 17:27:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AFB1F80224; Tue, 22 Dec 2020 17:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 009D5F80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 17:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 009D5F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iDgzLpQB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5D5622AAE;
 Tue, 22 Dec 2020 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608654434;
 bh=TL0OpA64GzFmwToXJLX0r9Oq1tR4MpAMJvZ6vZ0Fdyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDgzLpQBBXH9YTfFBKVQJYN6MYAp0jCmF55BRi4QMkWj9bvJlAMGoT5ymjLbEQtzw
 3tEM/W5nGCHA3+B+VwbF798B2VViU6tS/mjzIV7x4TgTTUMiDOkQq5MI3n7dW9zA5E
 FSw9Km5td0sUQBbjY85j2Q3PdKmI6mps5XRQCC2ChSGNeeoPAZ528rrHsxGFxTJSNt
 5g4vgoUpkM5Ac394XVjisDu4ydN3le5yZm44TWYT94ZnALtWvXTqjsMhTMGaD8dqa1
 Gk5eCeSwlpTHzab3W/rGF8KZK1Pw/MvIBODzv2zvbb43/pVQ+KG76KZIpU6ryF/bZW
 0vu2GqQzMYCJA==
Date: Tue, 22 Dec 2020 21:57:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
Message-ID: <20201222162709.GA120946@vkoul-mobl>
References: <20201222040645.1323611-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222040645.1323611-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
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

On 21-12-20, 21:06, Rob Herring wrote:
> 'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
> preferred for a single entry while greater than 1 should have an 'items'
> list.
> 
> A meta-schema check for this is pending once these existing cases are
> fixed.

> ---
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 1 -
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml   | 1 -

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
