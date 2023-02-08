Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60A68E5E6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 03:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB05320C;
	Wed,  8 Feb 2023 03:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB05320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675822315;
	bh=Jjst/WpFvg8P95qS9FxEzKlKu/woCHWgha+Tvs8eFMg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JUgReORzt0kv3A7yKOXTgVkoVSuauPOEPKkjuUHjYOqNYcxR4wV4IMXYtEJC0oK+Q
	 KBsujBd7Q8HOEoJpWmFDFwBkYXyUSj4xdeISAWu91BcnhWUUX2JcyJ8nifcDDFXoRg
	 7QglIkm+nWtpANrpDMnyKrzbLTVGL8gMUFz7AvhU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82AD3F8010B;
	Wed,  8 Feb 2023 03:11:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B2FF8012B; Wed,  8 Feb 2023 03:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 650CDF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 03:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 650CDF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=ZqjGyVa9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=AuTyDSrSjqaHZtVxnBwKuHAyQ6R0P+ssQyTf+RiDt24=; b=ZqjGyVa9C8gevk4DdJl9RIZ3Z/
	JhUhMdElBE4KCOSfvQ6kWk+fROA6xuLYbtFt1wqcEYaS/38nancZyGQE7K5mUEzQg0AXTDK3sqf1k
	gXP7VDbcT50A0h+xR43+n0Cab00vGpqb358gqLqkuOnW+gE4H2Ata+DvYiT6i4D3M5Mqr1sLfakUk
	5BOBj2Ez4fd2X4wIWSVbevBwCnVNRDEiy8VeubVqwY6z09mycaN0ECFoh/gx0dfDvgRiEqZcBDJO0
	1U43rm4nA+7N15ElcAb78D8f2eeBZaRtQ/bz0+1VbfUr7/xhZfwBCNaVSyAxvAockml9xHs2gpK9D
	U9q4HP1g==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56]
 helo=[192.168.1.80])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPZuk-000mBb-Qa; Wed, 08 Feb 2023 02:10:27 +0000
Message-ID: <40b2139d-274f-10c5-e74a-3849c94475ae@infradead.org>
Date: Tue, 7 Feb 2023 18:10:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] ALSA: core: Make snd_card_free() return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
 <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RYY2H6C2JFHZP7LKK2EMQTLFHSMBSWGL
X-Message-ID-Hash: RYY2H6C2JFHZP7LKK2EMQTLFHSMBSWGL
X-MailFrom: geoff@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYY2H6C2JFHZP7LKK2EMQTLFHSMBSWGL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Uwe,

On 2/7/23 11:19, Uwe Kleine-König wrote:
> The function returns 0 unconditionally. Make it return void instead and
> simplify all callers accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  include/sound/core.h      | 2 +-
>  sound/core/init.c         | 6 ++----
>  sound/pci/hda/hda_tegra.c | 6 ++----
>  sound/ppc/snd_ps3.c       | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

> --- a/sound/ppc/snd_ps3.c
> +++ b/sound/ppc/snd_ps3.c
> @@ -1053,9 +1053,7 @@ static void snd_ps3_driver_remove(struct ps3_system_bus_device *dev)
>  	 * ctl and preallocate buffer will be freed in
>  	 * snd_card_free
>  	 */
> -	ret = snd_card_free(the_card.card);
> -	if (ret)
> -		pr_info("%s: ctl freecard=%d\n", __func__, ret);
> +	snd_card_free(the_card.card);
>  
>  	dma_free_coherent(&dev->core,
>  			  PAGE_SIZE,

Looks OK for PS3.

Acked-by: Geoff Levand <geoff@infradead.org>

