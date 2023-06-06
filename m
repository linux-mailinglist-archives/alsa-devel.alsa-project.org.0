Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2B72372A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 08:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EC6F6C1;
	Tue,  6 Jun 2023 08:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EC6F6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686031631;
	bh=mY7o7sRc/5bU+UcOF0Y5YHgkqhcEBGECrMGl3p6mpQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K2SOpiUBZTgwUKUcOnrcP0n1ptAt+0f/6GEsECqZHfbZbQFvI313eeEQ6/ZZslVY+
	 C62oUTIVU0/ajlULinxpmzWclNIs+99lOTQM5MK4uHFkA7uAube+ds2TtL6U62eVg5
	 h2VrqkQVX852oUdXARcNTulaTM5kNKi/0IIuNsf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63F9BF80557; Tue,  6 Jun 2023 08:06:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D655F8016C;
	Tue,  6 Jun 2023 08:06:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89153F80199; Tue,  6 Jun 2023 08:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB1EEF80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 08:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB1EEF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=a5l5R4dD
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-55554c33bf3so4255941eaf.2
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Jun 2023 23:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686031343; x=1688623343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mY7o7sRc/5bU+UcOF0Y5YHgkqhcEBGECrMGl3p6mpQI=;
        b=a5l5R4dDWqWJQe47YFphsnmQsaMtmxywO87ZmJT2h5NVDTVYo7i/A6HG9LkPkpWGlY
         0zap7ky9F9OWWuaExjC0oXCt13rLR8K+y6G3R8NJjCIjkNNHwGMNzd6l8wMEDqB44heN
         itNDLEnSbBRHcoUPUolPef3tjCxsfX7cmH4tdJ4ZsEIsqVtnScQLmQisH6MfgQjLxWmp
         ybLgJWv46xo1DkXldgLGHtoi+8qxqxUtEO4QFc4tMO+r0tmfDM0PkO71Q0JDhLUJojvW
         uz1DKsXiLkKmZC51/XGNx/jUUCbA1dHgXqbpFmfzf4Ju08w2cptSrBpk/qq6+5zQmzbY
         zCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686031343; x=1688623343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY7o7sRc/5bU+UcOF0Y5YHgkqhcEBGECrMGl3p6mpQI=;
        b=h1MshzKKYoJCcV3/KmXyte2QDmXLofNLaqezy1PZ33//Dt11p5apiRkDwF1A7li/mr
         hBvyQfv0mUledV1SqjLRotXeTXjCL1PcsZfdNSvoogP71rLrNgy+hLy4reQ0UZ8p2Avc
         wSa9dXcneZcbciT4TLAtKvaTh4i29G9KbWFoFBaomV+NhVFiHmBTnwfAS13ppsevAvEh
         6y1Sy5KXbHBusbnzNQqxA1vdOzV9L7u7H4RXOZO1UqqH1n181hkU3Ww1LNM2ld96qy4S
         QI980159nyvm9+jQ7dWMwX1RzVzqEyOJip7Bb7J4cji3viI/XZQDBeMDQ1lGEXmc6+lE
         53Ww==
X-Gm-Message-State: AC+VfDw9D5HiqoysMYVIpiAaf8TPWO7W1TEKpL6zkvbUdzpV0qUuGP5f
	osAg0GjYZpE0NETApdY/PjCRfatiWjxSfkhjfF0=
X-Google-Smtp-Source: 
 ACHHUZ7hjiFq0lxhztahl8Ybz+ZoLb3X9zoqOeZaFy1I2QkvYKCBu73Yl47ket3DowZwnDmfxhaZ8nJlGfzhirAOKDg=
X-Received: by 2002:a4a:ea8f:0:b0:558:a3f0:d16 with SMTP id
 r15-20020a4aea8f000000b00558a3f00d16mr869901ooh.9.1686031343118; Mon, 05 Jun
 2023 23:02:23 -0700 (PDT)
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
In-Reply-To: <873536js7q.wl-tiwai@suse.de>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Tue, 6 Jun 2023 02:02:07 -0400
Message-ID: 
 <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang <kailang@realtek.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3QWUB7KHCZBJBE2VAJ54XAIS4IF2UQR6
X-Message-ID-Hash: 3QWUB7KHCZBJBE2VAJ54XAIS4IF2UQR6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QWUB7KHCZBJBE2VAJ54XAIS4IF2UQR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 5, 2023 at 3:14=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Kailang or Joseph, any of you can submit a fix patch?
> Or shall I cook the one, as it's a trivial change?

I don't know enough about these driver internals to be able to come up
with a new patch. Unless Kailang submits one, I guess the trivial
revert one would be the way to go.

Thanks,

Joseph C. Sible
