Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB5832CE7
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 17:10:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E832A823;
	Fri, 19 Jan 2024 17:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E832A823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705680646;
	bh=vrfrQmaR7zVk3WtIOmDG6fhQnohSJy5l+phLzlOEZ2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LF6F/jqoKowyxcY2VzOlQZrroHznCSXOc5DN8tqNNE5oUpzFWvEFcu6m7UAGbBEcL
	 nusfpgl73zxvwNfRc65PrIUdxM8bQLgeyqPCtuyOhi5qXU8kFAcd0dAmcbYYB+uavm
	 elm+9I1nZy7CR8no+KqUiSUp7J+7mRs8HmbpAnYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEE9EF805A0; Fri, 19 Jan 2024 17:10:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63317F80571;
	Fri, 19 Jan 2024 17:10:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42F23F8014B; Fri, 19 Jan 2024 17:10:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE23AF8003A
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 17:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE23AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W79svdtl
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50eac018059so1348369e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 08:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705680605; x=1706285405;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe2AZJ9rG4DIKTX8/he/utaFFdUl2hwHY++4l7rMVNA=;
        b=W79svdtljUpAqDwLx29SfpLnyMfyLXe3D7Vt9HNHF7YdURIMU+1h8m2cX3PcWwdH9M
         ozx6Qzwrz1hkuK56uwFP1sos1kps13MXTh04W/uqH0le69I5igA4kAM8bjAvEQvycWfu
         W9cclY7qe1lVbEz4bvAri5tuYbWvNG3WCvkXPUUmHoMEeMGUipWiwU1BchbjTRcy9HAU
         IXzJY94Pr7BCcbPN03w3Mq5uhMQYxxbjICC0wV7S4FRfaheX6SsnDyRJ/vcYYFm1Rkvq
         98WXVu8pNNfmL+Q90u2RBi2jlGOxI8T2eNljW2sZN/dBGJXe8Md/gS5RyI8KuH6rQwsE
         fbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705680605; x=1706285405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe2AZJ9rG4DIKTX8/he/utaFFdUl2hwHY++4l7rMVNA=;
        b=XF3LkgBQ4KFRIIeR1VFkhCB/UrfEt1qKuAOH35Ak1BWqOD9vhzWqsuzgejXBEOGRtD
         DFXnGsy0H7gbx5utmqrzQo7YrjVokIXEMTsjlIirtf97JHp9MO4DtYZJUkQfdiQ3u3+k
         WSghjyiGUTWlNSQDYLCxvzuTwykVW7cy+IjvzyNrE8aocepj++Q9sxK3OP7uRbRayzUg
         VO+lerP8suc8XJSRfmd6GmsnyxYa7FVQitlADY9pdzFV45BeWLofrh1NiUk/p9GsF6hA
         liLxI/Rr7IkiWMyFQafVtFT7XOQgtG2zYZpYY22F8En0ZuFCDpuK+ZTP0qYl65yyU814
         Uz6w==
X-Gm-Message-State: AOJu0YyIxlp5CHl1bDzbV1gJA09EyJZl95taAsYfv52svXwr99pbKOTG
	pKQHqNwXS3CvuChFIxQ3n8kyrgHlvSw0cKjbHQT6CsKQvhjfIxvZ5bnPy/Z+q8ROJDGK4Y+k8N6
	4Om4OfYuGiyRpL7MF8h2FADkLUrM=
X-Google-Smtp-Source: 
 AGHT+IGe5hGb3AQxEzUByESuCQYg8t9XsnK7jKBnEML9VYgxTrUlh51XrlhoAVDfHHhRdN684YROYUuUrEhYSmYrlgU=
X-Received: by 2002:a19:7413:0:b0:50e:d5e2:92cc with SMTP id
 v19-20020a197413000000b0050ed5e292ccmr804081lfe.81.1705680605272; Fri, 19 Jan
 2024 08:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-6-ckeepax@opensource.cirrus.com>
 <ZalahZkCrBm-BXwz@surfacebook.localdomain>
 <20240119114917.GB16899@ediswmail.ad.cirrus.com>
In-Reply-To: <20240119114917.GB16899@ediswmail.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 Jan 2024 18:09:28 +0200
Message-ID: 
 <CAHp75Vf0BdOj_Bcxs3L=aznUzoMptPF+tDBpOcBKOcVTH45+Hg@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] spi: cs42l43: Add SPI controller support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: N4ANFQC3DMJ55IYVJ3EHT4KVKXDNOMDO
X-Message-ID-Hash: N4ANFQC3DMJ55IYVJ3EHT4KVKXDNOMDO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4ANFQC3DMJ55IYVJ3EHT4KVKXDNOMDO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 1:49=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Thu, Jan 18, 2024 at 07:06:13PM +0200, andy.shevchenko@gmail.com wrote=
:

...

> > > +   if (is_of_node(fwnode))
> > > +           fwnode =3D fwnode_get_named_child_node(fwnode, "spi");
> >
> > You can actually drop these is_of_node() tests and use another variable=
. In
> > ACPI there can't be child node in small letters.
>
> is_of_node feels pretty clear what the intent is, rather than
> relying on nodes not existing etc.
>
> > But main problem here (and in another driver where the similar is used)=
 that
> > you bumped reference count for fwnode. I haven't seen where you drop it=
 back.
> > Have you tested rmmod/modprobe in a loop?
>
> Yeah it should drop the reference will add that.

Note, this will require an additional variable anyway (as in the
infamous `x =3D realloc(x...)` mistake).

--=20
With Best Regards,
Andy Shevchenko
