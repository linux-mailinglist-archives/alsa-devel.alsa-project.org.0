Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C843B517C
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Jun 2021 06:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4CAC169A;
	Sun, 27 Jun 2021 06:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4CAC169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624767807;
	bh=x9OKbHPB+a5crMZ16YWh01e6J48WBoddPypucA/HiB8=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pX43TSilrVURou0zZVBHjrjM5pLt9Yh9GcTQQhu35dG6NSzjQ0I+tySfnDF9OuTDX
	 rkrUvmSAiZf+n7fAUuMbXKFjTgHGDSkauuP9Ii19uv8lMxMyUnhPgDpn0Guxc0I6bl
	 1H4XqAELXXCPgmzAaU60rxNJjs+Z1ZcBC05CMc/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 364A6F80240;
	Sun, 27 Jun 2021 06:21:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1590F80259; Sun, 27 Jun 2021 06:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=PRX_BODYSUB_1, PRX_BODYSUB_18, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 710E7F80137
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 06:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 710E7F80137
Received: from hellmouth.base.nu (localhost [127.0.0.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 2e2c0c9a;
 Sun, 27 Jun 2021 04:21:50 +0000 (UTC)
Received: from pandaemonium.base.nu ([2a02:8010:6391:0:7285:c2ff:fed8:8963])
 by hellmouth.base.nu with ESMTPSA id kegQAt7812C27wAADaPQrA
 (envelope-from <livvy@base.nu>); Sun, 27 Jun 2021 04:21:50 +0000
References: <trinity-94e0c40f-401d-4d9e-84aa-f533d548ee7f-1623134599278@3c-app-gmx-bs25>
User-agent: mu4e 1.4.15; emacs 28.0.50
From: Olivia Mackintosh <livvy@base.nu>
To: Roman Muller <klangrausch@wolke7.net>
Subject: Re: Xone43C: USB communication
In-reply-to: <trinity-94e0c40f-401d-4d9e-84aa-f533d548ee7f-1623134599278@3c-app-gmx-bs25>
Date: Sun, 27 Jun 2021 05:21:49 +0100
Message-ID: <87v960aqea.fsf@base.nu>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org
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

Dear Roman,

Thanks for reaching out to the list and starting to analyze your
device. 

> sorry for spamming the list with such minuscule details.
> Thank you for your message! I did not hear from other people yet,

No need to apologize.

> From this I see several URB control messages going back and forth, for example
> the host sending 80bbf0, and the device responding accordingly. A bit later,
> and after sending 44ac00 six times (hola!?!?)

At least one of those is to set the sample-rate:
      44100(Hz) is 0x00ac44 (44ac00 is the little endian)

Most likely you will need to set the sample rate of the device similar
to the Pioneer devices. Take a look at pioneer_djm_set_format_quirk() in
sound/usb/quirks.c to see how the URB is being constructed for DJM
mixers.

> Only the manufacturer knows it, I need experiment and guessing
> with a lot of time and luck.

You will figure out that soon enough with perseverance! Do reach out on
the list as there are folks willing to help out but a lot of us do it in
our spare time so might be somewhat slow to respond.

> Is there a common agreement where in the source code such control
> messages should be put? Probably an extra file?

It does vary depending on the specifics of the device but the
maintainers seem to prefer keeping as generic as possible and putting
quirks related things in quirks-table.h and quirks.c for anything device
specific. I probably wouldn't start a different file just for your
device if you can avoid it.

-- 
Kind regards,
Olivia Mackintosh
