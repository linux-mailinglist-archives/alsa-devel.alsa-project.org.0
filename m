Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC4771513
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Aug 2023 14:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E833C82C;
	Sun,  6 Aug 2023 14:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E833C82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691325737;
	bh=nFD7z3c13NvSK1tSfJL2f3eMNutGbhDjiU3cgo+Y5oo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jGaacijoqWSQQd1y8rHq1cGhTDwL4o34s9WH597wjCinq9BCBr4V1VTS1xjlsgIcq
	 XrxUa+a1u1zMsvJEaOpY3P+DNbKrxik/crmH/iKhNzrn5PM8NYD18HWyjy7oI+4Xol
	 wepKf1PxPkTxi5nz/Zo7g0zr/Waucy0fnB61EhF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6A0FF80544; Sun,  6 Aug 2023 14:41:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB26FF80132;
	Sun,  6 Aug 2023 14:41:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C47BDF8016D; Sun,  6 Aug 2023 14:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1646AF80087
	for <alsa-devel@alsa-project.org>; Sun,  6 Aug 2023 14:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1646AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IO2oJBX6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6A69610FB
	for <alsa-devel@alsa-project.org>; Sun,  6 Aug 2023 12:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B035BC433D9
	for <alsa-devel@alsa-project.org>; Sun,  6 Aug 2023 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691325655;
	bh=nFD7z3c13NvSK1tSfJL2f3eMNutGbhDjiU3cgo+Y5oo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IO2oJBX6fwJLrc50nMXI++iSmix7tqD7GnAj/m5VTrgOPixrlMJ5x7QcwUZ6jv6Xs
	 3PLe/6+v6ZNgyWvsePCWSWz2Vxvg9EggO/zhSG0RDe/MO49p3j7gBo5zNHmiBR+8MU
	 zNlNer4aEoN7XIhMQ2szELQwzPNhHTcM3BCSTpAMLReY4s9NejkErQxYWyF74MCfjJ
	 ZDSjNhl3wAAVsvQ12HJEu85C5RDbCczFO0LZ5/rZo4WaFoFCrHaPQ9LDiQoJ3miHBp
	 BFR2JfDM7C4s/2s4i7y0n4iNfvzg/AyIeTtO0yLaudYYzEDSbDrL/gn0fiFD7gacnG
	 V0IIykJB0rk8g==
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3a5ad6087a1so2001740b6e.2
        for <alsa-devel@alsa-project.org>;
 Sun, 06 Aug 2023 05:40:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YxXcKmiCE3QUngdd8/RysfmxCn0huvWL5NPdMn3Xt2FHBQFJOXL
	v1P/d4Nm+VvQSF4YJRW+EKSeaXGNSvjO2mHmNKM=
X-Google-Smtp-Source: 
 AGHT+IGECC3WwLCbh/4btLngvNb293Va8WRKjDpuT4+YY474LsINtVefC2rYRorCpFghi2Glsk6bb5FbAtTZ9/M3pq4=
X-Received: by 2002:a05:6808:918:b0:3a7:4161:44ee with SMTP id
 w24-20020a056808091800b003a7416144eemr5064315oih.6.1691325654832; Sun, 06 Aug
 2023 05:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230802051500.13271-1-rdunlap@infradead.org>
In-Reply-To: <20230802051500.13271-1-rdunlap@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 6 Aug 2023 21:40:18 +0900
X-Gmail-Original-Message-ID: 
 <CAK7LNARV8va+4JeYHOxZFh_dLgXAfP1wRVoEqUJ_Uuhj=SKnGg@mail.gmail.com>
Message-ID: 
 <CAK7LNARV8va+4JeYHOxZFh_dLgXAfP1wRVoEqUJ_Uuhj=SKnGg@mail.gmail.com>
Subject: Re: [PATCH v5] um/drivers: fix hostaudio build errors
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6CNCYK75TT7NEJ6U6CDHA654LWQSXMPX
X-Message-ID-Hash: 6CNCYK75TT7NEJ6U6CDHA654LWQSXMPX
X-MailFrom: masahiroy@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CNCYK75TT7NEJ6U6CDHA654LWQSXMPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 2, 2023 at 2:15=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Use "select" to ensure that the required kconfig symbols are set
> as expected.
> Drop HOSTAUDIO since it is now equivalent to UML_SOUND.
>
> Set CONFIG_SOUND=3Dm in ARCH=3Dum defconfig files to maintain the
> status quo of the default configs.
>
> Allow SOUND with UML regardless of HAS_IOMEM. Otherwise there is a
> kconfig warning for unmet dependencies. (This was not an issue when
> SOUND was defined in arch/um/drivers/Kconfig. I have done 50 randconfig
> builds and didn't find any issues.)
>
> This fixes build errors when CONFIG_SOUND is not set:
>
> ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_cleanup_modu=
le':
> hostaudio_kern.c:(.exit.text+0xa): undefined reference to `unregister_sou=
nd_mixer'
> ld: hostaudio_kern.c:(.exit.text+0x15): undefined reference to `unregiste=
r_sound_dsp'
> ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_init_module'=
:
> hostaudio_kern.c:(.init.text+0x19): undefined reference to `register_soun=
d_dsp'
> ld: hostaudio_kern.c:(.init.text+0x31): undefined reference to `register_=
sound_mixer'
> ld: hostaudio_kern.c:(.init.text+0x49): undefined reference to `unregiste=
r_sound_dsp'
>
> and this kconfig warning:
> WARNING: unmet direct dependencies detected for SOUND
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: d886e87cb82b ("sound: make OSS sound core optional")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: lore.kernel.org/r/202307141416.vxuRVpFv-lkp@intel.com
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: linux-um@lists.infradead.org
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Masahiro Yamada <masahiroy@kernel.org>



Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada
