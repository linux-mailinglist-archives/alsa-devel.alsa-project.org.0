Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0517BD5DB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 10:54:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D856E839;
	Mon,  9 Oct 2023 10:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D856E839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696841645;
	bh=MPdLVb/pvOTZLkwQXRDilr3q3ShdQdO9Sr5gzkHwXDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cyBmrQsLetGIoPxMcGIHnRR1FczNCbzR3uakQrA1R/36s8yj5g4+tE2tW9pCYGbMp
	 jkTSC56s+31m4uTvFNKBAZwXrqxL5AMUjDQ2KrFCMSGj8KCVic3DYs+RqEa2l9DIKg
	 Oe6GIjjFzQqDLn3Hoac3u4I8Tlu1EzFnuJMKYaIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 639F0F805AB; Mon,  9 Oct 2023 10:51:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C118CF805AB;
	Mon,  9 Oct 2023 10:51:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93708F80557; Mon,  9 Oct 2023 10:51:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5252F802BE
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 10:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5252F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=jJ/dDJsK
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9D1D66072A7;
	Mon,  9 Oct 2023 09:51:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841488;
	bh=MPdLVb/pvOTZLkwQXRDilr3q3ShdQdO9Sr5gzkHwXDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jJ/dDJsKYGIO7JPg7gDYbl5cO1tGQ54DIuLQSnO2Gbza9F0vf5+Y3eDd8SIlg1kNn
	 HRT18v12JJTvSgBz77n9QcIzmp1Sxt/CliQXn4bAZg90Zodi5C0W3qA89BmWJDp/F7
	 b04d59JxjEqe48xEqBAMvjvg8A/NbEetEREK22AfsIzPyoG7AWnGLEajMk9mK+l1dz
	 Gxi+NVU7QhhqH4Jn4Ogf/IirSSHrUFIcNRAaMzs/cZl4CVGiMUidhe2LkQ30cg5D3k
	 A7JdL9/1XI/1ZLCJeNHYBA13x1hNfNCMkDLlX/WQ1XAFNhJANxbAaAfmOggRTFSLq6
	 mAFp6pdpwn68Q==
Message-ID: <d8fd9384-4db2-014c-c0fe-5cb150cb20ac@collabora.com>
Date: Mon, 9 Oct 2023 10:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 7/8] ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused
 include
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-7-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-7-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 34YKBTV5CLCJ7PJ4J6JL6SCPJARIUQH2
X-Message-ID-Hash: 34YKBTV5CLCJ7PJ4J6JL6SCPJARIUQH2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34YKBTV5CLCJ7PJ4J6JL6SCPJARIUQH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> but
> is not using any symbols from it. AFE has a custom GPIO
> implementation that is not using the kernel GPIO framework,
> so it need not include it either.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

