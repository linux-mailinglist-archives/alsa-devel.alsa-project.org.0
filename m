Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD58693E8F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 07:59:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E912A836;
	Mon, 13 Feb 2023 07:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E912A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676271556;
	bh=m7UniMfnUOUD9LMiXXUlzMPw5uiorJZCJ5QdJL4glqQ=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gUXPDN9q6Vvxj0RD830hduVmkuecpR/7Snty6MzqPUk3F03XBYdBAsXeDssqgO1qY
	 NxC/WtahZKB5gvvkHY36pwVoiCw/RUOTemC1g4P75sIGTsLieFCNThXEF35eLxrmDY
	 SGqeTPV0YGfp4Pu7Yy2fkkbEU4SGw7DzgoPCP9w4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12EB1F800B0;
	Mon, 13 Feb 2023 07:58:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EE6BF804B0; Mon, 13 Feb 2023 07:58:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD7EEF8001E
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 07:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD7EEF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SZDqO7ID
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B7C571C0003;
	Mon, 13 Feb 2023 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676271490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5ffWlE9Fge2l3HWz1yfAkL/3WPC9cXbFyLq3aIvwmM=;
	b=SZDqO7IDfZsY4Hk+jjtdzCZZ11rveeU8rlYTCNWwKp2QtoV3ZjJVMG0d9fOu42SZb2j0kH
	zZopAmGbEj358Sh+1ExUev/dshwTZEXjncnykRlWKTn8zT3r/PXCF5gxFTDTctekrK6JBI
	59iqQhXuhFR+rC++3ZDn8YvxifMfONqXclbIfl19GpDltNVs8wlYWM4e+sPyqafXoGQvrb
	Xiy52t8tdRuipp8yRkPN+vMGkSc2D/3QBDBVaOHfpr+vSgdv93nv0n4VYSaelzyjJEOkf2
	OS6WEWannD4vJ7Sl4W5I9Z5Zpi7L1oexPL5iMB0c9DCvOJ5yu5m6RyAk/LXoXg==
Date: Mon, 13 Feb 2023 07:58:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: codecs: Remove unneeded semicolon
Message-ID: <20230213075808.45c9c4f6@bootlin.com>
In-Reply-To: <20230213010547.105312-1-yang.lee@linux.alibaba.com>
References: <20230213010547.105312-1-yang.lee@linux.alibaba.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MMZOSSW2BFVUT3Y4YBPP5EWRACEZMC5I
X-Message-ID-Hash: MMZOSSW2BFVUT3Y4YBPP5EWRACEZMC5I
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMZOSSW2BFVUT3Y4YBPP5EWRACEZMC5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Yang,

On Mon, 13 Feb 2023 09:05:47 +0800
Yang Li <yang.lee@linux.alibaba.com> wrote:

> ./sound/soc/codecs/peb2466.c:1851:2-3: Unneeded semicolon
> ./sound/soc/codecs/peb2466.c:1887:2-3: Unneeded semicolon
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4045
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  sound/soc/codecs/peb2466.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20

Oups, I missed those. My bad.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Thanks,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
