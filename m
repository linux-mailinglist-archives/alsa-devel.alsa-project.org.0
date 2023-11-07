Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6477E415F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 14:58:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CFCF84B;
	Tue,  7 Nov 2023 14:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CFCF84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699365525;
	bh=gD0fl91BJJYK3GHx/hIeJyQppl6gbLh4shexoNrIjjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MtCNu1X8mARDZB+Ladu7oEzvqTm+pav3x0YXwLsbrPAGJXbCoBOhAkMowgdgL3rLC
	 8fSBLNlKgupMybm0EVphMGQnoGYEcv77tcvEj8pNZmyZBIW4IrUX6+4OE+3COOUHsY
	 PhfiWfeitZQUtz9k0kMsTGc25pOV7QlUKqRY+Ozg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13A04F80563; Tue,  7 Nov 2023 14:57:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 667FDF8055C;
	Tue,  7 Nov 2023 14:57:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 872CEF801F5; Tue,  7 Nov 2023 14:55:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AF81F8016D;
	Tue,  7 Nov 2023 14:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF81F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=QcqO2yXY
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 918F966074D1;
	Tue,  7 Nov 2023 13:55:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699365309;
	bh=gD0fl91BJJYK3GHx/hIeJyQppl6gbLh4shexoNrIjjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QcqO2yXYIc5T2HT+gxP6HwXtEnNzcgSallJ2Z8xbss9ad3Obsd56gxp1SL4XSWAR/
	 m/u+Tf8mmUlmyo54ve2QktQ/8pYP6P8ztKS5xp1IyH5bpaH4za2b4yzLvqMMsHD2gZ
	 fb0il/thr9lD59BBj4ldFbXxLD35eWQT/TOzE7QrnYwUfLEi0qV2z1qqmBPh5OUoFm
	 8ddaNcMnI1D/6iG5W0KRHjXMYSOKxtiTJg8/ro+u9725fzDb5n/QPg+I7gMF7fktZy
	 hGEAR+zGjS6XLQgvzuX02uRnO37PUtcHkGX9AGyyfe3dc0820XhDLIKubR0RauVm8S
	 ulKBYnU5r423g==
Message-ID: <3b440a39-593d-4426-8268-979d12ae36f4@collabora.com>
Date: Tue, 7 Nov 2023 14:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: SOF: mediatek: mt8186: clean up unused code
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
 <20231103095433.10475-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103095433.10475-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X6SEGQBZ5MDCS5KEG7L5IVIUMDM3VQ2J
X-Message-ID-Hash: X6SEGQBZ5MDCS5KEG7L5IVIUMDM3VQ2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6SEGQBZ5MDCS5KEG7L5IVIUMDM3VQ2J/>
List-Archive: <>
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


