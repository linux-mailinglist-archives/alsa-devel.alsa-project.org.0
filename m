Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C039FFE3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 20:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB3461797;
	Tue,  8 Jun 2021 20:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB3461797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623177877;
	bh=bojqqOMPKAJjAfzKOjRhJhHCQp0pEAVGc5qjlgbwTAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f87S4MXXqM0NHbIB/eradfWA8oJyy3GGT5xXpqHPgaRguuef7OEbyuEhQY0FoeVVK
	 YQQfENoFnheX4yz6E7Pr16KCskXqbfBXLf9Q5KBfVgJ6uLUjl2QIP09hgKZAcwIq77
	 F5C2l+rAXNFG4JDX0fVz30wBtDMVJlvRILA07nZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF52F8019B;
	Tue,  8 Jun 2021 20:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0529F80218; Tue,  8 Jun 2021 20:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32D9BF8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 20:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32D9BF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dPpibfmA"
Received: by mail-qk1-x730.google.com with SMTP id i67so21208138qkc.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bojqqOMPKAJjAfzKOjRhJhHCQp0pEAVGc5qjlgbwTAQ=;
 b=dPpibfmAO3tqQMqkLpE+RNWg3und95D0JFFr8Rc4hCIhlUTxBQJUQhs0XPQECGZaU4
 euFKSPDzKyG+Kk4iCeklrxghxwqZAGDgWjzUD9u21OY+b+KFxCVvyHjLryHF6WQf4Uun
 jcF0vCIHXx1bDFJgNr2ZGMIppepULDnePxRuZVKtkb/ADeilMuXdGnMJpbCDRTtvvqVO
 50/cAVilfrrpdAWEoH//feKj2Hc3Pk8yAIClnjirX1Szlg6YKH+IrGiWKz39Cq/O+oI1
 gIkVx5Z7fCkMcQsj+atUeCtcqRrDdY//mdUsYSMMXUD9VtYcpHHS2IW7m3wR63eWcthD
 hlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bojqqOMPKAJjAfzKOjRhJhHCQp0pEAVGc5qjlgbwTAQ=;
 b=XYLzceZ+cKy7rMC1p4YPaDDzgWqy3UnAwUpVpBPR5gfYhoWJ57wiadG8yPZb8qbCYw
 8fjNCoVVlZS8cn1pjW6zna3MwmipHOu4YIqY8cj7bGryzSx7rqRqW6MsNPk6AAbrBxYA
 pABDwoMpCCW7K2Z2KnN28I1EwwquXdzcdTJbNMITUVk/md/DdrQ/wq++iFkLHOaY8JTi
 jQex+I0mwAESHbbiwzXGS9d8/iDcFiFyNSX6sO992QlUOer75FUS77NGDcT5tuD4FAWv
 YByg99RYB360JGZgUHFgY0q7LSxkaNoLWEL8lG3zMh2+AGMX9Q3Ha44ZC8phzLmPXLj3
 sTtg==
X-Gm-Message-State: AOAM531xOHu/nuDVbkbmyeT2TRF06raMxfjR4DGafEmmi5SpgotfsNWR
 tcLV3QXRlXNQCxRQ0ygfyq/uSh8b8e7704xn8NA=
X-Google-Smtp-Source: ABdhPJxvxPAUmpEjrAPwI4WiHWCQPAlFocTSMKdelPkSxyqk3hs8kGB98vrTz2e0o8jUFUN2j+nTjhw4UAp9/0KtKuk=
X-Received: by 2002:ae9:e84b:: with SMTP id a72mr19991743qkg.226.1623177774372; 
 Tue, 08 Jun 2021 11:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-94e0c40f-401d-4d9e-84aa-f533d548ee7f-1623134599278@3c-app-gmx-bs25>
In-Reply-To: <trinity-94e0c40f-401d-4d9e-84aa-f533d548ee7f-1623134599278@3c-app-gmx-bs25>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 8 Jun 2021 15:36:50 -0300
Message-ID: <CAEsQvcunUrQLTKMDYkGf8B1-nCbScqd=VkMwuPBEiwRC=mMKyQ@mail.gmail.com>
Subject: Re: Xone43C: USB communication
To: Roman Muller <klangrausch@wolke7.net>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jun 8, 2021 at 3:44 AM Roman Muller <klangrausch@wolke7.net> wrote:
>
> Hello Geraldo, hello all,
>
> sorry for spamming the list with such minuscule details.

Hi Roman, don't worry, your message is on topic...

> Thank you for your message! I did not hear from other people yet,
> so it's probably safe to assume that no one else is already working on it.
> Adding a section to the quirks-table does not help, the vendor-specific
> interfaces still don't work. Obviously they need extra initialization.
>
> Next step: sniffing again while running Windows in the vm.
> The interesting stuff is going on here:
> https://drive.google.com/file/d/1IlkR4ey9Gwsdrrf6jfOwNUVDtGcl_93-
> (Full log: https://drive.google.com/file/d/1VmSGVk8V1saw7qdPfbOH2d4HmZTrlzxj)
>
> From this I see several URB control messages going back and forth, for example
> the host sending 80bbf0, and the device responding accordingly. A bit later,
> and after sending 44ac00 six times (hola!?!?) I get isodesc[0-7] cross-device
> link for input; and once more for output, and the device reports success. These
> appear to be my eight channels. So far, so good for a first basic overview of
> the structure, but the tricky part is figuring out what message is doing what.

Your Xone:43C doesn't seem so esoteric from the usbmon capture you gave.

Is your capture complete from a software standpoint? i.e. are you
starting Serato or Traktor on the VM while doing the usbmon capture?

80bbf0 is just the data fragment, you need to replicate the whole
Setup Data of the packet.

> Only the manufacturer knows it, I need experiment and guessing
> with a lot of time and luck.

You probably don't really need to know for now what these control
messages are. There's a good chance replicating them is enough.

> Is there a common agreement where in the source code such control
> messages should be put? Probably an extra file?

I think you should worry for now in getting your device to work. Then
you share the patch with the maintainers and they will help you write
the best code possible.

But sound/usb/quirks.c seems like a good place to get started.

All the best,
Geraldo Nascimento

>
> Best,
> Roman
