Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934069BDEF
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Feb 2023 00:28:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C572EF2;
	Sun, 19 Feb 2023 00:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C572EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676762900;
	bh=o4n9TV7P8lOWD4f+6mSZVv0GFtJZ5luwHrSpvYZHeT4=;
	h=References:From:To:Subject:Date:In-reply-to:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N9ObQjpwYStd3r8agmWxrTY72PXfqivKzk6uIOWO0KCGOBWxWsSvdBt2KBIMLx7qu
	 NMjxVgg6Q5NMoFoeaQZJIhFpIf2m962Jh7Pb7UHJv/ou5dhGmpVAQkjESbi0KbyJ50
	 KzV0JWUD30M19rKQfVpq6rmT0F81jWpnAeQHqkAk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB68F8025A;
	Sun, 19 Feb 2023 00:27:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5FE5F80171; Fri, 17 Feb 2023 22:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9DAAF800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 22:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9DAAF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YbR3L1en
Received: from SOPL295.local (unknown
 [IPv6:2a01:e0a:a6a:5f90:38fe:9937:c1ef:e044])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 068E2B0055E;
	Fri, 17 Feb 2023 22:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1676668389;
	bh=o4n9TV7P8lOWD4f+6mSZVv0GFtJZ5luwHrSpvYZHeT4=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=YbR3L1enVLq5ZaRfsEnSqSPMDplJyVixP/skM+hJ3ek1fRySocXdxtGG6klgx44QT
	 pIURdqj5OArK93keVZnZeeJI53v3hnsI+txoQ/qM8UplvfJ1aofRM0onAc3grmOhDA
	 veBXTtKBSkwkq6elouRVtM6xRAzcxMjJd7N5CW675lCx78UWjhUBmnLvuW/vzBeU6J
	 QBwR42KkNAU4NPj5BblXwPwK0Ylou/LS5F+sN4x3r0wq1/U2IUcoTzetF9Keg+1uy9
	 uEEFx8OkTI0+kBaM9+zJVgUr4dpK76XtFf4QrhzsR+BTJoP1IYcfLijS+KLdfKC/mv
	 ERpuLamhA8hAQ==
References: <20230214090728.1737140-1-arnd@kernel.org>
User-agent: mu4e 1.8.11; emacs 28.1
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] Input: mainstone: fix pxa2xx_ac97 dependency
Date: Fri, 17 Feb 2023 22:12:16 +0100
In-reply-to: <20230214090728.1737140-1-arnd@kernel.org>
Message-ID: <m2r0uoj8rm.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-MailFrom: robert.jarzmik@free.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H2FNGB7AXMZF5UVN27AVWPP6P553KNYX
X-Message-ID-Hash: H2FNGB7AXMZF5UVN27AVWPP6P553KNYX
X-Mailman-Approved-At: Sat, 18 Feb 2023 23:26:10 +0000
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2FNGB7AXMZF5UVN27AVWPP6P553KNYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
... zip ...
>
> Fixes: e217b085a1ac ("Input: touchscreen: use wrapper for pxa2xx 
> ac97 registers")
> Fixes: b401d1fd8053 ("ASoC: pxa: remove unused board support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
