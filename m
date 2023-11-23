Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD347F5D95
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 12:18:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1536E74;
	Thu, 23 Nov 2023 12:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1536E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700738281;
	bh=2iodxh4WFdUN0YUDs8e2jORssg12+fCUm/I386AK+n0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pXjH4sAZPvSKih/qurna/Klpl8TWrIT9bvgb/Tv6m6Y85a2A6fTuVqa7qeWwIApBy
	 peC2TFlZN4o4wzfS+k+Ce7VE7VolV/maEa1FO2fvr/+R0sCO0JQpQqAPNSYsk5w7j/
	 GogLRVhOBboKJSbNKz69r7/ySSFN9lG2jCAaQd0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF83F8055A; Thu, 23 Nov 2023 12:17:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61161F80579;
	Thu, 23 Nov 2023 12:17:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54D50F802E8; Thu, 23 Nov 2023 12:17:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4C4BF80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 12:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C4BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=UtE+qT0b
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD3586607399;
	Thu, 23 Nov 2023 11:17:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700738239;
	bh=2iodxh4WFdUN0YUDs8e2jORssg12+fCUm/I386AK+n0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UtE+qT0blWGNvMpufqC2Ubyc9FWynPNxujH3YsMq8FjcF6hy5CTCxElfzz6oeV0sp
	 Lqou3s23pBgY8+WDrGh0n6JuLA8ZDWiT/1L6U6leovnk38fnvULQOWtUhPqBaD9yKs
	 7avw2udD0LiKgmSs5U0X67ave7Bh1MhfmGf53Xy9MC5ts/o6zUt6YibDSA0sWtWUOg
	 WV2WUUXnXgpW3kp71HqVO9nqMu/QevDthr/cMpznrMBEuuExabn2LR7bMAPSzzh0ba
	 XVqgdI+yUjWZNEDgEkEFmGHIDCSjwjSZJ15g+NK7GhK7VkHiSz0nonfDluE85sljnG
	 gORtC3C2h7j/w==
Message-ID: <0311dcdd-1c70-41ff-b170-dc2782f7ea49@collabora.com>
Date: Thu, 23 Nov 2023 12:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] dt-bindings: arm: mediatek: convert audsys and
 mt2701-afe-pcm to yaml
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20231016203915.9793-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016203915.9793-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LQHCV7YH5QRPS5AMGAS3SEOIDUF53PKR
X-Message-ID-Hash: LQHCV7YH5QRPS5AMGAS3SEOIDUF53PKR
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQHCV7YH5QRPS5AMGAS3SEOIDUF53PKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 16/10/23 22:39, Eugen Hristev ha scritto:
> Convert the mediatek,audsys binding to YAML, together with the associated
> binding bindings/sound/mt2701-afe-pcm.yaml .
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


