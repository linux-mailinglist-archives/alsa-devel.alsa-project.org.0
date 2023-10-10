Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E67BFDB0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 15:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E351508;
	Tue, 10 Oct 2023 15:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E351508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696945125;
	bh=2BcYWTkK3Zq4RaJ6QSiIWDLjJKh5RkW4qWVPOlMXZYQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nHSvTZFsW7PKoTIZbTAvDrU1ztZpX+niZXIgKcKD0S9rUnxNc26asLl4972qqbhQ+
	 XHlh6i97YWMEIWHsID5YQImgOSuOX5Le7TmTBvjqOT/NS+bgLfJbZYIzYR0BnCWvXd
	 C6rqOyO1Pzh2lvFQFSWSzSnnbwAaQyfwiQzDBYaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CD0BF80552; Tue, 10 Oct 2023 15:37:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5388FF8027B;
	Tue, 10 Oct 2023 15:37:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B40ECF802BE; Tue, 10 Oct 2023 15:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1432CF80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 15:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1432CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vXYEIiwr
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-59bebd5bdadso69503737b3.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Oct 2023 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945066; x=1697549866;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BcYWTkK3Zq4RaJ6QSiIWDLjJKh5RkW4qWVPOlMXZYQ=;
        b=vXYEIiwrd4yeGZUmTHCVVNTtiMyp1TOqlU3cwkmDwRs4231WKsqU/Y6q+iFerhCHGz
         k/1jG/SJciVTab7/JJe29WuZtDqOvhFWC4IlKGJxHFQfHS+EX3vphSm3pKmALFN4x96X
         ziSDaX6P+VUJdoifbkjxRE/+2/ksc/mKyIrd+mLfWJAp1b4Fe8c5ZCQeILPNYuYBFVpE
         Qz9NfbTjO3iYem8iJF7syjc2eIVqLzEn3Zs7XA3eCL/JPoJZrMEndlJihdTgSppQE8eX
         IBVOtcIH4Vsx2YAhIwioYjMTnLHkNVRh/XWg9wgcBsDFqvHwlwRwJRQm4blVrvgrBJsM
         a0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945066; x=1697549866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BcYWTkK3Zq4RaJ6QSiIWDLjJKh5RkW4qWVPOlMXZYQ=;
        b=JP4xUEV+qcD1jSVm8sZ+2oa/GZ4mDzw+/oECnLTMgVL8+t3XH8y5tQwIxnc0cxShdn
         0vi0XoTlVPbYsr/0SAlFTDtmetc6WbFS8KEseni2+mWiTPE1iqYg1Fre0atUGE2S6mXX
         fcBmQEOmP6cOnTCBLdsMgNQ0uJd/6xg+7aMTSmk4mGI6SNjGc4x672vt4GrJlCqn+rCr
         A/+pKky3x0xvfSFOulgXmQ130VCDN84kgrZ4Z0oXgY29/2qesZXxq27Hr0nnWXRqjEPY
         zrnD84ktQNUhfOEDO1LU7Vdm/mFXqCfOnA+P2Iib1dDezJjOMXsLrl3utiCEbN4mpkOO
         XshQ==
X-Gm-Message-State: AOJu0Yz+H5jCmDYs7fxbqPGAicNgqcYP4UM/Xev2QJONAqEyKdWlJcBj
	cackAmZebVW+Avr7LReZc2a1dDkZJERgDEWJWS3xnA==
X-Google-Smtp-Source: 
 AGHT+IE9ra+QcU5GelAXlm/a059fwMX6oxmQ0juTA1o08HyJtYqownxe+FeFv3gkCGaafO5jpogaFwyON/cZD9IiFGA=
X-Received: by 2002:a81:7c86:0:b0:59f:687c:fb36 with SMTP id
 x128-20020a817c86000000b0059f687cfb36mr18746618ywc.45.1696945066223; Tue, 10
 Oct 2023 06:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
 <20231009083856.222030-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-5-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 15:37:35 +0200
Message-ID: 
 <CACRpkdawPWhYQTKMFqxYxc7=rpTGWK=3Ohis5AYb3Ye8dkxEpw@mail.gmail.com>
Subject: Re: [PATCH 04/20] pinctrl: cirrus: madera-core: Convert to platform
 remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NPE2QSVUQHBTXCQUUBAOEZENW5X4DPUO
X-Message-ID-Hash: NPE2QSVUQHBTXCQUUBAOEZENW5X4DPUO
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPE2QSVUQHBTXCQUUBAOEZENW5X4DPUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:


> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
