Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B9749B91
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 14:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B127A3E7;
	Thu,  6 Jul 2023 14:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B127A3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688645850;
	bh=hbS/npHCI79m/1IPUPMVSaw5hH91x1uiSvUPbBK+Y7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mf/ig1dJNOLjIMTcM3k40oBNRTo1cDVHyaOjcVhHXhOeuYOjgguRjbLIi64Tfr4jN
	 SJsDaAuSFY1fzlhPiWRUuX5fQoLu3La0jee28yap17JseJ3Zn/du/dQa+R5ARxzzDQ
	 vRwGnwmE2MvtqvG0MRQdCWJwiY8WLB0IGXLvhfzc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A47FF8025F; Thu,  6 Jul 2023 14:16:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 244D0F80100;
	Thu,  6 Jul 2023 14:16:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C720FF80125; Thu,  6 Jul 2023 14:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF974F800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 14:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF974F800E4
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-579d5d89b41so7566347b3.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 05:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688645771; x=1691237771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzl2SvwgN5dAVGpY419AzobIOEk8FC71RqlBpVF0wLs=;
        b=RlsBH1ga4OjVO4us0H/WpsuntWMbEELgvLRUOh6DSl1Qj3OMNvY53Xe7SdagWdlYqM
         qxUL7DSJFFIPv54hcd5qSZu+g2wAh59ZodaPTB8fiVu5RKWH6C9s/abEvgc6P5WgEy1G
         CuagUOUq24EBLJpfTbTI8jQBZC9FTnoCT929tVjLxbXUAKG+uKhipeeKDMcyoC+pLica
         /CTznyfwm5onjSheGm2aXr3IhOZcGd3oH6LjYo0f06JTGX/rKIp1Pg6icUBE76Lciak6
         GHjSucUrqmGx6DnL31MDyi7s1/EPhzm1zVPUSnKHcd5kC06BGzB74i3HPvcJ5qftallk
         tubw==
X-Gm-Message-State: ABy/qLY8l9ZFEH05mD9tN/68n7D2cyeytqpsS9O2cufRjvrmThCrIqYB
	82rT70B5/VjJavXexiZ7imSI5Ewu2FFvOA==
X-Google-Smtp-Source: 
 APBJJlHRcKUOEFYF1ga0XjOk7u18hnzg/W1ewE6NBVbrtwRK/T7zCIjo6l9Ks6XDQzdEq3x7dpxk2A==
X-Received: by 2002:a81:7d54:0:b0:577:f47:3d8d with SMTP id
 y81-20020a817d54000000b005770f473d8dmr2077517ywc.25.1688645770509;
        Thu, 06 Jul 2023 05:16:10 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id
 e8-20020a81e948000000b0057072e7fa77sm297260ywm.95.2023.07.06.05.16.09
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 05:16:09 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-c5e76dfcc36so652398276.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 05:16:09 -0700 (PDT)
X-Received: by 2002:a25:c050:0:b0:bc4:515e:cb0f with SMTP id
 c77-20020a25c050000000b00bc4515ecb0fmr1494840ybf.1.1688645769466; Thu, 06 Jul
 2023 05:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688643442.git.geert@linux-m68k.org>
 <cafd878747e7951914a7d9fea33788a4a230d1f0.1688643442.git.geert@linux-m68k.org>
 <bd265a83-ca5e-4196-936e-0f753ea47a25@sirena.org.uk>
In-Reply-To: <bd265a83-ca5e-4196-936e-0f753ea47a25@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jul 2023 14:15:57 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdUc-6ga7G5xuXXcKXU0ya3XBBM-tEJ3tZ-BY-oa+wozsQ@mail.gmail.com>
Message-ID: 
 <CAMuHMdUc-6ga7G5xuXXcKXU0ya3XBBM-tEJ3tZ-BY-oa+wozsQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: SND_SOC_WCD934X should select
 REGMAP_IRQ
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Benjamin Gray <bgray@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NTDYKOTIEMNVLJNOERPUQQAYQZDFWJT3
X-Message-ID-Hash: NTDYKOTIEMNVLJNOERPUQQAYQZDFWJT3
X-MailFrom: geert.uytterhoeven@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTDYKOTIEMNVLJNOERPUQQAYQZDFWJT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On Thu, Jul 6, 2023 at 2:09=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> On Thu, Jul 06, 2023 at 01:42:04PM +0200, Geert Uytterhoeven wrote:
> > If CONFIG_SND_SOC_WCD934X=3Dy, CONFIG_COMPILE_TEST=3Dy,
> > CONFIG_MFD_WCD934X=3Dn, CONFIG_REGMAP_IRQ=3Dn:
>
> There appears to be at best a marginal relationship between this and the
> rest of the series, please don't group things needlessly like this, it
> just creates spurious dependencies which complicates getting things
> merged.

Well, unless you have CONFIG_REGMAP=3Dy due to some other reason, you
won't reach the mentioned link error without applying [PATCH 2/3] first.

It doesn't hurt to apply this patch independently, though.
Do you want me to resend it (to your sound-persona) as a separate patch?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
