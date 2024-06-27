Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DE91DF54
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A52AD299D;
	Mon,  1 Jul 2024 14:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A52AD299D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837141;
	bh=q8pm1cQ32txw1WRPKTanNTmvRox3c7g4AlMuHhl+D20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YaZ2qMD6+RvUN6g5QqRqdBpaX9qRxXxs2GyVLAbhPig0ErwDjwT0Mgt5yDGKQe5ws
	 jjM2oa4eiXTifBurPzPdFvs6of/aBh+7LzLIYU9zNtb15vHjtWbXuNMv4tcijIjCVW
	 XDozeppnMsS/h3SEpW9sXtfNy2aMcPk0R0OW3Hpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34B38F806EC; Mon,  1 Jul 2024 14:23:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68292F806EC;
	Mon,  1 Jul 2024 14:23:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3B1BF800E4; Thu, 27 Jun 2024 13:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E991EF800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E991EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ugzqdyiH
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6b5932383e0so3472886d6.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719486365;
 x=1720091165; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8pm1cQ32txw1WRPKTanNTmvRox3c7g4AlMuHhl+D20=;
        b=ugzqdyiH04uDUpvGX0aoUZf5bSuBwE0PiGoVg9rl6knjXQLAXunRWKyAwoWFFqG9J4
         pQiQfwJA4Y8QaRsZvMGp54sT3UeCZZPa5ERyzUjnxLfU4QKbob5yZWCX58XTeUuc0Ry/
         gVbWd1mnUguMBQ2YK2T/rb/Q+i9h9J7aMaifGJqG0o4BhwrgC0Jwbxu/TMOXPJ4OAm0H
         pjP0rTu2a6Yrno3qHS8sMY3hwyyGSbrl5alcMDAz9P2D6pJUAxkDuRmlS3n9vZQsZX+Q
         Wi0We37zwUkdivUlKAyo0uyOiq+Lxs2LChI/XGX5cIKSRUmNN861Z2aTxIB3AJ2PDeAN
         u86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486365; x=1720091165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8pm1cQ32txw1WRPKTanNTmvRox3c7g4AlMuHhl+D20=;
        b=SK5zpvPfER1vNoAi/A6NlJlvXb3I23g8MCJKZffu/01T6qPuKuT6cXhmAA1VrMtkOF
         PN9n0C7QieAMtH7Uk41V1Yi5le6anMzVZl10+c8sUqWToa0vbqS0TzwWqQOc1JzfjOJC
         HLTJL4mMf94F8lpK7OMvcC5Hoaz33Y9Uto+ftxFvUssMGLEkWh5/MASRdIEVO0Q6jnhj
         v0cs3UDlb4KgZU1KbZeMvNIWpfJJ92SyQihSf7NeQt/pxlS83iQBc3dTD6fnLg1aMjMa
         K5Ea4RS0MyNpfd7TKiLJ8lXNBdwtjeCF2z6UxyT4WDmr93+i6hxO+z00sI/HeqZ/T2sP
         fOJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtkOtLF1iIjpi6nCbm6R/jv8O/j0e1CbIjRgz8P2VrsMD3/swkf9YEorHNncdznBwlhjMRPCE2KhZT6hQ56kaa2/lANSVVv2+m4Xo=
X-Gm-Message-State: AOJu0Yy1pcyZ1XHmy/MhxC5AySDdf6cslvdcb9IdbpW7P9AZDXTcPFr+
	rDkv8Vcab8cqmMAmYdDFHtzNOMIwJT+vLch3kgi982q03UAQLXC0sFGPdj5Dh9DQ8OKW7dREGpv
	w/CAaPSqqfa6QZ4UaCV9IyDYRPlzYAhJIQtalVw==
X-Google-Smtp-Source: 
 AGHT+IG2MNKNNOGC761uBwvpqX9lGsPO6rQNPCNWhEy1V6ZqnINWb303gmPma/KMWKNSmIVuRVUQ+Leug+4DoYkVHJE=
X-Received: by 2002:a0c:f2cd:0:b0:6b4:f7bb:6d69 with SMTP id
 6a1803df08f44-6b56380939dmr109313566d6.32.1719486364821; Thu, 27 Jun 2024
 04:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
 <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
 <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
 <73yvglxha45d5ft74m3y5fdmkgatm2yftvhza2msg4ombjz42f@wz43pubhbpdz>
In-Reply-To: <73yvglxha45d5ft74m3y5fdmkgatm2yftvhza2msg4ombjz42f@wz43pubhbpdz>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Thu, 27 Jun 2024 13:05:53 +0200
Message-ID: 
 <CAG+cZ05uam3LkvLXG3xAc8FY_p6jx4p=zinNeWbkKUbcLxSTrg@mail.gmail.com>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
	Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QGYTJSGN34Y5SW7C23XN3V4SIQZP5BPB
X-Message-ID-Hash: QGYTJSGN34Y5SW7C23XN3V4SIQZP5BPB
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGYTJSGN34Y5SW7C23XN3V4SIQZP5BPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 25, 2024 at 11:12=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Piotr,
>
> On Fri, Jun 21, 2024 at 02:08:03PM GMT, Piotr Wojtaszczyk wrote:
> > On Fri, Jun 21, 2024 at 12:57=E2=80=AFAM Andi Shyti <andi.shyti@kernel.=
org> wrote:
> > > On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> > > > When del_timer_sync() is called in an interrupt context it throws a=
 warning
> > > > because of potential deadlock. Threaded irq handler fixes the poten=
tial
> > > > problem.
> > > >
> > > > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> > >
> > > did you run into a lockdep splat?
> > >
> > > Anything against using del_timer(), instead? Have you tried?
> >
> > I didn't get a lockdep splat but console was flooded with warnings from
> > https://github.com/torvalds/linux/blob/v6.10-rc4/kernel/time/timer.c#L1=
655
> > In the linux kernel v5.15 I didn't see these warnings.
> >
> > I'm not a maintainer of the driver and I didn't do any research on
> > what kind of impact
> > would have using del_timer() instad. Maybe Vladimir Zapolskiy will know=
 that.
>
> Your patch is definitely correct, no doubt about that.
>
> And I don't have anything aginast changing irq handlers to
> threaded handlers. But I would be careful at doing that depending
> on the use of the controller and for accepting such change I
> would need an ack from someone who knows the device. Vladimir,
> perhaps?
>
> There are cases where using threaded handlers are not totally
> right, for example when the controller is used at early boot for
> power management handling. I don't think it's the case for this
> driver, but I can't be 100% sure.
>
> If you were able to see the flood of WARN_ON's, would be
> interesting to know how it behaves with del_timer(). Mind
> giving it a test?
>
> Thanks,
> Andi

I took some time to take a closer look at this and it turns out that the
timer is used only to exit from the wait_for_completion(), after each
del_timer_sync() there is a complete() call. So I will remove the timer
all together and replace wait_for_completion() with
wait_for_completion_timeout()


--=20
Piotr Wojtaszczyk
Timesys
