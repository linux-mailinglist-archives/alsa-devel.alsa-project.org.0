Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E96869C1B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 17:29:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 507FD85D;
	Tue, 27 Feb 2024 17:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 507FD85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709051350;
	bh=gxRtFtSYjnlTrJJn3q7eEW0xJvelWZEgyZ88iY2xwfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c64JMtd7w631TxFf9b0K08HxnyJxg6Lr0Es7oi2OppJLzahj5Jh3Y4xRvPoHOyicQ
	 4d/8P+G7OAuyI6a6Aej8Mk47YtsV6BNj0JpBGOr1Mn1U4yvjScQPOQXfjflUpZ3D+E
	 BB1+dEzo6pP9TYt6LaEpntz9jrJVMQpBxVVOcDp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D546F80588; Tue, 27 Feb 2024 17:28:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F10DDF805A8;
	Tue, 27 Feb 2024 17:28:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 324F9F801C0; Tue, 27 Feb 2024 17:28:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAAD8F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 17:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAAD8F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fOAsqFPh
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so685743066b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709051288; x=1709656088;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0dTpHR1K23pB61bzvysNHvrksQiS977Ao80yDg/2EM=;
        b=fOAsqFPhMz/mIwR/Vh6GQax+xWjWAIc4+sJMyUvMerrCUeoqsnqBfE85bS0114eHeB
         RgLD2fDK3Wirc/pCouvvHeJ3qutrDoi7yLrmeYUza3TwBfk/IJ0cKhnO4FcC7dc9rSLt
         dJ5uTScM1QLcDJ8HMrM7npRBf9InvDJPkqdxhkFb1lv3kBV0C22/3Bxmq+AMrBg9ctum
         XZOOl3ujtK9/X5/XT3NBCKe4VQVZtEfi9MwmZkVL9/FA0h0q9N6NVHHLYAbzKB7whpDg
         +fhOiODwVUIjrMBngm7rYiXPIrpu7P9UYSPOWG2xFCkCRsZTV5eYUGWOOKXwRleL2ohP
         VR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709051288; x=1709656088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0dTpHR1K23pB61bzvysNHvrksQiS977Ao80yDg/2EM=;
        b=KHQvnKx6rGYEkYKiKb524CgC/pHYkPsmdOCWOKXv8CrVHDUwum9B/cDBjwHRRQ1UfU
         3w8F2fcLIMvblo8ZHPg+COgfxDzPz4CsGYox2bSblQOzLM3qMH+gnsBaVCXBLXS4XrOg
         I7amMC3cIuZrWpksvgTOL73X1iSOeXkS+7ecQWSMEAWJn94xitirvrAjnmFqqcAF82Ju
         m+C/fbf/D+JFFL5kvr7NqOzIBM6TLTJOf8rv9NluiGVi9YpONGqFTg+zULeB5CZBzne/
         JHs4ssMFm+XNTdMhe3dM5t63r3gdSiW4VADtlVkE/7rrb5CAIEU/UKHJBhJfGJMvUBpx
         4y5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1gRYrtwmLpz/VBkiJU2BIbmkqFaZ6tJPbRjqCe0KOFQFaC/mW2ckbvE/C8/aLYUP9oxhc5m3pP+DawghfaEoqbaVjqoOM1q6Qhoo=
X-Gm-Message-State: AOJu0YxqC7rBxuTRDLwI4VCJxUYKiwsEzLcWrwWl1+paCw3gVwbLjNNX
	Fk0n0Zk/CMPqjEAGvweNeXVO2nk+FLflOgvoCPaGGKhBmEbVA9x+CwEwRTGOUdZRycP1OOXTQIc
	aoPI0LzyQiQYaFf4piZAyW/QVPnM=
X-Google-Smtp-Source: 
 AGHT+IGzJBW8k7ldwen5EXjuSmgR3l2IjW+yccX6qBQwDIsY+xoBXnRY/aIUOm+e4NHYEM1QabbatXe2pbsUDCTTnSo=
X-Received: by 2002:a17:906:5804:b0:a43:a7:c683 with SMTP id
 m4-20020a170906580400b00a4300a7c683mr5916386ejq.42.1709051287508; Tue, 27 Feb
 2024 08:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20240227123602.258190-1-javier.garcia.ta@udima.es>
 <20240227160952.615291-1-javier.garcia.ta@udima.es>
In-Reply-To: <20240227160952.615291-1-javier.garcia.ta@udima.es>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Feb 2024 18:27:55 +0200
Message-ID: 
 <CAEnQRZDY5Jfj6d008goccsWwwUuUuryw1s8xJH6EyGXEiqnovw@mail.gmail.com>
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
Message-ID-Hash: B6M2YXTT5VTU4WYQZMONJ2XLSHVAUACL
X-Message-ID-Hash: B6M2YXTT5VTU4WYQZMONJ2XLSHVAUACL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6M2YXTT5VTU4WYQZMONJ2XLSHVAUACL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This looks much better than v1. Make sure you have addressed all
comments from the previous version
and add a short log under the scissor line explaining what you have changed=
.

Few comments inline:


On Tue, Feb 27, 2024 at 6:13=E2=80=AFPM Javier Garc=C3=ADa <javier.garcia.t=
a@udima.es> wrote:
>
> Convert the Imagination Technologies SPDIF Input Controllerto DT schema.
>
> Signed-off-by: Javier Garc=C3=ADa <javier.garcia.ta@udima.es>
> ---
^ this is the scissor line. Here you add the change log.

Changes since v1:
- re-written the subject inline to include relevant prefix
- removed header file as it is not used
- ....etc


> +$id: http://devicetree.org/schemas/sound/img,spdif-in.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination Technologies SPDIF Input Controller
> +
> +maintainers:
> +  - Liam Girdwood <lgirdwood@gmail.com>
> +  - Mark Brown <broonie@kernel.org>

Please do not blindly add people here. The most proper candidate for this
is the people who wrote the original file.

Using git log we can find Damien.Horsley <Damien.Horsley@imgtec.com>

Damien,

Is it OK to add you as a maintainer for this file as you wrote the
original driver?

Other than this looks good to me as far as i can tell.

thanks,
Daniel.
