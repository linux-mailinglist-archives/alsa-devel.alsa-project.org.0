Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E319869F00E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:20:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97EAFE83;
	Wed, 22 Feb 2023 09:19:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97EAFE83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054048;
	bh=s85ej20o57EVIAZFbWgvrgnN0SkPXWj9xUiifHsTHZg=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lxwT+ezp/vAsB3xl9OZZplRTgPrNKon8ElMiNVRURiAsHfmg0EZ6Om+1gBzPXXvkr
	 7GUPNSDdkXjkPSampdVhvec/LqT57KuvL3yFP9Tbc3gHOhFfpSR5qJpqRLBbYb+1Q2
	 2SoQ2Drot9ZCD8IhkTdqDVLsWKY0qsnQRZVEhhyI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0743F80266;
	Wed, 22 Feb 2023 09:19:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D31DF80266; Wed, 22 Feb 2023 08:53:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8222DF800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 08:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8222DF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AFb76RWl
Received: by mail-ed1-x52c.google.com with SMTP id f13so26267161edz.6
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 23:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s85ej20o57EVIAZFbWgvrgnN0SkPXWj9xUiifHsTHZg=;
        b=AFb76RWl0qx095lTG9TFJYrGSOSHsEId33Ft2ZTbU4DUX7kfqyIOv+8xnezBuHPYa1
         yCDyIMnOZridhY9SjLWjr1yuNZYnjaiDKIytq7JCdL+N8e506wpoMBmPQ+Nx2YMRsLCu
         RRtl75WuqhpLkXGr0F0kndHrxQhk2RMlFm7xAokmbPGAm3S9VcVvTGXs8s0X7W6B3quc
         iBAczBLHfa2OGqN+whJaqLMPDVyvjY+Rz82MsXi7wcio17ZKeVdqIP/uP8fX/9ulnnZo
         UmNtML76sovEkZBCTsHM6GkdL1/9B01pBEx4vUno8bi3hdeCaOdoTyfq6hkTa34gmft4
         03oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s85ej20o57EVIAZFbWgvrgnN0SkPXWj9xUiifHsTHZg=;
        b=Dj+C9XPtD1z70v/pbo4jv/6m1A+1JF9qAOpeXZw++wWarEOOd6rfECUfOYBCuGiRnz
         HYDr1ZEZKafeu3d9+KEpjAE084ta9cQ0bXEFrRgxRYHW+AmSW0zgcP1gmf/IuZbEB9ij
         F6Y6c3e73w8bRiMTKE1oqLvK5yuGqg3ogzAwj6vcgDnoQPI3rVOiT9djw4gOGaR6ohAl
         y8RVV56YV0/5sn729cUsOOOBL+HfnPuZZm0KVT3RoZJ/5QTkIobz4ymBPJ/O8wU3wfds
         0Ydwb1WU2XlH0U2k3BP4qbMYobf2/bMDVQmPnSAj8mCVR6dRAEyPJk22NBdnpIO8ZFDp
         XC1w==
X-Gm-Message-State: AO0yUKVhY4/kiB6LK1mkJicEIZF+lN2uxWszYtJ79VD8Z/7KXrkGLBxX
	6R6MPMk53jjnAMZXuKMhKIyb0gk/CRx6n1UpzgM=
X-Google-Smtp-Source: 
 AK7set+0c5IFVbo5S3RjC5aOGFuL8Zs9WlbR6blsKJepl2XbT7Oc5hgv5WTV0x4z8gzWNJGZhNesPqm9d1b5s6s1HSQ=
X-Received: by 2002:a17:907:6025:b0:877:7480:c568 with SMTP id
 fs37-20020a170907602500b008777480c568mr6954732ejc.8.1677052419551; Tue, 21
 Feb 2023 23:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-3-clamor95@gmail.com>
 <Y/VA3HK/jGVPbrqb@sirena.org.uk>
In-Reply-To: <Y/VA3HK/jGVPbrqb@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 09:53:28 +0200
Message-ID: 
 <CAPVz0n2cHvKfez6=ydR8HQfAfM_bipmAzav76Gxmp6pF4wLuhw@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] sound: soc: jack: allow multiple interrupt per
 gpio
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OYLV65ENQULX4PZQSM5XGHJCB4XCS44U
X-Message-ID-Hash: OYLV65ENQULX4PZQSM5XGHJCB4XCS44U
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:19:53 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYLV65ENQULX4PZQSM5XGHJCB4XCS44U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:08 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:03PM +0200, Svyatoslav Ryhel wrote:
> > This feature is required for coupled hp-mic quirk used
> > by some Nvidia Tegra 3 based devices work properly.
>
> Please submit this separately, there's no meaningful dependency
> on the rest of the series.

RT5631 by machine driver commit contains a coupled hp-mic quirk which
requires this commit to work properly. In v2 RT5631 machine driver bringup
and coupled hp-mic quirk may be split into separate commits.

> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
