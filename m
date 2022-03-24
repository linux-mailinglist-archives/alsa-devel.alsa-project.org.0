Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 140024E5FA8
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 08:46:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83AAB16B0;
	Thu, 24 Mar 2022 08:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83AAB16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648107997;
	bh=BnVHS6h5Gh84trbMb8OgFB+LCVYnDXlcMEKuxFAbQcU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WO9tcSRNoC5o5f4RXjL31NxQJP0WiikdcfLDt+V5b4Yb210B+ebkzfe5kwTxRJBZr
	 hII79eFTkLzp9vPpC22yBxM/Tk8H2B65aQ/DkhSpoNv+1xa8Zqs1LM3tEVIP3WYljk
	 0TSsHmFPjZCt7EwUZF+dcVuHZa8kBIS4BlegC3Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D04BEF801EC;
	Thu, 24 Mar 2022 08:45:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD128F80165; Thu, 24 Mar 2022 08:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64C0AF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 08:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64C0AF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bLutvu2Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82630B8217F;
 Thu, 24 Mar 2022 07:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE70C340EC;
 Thu, 24 Mar 2022 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648107919;
 bh=BnVHS6h5Gh84trbMb8OgFB+LCVYnDXlcMEKuxFAbQcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bLutvu2QgVXaYjMT9E6LteYKjL0MKAyLoZowrNBoFir1ic9GvP5pxB8Qn+2krNKsT
 e1nlqE+9Bxi+0O3yEKZlZAGGVG82yli47FYUoYtax9xqqFh2rz96FWGBaZ5yU51wLI
 IkIMjFwjwpyNOziCmgcUrchi+2Sls7dW24IYek69lHVfmNdarcIh051zIU47N+5Q1F
 mLUnF3S6L/VLwxyL7tckyP/ZL+0xGa6McgkCyET9q1abHUFUWANes+Pr4ehah0j46m
 PhjzhAHi/9qhbAyijiH7i+11LmXPxdatS8iuWtRQZ/aeU+zusa3p8PAIUymuuILivI
 7IaVWPk3AYkhw==
Date: Thu, 24 Mar 2022 15:45:14 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v4 2/6] ASoC: mediatek: mt8195: merge machine driver
Message-ID: <Yjwhiv5Go2d62JkJ@google.com>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-3-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, miles.chen@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

On Thu, Mar 24, 2022 at 01:38:47PM +0800, Trevor Wu wrote:
> Because most functions can be reused in different codec combinations,
> mt8195 machine drivers are combined to one common file.
> 
> The model and compatible string are used to decide which codecs are
> being used.
> 
> As a result, We can prevent from copy-paste functions when new codec
> combination is introduced.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
