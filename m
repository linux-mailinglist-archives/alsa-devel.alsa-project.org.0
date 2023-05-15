Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB6702200
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 05:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B18DC827;
	Mon, 15 May 2023 05:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B18DC827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684119918;
	bh=rESEKzY0pGYDvdhzhnHvQvNWcEBIPeEwfTIqe8gY9Kw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=avF1ANmjgwNjDn9WbzAV7oPs+xR76CPNHK2bOfe2VngTn1br2oL4iAmMwbwpU2SZy
	 ZfH7nFrAzuRKC+pr2RUoEXpXnZ+wrOA0FPgU8mvmPOU2aKtRRKXm9YwP1aQg+Rnyic
	 I0yAEhJJgU7VQkfZQKiDC28HKhqisJQO8WNj7GXI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D562F8025A; Mon, 15 May 2023 05:04:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BD5F8025A;
	Mon, 15 May 2023 05:04:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA032F80272; Mon, 15 May 2023 05:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57E6EF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 05:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57E6EF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=SFBznUFr
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-19290ad942aso9580316fac.2
        for <alsa-devel@alsa-project.org>;
 Sun, 14 May 2023 20:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684119849; x=1686711849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rESEKzY0pGYDvdhzhnHvQvNWcEBIPeEwfTIqe8gY9Kw=;
        b=SFBznUFrkJnYqwS8H/ynSIyUiyvNCdt2Sm9MefoIXDU+h2XMN1Szy6uvGk8xJWk80t
         MUIrbAZxcXu7P7f46BzGfx26X3qC6Ab1xOcYUz+WDukVE/qhWvZxpT8jTXEqIl2GwJPd
         xYvA+SlAODqcI/ngWdylGIHlM6ZJXf/D+rjlsOUrUm+BOZ2CDuCI6F1f/lX4jM3ozx8I
         db4/FBJN0X2VlVJZ43vpjlWUPD3HM98IFa13DUKJXQXX40jr9MCV8nD08Wp/73hZgDG8
         yr8pa7x2ibfBjoKmE8iDA2UMRK7CIu/YOWA7mgOUghAk6vvYbe7cZnltOMzJ9dEIDQvc
         HKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684119849; x=1686711849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rESEKzY0pGYDvdhzhnHvQvNWcEBIPeEwfTIqe8gY9Kw=;
        b=Hje7kFtM45PKJ+9y72R1LwObvWi4Jrgp0u1pv4jd7hMKliJM/zitLTgK6QKdeNx46W
         tQXSbN/sKTvRX9mAZ0YpW+ghP4L4li4sllnf6T4NgM+5LSKKAMSyq9879Blejv2aWzmB
         9mdbQYx93uCMVAHfo8nXFmBB9rUySuhqqpGlVuimNiX61TkIL8eiLB0ZYuzyx3I5b16N
         SmmyonYILW2BHpsR7k5TVcSGZQG/iCUYiyoX1OPRZpH7lkaSwyp6cBuuM47C7ZA3r1r8
         gLn8YHZ+UxQ309IQ4RLp76iuKXWnbxIZxjczqgZl4MF4Pxv9CMqoDbIjzu7nIQujozaJ
         Dk1g==
X-Gm-Message-State: AC+VfDxGMAUuoni67OrqkqDr8JZcoYX7M4eZLOMSuY15o2346zsrU9ZQ
	ojNBFnLPNhpdCIs68mjbqNyMjI8E/CMvFJEMWh8=
X-Google-Smtp-Source: 
 ACHHUZ5Z3klxal5JMA02mBykhOFFwNsQrQy2JFvtdeZznSUsD9Od0nqHm/iWjT34/UX1FX0fipTytXJQ4AaxFOylDT4=
X-Received: by 2002:a05:6871:582:b0:192:7cb3:5822 with SMTP id
 u2-20020a056871058200b001927cb35822mr14494777oan.38.1684119849460; Sun, 14
 May 2023 20:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <626d677d-ead7-7ec8-b91a-162c914fe1d5@gmail.com>
In-Reply-To: <626d677d-ead7-7ec8-b91a-162c914fe1d5@gmail.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Sun, 14 May 2023 23:03:53 -0400
Message-ID: 
 <CABpewhGziT7JOvRXdFDJkVwrszga8kNTG8=1G-4v0o27iONFag@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, regressions@lists.linux.dev,
 kailang@realtek.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KRJSZ2UIGYC37US25XKXJNOFADEFGM5N
X-Message-ID-Hash: KRJSZ2UIGYC37US25XKXJNOFADEFGM5N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRJSZ2UIGYC37US25XKXJNOFADEFGM5N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, May 14, 2023 at 10:23=E2=80=AFPM Bagas Sanjaya wrote:
> Thanks for the fixup. Can you send it as proper patch for review?

I only included that diff to make sure what I tried was unambiguous. I
don't think it'd be a good idea to merge exactly that, since it will
probably re-break the problem that the original commit was fixing in
the first place.

Regards,

Joseph C. Sible
