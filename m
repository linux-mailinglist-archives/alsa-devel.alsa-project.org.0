Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B149663F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 21:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 793FF2A0D;
	Fri, 21 Jan 2022 21:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 793FF2A0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642796019;
	bh=wQ5G60YTfPNaxMZGgqEvLsKSjCnZki+Da92EOx+AWdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nTxWMjKVQ3CKoy84aWj9MZS8VSZDPL3P+Fi5m0tb+Kfr6Ai4ErVamVe3TabgjFYOv
	 xjz+QIM18lSR0ye75JVpQFXaJuqz2h0t01sk1UrX8Q+/jSpmzb4gRbzdP2FCieLDOV
	 Ot+sPJMd7LS/dJjyVmUZ/5mgJikAO+9Y/lUCTov4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E36A8F80302;
	Fri, 21 Jan 2022 21:12:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC6E7F8028B; Fri, 21 Jan 2022 21:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE038F800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 21:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE038F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C8EOiSjC"
Received: by mail-ej1-x62e.google.com with SMTP id k25so3019394ejp.5
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 12:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TWFhQ8AyYyJtKJhYHxbzZAy/uyi61n/qj66gr+QR1JU=;
 b=C8EOiSjCDvxrWY2Ruh48zw6GmmqDRMiC4Xh4oNcfGcsAk4QxT/4WpK9v30k7R8BJTP
 Ox33CjNanCQL5JyR5uyLDlkgeLcOdifO5g9DsCa0rbRNbnWai+SokHAOH8jjHzhYibLU
 +zS9PNDuW/W449Hl6zRgYlVFU1GH8q3F2fwCNvg0PKdCaFYlX1Oi9gpQMYDiEgeBBn4E
 gepuFb5h9afDmvRCUqdyNzK+46+J1POQ0Dw50E6frm5NfGq4duBsbIy48/Su6VdUdePn
 8FaHt4DcROcLF95bgfpKvTH6CankmVX8ujX+aQajQ6ivme+VErteaMSP9P5K3Gatceg+
 C3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TWFhQ8AyYyJtKJhYHxbzZAy/uyi61n/qj66gr+QR1JU=;
 b=1lF6cLZ2VtLS/ezxn+mkhKhcy20ONn7AsMzNiREP4ZYfD0/E9Pfqgz9Q3DlcxETbbl
 MJk4BZeVXleWa/o7XLUIsCDHLJZ7kfGeFjgNUZ7j0I0533xUzglAGTaS21QPsAeTL0VX
 1CYF7aJE5b/H037L8yDBDzJa/yHvMMTBD92TZcVl5G5MsLHmbDLTokQ2cKMqE3bXZUyJ
 bPgnOaEqJZZeClOT/UVoXfn3yoWBdBtSp+YnPRuJxZopIxF1sivk/stg/dnQ4noPf5C2
 VhU/cq3hlOxfZ4qrayFa3ruKEwNMqE0NEpGfL5hjifLINxWENULT8Eqs89uRh7sSN2Bb
 KA1w==
X-Gm-Message-State: AOAM532gPZ86rp8BqqJ0PuYnryJZdfM86ld06i8ZGpog/lvLUUH5J7Sv
 ox45jVkMvoBIRp8Qcl/9wP1/MZi+SS8436kzvDk=
X-Google-Smtp-Source: ABdhPJxiTTwzTmbtx9DNC7Ah5PIXbFyKWQWSb2hxPEtw2WvBrKl7feHCqB0yc+Flx4KZez6dtVy+19KCludTGmAPY9M=
X-Received: by 2002:a17:906:3004:: with SMTP id
 4mr4419944ejz.579.1642795940215; 
 Fri, 21 Jan 2022 12:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
 <20220118145251.1548-6-sbinding@opensource.cirrus.com>
 <CAJZ5v0g0n201FPcG9LBNG3e4UdNYSWmj_1sN3MxLxmK=GoF+tA@mail.gmail.com>
 <a3522b5e-fb36-b959-d2ea-d141d3ad9999@opensource.cirrus.com>
 <CAJZ5v0h8MWb3sSuqWHUcm9TVWP0uJ+=GmzAuqVtNag2LP+0kYQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0h8MWb3sSuqWHUcm9TVWP0uJ+=GmzAuqVtNag2LP+0kYQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jan 2022 22:11:43 +0200
Message-ID: <CAHp75VekU6j4vB_ej8k1f5JcTrAfm10aeekZo8_=jenK1KRbUA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] platform/x86: i2c-multi-instantiate: Move it to
 drivers/acpi folder
To: "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Lucas tanure <tanureal@opensource.cirrus.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Len Brown <lenb@kernel.org>
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

On Fri, Jan 21, 2022 at 9:53 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> On Wed, Jan 19, 2022 at 6:33 PM Lucas tanure
> <tanureal@opensource.cirrus.com> wrote:
> > On 1/19/22 16:53, Rafael J. Wysocki wrote:
> > > On Tue, Jan 18, 2022 at 3:53 PM Stefan Binding
> > > <sbinding@opensource.cirrus.com> wrote:

...

> > > Why are you moving it away from platform/x86?
> > >
> > > Adding SPI to the mix doesn't seem to be a sufficient reason.
> > >
> > > If this were going to be needed on non-x86, that would be a good
> > > reason for moving it, but is that actually the case?  If so, why isn't
> > > that mentioned in the changelog above?
> > >
> >
> > It was a request made by Andy Shevchenko:
> > https://lkml.org/lkml/2021/12/3/347
>
> But he hasn't given any reasons why that'd be better.

My thoughts were that these are related to ACPI handling the serial
buses in one place. However, counter arguments might be that the cases
of the resources like this are found only on x86 hardware (while ACPI
should be agnostic to that) and that the i2c and spi already do ACPI
stuff on their own. That said, there are pros and cons and I'm fine
with either choice at the end of the day.

-- 
With Best Regards,
Andy Shevchenko
