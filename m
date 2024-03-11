Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86E877BD5
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 09:43:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014E0B70;
	Mon, 11 Mar 2024 09:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014E0B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710146581;
	bh=CVcpSQEowmQSM9t8/GfJCKCgL/YYmkegZpNkLQK9IlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tj7wGuaGTdffAUIyhwVM2qCKa5+tii5jzI3uUaua+ttMAe7W4P0TJYsHavpNwhTmN
	 /VIohGgPW/ViIj2pKWcs94SrfkwYL64gSnhvg6n4UXPD9HyiPzDJk3rySxq2oJpko3
	 hHXRcc52/K164zVGQoMSLljUDOJqkiinetlId51k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E53A1F805AA; Mon, 11 Mar 2024 09:42:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1EFAF8057B;
	Mon, 11 Mar 2024 09:42:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06FA5F8028D; Mon, 11 Mar 2024 09:42:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2E73F8014B
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 09:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E73F8014B
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-60a0a54869bso17754077b3.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Mar 2024 01:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710146530; x=1710751330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgHOKxgDd5agwFdYIamY3hBfpfSIfbA2P0oFSiagzbA=;
        b=LydXV7PnVtOLdVuKta3Cx+F0rX45uEX5cXnB3eWGkPQFC7Gxu0KSUr2SjYrE1MD694
         QeatpLtAyQcjpTY9Rh7zNFTKh7nx+3Yw47alaR74LOD3dk7Tbbiiih23GXtNsP1g35Hq
         qu228t/ISMholFfhx7r4n2dW8RiuwKH8d3BiBFkTOQm4ynIhbR3Q9Kp5cSYee3HZor6H
         W8/3V7707qUD0PnVR9hq/rSGqrFcGibMaZlgVtU7uLSQKR4UPfsW8I1ysnb1iLYPdfx6
         JiOqL8VMEldghtzd80Jkd6NM6L6NmncRsxkg1hCsx6ZqW+FWdtU9PYerNijOcgIYBrgG
         nmsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYVNNdSbs56nE/TLFHaxK8k3XVM86FXrVIz9e1w/rlbekmF4OE+CumpPdu3x0Q1UN89rY2RoSudtjiqqk5moJCh94kBM8Xo0dRkI8=
X-Gm-Message-State: AOJu0Yy6JUuAp2WIF1APtilE74MdDfWykWrW1Q9SRQqMgxv/6wdqc5B1
	cvVn+s3g9clZDahMsJH0+iBU9wtmuxIBgC/S2caWnznk4GXPH5sVlAvhRFBXIYE=
X-Google-Smtp-Source: 
 AGHT+IHiQ4gcp3cGYqXZuwLyiNJeMp9xIyhvPs1iuS27buSXpmJkNlBpKcPkTGw3HQ/tlrWpaYBi9g==
X-Received: by 2002:a0d:d904:0:b0:609:72a8:13b8 with SMTP id
 b4-20020a0dd904000000b0060972a813b8mr3165587ywe.1.1710146529518;
        Mon, 11 Mar 2024 01:42:09 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id
 n30-20020a81af1e000000b00609f87d6d1esm1233576ywh.48.2024.03.11.01.42.08
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 01:42:09 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-609f4d8551eso29096167b3.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Mar 2024 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbgtrfBzFiWKSgYsVf/VL92pcDZowyIKd0OraGIZviDZ1ozUyInMkBLEOYl3uuKXQ88Hiue8Ox1EcbQGWHgs/nRw8IoHk146+LFKM=
X-Received: by 2002:a0d:d90e:0:b0:609:7699:dc63 with SMTP id
 b14-20020a0dd90e000000b006097699dc63mr4623835ywe.9.1710146528457; Mon, 11 Mar
 2024 01:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 09:41:56 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdXAxus+Y9w9e_A03MHhcBSzj4xREw1YwN9d331o+6=zhA@mail.gmail.com>
Message-ID: 
 <CAMuHMdXAxus+Y9w9e_A03MHhcBSzj4xREw1YwN9d331o+6=zhA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Don't strip remove function when
 driver is builtin
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TEKEFQ3LFZ6PYA4FVZ3XBJR4PEBEXJAP
X-Message-ID-Hash: TEKEFQ3LFZ6PYA4FVZ3XBJR4PEBEXJAP
X-MailFrom: geert.uytterhoeven@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TEKEFQ3LFZ6PYA4FVZ3XBJR4PEBEXJAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Mar 10, 2024 at 3:39=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> Using __exit for the remove function results in the remove callback
> being discarded with SND_SOC_TLV320ADC3XXX=3Dy. When such a device gets
> unbound (e.g. using sysfs or hotplug), the driver is just removed
> without the cleanup being performed. This results in resource leaks. Fix
> it by compiling in the remove callback unconditionally.
>
> This also fixes a W=3D1 modpost warning:
>
>         WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section=
 mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) -> adc3xxx=
_i2c_remove (section: .exit.text)
>
> (which only happens with SND_SOC_TLV320ADC3XXX=3Dm).
>
> Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> note that this patch only applies as is after commit 4e8ff3587868 ("ASoC:
> codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in __exit_p()") which wa=
s the
> wrong approach to fix the build error.

Sorry, my bad...
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
