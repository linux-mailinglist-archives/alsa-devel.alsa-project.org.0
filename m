Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B405E7BDB9F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 14:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFA21E0F;
	Mon,  9 Oct 2023 14:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFA21E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696854158;
	bh=ipB1t0cSQBymxpdIikiz/0GTXsJ8nWOTmw69GaAQ2UQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uBGQILDCYo+ghDEWFe7KH6BOUPFyRVeblUi4BP2U7tYROxIjAxW2mTygWz4/hoPed
	 FZwzMVCl8bX3ruXm99n9n06svcDX8mmyJ3h/1p61iulxWeWcqgpMc/bM00ISCCzoKX
	 ni9GjgZW6CC7+mzOCNlH7Vz0JHl7YAAv3eUYhCls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3A89F8055B; Mon,  9 Oct 2023 14:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DB33F8055B;
	Mon,  9 Oct 2023 14:21:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67923F802BE; Mon,  9 Oct 2023 14:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E362F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 14:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E362F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Jr18bvPe
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F2D0660708F;
	Mon,  9 Oct 2023 13:20:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696854048;
	bh=ipB1t0cSQBymxpdIikiz/0GTXsJ8nWOTmw69GaAQ2UQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jr18bvPegygn6tygNt5zBGY+jZ5jyWS7TnxSWSDFQsK53uootGZUv6iArYChIfpvb
	 LsUHOvT8lMcXXTnztBSWd22Xt0QABmwW50y0q9uiipRjqkIy+AwgDC3vShB9Mw3ooz
	 3+9HAfDGNYVOdCxao8Do2Ye+re+VDFgVgUgRw7gkmBHkCxyaAd1OLli1R2TShQU403
	 Y/ZrCoge1oU/c0d/aNDiR4dHaosENj1Z9+dBUrfhDbTpgilEHk9lCg11ho3flFjrD4
	 F98R5O1/W4y0J5z6fi0MEqgZ0Vt/gm9Js7bTvH2AVRoX6UGfX3gre4FB6rFdfzd50D
	 bTzA8bI32aQ7g==
Message-ID: <cae3a6c2-d6be-0795-f242-100019f1a070@collabora.com>
Date: Mon, 9 Oct 2023 14:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [v4 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: 
 <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231008014629.4971-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: 
 <20231008014629.4971-2-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2PN3UL6UQ3EYBDM2VYXHY2PJHY6AVFIU
X-Message-ID-Hash: 2PN3UL6UQ3EYBDM2VYXHY2PJHY6AVFIU
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PN3UL6UQ3EYBDM2VYXHY2PJHY6AVFIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 08/10/23 03:46, xiazhengqiao ha scritto:
> Add compatible string "mediatek,mt8188-rt5682s" to support new board
> with rt5682s codec.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

