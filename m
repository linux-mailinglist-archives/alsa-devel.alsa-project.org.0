Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A046A72FD76
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 13:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695933E8;
	Wed, 14 Jun 2023 13:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695933E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686743602;
	bh=llC7j82RZKry7GlJCfO+/ymbz6jJk6XeZlcOOxNqWJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dYtGtRoMzUMp/eg4VHCntLhdXFDx6PsfbiGwfs2/zZ1z9/7lcQFKvN+/QI7Vn0qfF
	 e2NXLeYO+sCU/MUpsPa6JDrMk5hG4gD7cT0cxUY5zg4OGlP/xdUFlT0BY2TVSaq4yj
	 tCyM/ksoC/VjVqZUmldPcfyxynvXYldjU/CY8Y08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBA4F80301; Wed, 14 Jun 2023 13:52:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CCB3F80093;
	Wed, 14 Jun 2023 13:52:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83698F80149; Wed, 14 Jun 2023 13:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D84F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 13:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D84F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=GzP9YZc9
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-62fe4ddd49bso4005506d6.1
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Jun 2023 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686743540; x=1689335540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQzjvB2/E4BuxnxzFWq+E7kZcQfXoFct1LFCiMktZS8=;
        b=GzP9YZc9Nxf4T2AW8Q8hO76zBgh47xmFmED4h1Fc+HXSmpVx+n8NbbKB2L00mXY2D7
         G4ulS0Fpiuqz0WY+8wH1wsgkFbuNdfQ2ulDnusGqCbV3RraiFcyANdBqb7TVJYDTP2Hh
         S1cEqXDhvbaD9uV96baRdkaLQWi9xfsyiqhyvz7l1jTEdfQ9Pwab1jk2msXSlX8Hc199
         2S0aakpOrtNRhyMozwoon/6l++5u39dKLlAblh5zXGdqVHZ012xuNilUvE12WOw8lyjL
         fWuFEGHzvWaEK0HZsCmjAIm2/ALSZwFhurgI9x3AlBOru0TaKvQaUd+JMvDy4NHIERl8
         x2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686743540; x=1689335540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQzjvB2/E4BuxnxzFWq+E7kZcQfXoFct1LFCiMktZS8=;
        b=IaeMH/f/Z9/2DUjCEzAX1/RSU6lKGrF+JDjagls8zvD4t4vnuHLEsom70cxQpQRDHu
         xC1/iAgRduqiv41/mOZMSvi2XVZR377/j+/lQ+gz2BNbOY2p3zFW40qozOhzYBTtOwVJ
         jWdKzqZspKf8FbnWcx8XOiWoqxzbviiExGjFKokgRMe06NlU7h7q9TdNA931aIHh7iZ8
         fEqP8K+AKtoDR7gy2spmqwd1T8VT8KrPekmoRgCN8FSrLEXzXCj1ACWgyL7Uj/2R1DBi
         aDl9cnks79dKNXOABkyr4av+crS++5pme1S/rmFcrI57o327EQIN6G/EEaNQbfY2kKtV
         /76A==
X-Gm-Message-State: AC+VfDyUWRG6B0Z/Fb60X+PKF6zjlspy2TzjAmdacynqqKyLLy201kjL
	Xq8K7ZT0o0NwjgdbIwhZWmEkn/OQ9zDDy4p3Z6k=
X-Google-Smtp-Source: 
 ACHHUZ7jeIS46iA9kp2IDTdw+Yv6lPjFxYeU5SPJjDwY7dxraYGEZszXvUcZ4Ee61amfJMfv0nnVUgEVzshrVjaiU9Y=
X-Received: by 2002:a05:6214:4018:b0:629:78ae:80f8 with SMTP id
 kd24-20020a056214401800b0062978ae80f8mr16092327qvb.10.1686743540056; Wed, 14
 Jun 2023 04:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230614074904.29085-1-herve.codina@bootlin.com>
 <20230614074904.29085-8-herve.codina@bootlin.com>
 <CAHp75Vcur=H_2mBm5Ztuvd7Jnvmr6+tvCbEkFtmaVLsEjXr8NQ@mail.gmail.com>
 <20230614114214.1371485e@bootlin.com>
In-Reply-To: <20230614114214.1371485e@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 14 Jun 2023 14:51:43 +0300
Message-ID: 
 <CAHp75VcmW2StPqb_LtKFyNyJ2+jz3c19zNRDiSuGs06Bseq04w@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] minmax: Introduce {min,max}_array()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZFYSMF2FMFHANDYDG5NHXTMWQ6H3JHN6
X-Message-ID-Hash: ZFYSMF2FMFHANDYDG5NHXTMWQ6H3JHN6
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFYSMF2FMFHANDYDG5NHXTMWQ6H3JHN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 14, 2023 at 12:42=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
> On Wed, 14 Jun 2023 12:02:57 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jun 14, 2023 at 10:49=E2=80=AFAM Herve Codina <herve.codina@boo=
tlin.com> wrote:

...

> > > +       typeof(__array[0] + 0) __element =3D __array[--__len];    \
> >
> > Do we need the ' + 0' part?
>
> Yes.
>
> __array can be an array of const items and it is legitimate to get the
> minimum value from const items.
>
> typeof(__array[0]) keeps the const qualifier but we need to assign __elem=
ent
> in the loop.
> One way to drop the const qualifier is to get the type from a rvalue comp=
uted
> from __array[0]. This rvalue has to have the exact same type with only th=
e const
> dropped.
> '__array[0] + 0' was a perfect canditate.

Seems like this also deserves a comment. But if the series is accepted
as is, it may be done as a follow up.

--=20
With Best Regards,
Andy Shevchenko
