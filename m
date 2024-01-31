Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A5843896
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 09:13:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C95F714E1;
	Wed, 31 Jan 2024 09:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C95F714E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706688828;
	bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fwZWcwrZA8adx1jN7LY/JzbjvujIq7AABF/UQwSdydeJ1oJbrLc3HI6xusA443u7x
	 GYQb8n0s3DUrvg+PhTkHDYfe7gqllSNXo3KjpV9S1KsTyzMguPDhC+muc3WL6Jl3pG
	 dze+vGv4w4EknDeqvw97sRN4GRHkKq+1WDgrzBzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2E84F805AF; Wed, 31 Jan 2024 09:13:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B8AF805A1;
	Wed, 31 Jan 2024 09:13:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D726AF8055C; Wed, 31 Jan 2024 09:10:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8B3FF8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 09:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B3FF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xSy0rVKh
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dc25e12cc63so554672276.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 00:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688642; x=1707293442;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
        b=xSy0rVKhsDKcUifBI4u3kul6SfuhsAi2BdQgiGIIoqqpSptokBoFYOGUVQx+xSC9MQ
         RgCqXSwcaTMAbq3rlkm7dQPCYu86S2zTkvfM4GNcpQ3CE8xfwECV5gwf7J7Gj6fKhKOZ
         Qpm5uzjiMkg3EDqxMOTWv2iQNnkHFkOwihz6YvCL17JGoXzc42AqLZ4zVO1dDD3eNPV2
         6JiCv3n8WYzMaUk8/rAmLidvFHsqQrBNSmkhR2IamgOaudka2bXPbQF9nC8U/EEoXCfQ
         7LAMTx6mqZled3PThgrB1yZXLaU+dPDus/V/Oi2Ys2mhhvJHlQVkMA6iAdO8VULA38I7
         9rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688642; x=1707293442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
        b=QEVEMf4LOwuzGt/g/3GODX+K2W83y9cB7u4x1m539ZT7lekfpXs1Sr/1XmH+u7J8uX
         9heVh3cNHXkmK2xci5v40bBmq6+46XCfe0zs4plbuakzmZbqklIQeyiFiFv7V7dsj8vY
         vSuQXxHlv1W9owM1tedhMXYAUbvo+WM/gau7jmmbI3yHK5O372aG3mz+u6i0hcVj31Ds
         +eIJfUvkRyXV5PtbPPBSainzE+qD+tjgmaQCFkWzijTT8VkGp7+WjAXPotUyUBjWeaFK
         LzRJABF2YNQDavqla/Adfh5Ty28xOBn/WieYOK4TeOjZHJQFrrDffGnIsKanAVkioM5d
         XSqA==
X-Gm-Message-State: AOJu0YzsizJOukx9oIewb9qcfQUbZiGBSdy2Sy6FbwngP4GIxIAI3NJc
	mp++NpEzytRa+TcGru30Ps9KXbuK7jDlwtDIyaitgTLGqiUEBsIu38MTgjrbJ0Pnwl2qaABcMSs
	Vw/DqgJPsUABxwyj+jEYmM6xkRq8QSz6+XX8qVQ==
X-Google-Smtp-Source: 
 AGHT+IF7/97h8A2ABSW+ZKivSqrc+3VaVDxhilyJhD8FjHKMHd8T3fIFoykLSG2kAQuVNIsrK+oFINo0NP7MfrmxMWg=
X-Received: by 2002:a25:bb4d:0:b0:dc6:c252:75fe with SMTP id
 b13-20020a25bb4d000000b00dc6c25275femr281957ybk.10.1706688642247; Wed, 31 Jan
 2024 00:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20240124190106.1540585-1-robh@kernel.org>
In-Reply-To: <20240124190106.1540585-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 09:10:31 +0100
Message-ID: 
 <CACRpkdZq4dYwJNvo1CncaHGsDeU5qQhms2SN8WGsTRwBB-Bhmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Unify "input-debounce" schema
To: Rob Herring <robh@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PO74KOPN3NF3NIWI5A3GHAJD6F4PETPI
X-Message-ID-Hash: PO74KOPN3NF3NIWI5A3GHAJD6F4PETPI
X-MailFrom: linus.walleij@linaro.org
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

On Wed, Jan 24, 2024 at 8:01=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> nuvoton,npcm845-pinctrl defines the common "input-debounce" property as
> an array rather than an scalar. Update the common definition to expand
> it to an uint32-array, and update all the users of the property with
> array constraints.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patches applied, thanks for fixing this!

Yours,
Linus Walleij
