Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA52768B31
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 07:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B197F8;
	Mon, 31 Jul 2023 07:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B197F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690781758;
	bh=AerGgUeyL6bl8f5iC0YwYuPzdRrmoPBOQPvhqo4HCFE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lzVHlgpcHpij6fe/68vPfPIIQhZMwxWheHZWnuRpNDuCfSbmO29EwKUZi8j7fIKgx
	 loXASbUQOnnI2gzOOSZJvqK3Dj8wEyi2j461ee5z+FFuiVJsQqms3SFgJVz7YvXNfy
	 3FAQol/MpVkoh0Soy0AqCgOXscWetWYIGzA+tAB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A764EF80520; Mon, 31 Jul 2023 07:35:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F09F80163;
	Mon, 31 Jul 2023 07:35:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF7CBF8016D; Mon, 31 Jul 2023 07:28:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DCF2F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 07:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DCF2F8015B
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 83FD563577C9;
	Mon, 31 Jul 2023 07:27:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id G9JFjYMLxIRN; Mon, 31 Jul 2023 07:27:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 550AC63577D4;
	Mon, 31 Jul 2023 07:27:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nipuTvMz7oy1; Mon, 31 Jul 2023 07:27:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2B97763577C9;
	Mon, 31 Jul 2023 07:27:54 +0200 (CEST)
Date: Mon, 31 Jul 2023 07:27:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: masahiroy <masahiroy@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	kernel test robot <lkp@intel.com>,
	anton ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um <linux-um@lists.infradead.org>, tj <tj@kernel.org>,
	Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild <linux-kbuild@vger.kernel.org>,
	alsa-devel <alsa-devel@alsa-project.org>
Message-ID: <1063472755.889096.1690781274039.JavaMail.zimbra@nod.at>
In-Reply-To: <3cd0e5b7-7e20-ce3b-e391-eb77443f63b1@infradead.org>
References: <20230728043013.27776-1-rdunlap@infradead.org>
 <CAK7LNAR4BkAKhZZ8+Zybed3Jm3omxzzdgus-Nqj-9MjWAeSmiA@mail.gmail.com>
 <3cd0e5b7-7e20-ce3b-e391-eb77443f63b1@infradead.org>
Subject: Re: [PATCH v3] um/drivers: fix hostaudio build errors
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97
 (Linux)/8.8.12_GA_3809)
Thread-Topic: um/drivers: fix hostaudio build errors
Thread-Index: NkqIAPWFcMLKoL0J2Cdhb+WpEEOx+g==
Message-ID-Hash: TOKZI4CUFDLZ255HAKA2SAIRKTBIXOT5
X-Message-ID-Hash: TOKZI4CUFDLZ255HAKA2SAIRKTBIXOT5
X-MailFrom: richard@nod.at
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOKZI4CUFDLZ255HAKA2SAIRKTBIXOT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

----- Urspr=C3=BCngliche Mail -----
> Von: "Randy Dunlap" <rdunlap@infradead.org>
> Oh, good point, and one that I agree with.
>=20
> I'll send a v4.

Ok!
=20
>>=20
>> Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
>=20
> Takashi, I don't know who will merge the patch, but I would expect
> that one of the UML maintainers to merge it.... FWIW.

Yep. I'll carry this fix (v4) through the uml tree.

Thanks,
//richard
