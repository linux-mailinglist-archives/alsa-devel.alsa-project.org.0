Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7BA4D7FDB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 11:30:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C7C318BC;
	Mon, 14 Mar 2022 11:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C7C318BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647253808;
	bh=bwHJoPxyu/AsruLxj2fvTwgEqOZ11tvgaKSJ2SduNvU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrWMPeQ57STlcrC2YhlBSLXDG+AhGp7PhqBzFJTZKW3OqXUfadAi1b2q96tQ31xXB
	 +hKua4WQ75o2waXv992SWRRcyKGR8eWHo0R4d2yn9HJ9qg81d7PKzUJsV0SNC8hfYn
	 x6Typ3sp+w3Mfic8tS5pTAArVTz+a2cB7FfCB+G0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0ACEF8011C;
	Mon, 14 Mar 2022 11:29:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C781F80139; Mon, 14 Mar 2022 11:28:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A63E7F80100
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 11:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A63E7F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="C7Pxy4F/"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C73B91F4354F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253729;
 bh=bwHJoPxyu/AsruLxj2fvTwgEqOZ11tvgaKSJ2SduNvU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C7Pxy4F/H7J0euO4lGClMCo9eeB6EsBAqQe2Cwxtqs/Rj+fZfImezffwz8imhnSUS
 PXw0pBauG13We073OAWMG8HwjQIqgNSMWPxi44sV8xQDZBtIxNjvmSR4RvoVuCApCG
 j4aO7+o67W8/NbD9orC2PYd1bXVjE3R28VC9Vvb5OlCg1lHufKIa6XygCH8F+RLJac
 BbnJa/Cb5mbFm4g0JObcD20Zw2QxqHkV3Mp4yL1UQUAOqsZiP+QMLEqF+C/7sVdXee
 gLfi5vzapDWRvbLc+r/I7kOtDmjp5G/sp4vKMilLGvN9Bu7ZjALK9AMNaA28x+MZ9Q
 tjvCVw2taCy3A==
Message-ID: <2cdd1e7b-d1e0-7cfd-ff24-18320dbe2a51@collabora.com>
Date: Mon, 14 Mar 2022 11:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 07/19] ASoC: mediatek: mt8186: support i2s in platform driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-8-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-8-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add mt8186 i2s dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-i2s.c | 1355 ++++++++++++++++++++
>   1 file changed, 1355 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
> 

