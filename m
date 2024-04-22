Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60F8AD3FA
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 20:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE06B60;
	Mon, 22 Apr 2024 20:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE06B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713810726;
	bh=nsVqF7aFr07HNwFy57xiuVhDHkFzFp4+A/2ncH7KiQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iA1U3lUarHatOam+tCngu2ROJ260uL79BEmIruZl26HagPN9qPfV10PqPyLqyNTuY
	 sKSNUfPl0TMkzl9FTDMhxMYTVli2k7UihYjzrULIDLFYvwfjMpzG0QJPLYWtrKSL83
	 EgQN7IikjXWKo1uatjtni+T6IWlWQtIhseac9+kI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9F42F805A0; Mon, 22 Apr 2024 20:31:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13009F805A0;
	Mon, 22 Apr 2024 20:31:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C48BF80423; Mon, 22 Apr 2024 20:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35676F8003A
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 20:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35676F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RZbcv8Vy
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-518931f8d23so5012140e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713810680; x=1714415480;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsVqF7aFr07HNwFy57xiuVhDHkFzFp4+A/2ncH7KiQU=;
        b=RZbcv8VypcXt/+NqG4dVIbyGL8svIX47D+2GAOu2iztXALtbEKP0EP+0g/JQJih+xA
         xJvjqwAJsJXHI+eE4ypoug9tc8s9O5kpImO1P2yVzSqGbnGcqK/kfbPV7aqfJH7cMA33
         E43muDb/4rQKpQUDFaiANRdGQjcPgtTOkn1WOPe7Qn92udyIpDam8XgNg4xl4E2Rt9Ih
         4ots2E9xY8M0T5r4oP2CTUk6UMzB2psbdaXBjUIvcyXshXrONT6iX+Ab9QonS3YOA8Op
         n0dSJUFUGe5Di/LgLy3TnvO2wA/kIaK0r2qXiWrYCCWB9wJl43zcwATkznzK1NaLEBCb
         7T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713810680; x=1714415480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsVqF7aFr07HNwFy57xiuVhDHkFzFp4+A/2ncH7KiQU=;
        b=weQ8+koIZ1tGVejRyZ0/AoaEnpGkvwMr6sp48A2hlWwZZ9lbw4n49D+R7o2DlavfoD
         aT/g+thQiqGawdAUg0WBbFZeWILpDy36wkyEC41oXD/qDArMnGbGkFz5401dh+LRVX0C
         sHyQGon2mgicJu4l+j3l1d0NE8hvjqWfNwl6HVPbuPwioae5Fdewh5ScbvXYdVOWLlzB
         QN+QMSclErBoCtf9bLBE1vsuH8q+m0qHBDTjz1Ov5t6EAemL4jVtCy1k7qqymaPld2hn
         SDFok+cU8P1zSATnKcq3JZuRy/6zTQ0QgobH2YveOCyIJfNgJPhDtXYIlHCEhhA4lGde
         j00Q==
X-Gm-Message-State: AOJu0YyBzlW+b4gCIkrNfC48l37acYf77/tuiOmcZTlceTgMZMnpM3Py
	P22CGR9v9gxc03plvcArDzmDs77rLzJ5fBXbKZXms+Gh4Syx5RyY2qLz2iaTXKFnRPdG9EN2v20
	bM4lDYxATgu9bY9LXBBodZrS+x9k3iwTW
X-Google-Smtp-Source: 
 AGHT+IEs+gQjuYndeYtmPz4/RAVR2aMDVHAUpHWDI+RUuLtrrdQncgtM8Cu3pLh4gLCkud/SvOBGKv3fV9O806eTiiA=
X-Received: by 2002:ac2:4dad:0:b0:518:cf01:9f21 with SMTP id
 h13-20020ac24dad000000b00518cf019f21mr6465250lfe.66.1713810680162; Mon, 22
 Apr 2024 11:31:20 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com>
In-Reply-To: 
 <CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Apr 2024 21:30:44 +0300
Message-ID: 
 <CAHp75VfhZZ9dN_AaF_7TYmknsZ0iXBiVKmeA1Q=6d_1cyE2xxQ@mail.gmail.com>
Subject: Re: Missed review / mailing list submission?
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>
Cc: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BH2SIQNDYPMFUWKKQRUBW5EIC5GJYMED
X-Message-ID-Hash: BH2SIQNDYPMFUWKKQRUBW5EIC5GJYMED
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BH2SIQNDYPMFUWKKQRUBW5EIC5GJYMED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 9:28=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?h=
=3Dasoc-6.10&id=3D710f9a3673d6839c485d6a1cd59a2b5078092d47
>
> I can't find this in the mailing list.

To be clear I have checked lore and spinics.net. So, it's not a lore
problem if you wonder.

> Moreover, it has an obstacle to be applied, i.e. as per
> https://elixir.bootlin.com/linux/v6.9-rc5/source/include/linux/gpio.h#L5
> the gpio.h must not be included in a new code and brief looking into
> that driver shows that legacy APIs are being used without _any_ good
> reason.
>
> This has to be fixed (by the author).

--=20
With Best Regards,
Andy Shevchenko
