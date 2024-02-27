Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F1869C22
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 17:30:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07BF486F;
	Tue, 27 Feb 2024 17:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07BF486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709051425;
	bh=HXzssYEYqtzr5qnD1CqK7udX2j/OUVEGL3tqoCbTsBU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aPEIq12crTrn9ZYrFJGYCz93QrjBdgx2G9ibCpwbRp/cM9A4e9uffYtRapT8jwg0x
	 KNOF6gfwgGROOsabNn3tc74PJ2VN7YDAiYMvxbF1g+apWfo7SagZ1uCHKPB2W6V1c3
	 jxQfuvGs0OkID3iYM7olQT2VYZ8G79T/idlzKe9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A23F805A1; Tue, 27 Feb 2024 17:29:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3ED3F80587;
	Tue, 27 Feb 2024 17:29:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95A48F801C0; Tue, 27 Feb 2024 17:29:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A0E5F8024E
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 17:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0E5F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RXOiKDCc
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3f1bf03722so490158166b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709051370; x=1709656170;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+v8WkYj+V0jmQrnbBd89P9mj/CLIV68PxeJ4A/mdwE=;
        b=RXOiKDCcY7PbI0rsq4ZYxuhWX2BINstQVd9jaUGiGCCArsDXIWVNDKmTm2HgRqtxRg
         gnATjxD5Tpa+M4J0UGu+TZbeaSbOMwnmCBR3GS+DdJbm9Etl1UVeVf/8BddVExSDVwbN
         64MUbXzQC30ZBuifNB5sZbUBMs44T5AlAM38UVDNljRU0JoR3B5j1TgliYPs0OyXOMZB
         3vMR/PZJhglDw1aux8wZepE1Lf3Tvt1MldxPyPCJzhr9VDwRLJCaCmt8nPX2bRmHHj5w
         M3L+lg5Xj6g4COlBeU8A/3F160CwgTN0NgsxQe0lEnkUM662vOp0dxhhPijEih4TkbPm
         MjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709051370; x=1709656170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+v8WkYj+V0jmQrnbBd89P9mj/CLIV68PxeJ4A/mdwE=;
        b=rP/wgRo2GUEYSzZeqO3MUV5WXtQj8emkpd4M2PYPnlWa+SuKpv6DXXqDoCBJOeSrQa
         G2qOfVb/myoH7NJUDeG/WbH278WCmJtp/36FxhL6ryNUAm20MIYse3AzwRet1ATLJ6y2
         q9h50j/IeG2LlU7hSwVqeFyD+v2J3LaVy8KmYMF+j0t2rrZCPoHr19m/Cc1Gip3cF/4x
         kmZDu66Zhe9RlNGo9YpiaedVBsrnpehrX9Z8SKh+E1qEf46GIvMWRkAmM1X3lI6UfeH4
         mPBPfe9hc8yVyiW11UEttx5/pAY7+sEjX14EiQvws6WmWHmjwHR9cJ6QExU6yB/0+7Nv
         1SZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIpsVFRpazmgA6b6yk1qLLLKQnbIWzDAFo7+sD3VHS9Hc7plUKcPl6TWfTS1/oBawKVaIA/yjwahF4XV61P3ARnSZQHTJ7Pgs9kXI=
X-Gm-Message-State: AOJu0YxZicj4Zrg9fFFGY5/TokDmT0cpsNswQMmKVmjjEydQu0JF3j+T
	Hw+cOUu24UcXAkh8C+LjGZ4BB9KrvAlGcyiSS0WvYUVYB0Sf6bAHChSR+XA+2wGoqs9NWRzfLOe
	3PV5cAUgd17cwUcDHnJwPuYzAWiQ=
X-Google-Smtp-Source: 
 AGHT+IF5cEV1+76NYOs+Omrynj4SA56WXsfZuwIoV5pmFaKXW0rXxBMKRAb+95kzbV3G/8fND+psJN9gkQVVzVm4zP4=
X-Received: by 2002:a17:906:f44:b0:a3e:a712:ba9d with SMTP id
 h4-20020a1709060f4400b00a3ea712ba9dmr7700879ejj.4.1709051370555; Tue, 27 Feb
 2024 08:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20240227123602.258190-1-javier.garcia.ta@udima.es>
 <20240227160952.615291-1-javier.garcia.ta@udima.es>
 <CAEnQRZDY5Jfj6d008goccsWwwUuUuryw1s8xJH6EyGXEiqnovw@mail.gmail.com>
In-Reply-To: 
 <CAEnQRZDY5Jfj6d008goccsWwwUuUuryw1s8xJH6EyGXEiqnovw@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Feb 2024 18:29:18 +0200
Message-ID: 
 <CAEnQRZAvqHfNYu+dYObJA=T7S_KfQMxB8TJGmdjK9Ea_FPrLOA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: img,spdif-in: Convert to dtschema
To: =?UTF-8?Q?Javier_Garc=C3=ADa?= <javier.garcia.ta@udima.es>
Cc: daniel.baluta@nxp.com, broonie@kernel.org, krzysztof.kozlowski@linaro.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, "Damien.Horsley" <Damien.Horsley@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VOUELWPJ5HZC4WAHZ3KTTYOZ2DEZKRFY
X-Message-ID-Hash: VOUELWPJ5HZC4WAHZ3KTTYOZ2DEZKRFY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOUELWPJ5HZC4WAHZ3KTTYOZ2DEZKRFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 27, 2024 at 6:27=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> This looks much better than v1. Make sure you have addressed all
> comments from the previous version
> and add a short log under the scissor line explaining what you have chang=
ed.
>
> Few comments inline:
>
>
> On Tue, Feb 27, 2024 at 6:13=E2=80=AFPM Javier Garc=C3=ADa <javier.garcia=
.ta@udima.es> wrote:
> >
> > Convert the Imagination Technologies SPDIF Input Controllerto DT schema=
.
> >
> > Signed-off-by: Javier Garc=C3=ADa <javier.garcia.ta@udima.es>
> > ---
> ^ this is the scissor line. Here you add the change log.
>
> Changes since v1:
> - re-written the subject inline to include relevant prefix
> - removed header file as it is not used
> - ....etc
>
>
> > +$id: http://devicetree.org/schemas/sound/img,spdif-in.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Imagination Technologies SPDIF Input Controller
> > +
> > +maintainers:
> > +  - Liam Girdwood <lgirdwood@gmail.com>
> > +  - Mark Brown <broonie@kernel.org>
>
> Please do not blindly add people here. The most proper candidate for this
> is the people who wrote the original file.
>
> Using git log we can find Damien.Horsley <Damien.Horsley@imgtec.com>

Looks like this address bounced back.

@Krzysztof Kozlowski @Mark Brown is it OK to add a mailing list as
maintainer for a yml file?
