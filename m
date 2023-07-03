Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6AF745559
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 08:17:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AEA683E;
	Mon,  3 Jul 2023 08:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AEA683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688365069;
	bh=2mre+NpxhnM/j2ilzhpVesXfPxbXoHN0rR5zLU6NZP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PwEy2ddkeOBoprKQkNr7BQnNwmqfvhu8XXYc1nEDybIxwK+evryOYhgOszCkIdtzZ
	 oC9F21/vJKr+lslmgjkPH3aAxhoCAfxZSXQvqx/nMvC1hmPdmvJMRxs/VT0FuwjQWl
	 HgS6sqjdavn/wrn+qWyYOdsjwbsXd8s3PsXm4MLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7046F80535; Mon,  3 Jul 2023 08:16:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC54F80549;
	Mon,  3 Jul 2023 08:16:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35FC0F80125; Mon,  3 Jul 2023 08:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 982D1F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 08:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 982D1F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vIzuonFH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25CCF60D3E;
	Mon,  3 Jul 2023 06:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EA1C433C8;
	Mon,  3 Jul 2023 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688364933;
	bh=2mre+NpxhnM/j2ilzhpVesXfPxbXoHN0rR5zLU6NZP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vIzuonFHs7xO4B7zjPZ0guaugCZQyYPqQVubQIX1L76rEdEAhNfnPcuHjsngyVl22
	 3MVwlvlMwobNJmv+UNpysJH5eQi7a9sHKgYWdWnSHr6nvbgvKw5kcKTh0IAaLQ8+Gd
	 DF3jPE3JksekXGCKStEQ6iZ4J6lLq1DJucmhoKwP6TnhNtc/vbJrJ8fNF7wwtJfFZ/
	 JHNwwk93WjQiCwOd2Z8dbnjNk56mJBrucwJElqDkdlKPPH+kxab/m932woGNGuFiW3
	 SQuxcz7WjXS9vdyIxhAcFwivDcnQnyJhSKZMZaqOznqFYFiq9LUtbHbztxQdyEB9q/
	 lGKAmuYxhqVxA==
Date: Mon, 3 Jul 2023 08:15:25 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?=         <u.kleine-koenig@pengutronix.de>, Mark Brown
 <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Antti Palosaari <crope@iki.fi>, Sergey Kozlov
 <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, Yasunari Takiguchi
 <Yasunari.Takiguchi@sony.com>, Michael Krufky <mkrufky@linuxtv.org>,
 Matthias Schwarzott <zzam@gentoo.org>, Akihiro Tsukada <tskd08@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 2/4] lib/math/int_log: Use ARRAY_SIZE(logtable) where
 makes sense
Message-ID: <20230703081525.0fb45fde@sal.lan>
In-Reply-To: <20230619172019.21457-3-andriy.shevchenko@linux.intel.com>
References: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
	<20230619172019.21457-3-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UEGUNLZNDVICDO3XPJNN53RXKZF7W3PH
X-Message-ID-Hash: UEGUNLZNDVICDO3XPJNN53RXKZF7W3PH
X-MailFrom: mchehab@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEGUNLZNDVICDO3XPJNN53RXKZF7W3PH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Mon, 19 Jun 2023 20:20:17 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> Use ARRAY_SIZE(logtable) where makes sense.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/math/int_log.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/math/int_log.c b/lib/math/int_log.c
> index 322df25a22d6..ea98fc0b3fe2 100644
> --- a/lib/math/int_log.c
> +++ b/lib/math/int_log.c
> @@ -91,7 +91,7 @@ unsigned int intlog2(u32 value)
>  	 *	so we would use the entry 0x18
>  	 */
>  	significand = value << (31 - msb);
> -	logentry = (significand >> 23) & 0xff;
> +	logentry = (significand >> 23) % ARRAY_SIZE(logtable);
>  
>  	/**
>  	 *	last step we do is interpolation because of the
> @@ -109,7 +109,7 @@ unsigned int intlog2(u32 value)
>  	 *	logtable_next is 256
>  	 */
>  	interpolation = ((significand & 0x7fffff) *
> -			((logtable[(logentry + 1) & 0xff] -
> +			((logtable[(logentry + 1) % ARRAY_SIZE(logtable)] -
>  			  logtable[logentry]) & 0xffff)) >> 15;
>  
>  	/* now we return the result */
