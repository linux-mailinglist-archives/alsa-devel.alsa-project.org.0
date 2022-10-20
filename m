Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B10605F8D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91EA29C38;
	Thu, 20 Oct 2022 13:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91EA29C38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666267216;
	bh=S1W+kOyi0wHGOiNZjX3Cm+bOIWF3zpfb/u/bT1UW4O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9WH36ZEeV8KcHxLXx+pCKg3Svye2sY9Q9xSY6o4wQUriHhnaOHU6Qq0xO8SimUSD
	 9wbp844dFRxCV3EeRnnTK1zOGUXRcrCbl8WK4e3dXpWKeHUdRDyQfWWF6QSl9pMi9p
	 1foRZOwrZXctJlJfP68swA8CVlEiX7/8wB/uZVpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19BEDF804FA;
	Thu, 20 Oct 2022 13:59:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA7B4F8032B; Thu, 20 Oct 2022 13:59:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77DA2F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 13:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77DA2F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M70nAw73"
Received: by mail-qk1-x730.google.com with SMTP id a5so12568710qkl.6
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TyMFpOElofDJZNk00pkycBZ1li0ZG0mlfPkJtReDgXg=;
 b=M70nAw73IR0CoIQ1ALAjyz+N3PNZkFAK4loZ76XpYp1+Dt/qsWYX4pYeErmz8EBQjU
 Gj+p/bw1TxgnwU3/VlMs6R54YCeWqYdSAw283lANOTVZZLL7gifAPfELCnmDOhzH0/gQ
 omMd4iVLWmilF+W8Z8pN7HT0uYg/WzMGqoB+v1vQdLS6VIVcJGN9JrmKYwBdeXYi1V2T
 OdGTAxprj9dSnJ0pjXuM8Y7Ow84kWwuQ8BBzxMFnS9izGqJtfJ2JVACpMep9KowEY52R
 F06h9LTKVseezN6xk215VHTpfkQQJBdWUmxV7gz+Ng2naph1TMNQjwYO6OkRVATnl9kN
 yzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyMFpOElofDJZNk00pkycBZ1li0ZG0mlfPkJtReDgXg=;
 b=Eumk1dWZDl9dnkZBB8NlfOzvRzcloAVSmCvY+cBBnfdZBpT1i47C3xzDTUejNBeXNp
 Nn4dlkhcUt93WTO33yC7fdtDH8BQGkTA4CVQhkgx/1biTXt8eTv5icbrZuUNOaNBetQi
 u5wcb4ogsK0B0H6Xi+cPBlf5lBJtNDHdjYe10a9LD58AjkA7F8l7DPt37e117TzBA/n4
 efZiFs61tLT5CEWglq4BfycLPVtXZgO4lZ4wVUROjH9RiY8XMs+2y3TuTfbTkJ57WVqQ
 HOclomkhxCwhZEcNUiV6D+FWGWtmFAXAatrWgw69yepIWD6BE9HbjWVeobx4W8dpgtkv
 g2IQ==
X-Gm-Message-State: ACrzQf2MT4MqJk5cMtYVSHuO+zvw0bFgsPe0JM6UFkPJX3gz24B0blDy
 FRbyeJgKUuPxcjhF3TQ8W/GblXE8/kyM7ClG5Aw/b4D4ejtCNUtS
X-Google-Smtp-Source: AMsMyM48UrLUGogQxyXHnQZ/YxaD4IPpxciQFU4nObHIDhoME9mQfyCSu++KX6/H9lb/F3oLZXexRKCOapJJelT0MN8=
X-Received: by 2002:a05:6638:3c45:b0:363:afb2:3269 with SMTP id
 bg5-20020a0566383c4500b00363afb23269mr9854117jab.215.1666267143179; Thu, 20
 Oct 2022 04:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221016132648.3011729-1-lis8215@gmail.com>
 <166609251307.155136.11548088283059583394.b4-ty@kernel.org>
In-Reply-To: <166609251307.155136.11548088283059583394.b4-ty@kernel.org>
From: Siarhei Volkau <lis8215@gmail.com>
Date: Thu, 20 Oct 2022 14:58:51 +0300
Message-ID: <CAKNVLfbfRRE3O2uFH6MQxoa_cdqTUcvpGzmcxFm3oCLKFfHv6w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] ASoC: codecs: jz4725b: Various improvements and
 fixes
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
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

=D0=B2=D1=82, 18 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 14:28, Mark Brown =
<broonie@kernel.org>:
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!

Great! Thank you!

Unfortunately I found a critical bug in my patchset, yet easy to fix.
So I need some help to make and send the fix.

> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.

What are mailing lists it needs to be sent to?
Any additional tags needed? I know about Fixes tag.
Do I need to keep a link on this patchset somehow?
Do I need to mail a patch with the fix to this thread or
create a new one?

PS: the patch will look like:
 - {"ADC Sourc Capture Routee", "Line In", "Line In"},
 + {"ADC Source Capture Route", "Line In", "Line In"},

Thanks in advance,
Siarhei
