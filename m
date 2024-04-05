Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28E89AF2B
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 065BD2BBC;
	Sun,  7 Apr 2024 09:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 065BD2BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474689;
	bh=FFhf8u3vHAwLFDislCLMJxK1IAaYlLiIRKAQetzAuKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hjIXGy7a9tzJgIzTqAYo90dhu0kkSuv8SnclnyfPNYTDVNV24FYrjXUnYLeSwIN8n
	 0kNHJuUyc7xLxh+ja01a2IrDx+bT8+Ap5snJ+nw8m8fuaHhWryGoy3oIy2ijDwfAOb
	 0J2yMI1DxesSvAt6VpWmYoTvUMgkjvrs966DsEpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B4E5F8979F; Sun,  7 Apr 2024 09:18:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8567F897A6;
	Sun,  7 Apr 2024 09:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B24ECF8020D; Fri,  5 Apr 2024 18:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64958F80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 18:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64958F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SV80V252
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d6c9678cbdso28316181fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 09:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712334552; x=1712939352;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFhf8u3vHAwLFDislCLMJxK1IAaYlLiIRKAQetzAuKM=;
        b=SV80V252ybaTAC41u/i3+CSlCraE0dDsuKMtp1a8eN1D1bn5zOGbIbktOVqH2ow0X+
         XtU0FUEAw83tR4O2qvT9cbG4Au+iDSKUtKOSn001/KRowZv/L5xAZpn7fhoKdWmhMXWr
         SSZtjtoAjDXobkTljIVAmLj3p1JY7XADEWC3rq2q6kH98Fxqt/T1cDsT2X2DwJyu2hXx
         INYdyuija5u/04kSfVeBGwAWwz5M7oD+CtB5oLkCgmMtDW2bC6ngNzCSwI/9gMwg+nr6
         bo5+HjpXEi2PkY3mpd61o1+sFqIXaq+KePhV+CsLh1MRsa5W5SeoV6Tjj6adQD4UPAoH
         z3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712334552; x=1712939352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFhf8u3vHAwLFDislCLMJxK1IAaYlLiIRKAQetzAuKM=;
        b=cqSoVD803hb/smsc/OCA698gkT2SjeYuFkm6kbgpyjFqZh7+j6Fg8VwrRxgda4two2
         HNjOAUS95pCjZBk6M6w9z4Orjog70ey650sHGIQ01SyIopijziKNMZBFy91lisjWPNwB
         iJM1Q2Bdnlwqthwr99h9QZCQNNccu+I9Wfxhl7aKNQ89RgnVsUHOwM1EDiceYmXct4kI
         ImMiLmkzxZzLX+5j/ZipIJqIrLpPPBaO33UjnFb40OJf1HkwkPnEMa3RzgqbbTxLmQlk
         otScme9L0Eac0urtIYcoH+jqEn6cH2Td14a5NCqJPpSoxFFwsotIsd5TBZ7B3/5OXbwk
         EtIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoMOs0NwjZl+DQd98jsHKGMUmVtIzl/Msp/6YyZHRlZ1sKtXhu2c2afngLHyhmJG9CcFmfa0VVWFGQw/EXZ88RTLjxubf6XI7SebE=
X-Gm-Message-State: AOJu0YwiTML+xuoqqDdf1LLdXiJ0a8gzscVkYMVCf9K7lqugbRv5t8mC
	aaSxCd5ZafLONTj/WK+c3daHSrWKdc6SH7d4NgxW5d2DENSurg6xxiDqic5N03OTayZFtYWwJ82
	w9RkUTw4+AVWH/2XUuhZWfxZaB1A=
X-Google-Smtp-Source: 
 AGHT+IGXhxPWut6ckPqQGcFkjTLFe0KuMRKI0c0zhjeW67pxATn0rYPgtZMB8P8956kck0Gl2lRUAL+Q0XwZrEMsZMs=
X-Received: by 2002:a2e:b0d6:0:b0:2d8:60a4:d0d with SMTP id
 g22-20020a2eb0d6000000b002d860a40d0dmr1488430ljl.53.1712334551905; Fri, 05
 Apr 2024 09:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240404160649.967-1-bavishimithil@gmail.com>
 <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
 <CAGzNGRnuG_gLUrH1N57WvpKbpiNtFrcsG6nJcacQNJB_yMYNrA@mail.gmail.com>
 <ec7f77a7-2cf1-4ea6-b9c4-d4fe8a1673ab@linaro.org>
In-Reply-To: <ec7f77a7-2cf1-4ea6-b9c4-d4fe8a1673ab@linaro.org>
From: Mithil <bavishimithil@gmail.com>
Date: Fri, 5 Apr 2024 21:59:00 +0530
Message-ID: 
 <CAGzNGRktm5gMj=bhtX2RAzcn1v5ref+nV-HV3Fct56FzAzxjWA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CCITQOHPQHWWPRRDQOHDXUJYSIDIIRGK
X-Message-ID-Hash: CCITQOHPQHWWPRRDQOHDXUJYSIDIIRGK
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCITQOHPQHWWPRRDQOHDXUJYSIDIIRGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 5, 2024 at 9:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/04/2024 16:48, Mithil wrote:
> > So sorry about the 2nd patch being sent as a new mail, here is a new
> > patch with the changes as suggested
> >
> >> Please use subject prefixes matching the subsystem
> > Changed the patch name to match the folder history.
>
> Nothing improved. What the history tells you?
>

Referred to "ASoC: dt-bindings: rt1015: Convert to dtschema"
Not really sure what else I should change.

> >
> >> Is it your full name?
> > Fixed it, my apologies.
> >
> >> Filename like compatible.
> > Fixed.
>
> Still not, compatible is omap4.
>

Sorry, seems like I was sending the old file again.
Will fix this.

> >
> >> Please open existing bindings and look how it is done there.
> > Changed it, is it fine now?
>
> You mean v2? I have no clue to what you are responding here, but no, v2
> did not improve much.
>

Again, could you guide me to what needs to be done?
Description for reg should be fine as this is how it is done in other
files as well.
Interrupts and hwmods use maxItems now.
Changed nodename to be generic in example as well.
Those were the suggested changes previously.

Best regards,
Mithil
