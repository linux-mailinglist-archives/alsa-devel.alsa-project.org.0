Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE218637648
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 11:24:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6162E16C9;
	Thu, 24 Nov 2022 11:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6162E16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669285455;
	bh=ep0/8WFmmF1DLAjStgRC+286Uemc17K0xldJybIShBc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z6IKyn4C5H/Uk+/t3Q9ni+nOSdcxTfoHB0bsrPFl4aTP9uwHRz1dKB6Dsjgv7Lh9c
	 03mP6lwKftEF7eoZXEvTkrKRDg3e6L2hTij4HrXYSzdS/8P6PItOw5r996irkIXkcD
	 GsaroDwCOoTEBqc2Q2q8c5wTyRoKtOCO3CE22v/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 010ADF80448;
	Thu, 24 Nov 2022 11:23:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6212F8014E; Thu, 24 Nov 2022 11:23:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 144F8F8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 11:23:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 144F8F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="awkyrvSe"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 18D596602B19;
 Thu, 24 Nov 2022 10:23:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669285391;
 bh=ep0/8WFmmF1DLAjStgRC+286Uemc17K0xldJybIShBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=awkyrvSeqIxToj4LbnERqzihnB06rBYL1VQ8mappgQrBM8rxkeA7GHzEVFAoTZ44g
 YaYyRFSzIJ1E6UsjmG5dKkPujzeDcPfNqMcU/gsIlCReMvv9nsANFPvM4+MiwnkY3H
 nX8PUc55Kmw2f+BdY78sCZag5dQPJWLOOY0Xu3ZTtUK+nnjnHmOl2uVre+ek9sBBIF
 9o3/SgLy5Qk9mUrg5Uv8RDfclM7ABCfpAxFWRY3MbRUANNVYsXm5/4F6/6v0erU23D
 I3Er7mbzYdneoDgn12Rp1whvWCCG86C3pjqi9XhlaUcGeXAwPktI6txYKno1sQzb+M
 SAAMrTM8s07Hg==
Message-ID: <38ac71ce-b38a-4fb1-ba21-aa5c91283bd9@collabora.com>
Date: Thu, 24 Nov 2022 11:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] ASoC: mediatek: mt8186: Correct I2S shared clocks
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 nfraprado@collabora.com
References: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org
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

Il 24/11/22 03:30, Jiaxin Yu ha scritto:
> In mt8186 platform, I2S2 should be the main I2S port that provide
> the clock, on the contrary I2S3 should be the second I2S port that
> use this clock.
> 
> Fixes: 9986bdaee477 ("ASoC: mediatek: mt8186: Configure shared clocks")
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Sorry, had both versions open and I've sent the R-b tag to the wrong one.
I meant to send that only to v2.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

