Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08C7697C4
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 15:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6FE54E;
	Mon, 31 Jul 2023 15:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6FE54E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690810582;
	bh=vXYdwuWWssmuPwqUqCNDUS6WYl7HIDaFQxEbS2ZYzH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=judpxdsWJA/CenJFt0KQXhxr30yGXA7qfwlXMTkO5qCQO27CfcorkNG2IfjHVt/9C
	 +2dZF4WXy51xb6jNmBQv4VP1M4nnhG32DxMCJnX9XYjVCKm9gCvg6/RfjLDjM+isTs
	 oaImFDcbcxCsGLv1JyyPI0ZeKUDTd7hYFplGv1Rg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42934F8025A; Mon, 31 Jul 2023 15:35:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68D33F80163;
	Mon, 31 Jul 2023 15:35:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0266F8016D; Mon, 31 Jul 2023 15:35:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 851FFF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 15:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 851FFF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=jO2JHy7n
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E56EC6606FD9;
	Mon, 31 Jul 2023 14:35:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690810517;
	bh=vXYdwuWWssmuPwqUqCNDUS6WYl7HIDaFQxEbS2ZYzH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jO2JHy7n1CCI+MkmkIVqAgz4PNh61jcXkFQb66KzT/xDlFGZ+LU1DyoikiYVWjU/I
	 Eml2fnnNVguX7xXwEW3i+en8wZq86SeJSqZato8HOMB5H3wjnrUW9ev3hnmiRYaJOy
	 b4TfWAYgkYmNYuCoYbZhTLLjzxSx0ImX3A8+53m5W7jIGbBBHfHVVhaSynQXjgrxGt
	 /gNrXOzu6J1yj7GhWAS1bDsVSn+eSAFI/IdWtJwY9FSem1/jE3sWaWbtYAdCs+bzEp
	 bFwlVNYC1q/ZUWmwAfaCSD+R9wZRsGsRTDX2bHd73DM4789qG/Wvkb3KE5MLl2QJIm
	 djbkgGr70V4fg==
Message-ID: <3c6f6ca4-c563-525e-e773-3539678956ae@collabora.com>
Date: Mon, 31 Jul 2023 15:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt8188-mt6359: support dynamic
 pinctrl
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725035304.2864-1-trevor.wu@mediatek.com>
 <20230725035304.2864-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230725035304.2864-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BU5UDRLDAR3GGTABGMKHSTEV2IMRSLT5
X-Message-ID-Hash: BU5UDRLDAR3GGTABGMKHSTEV2IMRSLT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BU5UDRLDAR3GGTABGMKHSTEV2IMRSLT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 25/07/23 05:53, Trevor Wu ha scritto:
> To avoid power leakage, it is recommended to replace the default pinctrl
> state with dynamic pinctrl since certain audio pinmux functions can
> remain in a HIGH state even when audio is disabled. Linking pinctrl with
> DAPM using SND_SOC_DAPM_PINCTRL will ensure that audio pins remain in
> GPIO mode by default and only switch to an audio function when necessary.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


