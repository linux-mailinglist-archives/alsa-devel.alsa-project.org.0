Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9132C409E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 21:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5DE1660;
	Tue,  1 Oct 2019 21:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5DE1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569956670;
	bh=GHV6+5N/Ykl4cj9pIBChGzAyTrW8bgy4/7l1CancrVk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPFxDZ/RTjoPMHOBQXVSSh6PmKqSp6/yKFWxQ19gSzhqq3V6P/0GHOjBDt7gZUwTJ
	 hNR30PF9LBgUrf0OcyANgs5CtENQfEhUxLwU72sjFbug+6GFw2ajt5a09ROfWJ8Jhp
	 RCyiP2z4OUqkwF/XIQ7gjZpjeRwERWV++PVqTQdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E628F80519;
	Tue,  1 Oct 2019 21:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D08FDF80506; Tue,  1 Oct 2019 21:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74354F800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 21:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74354F800D0
Received: by mail-qk1-f193.google.com with SMTP id q203so12384759qke.1
 for <alsa-devel@alsa-project.org>; Tue, 01 Oct 2019 12:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RtRzWD7zEbjJ2A4VYjRF/6/NQuaf29B5zVdZT4/GSfc=;
 b=UdYcANesWgIM3EAQa30XaniGO+p6BFhDkPF5hc5kR0Z9ylrXn4des6Su77qni+hPfe
 sz0MGLY2WhDVGbYte5idjFvGVbp68YyZV4EHmtN0GE3x7iPh//y1+r914AEW9DtAoXGK
 rrd79E+9Nfp4alF9RWOhPyehGMKlSCuJUXPa/HEjxSMJsjcy8to0QdwY7OvfkPbkdqhN
 +9tNGwJj4S2QVGtVcAup2zrI8k4wq0EsQNcm69NjWRH2Y/9OnzyOvoyEljzSyzb4WSzs
 xUfMMCz4GH6kTY030FvfDNSnppVeQ8Gpio9Y+xtOjR2Uq0OKyTKB0YA+TfaeBqzOWW4l
 g4lg==
X-Gm-Message-State: APjAAAUpk8abzJrYHdGQt7n4Xv+qMPbJQce8MrL2y63fU9isUrZ3wKqb
 Ba1hND1SSd7RGkPVAkpmX/99ZMJNViwPxhR6/PY=
X-Google-Smtp-Source: APXvYqyKVBTpwzORgepB82eF9G6BF0XWbuGMTxfsXAs4ovRtl9RXDG3EDKzynC6mRl7lAXlZww4fFPocBSuw3EMLKmw=
X-Received: by 2002:a37:a858:: with SMTP id r85mr7757595qke.394.1569956558234; 
 Tue, 01 Oct 2019 12:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191001142116.1172290-1-arnd@arndb.de>
 <20191001175501.GA14762@sirena.co.uk>
In-Reply-To: <20191001175501.GA14762@sirena.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Oct 2019 21:02:22 +0200
Message-ID: <CAK8P3a2idD4as-9ns0NrLjYGYSEc0=6A67VaNXDacA3-tJEr0Q@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: atmel: fix atmel_ssc_set_audio link
	failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Oct 1, 2019 at 7:55 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 01, 2019 at 04:20:55PM +0200, Arnd Bergmann wrote:
> > The ssc audio driver can call into both pdc and dma backends.  With the
> > latest rework, the logic to do this in a safe way avoiding link errors
> > was removed, bringing back link errors that were fixed long ago in commit
> > 061981ff8cc8 ("ASoC: atmel: properly select dma driver state") such as
>
> This doesn't apply against current code, please check and resend.

I looked at "git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
for-next"
as well as the for-linus branch in the same place, but found no
conflicting changes
in there compared to v5.4-rc1. Am I looking at the right tree?

       Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
