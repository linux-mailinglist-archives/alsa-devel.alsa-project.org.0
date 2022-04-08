Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B044F9278
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 12:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD15190C;
	Fri,  8 Apr 2022 12:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD15190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649412153;
	bh=y2Z8H4r5yL5fYxfps5SscpYEsfiWgrzqC4K+pnf/lyA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRaHktqjtCNUIn4j7CN+WtjI6tA8bGKwDATgfrdfVH4tLcJ3zFK2P9vMopNwPOhPl
	 tyUhVk1R8X9s3Zm7ilZs4eVVDNe3x+cI2V3pJkgLzo8kRawDAHOnN60sdBFxqfQx9g
	 IY8QpN8+ChUND5LUReQYIp6gLBa96CV4/0dVWpf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F600F8050F;
	Fri,  8 Apr 2022 12:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD59F80116; Fri,  8 Apr 2022 12:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ECD2F80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 12:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ECD2F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="L5h59Cyc"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 865581F46D04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412083;
 bh=y2Z8H4r5yL5fYxfps5SscpYEsfiWgrzqC4K+pnf/lyA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L5h59CycUo+jq7lWmAiMkXvl3wNFJp5cEoROTefBRkPTCrtlSnVmpK76P+n6W1vl6
 Z+1UHNmCeIVigvB9n7Hc5zbXaWneCBR24v06HTYBAbbvM5n7uHVX8BdBuYRymsM/oA
 YS67LvnFEC0ZPFIr7ApecusZPzqbAAwFwMkShV9mCltWDzg1QGRY+E+HXmmEzkhEpQ
 oLXiEAS2dwCkXaC1HEylmFCpBO/VUBWD+9FLjSOMyj+5ohJ8CPVLLoJGAdJOTm0Tgh
 umwwshvQRybzkyfQwxDtpiQjruxDsxDCeaPhDOIkM5KvnIWEklWaSKJ1w+IuoTSUJt
 LV+8F0VyUmadQ==
Message-ID: <4f9fbf6c-e4b0-c3d8-d340-0e5e018b3c42@collabora.com>
Date: Fri, 8 Apr 2022 12:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org, nfraprado@collabora.com, tzungbi@google.com
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
 <20220408060552.26607-2-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-2-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linmq006@gmail.com,
 Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

Il 08/04/22 08:05, Jiaxin Yu ha scritto:
> 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machines
> with rt1015p and rt5682s.
> 2. Adds new property "headset-codec" for getting headset codec.
> 3. Adds new property "speaker-codecs" for getting speaker codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
