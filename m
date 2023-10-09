Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B00797BD5DD
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 10:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB9085D;
	Mon,  9 Oct 2023 10:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB9085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696841655;
	bh=1gNhaObHCLIYEZDj3EhK4FrxanyZDjIo1h+E/Gzi1n4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VJhKmAp5aIcjAyFpoBgyMIJVSucvPyFg7HcDMsqaAlTJmylSSzWIBHWDR5IkDCV0e
	 uPnpy9mN4A83TtX7+VlgfnsBn8hmVLTtxUsngxRX21ZltVT7pFv65M9xzMBPVYrSJW
	 ocp3OfjNYvWeZTUaF9ZUdYRkL6nvz8xWGxmd0VOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CF75F805BB; Mon,  9 Oct 2023 10:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A4ECF805B0;
	Mon,  9 Oct 2023 10:51:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20F11F80589; Mon,  9 Oct 2023 10:51:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 01E40F80580
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 10:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01E40F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=T2qHtnQ8
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF581660708F;
	Mon,  9 Oct 2023 09:51:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841498;
	bh=1gNhaObHCLIYEZDj3EhK4FrxanyZDjIo1h+E/Gzi1n4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T2qHtnQ8kryfd85e/V0SXXGnyo6tZ7ZqoyGsRS+B6S4aL1YlSfY1Of5dxlhl+Od6h
	 GfGgeT48fUGv9e3sz6ghyS8HLIYHKdFmbI4WCPV7LWfRK61KmyA1qZTnD1Se1B+6gV
	 Zoath4IUrRiBlDzP7qTxdfctpLV5gW5+G3sa6OVpg6A5+a8zyUFCl+bjwHRN+Di+Li
	 aDio7E2mXB8UQWIo7YB49VM0A6Wh/Kp5Os3JP0UpsvAHWw0Dq8j6Z4lJLC5lt+Ot+y
	 tOHwqsO1JdVvUkWPwM49+CVehRPcpSlgud7VRQjGTg1C+lr5Wf18AUgY4ifNOVMVbe
	 fTF2KnSFcYNbQ==
Message-ID: <6134be37-b1dd-d0df-6b45-00aced9e1685@collabora.com>
Date: Mon, 9 Oct 2023 10:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/8] ASoC: mt8173-max98090: Drop unused include
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
 <20231006-descriptors-asoc-mediatek-v1-3-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-3-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 655GWDCOLBAVH4PRMZ7IZA6GTBGP5VRQ
X-Message-ID-Hash: 655GWDCOLBAVH4PRMZ7IZA6GTBGP5VRQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/655GWDCOLBAVH4PRMZ7IZA6GTBGP5VRQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> but
> is not using any symbols from it. Drop the include.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


