Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60A726905
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 20:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CAB774C;
	Wed,  7 Jun 2023 20:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CAB774C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686163088;
	bh=UjlYPxtK8nY5Y/ZlNYXABoYcMhb7X/VqwKUIU2I9L9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aRgvNpH/EepuQLbrExLr+4FFiLCdKzU80FPdyITh14NgklzAruYqKuLnpifoXnGTR
	 lWrz+kiMu03DacZ/ok6OJDpEPSb8wRCAULc6dADzDTNAAzunDN/ZND82Fvo66t2RBw
	 IoyLNW/yhtiwOPUXls1iHGuVd+Aa4Xdx/XCy2w9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF3FFF80520; Wed,  7 Jun 2023 20:37:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A03F8016C;
	Wed,  7 Jun 2023 20:37:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A8F9F80199; Wed,  7 Jun 2023 20:37:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF843F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 20:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF843F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=LMszLYys
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-546ee6030e5so3628293eaf.3
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 11:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686163024; x=1688755024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjlYPxtK8nY5Y/ZlNYXABoYcMhb7X/VqwKUIU2I9L9k=;
        b=LMszLYysHgE9ur3Xj6tS8FBzY7iDgVA19wbU1X5TkG/XI8twI24J3Et1qiPp4WeQE/
         frqottJORLpVSMjiUVNp0msZNe8LPGKiM65MDAiZ+KKg86cz2eAjy7/ypoVUW92zg/Qz
         YM4mKFZCxmwRl1w/VYOXd6ChH+aZ4gVsahFqHZrwiAgKngqA5dV45H0f71Jow1r2YgvQ
         xcwpSGOcu0ipVJf31aowf4YBvKepRnPUnsc8vnFs4hxdSzrGrrRG4+dPiPbLqsgmE0Ll
         F+JuDLdW5fbsk0S/aVc7cW08A/BqJ0EdC2rNxYEs5om3wicVh8o7EPxoS+yg5YzFbuiU
         mzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163024; x=1688755024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjlYPxtK8nY5Y/ZlNYXABoYcMhb7X/VqwKUIU2I9L9k=;
        b=EEvf5mwy5WIEjfcAhcO93FIQEfDmaKBX9Wu8Y3HCxfHW6VhMWDQEK6tDx/VwIr6mra
         tvTfwMcWv0Xeyl44vdGKzzDYePM6Gl+S6l3OBkhdMfNS4YSKmYN6z2z2xRbaBQPJhpi/
         yXZT7GsGS1/7CDkk6mXj2Lwg1Cr71DecsQhSsPIZV93CNeXzPzXz90+QvJ8ES1hPJbTs
         DgYHHgFwc4ZnDZqN05eRZJ9PMP7KGEizeS6jyg38HaPAvaJ26vS/gH8An1PjsQU1Thuh
         WZGsmVqTLOqd6duUMLzWSf4mFkUc0qQHJV3uwKdShVpg2OwTGpT5nzlrvj20rCuDP2C8
         L15Q==
X-Gm-Message-State: AC+VfDxx/uedV536UjF6tHjVx+esIanwZ/eP7+Uzd0M7DZ8dfbLVReAm
	y5HKE1nVK+qxEJe5oLzm8PY4zCIeq2qnyOqyC6w=
X-Google-Smtp-Source: 
 ACHHUZ5VCXqI2QSijHGbjgoV3BzHSENo26E+Xex5CIQq89WWILlCnN9UOc3DA5HaQGh4kUUT59zQxRzHt2WlgFY5dNU=
X-Received: by 2002:a4a:d105:0:b0:558:aeb3:8c1f with SMTP id
 k5-20020a4ad105000000b00558aeb38c1fmr2730716oor.9.1686163024654; Wed, 07 Jun
 2023 11:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
 <873536js7q.wl-tiwai@suse.de>
 <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
 <2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
 <CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
 <485f99149508488080d563144454040e@realtek.com>
In-Reply-To: <485f99149508488080d563144454040e@realtek.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Wed, 7 Jun 2023 14:36:47 -0400
Message-ID: 
 <CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TBNF3ITA73RYAESIA6S5AC6GGFPM2RTW
X-Message-ID-Hash: TBNF3ITA73RYAESIA6S5AC6GGFPM2RTW
X-MailFrom: josephcsible@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBNF3ITA73RYAESIA6S5AC6GGFPM2RTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 7, 2023 at 3:06=E2=80=AFAM Kailang <kailang@realtek.com> wrote:
>
> Hi Joseph,
>
> Please try attach patch.
> Please patch follow number sequence.
>

Unfortunately, the problem still occurs when I use a kernel with both
of those patches.

Regards,

Joseph C. Sible
