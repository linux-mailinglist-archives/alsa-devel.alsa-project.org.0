Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1761291DF43
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F112BBC;
	Mon,  1 Jul 2024 14:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F112BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836974;
	bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RYuxEQzLypJ3w6hL8vH9bP8H7snujP2of2I+wLGbfCKuVp4YI4F1K13q2kKRmZw1S
	 KdIUkaR0yAvctTLVbV+f8XkvBuwD+3QUSbiQgaTqCmHJj+8SL8XamldcZPny4b8PwE
	 bmvU9ZgOX4jI64BB37U9MGvjlinPsRK++6qJsobE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9850F89858; Mon,  1 Jul 2024 14:21:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A0A0F89853;
	Mon,  1 Jul 2024 14:21:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18AE2F80423; Mon, 24 Jun 2024 10:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E13BF800ED
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 10:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E13BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=iVNvWPwB
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6b4fdf56903so15669406d6.1
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Jun 2024 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719219563;
 x=1719824363; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=iVNvWPwBjAmeUKSpNJC3SQQF9ZU+rjJ3+lpvp38kf5NthU38ZkYcRV9RXeTZEw108B
         wsfI27w8mjSVMsdOs0yhngu58G+rGZeijpACSTKcMRDfJqNrPxo8rvvsGEj4LwqyHEo6
         fMnzAHSbQwrZLMIlawClO3iPccP29m2ZBatWB61fARY8beu2V8OpFN6I6wW9yosY5wkm
         KCOhM1+IEohTuyvC5ZYPF50tQWrkyofd9Xp57Bp738K7XGBSEl4IP9RVM2OABrbM2jMH
         /4m0Dfc19peODMjrjmI6wUMGEwluhun4ZFN3JPJgARx/CctGULvzvjLAj6gP30nUtfYd
         1rIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219563; x=1719824363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=gcUgOWzYs+Z8J6WHZJxmSJRRrgcpK5Q731c1qoIBlejeAXYrkujJlNe6A/8jjBTy4N
         UPDOLcsN7/XWIMnTUjuj1HfHT5li3/3rMwc2McMrxzUcP/IhKW9BVDcRudpzgpCeYQyO
         xfJL7FvlprgJW6iWuNB0OwgWss+zXzJaPd/sVxjm+lORvCp+KxTopa24AOMu6OmdjW/L
         KPamcFOK6k131vO6bVX480920V0zOI5PA5NEH0jdogy+vuvdjNUEd8CMIzY61SrJmGHj
         4EYQqL/vXP5+Mj6OcKjMySRwgbXUNcD7oU/Az1hn1s/UTrAEPp57scwttWhvZwGpiliO
         5EhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU76JB+BTNx/84Uo44H8Wk/qjx6sDQ/llWM/GnwDJaygl27ZR6TsO7kQQXckKP8SGNT0IjjlRvzVQjuKnqHDE4P8/B5NhpkSsqWtLU=
X-Gm-Message-State: AOJu0Yx7Fxv0rvnkDvb7bonwHdfqpXch5yuAJ7GH8zCAFBDFj40ZS2f4
	oykhX+IiBcwzGg8faSVdswx8M5lPdxhX/TTRZeA3o1Ojg2Q6hzbooy3j2fTE8SZKlLCoWmgjRFc
	jAeIQRT+zo4yxHvoVuNi9J0uiPO/n1svVuxocvA==
X-Google-Smtp-Source: 
 AGHT+IHJdukmHTX31XZGqN8Ya5O7xqbZeOSn9ad1olNhKCpFsHEHdPHP6m4H5tAF93YKuWVFl5Mnqdf3Ba8kIeeVBLc=
X-Received: by 2002:a05:6214:4a45:b0:6b4:ff32:8287 with SMTP id
 6a1803df08f44-6b5409be0b9mr37950676d6.22.1719219562855; Mon, 24 Jun 2024
 01:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
 <ZnkGcwd8M1QFfmxl@matsya>
In-Reply-To: <ZnkGcwd8M1QFfmxl@matsya>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 24 Jun 2024 10:59:11 +0200
Message-ID: 
 <CAG+cZ06R5P1g+1Pk3gbQ6Yod0mBM41dFTgvnBWg61HZFUtmx-w@mail.gmail.com>
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX
 SoC
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>,
 dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D5PLSQDU4WM5DZZU4MSW4PCEPE66UE6T
X-Message-ID-Hash: D5PLSQDU4WM5DZZU4MSW4PCEPE66UE6T
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:22 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5PLSQDU4WM5DZZU4MSW4PCEPE66UE6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 24, 2024 at 7:39=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
> Any reason why dmaengine parts cant be sent separately, why are they
> clubbed together, I dont see any obvious dependencies...

The I2S driver depends on the dmaengine parts

> On 20-06-24, 19:56, Piotr Wojtaszczyk wrote:
> > LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer=
,
> > this driver allows to route a signal request line thru the multiplexer =
for
> > given peripheral.
>
> What is the difference b/w this and lpc18xx driver, why not reuse that
> one?

The lpc18xx used the same dma peripheral (pl08x) but the request signal
multiplexer around pl08x is completely different - there are no common part=
s.

--=20
Piotr Wojtaszczyk
Timesys
