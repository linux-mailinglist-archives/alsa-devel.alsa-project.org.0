Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB67BD41D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 09:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9481083E;
	Mon,  9 Oct 2023 09:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9481083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696835647;
	bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mv6iC3ByNEW8S1S6159nNoapNM6RTY/Z4O4upqvl+e+RVH362fupl4k3HOcQBzSaN
	 QTUqPf3wimbuZSZVxcq0j4hkxPfvwOp7zAWyhp9tyXJOzwkjClPZ9p9p4NTBQeUTcx
	 Am36YEoHSa22T/8jqyMATHELdoXLov6LeKDCqnr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB461F8027B; Mon,  9 Oct 2023 09:12:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69688F8027B;
	Mon,  9 Oct 2023 09:12:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C375FF802BE; Mon,  9 Oct 2023 09:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25800F80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 09:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25800F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lOl9D8gu
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-49d8dd34f7bso1294421e0c.3
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 00:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696835563;
 x=1697440363; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=;
        b=lOl9D8gu7HgTQnwbvMGgjMJsC5+Oc+1ZuTDAm/J7nCFyKJ42lbJfGer5hxLIJP+jzd
         05U7oq9rEoiKLkl+mbNzkaHS3B/AqO8TBbTbcUUr5ei3KUQvt/Psv52D/gIfOrN9U8ww
         X8L9Z9s0+5VL4BhNP3E7VhXHutU1jfPhIEt4+S0EC09NkQHYPLEFsr6KmbWm3/eGBG6H
         ebuXzvMC7IpNuyvFRAofpiz6rH8V9a3HWpy029pl+8+XVxb0QC0hP0DNxDJGkQmV4YjL
         BaADkdhGhdg2vfTOV4EEPDJmqw+aPhfrccPPYIR1UOkvd1bI0sgM7PBEWkLBSEPSAac+
         FtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696835563; x=1697440363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=;
        b=get8RoEV9trSVFC0chH9JpLKsOO96356ia3V4S82AU3uwRbp7xy4bac4OWklMSosDT
         +92AZPV4zOHrTJhnK+aERlNa/+ezNMjhTmQjEICKM21AYuU+qQXYf7JTrSbAEQfJPMCk
         t4fukViqkFK/EbubcIyFTJL/Dbj1xg8UmfB++4RTPs/G8HcxzCKNXJuybVgTwmB07FON
         UijJHIWefsB9iopzyMsA/cMySuwoRX6IHROylQVbObLB0NmlbfxJknCBgqK78TdZFMln
         P0lLmgv/f90RX5C1nZFyWu68jP5YRw7P+kDt74ybKZzHS+Y3XSnICZVfEs01BGQP2O7s
         ArDg==
X-Gm-Message-State: AOJu0YzlYtyG41KKH11pmIR7/68jVJMFFb58sOr7urhVJvhk4NJoXksT
	UtDatrlDdGodNMHZMS0hqP6FMVseAjHrVSwZjzodFw==
X-Google-Smtp-Source: 
 AGHT+IFwDwzm+lRsT8bOFKIAm/GhR+1llhPbmAbOCazbvOSuFiL5J72lfZwBACd3hGJsn9Q29a1UTTr3OVDkXyj/GAc=
X-Received: by 2002:a05:6122:222a:b0:493:5420:f20c with SMTP id
 bb42-20020a056122222a00b004935420f20cmr13749354vkb.10.1696835562966; Mon, 09
 Oct 2023 00:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Oct 2023 09:12:32 +0200
Message-ID: 
 <CAMRc=MeVp63fPXWs=JDL-GYg7iYzL-m=3nkrp6J+nyM_pL2=tg@mail.gmail.com>
Subject: Re: [PATCH 2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO
 descriptors
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7KUTKII477L2WKBJVBPPAYLUB7CW27KH
X-Message-ID-Hash: 7KUTKII477L2WKBJVBPPAYLUB7CW27KH
X-MailFrom: brgl@bgdev.pl
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7KUTKII477L2WKBJVBPPAYLUB7CW27KH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 6, 2023 at 3:46=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The driver is pretty straight-forward to convert to use GPIO
> descriptors, however a separate patch is needed to accept
> the DT GPIO resources ending with "-gpio1" and "-gpio2"
> instead of the standard "-gpio" or "-gpios" name convention.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
