Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD7719840
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 12:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3CA082C;
	Thu,  1 Jun 2023 12:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3CA082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685613879;
	bh=fBGL4bPqrWdlEx8OCDvLG0uYfi343SDPLIkWwU5ZiK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q+XlcxyBg+6Ul5dfTNAgDKGpIGR35quxrMrCsdYKwtZn2nngAomjkZ6Wn2Eh9CXQl
	 inmcBUlvgqE9JAFt9JJ1deJPY3AZQjqizHva1JQ1QvTLGa/WAkpNZg+/WixLgC47Fb
	 U9MNFdz5VlBs6TB//tx6K/dHkDCihDDu5hbG+ywc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E1ADF80568; Thu,  1 Jun 2023 12:03:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D796EF8055B;
	Thu,  1 Jun 2023 12:03:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B915F80564; Thu,  1 Jun 2023 12:03:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BB7FF80552;
	Thu,  1 Jun 2023 12:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB7FF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=POcatlQ+
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1896A6602242;
	Thu,  1 Jun 2023 11:03:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685613792;
	bh=fBGL4bPqrWdlEx8OCDvLG0uYfi343SDPLIkWwU5ZiK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=POcatlQ+8JMl+loYBG85HYHQ9cQPvs/hL3XzH0Zdbb2NGX2H7TnZkWYxaP61MAykd
	 mI/bdIT+3WB+37YWTwrzPLYxg1mbUV+2AHZ+Y5gvvl6PZ+yJ0oulJ97HMcwPYZYGlr
	 V/GmGNPh70TffnKo7CNx0K+UdTlBY/lnPodb6ykFTC79druf4Bqn/FD+atu1GpE0m8
	 WQ87UbMG2dNpudyYJ1aQpPpoPw2LQA4Emk+5RRa44tzLZ/hocffZPJga5BV6x7MvmB
	 K6kM5FJzu0cxBhZrcvxbyYNPgoyo3DlZTbJa+IxddVMK2YPGWikx/IVqaF5D6XXpDV
	 KQjpImX8cbeFw==
Message-ID: <21719c2d-a465-35eb-8ce6-8ad3a376b883@collabora.com>
Date: Thu, 1 Jun 2023 12:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/1] ASoC: SOF: mediatek: add adsp debug dump
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, tinghan.shen@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601034939.15802-1-trevor.wu@mediatek.com>
 <20230601034939.15802-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601034939.15802-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 56UC3NDP3ZQJF3VUYWAYHD7CWTQVEXZG
X-Message-ID-Hash: 56UC3NDP3ZQJF3VUYWAYHD7CWTQVEXZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56UC3NDP3ZQJF3VUYWAYHD7CWTQVEXZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 01/06/23 05:49, Trevor Wu ha scritto:
> Add mt8188 and mt8186 .dbg_dump callback to print some information when
> DSP panic occurs.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


