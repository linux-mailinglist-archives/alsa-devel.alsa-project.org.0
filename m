Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899878AE22D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 12:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6DD1903;
	Tue, 23 Apr 2024 12:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6DD1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713868158;
	bh=Fos++Rwloq0zSh7TGDl4NBXgKPqtKiDUG448YGGQgVU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hJx821msdYvr//968s0idZxTOH39/v7ntV6EVQgQVNS+vxP+G2dQ5ABqbKpPs3F9u
	 xDbzRq8Pajqxl98eac8PBh/hl58kl3muhKxDqUbLTf3YjX4LZFYHHqHxuHR5TzChyQ
	 IdDQ7EmAntkGZN7Shu/hjboMzoUDDQQduSK4WifM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ADE5F80588; Tue, 23 Apr 2024 12:28:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04676F805A1;
	Tue, 23 Apr 2024 12:28:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0405F80423; Tue, 23 Apr 2024 12:28:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96DCFF801C0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 12:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96DCFF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JfloKUxU
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso599712566b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Apr 2024 03:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713868109; x=1714472909;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8lNpt6zWvVHRupkePuK9koOdJZHK4un3t9GHiI010U=;
        b=JfloKUxUwqUVR4Q6DeouINKZVPnn5rDWntSnK2cJg9GwEFezc59NgB7i+Ktaqn1wdK
         6AvLZxNxNa3I5bYaTbknOV9cEp7GhzEPuPD9VFFR0ScaqzsL8bRFmg990VaKuY+UXPY6
         MbqPUyafTq5/refMSWvSN5T2S2m+l3p5UdzAgizPXlkSI9dHF/2SF3MxYbCMh4rhd7Zk
         vD6DnIR++tpKGwFQNDtGFpPCBf8yZiphCtneM1uVwycKTQOcch1cj3fnmkmoNHPxaLQ+
         mFEtzQZkMNCuuBZuBJRPcxTXXBdaS/3PeeD8vEyElG63sned6PAXDuqGONmNV+8AQWh5
         4mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713868109; x=1714472909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8lNpt6zWvVHRupkePuK9koOdJZHK4un3t9GHiI010U=;
        b=gTeoJPkSdaEmgQ7cBZX+r/zb+uiKm5pIwzdUW16ZddvlimaHHMz7FiFQv4IrVMiMn4
         Je0DcNGdEAJXAy6YZOYbVyl+gSBwYMxIdTH64m9onmMUCTvv7AOizy4bTWmVvw/pp+Bw
         4BJse1EOsUdYI7Tn6adbxKZCeDiu1I3dm9ND4dEtg+ChvFBEHl2zHN3AC6CZ9ChQzHNx
         zf4ggPaukj9ffS19RjALx8Ry5NbQ4ii1hiyNxzK36LNfV4UQHv5/XIC7G5cmh6hqVowI
         hEWmqc06Exl7c4XuSRPo2xZCZh8Hgs0xRmL3RknXXP+bCzzRhZ9VJ/7/KXTu4NuPakvW
         xg+A==
X-Gm-Message-State: AOJu0YwR1ZCvVlF43o2jV+mnrGNRaEFY/xP2wPxzSLggcvuWbhaVCCeP
	4uKic6aEndGRF/AK/vdTa4CiJsjzTT6VnXp7Brrng64Rw/1GLBfNr6x+Ugji6//RMQINDXH7gx8
	jGgU6809YoJmIe0EhOGMoYsfFrQ9Bw2nF
X-Google-Smtp-Source: 
 AGHT+IH9Ggp8GTBSILa98X3L2LV3MP5Z0cnJ09/dFRd5UsErO6F4p+myjYsfBGejr3v/xcA1IkgBRJy8Y1VwehqNAhQ=
X-Received: by 2002:a17:906:16cb:b0:a52:6159:5064 with SMTP id
 t11-20020a17090616cb00b00a5261595064mr12206488ejd.52.1713868109395; Tue, 23
 Apr 2024 03:28:29 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com>
 <Zic9FJllBhOVtWr3@finisterre.sirena.org.uk>
In-Reply-To: <Zic9FJllBhOVtWr3@finisterre.sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 23 Apr 2024 13:27:52 +0300
Message-ID: 
 <CAHp75VdUZ4ZLcXBSm8xq+sKuo_ny-VCcKYaBd2Ng+eGEjen5dg@mail.gmail.com>
Subject: Re: Missed review / mailing list submission?
To: Mark Brown <broonie@kernel.org>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5DA6V35ZNRMAGEATMTUNOWQNTY45EDLJ
X-Message-ID-Hash: 5DA6V35ZNRMAGEATMTUNOWQNTY45EDLJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DA6V35ZNRMAGEATMTUNOWQNTY45EDLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 23, 2024 at 7:54=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
> On Mon, Apr 22, 2024 at 09:28:45PM +0300, Andy Shevchenko wrote:

> > I can't find this in the mailing list.
>
> That was like v9 or something, as you later noticed it's been on the
> list over a very extended period with many revisions - there has been a
> more than adequate opportunity for review here (Pierre did a bunch for
> example).

Right, I simply looked at the wrong place, sorry.

> > Moreover, it has an obstacle to be applied, i.e. as per
> > https://elixir.bootlin.com/linux/v6.9-rc5/source/include/linux/gpio.h#L=
5
> > the gpio.h must not be included in a new code and brief looking into
> > that driver shows that legacy APIs are being used without _any_ good
> > reason.
>
> > This has to be fixed (by the author).
>
> Or someone else, for example you could do it if you were so moved.

Sure.

> You
> haven't even CCed Shenghao here...  please at least send a mail to him
> explaining the issue.

I Cc'ed in the last of the three I have sent.


--=20
With Best Regards,
Andy Shevchenko
