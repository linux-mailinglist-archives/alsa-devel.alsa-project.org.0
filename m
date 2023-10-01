Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335E7B48F9
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Oct 2023 19:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61F24E12;
	Sun,  1 Oct 2023 19:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61F24E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696182690;
	bh=l84zSjGv/3HxQqqQVT5pTigBf0iuKgtfn3rivfi9Nnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B2suIera7YououBVHjS9/TFSBtlsJnBcVy2M7GOQlrYkVX+ZDL+3KjjkOIKcgr9jm
	 eQKcp3eLEt7QLT/HrNO9xvZmd5F+L7FDgJAv8pAskeaLR8bB+se3JuobUBhz0GhJI4
	 oVBpySdfROV3Pt0wyuUQiSRgUQQpYtMnYMgJTIzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9831F80557; Sun,  1 Oct 2023 19:50:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA56F80552;
	Sun,  1 Oct 2023 19:50:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1403F80310; Sun,  1 Oct 2023 19:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bitmer.com (server-237-49.tentacle.cloud [185.179.237.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A295AF80166
	for <alsa-devel@alsa-project.org>; Sun,  1 Oct 2023 19:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A295AF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bitmer.com header.i=@bitmer.com header.a=rsa-sha256
 header.s=key header.b=M6E1/vc5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
	 s=key; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yE49Vr6pptS+we01SoDcdrGH43G1IbFfqo3qFcIDImY=; b=M6E1/vc5QBUmN8Vju48mmV490O
	YU1iNjUX1GW9nKJGkJTU7a5Li4C1IBrWSeXkGQeGGw8jJnt1cI77LCMI5L7DxircuLlmthqOPjVqs
	T0yQhtf6pKW3kXIMs+z1E9Fg8iX26iVD225bT8nkQYiUl03+EY2Rw65EiRIz1/MsD1qZ1ilnY/ziG
	3N1iXny3H399pi59i3DAoFhK3E3LYiQ2bV4myWfmrJfrCX/v0ySxdNoqb5tincG1GfRaBKjnRQ0ij
	zQlXAKUwrZixsZe31mCQgJ/SJAFI0SQvufJ+fzsQcAG4qwMIs4ka62anYw8pKwbKq1Le9Ud8h8LfL
	Uw32wN5Q==;
Received: from 91-158-0-106.elisa-laajakaista.fi ([91.158.0.106]
 helo=[192.168.0.12])
	by bitmer.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1qn0Z6-0000Yz-TG; Sun, 01 Oct 2023 20:49:12 +0300
Message-ID: <4eb93a15-6e6b-4b81-aa3e-d78d7ef9476c@bitmer.com>
Date: Sun, 1 Oct 2023 20:49:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] GPIO descriptors for TI ASoC codecs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren
 <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VIYVBBWZUGW3ZZRE43Q54DTDGO5COVRZ
X-Message-ID-Hash: VIYVBBWZUGW3ZZRE43Q54DTDGO5COVRZ
X-MailFrom: jarkko.nikula@bitmer.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIYVBBWZUGW3ZZRE43Q54DTDGO5COVRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/26/23 16:25, Linus Walleij wrote:
> This cleans up and rewrites the GPIO usage in the TI
> ASoC components to use GPIO descriptors exclusively.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (5):
>       ASoC: ti: Convert N810 ASoC to GPIO descriptors
>       ASoC: ti: Convert RX51 to use exclusively GPIO descriptors
>       ASoC: ti: Convert TWL4030 to use GPIO descriptors
>       ASoC: ti: Convert Pandora ASoC to GPIO descriptors
>       ASoC: ti: osk5912: Drop unused include
> 
>  arch/arm/mach-omap2/board-n8x0.c           | 10 +++++
>  arch/arm/mach-omap2/pdata-quirks.c         | 10 +++++
>  include/linux/platform_data/omap-twl4030.h |  3 --
>  sound/soc/ti/n810.c                        | 31 ++++++++-------
>  sound/soc/ti/omap-twl4030.c                | 20 ++++------
>  sound/soc/ti/omap3pandora.c                | 63 +++++++++++-------------------
>  sound/soc/ti/osk5912.c                     |  1 -
>  sound/soc/ti/rx51.c                        | 19 ++-------
>  8 files changed, 72 insertions(+), 85 deletions(-)

To whole set (for sound/soc/ti/):

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

And to 2/5:
Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
