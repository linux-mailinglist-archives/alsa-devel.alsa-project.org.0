Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D82D86FE340
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:28:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B714D103D;
	Wed, 10 May 2023 19:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B714D103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739736;
	bh=LMsA6JxRTYWQXM4naAdveOz2WpVCJs1mzJM+iSTf9FA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vqnw+uWOIYbQU6YrEuHKWDY7ymxwyczrliXu+2pdhOEh2ejDD/s11e56UOUqjhR5q
	 6eF+4CMnH3b35v2FvO0Il5a6Bau0EYPq6Pjk9bO0C0XFl7XwXQ2vFXu20ZpDhdK8fX
	 s5WEa+kcTnwysVzj7MZUPF3ze9OkI66illudRr94=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5194DF80553;
	Wed, 10 May 2023 19:27:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B2D5F8032D; Wed, 10 May 2023 10:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E78FF8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 10:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E78FF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=TYoNnaq0
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9DDA33F443
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 08:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683707648;
	bh=LMsA6JxRTYWQXM4naAdveOz2WpVCJs1mzJM+iSTf9FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TYoNnaq0fv8X4f6D0swEt3Aa4+rATBtdnWDQ2C/HrCRkHvJx8iwAfpiguvdj6Au9L
	 +D6KXR0gLhbsFyxdp1GsFRbEUvVjqmsQLB9u1/ZNFJi/ZT/Y1ddUBZi/2ElmyRzWBI
	 iyopdZHZwfWHhcqge9Klkp8zESLWsofLorhk0qBUKxH5eIIF52KlotfH8hpononLkG
	 EvAQgGDAR7vxrcR5eshla1HsfrwMreKJjmUFfo7ikqvL2rhy4HnrBlPUysBUAN4QXV
	 BAvMR8z+++sPg9x7jUZgJkdG7tDJhL1NlG98F59hULMe0cjKEAmFHYEziGCWRHGiFx
	 ReafP8PAgO11Q==
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f397a1df12so12111561cf.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 01:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707647; x=1686299647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMsA6JxRTYWQXM4naAdveOz2WpVCJs1mzJM+iSTf9FA=;
        b=GInOR7g9F4ZncQDe/0wHbOTPxIhf2SsP9pxCWm0AaJe4VCw0/Sy34/hhfJW5q05PQH
         gfFruak27iytdbK6mAWkDHoi30UUTmCiwtAsaBlL25cL47lW0gyrYp5eA6Y8taEoibsK
         mJV8lVqkbxRtj+lvRUp6MBXO2HvsrlLg/3OwmVQATOD3atownZHXv6dfj998cuFtI1cW
         /Z8rbindd6XAbrxcBQwv5aUm7oEBYR44yD9n+QZoZAIc8JAh1OogtkiiAsGh+7hJgHvM
         0QwFfdSgU9xx40Jg2KycBcgJbAw3WwdiVa8EoDODD4QkLcBkclRBgiUekyMdYinEEhi0
         Mjyw==
X-Gm-Message-State: AC+VfDzAFjfW+09opXfn/Q8ZpcbkAeoPzOK7AO/0Wzf4uj0ft7XgePve
	MrLQoXfq7pM0+t2Rjxj+jfmG9fHggMU8wZSR6xwELN0D+M1kU2Hq1q4IkXrxYwkKovHVTVaW4Na
	qkAUcA5K/FQ4S3nBpWgKamn7kpl1k+/9ijwG7KsUjsRrrxymWYu4CRvJv
X-Received: by 2002:ac8:598f:0:b0:3ef:31c4:c8da with SMTP id
 e15-20020ac8598f000000b003ef31c4c8damr26087995qte.50.1683707647637;
        Wed, 10 May 2023 01:34:07 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ5DZCX5r73TwM0f7t4oRTD7Y8E8pM8uSWayhN2OzbxOG+SFBnhHTqvrbsOT/q3EKUIZc2ylBzrCQUO23z5q8NA=
X-Received: by 2002:ac8:598f:0:b0:3ef:31c4:c8da with SMTP id
 e15-20020ac8598f000000b003ef31c4c8damr26087975qte.50.1683707647399; Wed, 10
 May 2023 01:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
 <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
 <20230509-overheat-pliable-00d60523637e@spud>
In-Reply-To: <20230509-overheat-pliable-00d60523637e@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 10 May 2023 10:33:51 +0200
Message-ID: 
 <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor@kernel.org>
Cc: Walker Chen <walker.chen@starfivetech.com>,
 Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: emil.renner.berthing@canonical.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TFBWLGXCAZOIQA6643UCQAV572F7OJ36
X-Message-ID-Hash: TFBWLGXCAZOIQA6643UCQAV572F7OJ36
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFBWLGXCAZOIQA6643UCQAV572F7OJ36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 9 May 2023 at 20:05, Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
> > Hi Conor/Emil,
> >
> > DT overlay is used to describe combinations of VF2 and hat.
> > Do you have any comments on this patch ?
>
> Up to Emil :)
>
> I seem to recall that he said at the linux-riscv sync-up call that we
> have* that he was not in favour of overlays for hats like this.
> I'll let him confirm that though, I might very well be misinterpreting or
> misremembering what he said.

What probably meant was that I didn't want a bunch of different device
trees for each combination board * hat. An overlay makes a lot more
sense. However, looking through the kernel tree there is a surprising
lack of overlays for hats committed already, so I suspect there is
some sort of policy around overlays already in place.

> Cheers,
> Conor.
>
> * https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a/
