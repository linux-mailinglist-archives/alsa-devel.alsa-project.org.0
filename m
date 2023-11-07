Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA67E4160
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 14:58:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1714B1CF;
	Tue,  7 Nov 2023 14:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1714B1CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699365533;
	bh=t+HcwzzdP0EmPq5p4rIAi7MQzNNURloc/LR1PJVAFxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MvpM3mYWk6LkPIGyg/J6u4clRwVnYGYIUDS5CRXdTFMDKjs81Hrp115skwu/4ZpPl
	 JpVlzugMfCqvc5Lm7lZISoyL7IQERoa/iMaEWou9qHpAxCtixHQammu5wQPvA8m3Sr
	 4tsujq/pDYG0T6RJCWsua6KJFdKu1xXtnVaSvppo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D10A9F80571; Tue,  7 Nov 2023 14:57:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33468F80588;
	Tue,  7 Nov 2023 14:57:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0914F8016D; Tue,  7 Nov 2023 14:56:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5902FF80169;
	Tue,  7 Nov 2023 14:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5902FF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=QC5U2jng
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F0FC666074CF;
	Tue,  7 Nov 2023 13:55:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699365308;
	bh=t+HcwzzdP0EmPq5p4rIAi7MQzNNURloc/LR1PJVAFxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QC5U2jngIN5RD27TfTsXzdUgLAzLn3b6MspIt0QmVH1+awm4vQ0rSd7B3V0BT6VPw
	 k4j9LoJ+w0moNKDvQQyMUc7FSg+LIRYnomTIRdCau8QUW5ql2+nEokyVkM4GzNwjfG
	 71dAp20Lkp0kLsZiiyrfYEWpW3WPcnhUyvPL4IPQrifJlWrJqcxEvowl0K1PSzeyMt
	 xptRn+iJGKETLugIw8iDFw/V9CLwIAK8ox4aHthOcsUjnTReep6QpthLFUjQPrT7fs
	 Z6DZb8IoSKlCjPo3Xlth6FqwEJBJssymZ0tSbTn0tTbOYHIlkSFqIb5qCi/n+/gKsN
	 H2W9q6QlzfObw==
Message-ID: <c6af0adc-4ecd-4be3-934e-621a9166a499@collabora.com>
Date: Tue, 7 Nov 2023 14:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: SOF: mediatek: mt8195: clean up unused code
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
 <20231103095433.10475-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231103095433.10475-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O6AAUFHJSNP4LQRSP2XIUJ4QTMOC75L3
X-Message-ID-Hash: O6AAUFHJSNP4LQRSP2XIUJ4QTMOC75L3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6AAUFHJSNP4LQRSP2XIUJ4QTMOC75L3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 03/11/23 10:54, Trevor Wu ha scritto:
> Since there are some variables that are no longer being used, we remove
> the code that was implemented for those variables.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

On MT8195 Cherry Tomato:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

