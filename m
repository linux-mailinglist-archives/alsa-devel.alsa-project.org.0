Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B373A181CB8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 16:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468E71662;
	Wed, 11 Mar 2020 16:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468E71662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583941608;
	bh=PFGUByZEZTBls3DOx4QmCSCySBxN4HHWWP3hytIxz6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ar88pQDH78I3ZogzSQOKy3i5eIt/LifKaQpY7lud9JqpieoptaEAK/jquDxrZYQU2
	 quRUtqFD2gotXgYXyWaoRqF1Hmicrk/oS7tTmUoIZxcber17Sq2Us5mXWU7qz/QO5t
	 aL9Y7jZE7sKE52UnlUoDbC8kwgJ9gDy+NeKr9nyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FEEFF801F7;
	Wed, 11 Mar 2020 16:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26290F800BE; Wed, 11 Mar 2020 16:45:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A95F800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 16:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A95F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B933aFpc"
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CCC720750
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583941499;
 bh=PFGUByZEZTBls3DOx4QmCSCySBxN4HHWWP3hytIxz6k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B933aFpcNlMJxmS8HIBv1ozND2nqR1JpFud+7CWKxeDc9Iy0XBV44M5fNbDRY5Xl9
 vm3dG6mVkT9Yg6CMQ7i8ect5XDgIYYnz1EaF0Avd4vGhfg4PsJ48QSaZ9BkQyfU3O4
 jSMb0T8qX71Ap4tF8QRvB6t/NL5+pK8ob/tWNIUY=
Received: by mail-qk1-f170.google.com with SMTP id u25so2527825qkk.3
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 08:44:59 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0T6h7jEjBHDngg5ULUXAU1cmBssDNhK09TCF2P9o6jGiatFq2c
 4sfJMdKkvJ3rWP4qaA4oRoq1HY4EWe1q1IKdFw==
X-Google-Smtp-Source: ADFU+vuw15q6epFZCXVJuZ1Xg31IOj2uW3MXifAIuvdbqLoaajvp1prFnelurSmWkqVzjoRj7mM7gpt70hmkQJ36bhw=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr3442629qkg.152.1583941498611; 
 Wed, 11 Mar 2020 08:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200117170352.16040-1-olivier.moysan@st.com>
 <20200121220022.GA12737@bogus>
 <6a49bf6c-8851-a65c-5606-563776e07c08@st.com>
In-Reply-To: <6a49bf6c-8851-a65c-5606-563776e07c08@st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Mar 2020 10:44:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGy6Ec57RC_N-KZfKgGij4nn-BEdNQqXCd9dH_yPY6ew@mail.gmail.com>
Message-ID: <CAL_JsqKGy6Ec57RC_N-KZfKgGij4nn-BEdNQqXCd9dH_yPY6ew@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: stm32: convert spdfirx to
 json-schema
To: Olivier MOYSAN <olivier.moysan@st.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 22, 2020 at 3:20 AM Olivier MOYSAN <olivier.moysan@st.com> wrote:
>
> Hi Rob,
>
> I did not report your reviewed-by tag, as I have made a extra change in v2.
> This change is related to dmas property reported in v2 change log.
> Sorry, this extra change was indeed not clearly highlighted in log comments.

Indeed you did mention it, I just missed it. Anyways, it's a minor
change and my R-by still stands.

I'd resend this to make sure it's in Mark's inbox again.

Rob
