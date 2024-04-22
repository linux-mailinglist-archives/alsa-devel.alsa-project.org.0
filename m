Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506348AD40E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 20:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF37E7D;
	Mon, 22 Apr 2024 20:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF37E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713810879;
	bh=0ojgGJtrDFJg/jyCRyjl7+ffqCDBGYI2paAIKCactFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YqTFKiIobl0VKP6i3Gd6+AYJIgMruWW8Bxj4vhrlWYJWV+pNQPiDZJfOvtntxf72w
	 myaZHDhCChcYS7fw1HOzUiCNuU4YSDX4W+67LON4ZsfzoryvaEgqfRHEOOug5+ox1v
	 68TJLIFvhUXqeZ0/TNM45f+CYqvwNapewJR6CLYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B62D3F80570; Mon, 22 Apr 2024 20:34:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD8DF80578;
	Mon, 22 Apr 2024 20:34:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D6C0F80423; Mon, 22 Apr 2024 20:34:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E18DF8003A
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 20:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E18DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Wt+cH6xa
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a51addddbd4so467136666b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713810824; x=1714415624;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ojgGJtrDFJg/jyCRyjl7+ffqCDBGYI2paAIKCactFs=;
        b=Wt+cH6xa7tE8lksOJU2LVOjEdRvH3/6FvTb8Z8CCtuHRKrinO1rZAnvrcB2FdyeCxg
         ZPZt4T+oEGz/4OnNboFRVMEaaPyeo9W5iq7lbhF8gHzPLWWTjVJGNmsZ8jCOXu5z8dVA
         cFSBb/acEwxgpSvTHyzg/HLxucfH/MYUjMANp8K6gJXF6bGAUU/K7JwvM7rPltgyuf8q
         1xPkQoDxhbhtHIFYsbHc3Us8rGDD9zbHGyto+qKCVLHFGl6+AZ7U9JQhj1pER4ZldFq+
         KZ5HE4p+uPzDJqpRFzfWpzYBupWsux0BkwXV+t4EiUXCQ2y8uZ2+RDbsfdonQP7udgby
         Ajxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713810824; x=1714415624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ojgGJtrDFJg/jyCRyjl7+ffqCDBGYI2paAIKCactFs=;
        b=eRBZ9IBk225T64RMnfkd9JPwXR1DHbALHmJDmdJI0Mzlh0hSPL1voMlYCKiTJ7yyQu
         tHCfBJQrtt3WfeuPbK75mk05NVkxhwaTrVPzF7Cc+AfEsOJTya+JJLZ2O/K0Rh8MngIU
         WoMrQwNRc3kZFD+MgAFjdCYn2dvaF4GB1f70Pmf+qDFlAMuo8uEqPzk2sxgSEsRI5+Uo
         ybhoR5qPpMmu2zjNgO/WBcguOTYXh8iA6LAu6JPBiXqDtSf5mhspk8TT7DJFeoTa7WHF
         RBYZVkpMblgBBQka6YEYUCrLPBxnN38Tu3YlzAnunvja0YrnC2eFZtWuGq30P0Kamsly
         DnZw==
X-Gm-Message-State: AOJu0Yw4lApC6kTjEEuu9XN/me9CGCB3t1I1htdj0YNO8WHUJgnjtVBv
	pijlmdjO7gfQr7z0ZtFud5/InLEb8z8Xi43s9zgXDiVq193ZNHIKkDTGdhOwCEoytHIR+KtUPm8
	pL4A9HHFMSxijcIi5FxCYg5CpCNh5e1eH
X-Google-Smtp-Source: 
 AGHT+IGS5fetiecPNNVakyidHygB9qfLf7xRXOW3JK8e4e0k3mR106ThnEiKjAyAuSEVIE7OfVBpDOSjLr2wq+uu1Yk=
X-Received: by 2002:a17:906:3801:b0:a57:b828:5f4b with SMTP id
 v1-20020a170906380100b00a57b8285f4bmr1179181ejc.58.1713810823975; Mon, 22 Apr
 2024 11:33:43 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com>
 <CAHp75VfhZZ9dN_AaF_7TYmknsZ0iXBiVKmeA1Q=6d_1cyE2xxQ@mail.gmail.com>
In-Reply-To: 
 <CAHp75VfhZZ9dN_AaF_7TYmknsZ0iXBiVKmeA1Q=6d_1cyE2xxQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Apr 2024 21:33:07 +0300
Message-ID: 
 <CAHp75Ved=9NgmRHbJSmZeNM6LgKBtmyoYL4JmTXLKYhzPkypoQ@mail.gmail.com>
Subject: Re: Missed review / mailing list submission?
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Shenghao Ding <shenghao-ding@ti.com>
Cc: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5IMHHTJMN7H7YGWQDRTSBJMSCVV3LSLZ
X-Message-ID-Hash: 5IMHHTJMN7H7YGWQDRTSBJMSCVV3LSLZ
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IMHHTJMN7H7YGWQDRTSBJMSCVV3LSLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 9:30=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 22, 2024 at 9:28=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?=
h=3Dasoc-6.10&id=3D710f9a3673d6839c485d6a1cd59a2b5078092d47
> >
> > I can't find this in the mailing list.
>
> To be clear I have checked lore and spinics.net. So, it's not a lore
> problem if you wonder.

Okay, I found it eventually.

> > Moreover, it has an obstacle to be applied, i.e. as per
> > https://elixir.bootlin.com/linux/v6.9-rc5/source/include/linux/gpio.h#L=
5
> > the gpio.h must not be included in a new code and brief looking into
> > that driver shows that legacy APIs are being used without _any_ good
> > reason.
> >
> > This has to be fixed (by the author).



--=20
With Best Regards,
Andy Shevchenko
