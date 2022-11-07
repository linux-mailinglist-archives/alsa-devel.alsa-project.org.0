Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F415661F5B5
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 15:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852851E4;
	Mon,  7 Nov 2022 15:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852851E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667830814;
	bh=mif3qn3xqCd8aP/nkWjlrL1oW7XjaH5g2PK3HDhAi84=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYVfHjLTRb22UFqruB3HR9xtXB6hBw8zu2NILSOeO/u/cyQLzNTGAaRycgf17PLME
	 ENb3yd+yjmvp2M3HYJsdTpTywBcRUt2FzMzHZNGc5wPabkvtX5aLAWXvfF7NFb/m+R
	 rF6HoMpRfx725yepaSP2AbGlueWOhdwn5m8TGmCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05BA2F800AE;
	Mon,  7 Nov 2022 15:19:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7801BF800AE; Mon,  7 Nov 2022 15:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2E71F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 15:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E71F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="jgBKXah+"
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4B97660239F;
 Mon,  7 Nov 2022 14:19:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667830754;
 bh=mif3qn3xqCd8aP/nkWjlrL1oW7XjaH5g2PK3HDhAi84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jgBKXah+RA7SIC0Q4KCuj43Bx8oHJJahN8t+3IkG7Ran+4yxX4eKJfiYDeWRTG05H
 XF8mOBWG7dBSxJX4EC2S7I7BaRYpuNlqJFEv2HvxArpu+ivWDq8Fyy/g84m6VjModV
 7u5weXvP/Bj4IfiN8zt8MxD8ozAeakJ8FAa6WdoUGnvhu//odgGPMupz+1VsvY+6jc
 trKaP8zfNs7rxJTvGBCmFgOHPibVES1yxSbWl85xaxrloXxM4E+jVpyH1bRhzaejsf
 uMudsdFXoUMxNFcKmbvWC7ucJbxTBI4/cxnah0qnS3SSouArDSXLF6Y3RYt9LXumY1
 OPKTB0GEqbFMQ==
Date: Mon, 7 Nov 2022 09:19:06 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8183-da7219: Register to module
 device table
Message-ID: <20221107141906.jrs5gwmwi2eakvvg@notapiano>
References: <20221104212409.603970-1-nfraprado@collabora.com>
 <63325548-63c6-8405-6481-3b019e7dd656@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63325548-63c6-8405-6481-3b019e7dd656@collabora.com>
Cc: Miaoqian Lin <linmq006@gmail.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
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

On Mon, Nov 07, 2022 at 10:06:51AM +0100, AngeloGioacchino Del Regno wrote:
> Il 04/11/22 22:24, Nícolas F. R. A. Prado ha scritto:
> > Register the compatibles for this module on the module device table so
> > it can be automatically loaded when a matching device is found on the
> > system.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> 
> Hello Nícolas,
> I agree but.... can you please do the same for 8192, 8195, 8186?
> 
> Getting them all in one series would make absolute sense... :-)

Yes, I was planning to do that in a following series, to avoid extra churn on
all SoCs in case some change was needed. But perhaps I was being too careful, I
can add them here for v2.

Thanks,
Nícolas
