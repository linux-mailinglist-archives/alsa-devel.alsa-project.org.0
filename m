Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E443972BE1F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 12:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A700826;
	Mon, 12 Jun 2023 12:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A700826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686564089;
	bh=r44Dg4EqyihdbL+KAokT86pfSJw+jh/v00yaiQZ3zZg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tn8YLIFQaGrwmPRNBgytRX7+joslN0p5Ppqn0ce4KNlEfF1VkteAzqiVVQW/Jf2TD
	 uU8BhilY9898zEiVZXykJ3dbBsO6BN9D8ryOvhormrxl7BHVQSBzjeIht9XVlrThJV
	 JOPEaE6EboPuS+y18pR/8vFcRhoTarvv7nN912qw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FF08F80149; Mon, 12 Jun 2023 12:00:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC998F80132;
	Mon, 12 Jun 2023 12:00:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A62B1F80149; Mon, 12 Jun 2023 12:00:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AE101F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 12:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE101F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=HJhMEH3H
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 45BF16605907;
	Mon, 12 Jun 2023 11:00:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686564026;
	bh=r44Dg4EqyihdbL+KAokT86pfSJw+jh/v00yaiQZ3zZg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HJhMEH3H2HAFodc6o70V0xn35JJx7uqF3h2a+lWyuS7CagZrK9rwyB7WdIkbRzmq1
	 j3U737I8bsAcSX2vV5QUnHW2XwgN4ksx2zq7vuYY/PA0dVJ4LmUEVh3i1EfowdS+xT
	 VbcBI8v5BimBsr9OeBJYKOpHAjUDjOIpz3b76CTGgwECZDoBKG7iPVBWaK4YHOyA/7
	 R0vj6fzNepw0u2IGSQ+MzcwE1oq+ELBG7GhoV2W0tWkCLlAtvnUlGRhnW7C6/tII9W
	 GJPG4t9Kn/2e2TODGpTj8YntlVXMKb+IbwaZp5PCx7e5P9qwuDSL7f1nUwx1YJANvL
	 IFgFXczlxrlKA==
Message-ID: <de0e99d6-dcd0-79f5-f3a4-14e25265c0a7@collabora.com>
Date: Mon, 12 Jun 2023 12:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt8173: Fix
 snd_soc_component_initialize error path
Content-Language: en-US
To: Ricardo Ribalda Delgado <ribalda@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@kernel.org
References: <20230612-mt8173-fixup-v2-0-432aa99ce24d@chromium.org>
 <20230612-mt8173-fixup-v2-1-432aa99ce24d@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230612-mt8173-fixup-v2-1-432aa99ce24d@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MBAKZ64V5DWLIUKEBBE6UM4ASCEHRDHY
X-Message-ID-Hash: MBAKZ64V5DWLIUKEBBE6UM4ASCEHRDHY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBAKZ64V5DWLIUKEBBE6UM4ASCEHRDHY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 12/06/23 11:05, Ricardo Ribalda Delgado ha scritto:
> If the second component fails to initialize, cleanup the first on.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: stable@kernel.org
> Fixes: f1b5bf07365d ("ASoC: mt2701/mt8173: replace platform to component")
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


