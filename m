Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A89484BF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 15:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4311719;
	Mon, 17 Jun 2019 15:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4311719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560779999;
	bh=EWlJ10GFwRuh3kt6ToHXgL5Cs3Ajz4Xx8tmDEQ09wsA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FzFCGpGhpA+G+/kiCSIO9ZNb9oaDKcgnsivUK/EF1+yADRN5O3HSIqOEJBFEsoevg
	 J0TiXrihX4z7A3EgwvVEP6tXcbnUOMLthJiBgsJ1vUUxv8rO+3jGmOwkhFISouDzUj
	 jH6EnWr797shWnS9X5xJktBaT7TJVGZeNOwJrO0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1958F896C7;
	Mon, 17 Jun 2019 15:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484FDF896C7; Mon, 17 Jun 2019 15:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 732D4F8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 15:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 732D4F8075C
Received: by mail-qt1-f195.google.com with SMTP id h21so10714285qtn.13
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 06:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QFz3ypAEzci/q5w59/tNyFmelIHZ1nn0STu2Nvru2uc=;
 b=qlNuIG+dKgNRl1Rv5iIZW5Am6YJpXmX84meGnNw+YpzonDtUm9HhWKro4owyJz0yqr
 /xuqps/DmPs9OesJ87xo4/NKZPciJ1yJ9pBcaEDl2QsQxCpKfZDzKDGZA4EKR1fY31Yz
 SGGlYoxGiMPruWgA00d0p/rW2wNeITx+Ufjz79nUBJJRIc+E3O7u7KPLVBJtwPxlIsr5
 4ic2vpxRom8q79O8CQvSys46z6BqvN9Jlw2lPZaPPPwKZgZC8NQfOHY/F/p6emGij9cS
 dRkSVPYp2Hxvh1nHIM3/ognV4Vj3A4KazoMr2CQkiZXK0K9hmnxcsurox9gTQNBbNNkR
 D3ZQ==
X-Gm-Message-State: APjAAAX4CBufVpgrPFZJ+5E+80hl7eHYfx4Txm051SLHxL0+1Eu5QaEa
 Pl+RASeTNvXUNtwzbMt9W3wgvLzzgdbpzU3cdabm+lhGqac=
X-Google-Smtp-Source: APXvYqyev+G8a5jSyoJqMzYH275GJDy37HQarq/vA8SGhqIgSuHoCBiXgAGnWnLDw/V+JEYWqCTG39p+QIItQLSgxBI=
X-Received: by 2002:aed:2bc1:: with SMTP id e59mr74159317qtd.7.1560779887799; 
 Mon, 17 Jun 2019 06:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190617124632.1176809-1-arnd@arndb.de>
 <6103cc84-6af3-7b82-4cac-aea500934dd1@linux.intel.com>
In-Reply-To: <6103cc84-6af3-7b82-4cac-aea500934dd1@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jun 2019 15:57:50 +0200
Message-ID: <CAK8P3a381XbG8BGOPo3tN6+q2EzFU+9R9Q=q-uv=Mbf931bt=g@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: disallow building without
 CONFIG_PCI again
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

On Mon, Jun 17, 2019 at 3:52 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> On 6/17/19 2:45 PM, Arnd Bergmann wrote:
> > Compile-testing without PCI just causes warnings:
> >
> > sound/soc/sof/sof-pci-dev.c:330:13: error: 'sof_pci_remove' defined but not used [-Werror=unused-function]
> >   static void sof_pci_remove(struct pci_dev *pci)
> >               ^~~~~~~~~~~~~~
> > sound/soc/sof/sof-pci-dev.c:230:12: error: 'sof_pci_probe' defined but not used [-Werror=unused-function]
> >   static int sof_pci_probe(struct pci_dev *pci,
> >              ^~~~~~~~~~~~~
> >
> > I tried to fix this in a way that would still allow compile
> > tests, but it got too ugly, so this just reverts the patch
> > that allowed it in the first place.
> >
> > Most architectures do allow enabling PCI, so the value of the
> > COMPILE_TEST alternative was not very high to start with.
>
> I think COMPILE_TEST has value in that it exposed issues in the PCI
> headers, and in general COMPILE_TEST exposes code that can be
> simplified/refactored. That said I don't have the time to suggest an
> alternative at the moment so it's fine with me if you want to revert. If
> you don't mind sharing your config it'd help me work on this when I get
> a chance.

I agree that fixing this in the pci headers would be best. Ideally we would
be able to compile-test PCI drivers without any #ifdef in the sources,
while ending up with an empty .o file as the compiler can discard all
local functions starting with an unused pci_driver.

I saw the error in a randconfig build, uploaded the .config to
https://pastebin.com/zBeyM41R now.

        Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
