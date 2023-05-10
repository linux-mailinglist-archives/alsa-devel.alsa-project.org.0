Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05C6FD3FB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 05:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3C51076;
	Wed, 10 May 2023 05:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3C51076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683687784;
	bh=BhXDuquWC1IuLLKuLTycCDSnaTxPHnK6icHPyCl+/rA=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GLhDu6/zLhYhSWcmBowqA5zVy2ShF7kN04bZnf+birtIOpcSkWMVnC0RNisOucfcd
	 vPKzc6zL4ouqih39MKozK29845UqDtH6EytT4/SG/7tky9KiiL1f0vSke3I5276yWP
	 oSnXJmC+Dkx46g2EJ9WewUG0ISRPqTCpUsdlcCMk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E81DF8032D;
	Wed, 10 May 2023 05:01:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9738F804B1; Wed, 10 May 2023 05:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36D02F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 05:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D02F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=KlrPxaOq
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-77d5083569fso2068569241.3
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 20:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683687675; x=1686279675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhXDuquWC1IuLLKuLTycCDSnaTxPHnK6icHPyCl+/rA=;
        b=KlrPxaOqp7T6Z7B8+YwlzOi8GacNHDuxGiICD13tfjNuXUmAL+akAJi5KsymGKxNi+
         DOjBk/Eic/1cXeyBZG6xf8zGkGHCZpWtr/j9wwoQ4L/CUbs9uLFOfCZeOLh0LL7bpq/D
         f7w/FDJ3G/oB1XE06U9UU/LqUuY8BYqmfOmGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683687675; x=1686279675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhXDuquWC1IuLLKuLTycCDSnaTxPHnK6icHPyCl+/rA=;
        b=PySHJ8ZiCYmZ0fYfFhs0/ZL43ZTAq8wiDhMvYj17TS8yuTp0HtvCX0nyE9484Xz9Kg
         PLZU8r3oPwhv5SdLiDI2vghaIUzHpTugL/KGEr9oFC5s8qFNwzt5BY6ZaojXuG0soHfH
         /F/x0TzEBKM62BzBCeR6leHCueW8a2dN0X99sgouOwjO2Tfr/AWon3V9Ok+px4sV8WXg
         rIBBJrd15s1911Y0DNNoGxIHXfKz6qR+4dXi1j7khZzVwLMIiB5QCz+ldKptdfGk8K2W
         ZpgA3WvM//sCKVud7D565meucQU7D1Gfi4JM5rsHSUivHoJao9G1WpbEqI71ivi70Igc
         ml5g==
X-Gm-Message-State: AC+VfDyJA1VuS9+yvafk7zG/SD8hYGaHResVnCbALK5TlILUF5qCdsD/
	9p+yo0m9YQLOfBtSwBIJPWUOZKZNj9Y35r8tKLXRpQ==
X-Google-Smtp-Source: 
 ACHHUZ5cb0wX6Z8toYUT1c4seEmSxw8Rq/ilwAS/JtX8Qq27BJqsOHaMlGunvUuyOk7xAToMR0CAAaP9cdWsiREE2a4=
X-Received: by 2002:a1f:c14b:0:b0:410:258b:97e8 with SMTP id
 r72-20020a1fc14b000000b00410258b97e8mr4501609vkf.12.1683687675167; Tue, 09
 May 2023 20:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de> <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz> <ZFqIGCliFRJ3W/ap@geday>
In-Reply-To: <ZFqIGCliFRJ3W/ap@geday>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 May 2023 11:01:04 +0800
Message-ID: 
 <CAGXv+5Eu8Y6PPwJ0iwfSvYMV9TkKqm1G+J=ZM1fw0jZyXUpOBg@mail.gmail.com>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 22KE4HC5QGXSQ27AK5KHHK2NVABF37CQ
X-Message-ID-Hash: 22KE4HC5QGXSQ27AK5KHHK2NVABF37CQ
X-MailFrom: wenst@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22KE4HC5QGXSQ27AK5KHHK2NVABF37CQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 1:52=E2=80=AFAM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> On Tue, May 09, 2023 at 09:12:55AM +0200, Jaroslav Kysela wrote:
> > I am open to any suggestions, but the default mailman settings (do not =
do
> > anything) causes that some (mostly gmail) users do not receive their e-=
mails
> > because the ALSA's mail server has a bad reputation. Many companies are=
 using
> > the google mail service for their domains nowadays.
> >
>
> As a GMail user, I can confirm that I'm not seeing any more bounces
> after mangling started. Usually it'd bounce and I'd have to login to the
> web interface to turn back on my subscription, a real pain.

FWIW the dri-devel mailing list seems to implement an alternative strategy
for dealing with Gmail and co. bouncing messages. If it gets bounces it wil=
l
send a separate "bounce probe" email including details about what bounced.
It will not just deactivate a subscription due to bounces.

Also, ALSA's mailing list now requires a subscriber to register a user
account to resume delivery is a bit annoying.


ChenYu
