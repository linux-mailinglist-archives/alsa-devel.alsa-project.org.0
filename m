Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D843AC35
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2650316E9;
	Tue, 26 Oct 2021 08:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2650316E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635229151;
	bh=UC5+kIB/cQuuDVHU5gR2AvUz2KmkMvQYXYiH83T5d/E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NbS9O0+inwpyRUyqfWn1num8QjGHmO+M0r+uvLLmLuHd/CN4nrkk1dP0k6LYWnt7m
	 YyO4s11luKMYO3GqOrSom7/8Jvo8BIg8laoZdqfJ4o3+RMXMOcDyN43ahk1njxXZ3H
	 WN7B+6htt3YcsB3bsED+GYfvi8Ita7by6g1Pkl9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7205F80520;
	Tue, 26 Oct 2021 08:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAF7DF8025A; Mon, 25 Oct 2021 16:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AFA8F80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 16:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AFA8F80086
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5DB1C1F42EAA
Subject: Re: [PATCH v3 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
To: YC Hung <yc.hung@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <20211025105635.30625-1-yc.hung@mediatek.com>
 <20211025105635.30625-2-yc.hung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b11f6124-9c94-3c09-7f15-ce952b5f27bf@collabora.com>
Date: Mon, 25 Oct 2021 16:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025105635.30625-2-yc.hung@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 26 Oct 2021 08:14:36 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org
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

Il 25/10/21 12:56, YC Hung ha scritto:
> Add adsp clock on/off support on mt8195 platform.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/sof/mediatek/adsp_helper.h       |   2 +-
>   sound/soc/sof/mediatek/mt8195/Makefile     |   2 +-
>   sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 163 +++++++++++++++++++++
>   sound/soc/sof/mediatek/mt8195/mt8195-clk.h |  28 ++++
>   sound/soc/sof/mediatek/mt8195/mt8195.c     |  22 ++-
>   5 files changed, 213 insertions(+), 4 deletions(-)
>   create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
>   create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h
> 

