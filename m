Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4972BE2A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 12:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B4C1F1;
	Mon, 12 Jun 2023 12:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B4C1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686564134;
	bh=TffA+lZzUvRHyw4/b64DDwCayT/nYLAIu4AYWJn79rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ATG+zYweAjr0fDMHa5HMTyp6eZgpELKIUvFhFFkEvukm2DMEJuLGpZ+NeqxsAqpBq
	 lJs1S6csyeK1/NDj42kIKfLHWPjJSwjKcEm8KVjUP6aZmn4Jyq8WZ3sTZokj2qV7JO
	 MtgwZUGcDyVWDOkmdNz0+7lC7LE9qmZrk3x8Tc9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A48DF80558; Mon, 12 Jun 2023 12:00:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B601F80548;
	Mon, 12 Jun 2023 12:00:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7126BF80549; Mon, 12 Jun 2023 12:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFA27F80155
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 12:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA27F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=K1BD9LxH
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 706F46606E9A;
	Mon, 12 Jun 2023 11:00:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686564032;
	bh=TffA+lZzUvRHyw4/b64DDwCayT/nYLAIu4AYWJn79rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K1BD9LxHyMr7/oBqUSy00KPUs1YWa3yAOJCc5jC0bQzJeUsB3H8sLk+oLDBQkaVDM
	 ObIlW7SU4KnZN520okXvI2L7JD2EcSthAUDM0J+k3+ThJrr3Hjm+cD2u+7chtr8JhQ
	 eyjmdXc8Rz8QzechiNKixXmzfh+Cvny5IuqcPp7hAp/J5zhDbSm8hbXc52aPAjvVW0
	 nZ/pJHBoE9tHMl+GXn+C92uQZpL1VW7xLtxyyZSGmaEmwj2sJVrYJR8r6r3q1Thdn8
	 az7Hh/2SP+3XuplQpADXWDANzQezlaI0Is8eJDX8Q2cqBof4bBkjt25y9NP/r/e5LG
	 bTaJeHK4BAB9w==
Message-ID: <5150557b-b070-d3df-6d6f-61bbabde9f95@collabora.com>
Date: Mon, 12 Jun 2023 12:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: mt8173: Fix irq error path
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
 <20230612-mt8173-fixup-v2-2-432aa99ce24d@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230612-mt8173-fixup-v2-2-432aa99ce24d@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Q6D5JNETOQYAFQ2KHMQKM5TFUUPGPGCF
X-Message-ID-Hash: Q6D5JNETOQYAFQ2KHMQKM5TFUUPGPGCF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6D5JNETOQYAFQ2KHMQKM5TFUUPGPGCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 12/06/23 11:05, Ricardo Ribalda Delgado ha scritto:
> After reordering the irq probe, the error path was not properly done.
> Lets fix it.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: stable@kernel.org
> Fixes: 4cbb264d4e91 ("ASoC: mediatek: mt8173: Enable IRQ when pdata is ready")
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


