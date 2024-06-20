Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D090FD47
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 09:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D38DF6;
	Thu, 20 Jun 2024 09:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D38DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718867185;
	bh=dJEzkSyweazjJTKUEf1BqydnD1RQQNyHb5AgSblIfdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uYwAi6gv3uI9QPsRm2HFWuUDl0Ye72XOIOYaNhbdhIrtu55QBZZex1sueABL5wsXV
	 Iy3u8EmJlyghQYUI2ctjavt6btsd3CFOfs9tPLSlBOZ+ZZ9ks9TC25FD5q7hdbkYOb
	 XXG7g7+xobMe64wXMXQ6mCDyWGfTZxB/DDfQn37g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44D31F805A1; Thu, 20 Jun 2024 09:05:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA46F80269;
	Thu, 20 Jun 2024 09:05:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C609EF8023A; Thu, 20 Jun 2024 09:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8ED0F80236
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 09:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8ED0F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZMmmB5Rd
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6f85f82ffeso52273066b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 00:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718867136; x=1719471936;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJEzkSyweazjJTKUEf1BqydnD1RQQNyHb5AgSblIfdE=;
        b=ZMmmB5RdsQnWJK7A+vGxrK8m5eIcSH4OZSbVwLtSFYEyqCxj38UX68M2jsRm+49roH
         qOPvp6cCAfyAzXKRMfuVJCxfrBRy1SCZBhwH95wa6h3RCqZUwK5NcxZVmSNkOeis3THO
         lnbGpevJA/GVDGYERBmR6X+iI0yKoeZBH4MrMO3iGGxc2Z3Pi3pUBS89ByfJPvYatcln
         ZmfWLjdRgSZFFugCZbO1CjdBosdvOSRK0UyTWb4d4r69XXyOOQjZIGryx05VWx63B07E
         V60pjBEDR/FZj+C58/RhNxZw39rB9xqDvbV0cQBmlgZI3ZeTjkePyTk3hpqEc1783XKR
         J+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718867136; x=1719471936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJEzkSyweazjJTKUEf1BqydnD1RQQNyHb5AgSblIfdE=;
        b=kw5OQTw9xcDE2Z+EC4JHVSxgKHtWHhnF5Jjf8MDsi7NGyn7TFD7pIz2mJpJfre1E2X
         2YI98L8ufkQpQDFRzDuJjuCRpdam/bDkAzqKZaiC1YrCuZ44X9MZoEmUw4pm1SSOsLf1
         0B9Qfyarb0zsVCoFbZvoseXGZmaTSRIkGG9S4qVFNHXhvfHzFcrmu9EsUre0sdiXokOH
         /P49tIBzToQ4Q/2c7DWJMZMF42GsENX15W7VV7jPxue7m5PVV60Hyj7pHIzC3ff7Qe0v
         AIjzl520cyFl6fu4TgUv6FDX7NJJ1l/cX5QGCTWYDke1zvFwgJxsXm4nPCCb1qTGzLhM
         LYBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlBi9J6W6SH1Xo0uSaJXLXr3pwIogbTx47/kVzG8fS+gafltNpKfio4SsbkkMZDzJcNf3pyQuCkcN3xdFKqiauWFa0K5Bgyeu4ZvQ=
X-Gm-Message-State: AOJu0YxetoVWLONIEBR4ybV8C2CgOIfBplxWkbe5Uqt7YR24mMy7iue5
	2bO7JJoL69fvN8NhtnQZaH0TM2M+7ee/027vRRS7R4CygEG9OAypf4LPnsUib77LWGuTKTpjj4Q
	/53ftB2zZSoZjs+dOtHmjiFDYkSU=
X-Google-Smtp-Source: 
 AGHT+IH9Zi075xLIea9HUNdZOY2FI+hFSTobEwSf38cByPkAEGv6hOZRLG60t8CtapdTRB2mmitpm6FhzBhArR1rZmc=
X-Received: by 2002:a17:906:81cf:b0:a6f:7826:41ea with SMTP id
 a640c23a62f3a-a6fab646fa0mr230471066b.39.1718867135834; Thu, 20 Jun 2024
 00:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 20 Jun 2024 10:05:23 +0300
Message-ID: 
 <CAEnQRZCKR6G4-fP7YVsjLvpKNHBQGNYa4TwxS0U0hdheFjxxBw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: add missing vender prefix on filename
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Andrew Davis <afd@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Conor Dooley <conor+dt@kernel.org>,
	Daniel Beer <daniel.beer@igorinstitute.com>,
 Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Shi Fu <shifu0704@thundersoft.com>,
	Takashi Iwai <tiwai@suse.com>, Vincent Knecht <vincent.knecht@mailoo.org>,
 alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HGNZBIGDVRBSBFCO45WGOZOXYT7IS54P
X-Message-ID-Hash: HGNZBIGDVRBSBFCO45WGOZOXYT7IS54P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGNZBIGDVRBSBFCO45WGOZOXYT7IS54P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 20, 2024 at 3:32=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Many Sound yaml files doesn't have vender prefix on filename.
> Add missing vender prefix for these files.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
