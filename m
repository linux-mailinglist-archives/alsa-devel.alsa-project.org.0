Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE99882A6
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 12:37:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D718F857;
	Fri, 27 Sep 2024 12:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D718F857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727433474;
	bh=hHoju3u/041HhlyK9FzkDceCp+u0ugdPviMfZb0y9V0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hW9x7E4ZD8CJdlaKo07ux4+C+cld65MfywzGCL/v8N3YYq+tZMeH2S+ko+u8oXQrM
	 VZwJu3rdoY2oT4g3otBhuQv49pj31oM4/KChtLHmDVvtTBP8dzMbYNYFxKp/e93pbc
	 /kWsoR/qz+/q997B9/MNwFmY5o1I9twyZmkvHxPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FA39F805B1; Fri, 27 Sep 2024 12:37:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F139F80518;
	Fri, 27 Sep 2024 12:37:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D69EF802DB; Fri, 27 Sep 2024 12:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A02A0F80074
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 12:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02A0F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KKY7gVhF
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso285005966b.3
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Sep 2024 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727433440; x=1728038240;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHoju3u/041HhlyK9FzkDceCp+u0ugdPviMfZb0y9V0=;
        b=KKY7gVhFV0xD0iPZSPgNPBqonUm2BKEFwNsh3Uht22HXidSjUx2MqJhjt7kHeXF07c
         LGzlRGR+KiUvUuNTMJlgBndGL4OKsgdm237AY1sHcT451GwGtluehZKVEsyt5xWTORPT
         DIB4YGTGgFtiVSb+qVmpht2iLeAFT0Tx+ZPcrExWeY27XUI47XBsCaBg57vBNOl/790A
         9tdYYeo1qdhKQ0QKDja7t/Shgdrq5NNwBLjppk8mCN9z6WFaz237evZYmNtfREUMI+zI
         i6+z5BDorxbc/FcV51kuGPDk/FK80LSPuwxj2q2e3Mn2t9roy9DGl5PwWSSd21GDfFrc
         aD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433440; x=1728038240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHoju3u/041HhlyK9FzkDceCp+u0ugdPviMfZb0y9V0=;
        b=KHsN516CX3FZmyonpuuuzoMp/xOGxGN0qH7vLEfRsBPf3Ag8DszxiosGV/mACVCpz8
         W5u9YtCU7M7AV736uyuS+tN3v2sYtLw9N+QOlj4VQIpogXCLo6QZEC16Ylvmc/zgCYR8
         e/FxtPAwC1mxSYYqbLRjFm7KwCQLu1TCmKrHIdHWMTH2zr/FDpTXabidk/ttXNyMl436
         HSE0x9UX5BbsXMzqSrHXyWP9ujCxFNLkiO6FdDHBMUCZEKD4GHEDzXbOjbz+Voma6x/O
         3o7IJRH0cubno20vSV5ntsNk5Hn+3W+5xhgUbB7DJwDCGZQrG6WMUtpXmq940OOEVoZb
         BMXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4bZtH6PtqBgF+8zUFuDJpnvJNx6tYsYusSftVMAAI1Ml8C7+pCpNSwFYXZYIGN3UgTZ/V2QPEG5OC@alsa-project.org
X-Gm-Message-State: AOJu0YxyOjJ5RP15WosYUA3bF/w5nkG4m7dv+dCuPnV/zDiMIhVVV/7R
	w92i/jujFpBdcJRMGFzRMaHLEUx1w/WxpG9/qUqOHLGIeLK8NNxLDJD4BYwlcsuM+BuR7FovuB0
	ahLWZ8ivPQqHDLNmClXC2Y6O2uXA=
X-Google-Smtp-Source: 
 AGHT+IH78ZbE2U9C9t69k5TZ6X+Gi8DEQA9qne76aeeb9j3yf1y3FHSicvo5uPYPSIyCtIKCVHczjOJor/I4gd87RzU=
X-Received: by 2002:a17:907:9709:b0:a8a:7b8e:fe52 with SMTP id
 a640c23a62f3a-a93c4a98d9dmr283774766b.59.1727433440228; Fri, 27 Sep 2024
 03:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
 <1727424031-19551-2-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1727424031-19551-2-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 27 Sep 2024 13:38:15 +0300
Message-ID: 
 <CAEnQRZC3SPUQg3B=0KtsWdNj40=rvjp9+e=1zAn7DhS+Z3wZ5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_micfil: fix regmap_write_bits usage
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WTPHHKALYFIJRUENSNVZVTQYJ4ZITW5V
X-Message-ID-Hash: WTPHHKALYFIJRUENSNVZVTQYJ4ZITW5V
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTPHHKALYFIJRUENSNVZVTQYJ4ZITW5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 27, 2024 at 11:23=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> The last parameter 1 means BIT(0), which should be the
> correct BIT(X).
>
> Fixes: 47a70e6fc9a8 ("ASoC: Add MICFIL SoC Digital Audio Interface driver=
.")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
