Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED67E4155
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 14:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01BA26C1;
	Tue,  7 Nov 2023 14:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01BA26C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699365475;
	bh=lEovXn58/a4qnfn12fKn636CmpY/k7Bme8lkfOulb/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vUl/RSKpMZPklEgzq7vskPQaJjjFvNNGDAwdQzLMSv3mjUU1XChr509ZVdxHD3U9u
	 yjX8gh/nLkxHBXte0LSI1GC87rHSK9JZd4NEAd4TiX23AHcReG7sNKAmIPBKxeWF93
	 HpbaFACWRgaeJs9DzZssr72gA5hdkiOMKxWJ6+fg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28537F801F5; Tue,  7 Nov 2023 14:57:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF979F80169;
	Tue,  7 Nov 2023 14:57:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7CEAF804DA; Tue,  7 Nov 2023 14:55:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2968FF80152;
	Tue,  7 Nov 2023 14:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2968FF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=b3cY5YwB
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D88066074CE;
	Tue,  7 Nov 2023 13:55:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699365307;
	bh=lEovXn58/a4qnfn12fKn636CmpY/k7Bme8lkfOulb/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b3cY5YwBIxpK4sAvXA6iiM2EDfd+5tG/YQQgKjaRzy6Q2pPcZo+fL2kgLsimWGfzh
	 ChwLHWADVMWoPM9DBcoGGkynvuiJt+qmzXGUwPA74HFfctyEtdH5ZcZfKEDne/hv/5
	 oTSZJ9ogffTuXH9OkMCvrjlGyjCYUn/DIEEYvdkONqf0+idjbq32qrPF66yqGMciBE
	 3eaJ/gZFZbXfY80AAXV7/Md2iyD+CR7zBA9eXnFsxi+BzA7NOwgArqE5vlrq9T/y+8
	 fPR3wxQ9OC04v/+792yj0/jjK9r8Ne5WRduqQJHOYjDKkOHFW7uCNRTxjpiQt2z37/
	 bhojXkVF5oMQA==
Message-ID: <534c55c3-d045-4c0b-a374-431ac0fe4751@collabora.com>
Date: Tue, 7 Nov 2023 14:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: SOF: mediatek: remove unused variables
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
 <20231103095433.10475-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103095433.10475-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2Q2XFRCERKY6IEX36AM63WMJMYVPZ3QJ
X-Message-ID-Hash: 2Q2XFRCERKY6IEX36AM63WMJMYVPZ3QJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Q2XFRCERKY6IEX36AM63WMJMYVPZ3QJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 03/11/23 10:54, Trevor Wu ha scritto:
> To prevent confusion on the follow-up platform, it is necessary to
> remove any unused variables within the struct mtk_adsp_chip_info.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


