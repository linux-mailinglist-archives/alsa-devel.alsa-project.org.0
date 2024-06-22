Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E5913418
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 15:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD79844;
	Sat, 22 Jun 2024 15:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD79844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719061612;
	bh=fZzXD+VBy/TnjHfeespdwqsqQcRvbT0wXeFDsY6VBSE=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ti637YrO/zdRONYZT0Y3qLSCe6t+pLkhuck+V4YBCZT5lwfrX4eUoCr+u1Lw4Dx/Q
	 xQ4lGcnVGHlSc54K1uSG88rWw+Q7oLLXw6nk5cVsmDP3BBgyf3BcGUAMxnkbfmnSeg
	 lfg/5bn+p0+tb/TaDNHDFn8M25WoxKpAbmMUB3rw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 812EFF805BB; Sat, 22 Jun 2024 15:06:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9935BF805AF;
	Sat, 22 Jun 2024 15:06:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63A94F8023A; Sat, 22 Jun 2024 15:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA367F80236
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 15:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA367F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jFR+Ve1h
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so2892489f8f.2
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Jun 2024 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719061562; x=1719666362;
 darn=alsa-project.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrytYasAxCaCe6tWDwhrVic7gXvGWpWw0egqVhOW2rc=;
        b=jFR+Ve1hFnLxSAb2L3Gh//qilJ5yJNBpt0/Lp+wgNUKy0S8MIPmizdqrjQSYhYt+lc
         7WOMJzPydhvu/sWeCWkCDzrXcdfnvMEZKO1TZ5WSbfTSSFPyfr5eiugJ4cFkyqiUBN8g
         yy4rr6nEXxguBacf1VZ9Wx+LkPyYzue3CZbY7pxWf5cQ/MPo2wTlUpRylO0Gqd/2VPkn
         yuDZOdmTG27XhUVFGjn//FwzmuRq4tvuUskeeZbQX3B+1QVeDWMw6NifeQnX9jsFmRjD
         EnS6hUaAwBkg1seHFxW6Ipj/JfLN8wYts9yk/DlGtfejwPlPpbbW8PUtwMdGP1+q+heq
         /6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719061562; x=1719666362;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrytYasAxCaCe6tWDwhrVic7gXvGWpWw0egqVhOW2rc=;
        b=N+/3jIpbvN+UkAawPbN7dxpnTkJpkUoKoSax+I8L+pAnZHA072eZs/MV5s17mKXxeG
         tM+jFd0VfS+wyxDqzQAcQsqRsXDrm6+ou6+rMywqGfr8pXyBqMzQJzxzDaRifSgXMsVX
         unL1q/ym9CwzzB+9qDA0Q6CQVd92SXdX/yv3YV9nHpxARRDPRRWmjmBLsWLI7vCpas5T
         josLZKvYy2yDm/x6mrxNxTDaa1L+71hmUoBddlOUNnkCflKSgGgB1F1xEvwl6u57aYX9
         WvbfYP49VnRjxrVJHQCevuAxSMsokqF5/YA8nmI2elrLaE9RbKMp+UxEx7wLqgXPHMKo
         +0pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC0tCnwOTISYe5g4HJuSh0ntrULcjPd0Rjxh6EdL5qxiyAyDfHkY05rNnttWRKzEnjzL5A5H6aeN+iSJTB4Z3Z2YCldGyT007/5Os=
X-Gm-Message-State: AOJu0Yx4cl6X0EeJacVSAz5zBKe/rHjuBiMRpTdt1ZVAJdKJicPkNwT+
	Lgj1hIfZlehCa9ubhHwvKMdSd2QTJFJagl0RicU+kMLXhc8B04Jn
X-Google-Smtp-Source: 
 AGHT+IGexro+lYSB8P9rFaqT/pj2wNDLwJM8cIt6lN/oXLdliRgMk3yRPZse8PG+bDDqHUZ0S41s6g==
X-Received: by 2002:adf:e6d2:0:b0:362:8dad:c6a4 with SMTP id
 ffacd0b85a97d-36319990496mr9020616f8f.57.1719061562130;
        Sat, 22 Jun 2024 06:06:02 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f6722sm4494637f8f.24.2024.06.22.06.05.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Jun 2024 06:06:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 2/2] ASoC: Add support for ti,pcm5242 to the pcm512x
 driver
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <57f0036c-4412-48fa-a6f9-3fa721717be9@sirena.org.uk>
Date: Sat, 22 Jun 2024 17:05:47 +0400
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE6B5FD2-790B-431F-BC69-4429CE26802A@gmail.com>
References: <20240622124603.2606770-1-christianshewitt@gmail.com>
 <20240622124603.2606770-3-christianshewitt@gmail.com>
 <57f0036c-4412-48fa-a6f9-3fa721717be9@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
Message-ID-Hash: WTJ6TJI2ZG6KIAY7HUCDGV7MQDPSHG7O
X-Message-ID-Hash: WTJ6TJI2ZG6KIAY7HUCDGV7MQDPSHG7O
X-MailFrom: christianshewitt@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTJ6TJI2ZG6KIAY7HUCDGV7MQDPSHG7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> On 22 Jun 2024, at 5:03=E2=80=AFPM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Sat, Jun 22, 2024 at 12:46:03PM +0000, Christian Hewitt wrote:
>> Add a compatible string to enable support for the ti,pcm5242 DAC chip
>> in the pcm512x driver.
>>=20
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>> sound/soc/codecs/pcm512x-i2c.c | 2 ++
>> 1 file changed, 2 insertions(+)
>=20
> The device appears to have SPI support too like the other devices in =
the
> family, why not add the ID for SPI as well:
>=20
>   https://www.ti.com/product/PCM5242

Okay, will do. I need to send v2 anyway as I fat-fingered the chip
number in the bindings patch subject/description :(

Christian=
