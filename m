Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 200186A6B71
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABEAA20B;
	Wed,  1 Mar 2023 12:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABEAA20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677669116;
	bh=4v4GBWA4PA/XVvMsfs2bisSUcSFmfwSDKbb1tUfLCw8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o4BUGEqKlwYWPVdgSLQLcyjcyhTUnuq6M+u7OLFDICLgLqfxyJmOlWQthdpRSz1vU
	 20P3K2XbRZR6PhR93lxOrhAYZ4GGYx17OsLJw6BFCdHv7TQYYS1vTNSBjYnNeawdnI
	 T91WgreMKJV55HBddO+Yh61mf5vlCmjLTJ5JCFmQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00FB4F804FE;
	Wed,  1 Mar 2023 12:11:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E5A3F80520; Wed,  1 Mar 2023 12:11:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAAA3F804FE
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAAA3F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=CFi+J3Ny
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C29E66020E6;
	Wed,  1 Mar 2023 11:10:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677669057;
	bh=4v4GBWA4PA/XVvMsfs2bisSUcSFmfwSDKbb1tUfLCw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFi+J3Ny2k8aOsMdFamx53fnd+38XmZ4i38wb42qoBWltE515E1u/HmWWoSUR5/LR
	 AV0XI9VZuhLKrZoOo+pPZeX/9gBZQwC5QeM0OcOzh3npjBHYvrWWe5Ii+WDayYVvNg
	 lb4zZT0GlB6YjVEFlZ8W5H8ywnh7cpl6CCadK3ZrDfq+XkMgn+tevzwEpWOg2Ifrnv
	 osABDshFWDg7bo5vasvt0ighqc+hwcFFePegOwRPPymnPGrapuyNKB7KMZGsIHgH+o
	 fDLPlZuSsvCIKlQoaidqOs/CSQequ8dxSf3mfE6C1QbaTmLrj0so4dLPTx4PVlZmuF
	 2OVzKZx3P0LDQ==
Message-ID: <ab6d0e1a-996b-b17b-7573-9141640bf759@collabora.com>
Date: Wed, 1 Mar 2023 12:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: mt8195: add missing initialization
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
References: <20230301110200.26177-1-trevor.wu@mediatek.com>
 <20230301110200.26177-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230301110200.26177-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6XWLTOTQFP3TQX6J25R6FKBFQWMRQCN7
X-Message-ID-Hash: 6XWLTOTQFP3TQX6J25R6FKBFQWMRQCN7
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XWLTOTQFP3TQX6J25R6FKBFQWMRQCN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 01/03/23 12:02, Trevor Wu ha scritto:
> In etdm dai driver, dai_etdm_parse_of() function is used to parse dts
> properties to get parameters. There are two for-loops which are
> sepearately for all etdm and etdm input only cases. In etdm in only
> loop, dai_id is not initialized, so it keeps the value intiliazed in
> another loop.
> 
> In the patch, add the missing initialization to fix the unexpected
> parsing problem.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

