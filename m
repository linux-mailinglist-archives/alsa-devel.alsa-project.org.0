Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28130233F4C
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 08:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F9D16A3;
	Fri, 31 Jul 2020 08:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F9D16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596177878;
	bh=Mz+qNrmSuHhP762sVPCCbD6ZtoTLt49x/k2ylV/iW04=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gyrekmy6zN2ZWjdaBWr70w5g622p/U6IfuJ5W4NHrOLzvZktrTZFHlzjM9nedKYLi
	 H5mL/ZGW8aFaprtNpvjzemDajSgWyVNcCH1JF9FWrKIxTPhqmyPo8tZ9AJy58vtLzz
	 0RzEHRxo0knpqolbpkAnreS20yMyNTTHXbi/XqaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2654F802C2;
	Fri, 31 Jul 2020 08:41:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CD1EF8021E; Thu, 30 Jul 2020 09:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06532F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 09:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06532F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="ATVq9r2y"; 
 dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="OgiJQ3sV"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1596092635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz+qNrmSuHhP762sVPCCbD6ZtoTLt49x/k2ylV/iW04=;
 b=ATVq9r2ySKvrHhR1Ew5gfobXzkJOa7AojOTliB75MUHbI823o3fQ0ntCWem48PvvRKqB9H
 Rt9hIre2E+faffSDe258p7pUnpiLxNrY9VnSFh5IqME+CrtiHzj9WxaiUGeZBdFpHIOAmv
 wnV7yVr+HeeHgOF9V1gPxEw/ndMBAD+sa6snxxFjk+V/ROFhMjUReFF9eq8Y2XWjuyHQdF
 6H7QimUGQoU88mR0cBx508aZtEEZImB+4c+3QuIGaiVRAuGq64btoT4du5WsNzqH7FOP2m
 IZz/+Qf17vLzhSMchX8tfx5XVjWjF9aTOve0tVRFY3jRZHZmgLJt0KbdLSrW8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1596092635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz+qNrmSuHhP762sVPCCbD6ZtoTLt49x/k2ylV/iW04=;
 b=OgiJQ3sVwNFJT1r4oP0n3TmmSrJH2lyZ7rxBtMWP23shTrTVU6KuEFirMQvosT5GwEbdK2
 QqQs4lhxrmHSNbAw==
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/3] Modernize tasklet callback API
In-Reply-To: <20200716030847.1564131-1-keescook@chromium.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
Date: Thu, 30 Jul 2020 09:03:55 +0200
Message-ID: <87h7tpa3hg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 31 Jul 2020 08:41:06 +0200
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>, "Matthew
 Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>, Felipe Balbi <balbi@kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
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

Kees,

Kees Cook <keescook@chromium.org> writes:
> This is the infrastructure changes to prepare the tasklet API for
> conversion to passing the tasklet struct as the callback argument instead
> of an arbitrary unsigned long. The first patch details why this is useful
> (it's the same rationale as the timer_struct changes from a bit ago:
> less abuse during memory corruption attacks, more in line with existing
> ways of doing things in the kernel, save a little space in struct,
> etc). Notably, the existing tasklet API use is much less messy, so there
> is less to clean up.
>
> It's not clear to me which tree this should go through... Greg since it
> starts with a USB clean-up, -tip for timer or interrupt, or if I should
> just carry it. I'm open to suggestions, but if I don't hear otherwise,
> I'll just carry it.
>
> My goal is to have this merged for v5.9-rc1 so that during the v5.10
> development cycle the new API will be available. The entire tree of
> changes is here[1] currently, but to split it up by maintainer the
> infrastructure changes need to be landed first.
>
> Review and Acks appreciated! :)

I'd rather see tasklets vanish from the planet completely, but that's
going to be a daring feat. So, grudgingly:

Acked-by: Thomas Gleixner <tglx@linutronix.de>

