Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3E83BC50
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 09:51:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD01844;
	Thu, 25 Jan 2024 09:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD01844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706172688;
	bh=p4BO9u8QAGeKIOwzK1sY9h5zf9JQT29Y2W8Ay3uMVC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kfAf2XHJE2ZezTwmA2l3AiJmL4Jb7vX+WKMxLv6m7HWFX7Dy1RwkwCLtMR3qFzrdg
	 +qpwDS3rOKf34+0RNwfy0N/ukSbSDq9aF2vYCsAeSDnI8ZP4yL55bUZ/VLFBZ0/Ubq
	 NFXC9b+qiO3L+1CKW7D3JEcmvoFhwF9xtWBCVrF8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71960F8057D; Thu, 25 Jan 2024 09:50:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35294F80564;
	Thu, 25 Jan 2024 09:50:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A314AF8028D; Thu, 25 Jan 2024 09:50:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB1B4F800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 09:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB1B4F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=g04Mkj6Z
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-46afd88430dso350505137.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 00:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706172602;
 x=1706777402; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsKffEL6mluctf+cUpjZAVkFUNhs9adzeOY5iA4Fn/I=;
        b=g04Mkj6ZWAkgA84vBrNq+6vSPYASb7XX26SsabLiSRIJ5P0ew2Vi3gbjL4jP2D3Hs9
         gyJgsVIyYj7cSrMW8HZkkjR+u2THVGqdeAQk8AMV64EZA954BFqhFODZovJza1EDKskW
         /Xy7Rx1qb6OrXzxaOBOSY73iRvnGvh8cbOxo/JesJLz/LEYd3erXPyrM4kfHa2FzQoDm
         7LWJ8huNI1H65I/fBcLy0uKNVxxYWNaIAgJ09yJpc4hI/VL5vVDz4kgVm7DaRSMJFU2P
         fHT9s3qiawDNfGPicLZo7T6Hy5J4jU6ENajxiUJ7HKGOIXc+h1MtLcorFmZbuWvyR3Zh
         QwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706172602; x=1706777402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SsKffEL6mluctf+cUpjZAVkFUNhs9adzeOY5iA4Fn/I=;
        b=Fac8KqilR6egUHF3HT0FG//JB/sNxaTxVvjf0ayaVv7fUkf/LHXURZfR7/QUyZF2FP
         k74L7oe1TKe6Jo4Wgxr3zoX4AXGdl0yci4wR8PLb4qa1BhegR4kY1t0c3z5wnaqYwsyQ
         D0UKDkTKwvK6DuWRnQOHEl6GTemWxJJfy5XokLa4AkuXCJkl+j7fWkPfc1eaLjqe3Daw
         jSxhj8qDfCS9ZQOHuddXOT0tNrflePBBj869gsCv5gzQG/t9GcOEnUs86GRXlRUnMFsr
         uu3bdE/tB6pcuJYUFqHcs3Y91zbvtTjN+GZkvyvzQvf6nFq8PYwG6vq2joHjk0IlL8Jk
         qrlA==
X-Gm-Message-State: AOJu0Yy5dHiwgHxddZo7XfrzgpDGNwHE7O68oe/fGU/thk+2cLKh6VTe
	cflecZAsUbqvHbuPOk05qzc2672yks9dSg0rIiG64n+vxSXIWsTfgr55SR/4Z19Zmok39DGRHiF
	1TyUcRwkYIneb6nKHhRTN8zNiJI7vd1W5/YFpAw==
X-Google-Smtp-Source: 
 AGHT+IEXyAabzgXxr3HfBXhvXdKu2rg2zJk9uemqtcciakhWkSZRpFr5cM94Z5De7H+I5E8qdr6SFsVNIxfIMEQUhDg=
X-Received: by 2002:a67:f752:0:b0:46a:fae3:d82c with SMTP id
 w18-20020a67f752000000b0046afae3d82cmr366729vso.22.1706172602526; Thu, 25 Jan
 2024 00:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
 <20240124074527.48869-5-krzysztof.kozlowski@linaro.org>
 <cc9683c9-356c-4cd1-a838-4ca92ded612b@linaro.org>
In-Reply-To: <cc9683c9-356c-4cd1-a838-4ca92ded612b@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Jan 2024 09:49:51 +0100
Message-ID: 
 <CAMRc=MexZidVUf=0gHcXTUOxbSAtdDLZ2gBk6-2man1CSv18gQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4IQCO66DCAMEKB4NHYH2HAOSSGZHBYMH
X-Message-ID-Hash: 4IQCO66DCAMEKB4NHYH2HAOSSGZHBYMH
X-MailFrom: brgl@bgdev.pl
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 25, 2024 at 9:02=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/01/2024 08:45, Krzysztof Kozlowski wrote:
> > Devices sharing a reset GPIO could use the reset framework for
> > coordinated handling of that shared GPIO line.  We have several cases o=
f
> > such needs, at least for Devicetree-based platforms.
> >
> > If Devicetree-based device requests a reset line, while "resets"
> > Devicetree property is missing but there is a "reset-gpios" one,
> > instantiate a new "reset-gpio" platform device which will handle such
> > reset line.  This allows seamless handling of such shared reset-gpios
> > without need of changing Devicetree binding [1].
> >
> > To avoid creating multiple "reset-gpio" platform devices, store the
> > Devicetree "reset-gpios" GPIO specifiers used for new devices on a
> > linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
> > controller, GPIO number and GPIO flags) is used to check if reset
> > controller for given GPIO was already registered.
> >
> > If two devices have conflicting "reset-gpios" property, e.g. with
> > different ACTIVE_xxx flags, this would allow to spawn two separate
> > "reset-gpio" devices, where the second would fail probing on busy GPIO
> > request.
> >
> > Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ =
[1]
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Sean Anderson <sean.anderson@seco.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > ---
> >
> > Depends on previous of change.
> > ---
> >  drivers/reset/core.c             | 215 +++++++++++++++++++++++++++++--
> >  include/linux/reset-controller.h |   4 +
> >  2 files changed, 206 insertions(+), 13 deletions(-)
> >
>
> LKP reported issue when building !GPIOLIB:
> https://lore.kernel.org/oe-kbuild-all/202401250958.YksQmnWj-lkp@intel.com=
/
>
> but I intend to solve it providing the stubs. Therefore this patch will
> not change.
>
> Best regards,
> Krzysztof
>

Ah, so this is why you sent the patches. I don't like stubs in
gpio/driver.h but I get why they're needed here. Maybe we should
consider adding gpio/misc.h for that kind of stuff.

Bart
