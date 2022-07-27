Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1F3582D17
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 18:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090151635;
	Wed, 27 Jul 2022 18:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090151635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658940870;
	bh=G93Wn6NV8jzazJNvWFiihKKnz9UHJjDKOAT0bi1EPBs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SwyosjaDbjsvVxhw07UTo7z4JEGmqdFsdcKwtixjJwZoJwtn7d1q6HRBav1yQerFb
	 GwJ/rPkGBVTA1LuQT1KJL2Bx0R3ig6JCfITkcHTU23/Sgdwi7coyMqwYM2imubk198
	 8Pe+MgrL4PDPJU0TEBsBo9jp0txw/m05C7VYC3fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 650BAF80171;
	Wed, 27 Jul 2022 18:53:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D1BEF8015B; Wed, 27 Jul 2022 18:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 298DEF800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 18:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 298DEF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Lwkvkol7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R4fJvX006636;
 Wed, 27 Jul 2022 11:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=iesTYc/ViLkWIDaL0vep5f+nAcgKS6RyWgmV8RlYjKw=;
 b=Lwkvkol77K7y4mq5fF092Iqo5/qSJ2IY+nGc+YGDXmQZvMt3ETuAHD4ChzdmumioxpTI
 PU0sdZa20ypglZvtRZt93VQTmSa7SWa0UwoceqwKXpDKm16bGxN76BJZ3jfCIX0aY03J
 KZTYNK3ozQl+MT2p5CqfytzFn3JyErt+wh0BZ0TLwGSpJuV+55ENP2P0POHUU503CZqb
 a6MDrl0Q2ve0svGYOomlhIYh52pzSpnLlaCvtEr+PFSttwE6gvevjCeDKiwwopDdsElo
 ANI5GhsXPtHJx9k84X18FTxxjfTNZIMkZz1tN6zMDIXtX7+e4fGt/8ApeC1IcEBQMuCF SQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp56r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 11:53:20 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 11:53:18 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Wed, 27 Jul 2022 11:53:18 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 96AB62D4;
 Wed, 27 Jul 2022 16:53:18 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:53:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: use spi-peripheral-props.yaml
Message-ID: <20220727165318.GH92394@ediswmail.ad.cirrus.com>
References: <20220727164050.385241-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220727164050.385241-1-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Fb6-zD7Ylv_XSpFuYJi-AaYf5TVKMTY0
X-Proofpoint-ORIG-GUID: Fb6-zD7Ylv_XSpFuYJi-AaYf5TVKMTY0
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, - <patches@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Wed, Jul 27, 2022 at 06:40:50PM +0200, Krzysztof Kozlowski wrote:
> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
> 
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
> 
> While changing additionalProperties->unevaluatedProperties, put it in
> typical place, just before example DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

For the Wolfson bits:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
