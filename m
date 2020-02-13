Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23D15CB3B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 20:35:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D8716A9;
	Thu, 13 Feb 2020 20:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D8716A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581622558;
	bh=UdmVfXngFFtrkk5Ztbs1U0slzZqLzuVHPPWVsPo+1uo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=frha4x01SJDE4bcySwZrmcoTyIt7DLB7uXDhFSCobvaZeQcDWNyyxv9llSoGxchZx
	 uVgrJkN3e486RIjuuBmoZ+QDYFaaKB0cf0P48tSqM+FXn9szlo4E/L905x+hi134pk
	 O3PvMjQ1qrR0pcSXSaoTmi44or0dB5Ky+YVHGOMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1D5DF80146;
	Thu, 13 Feb 2020 20:34:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F4A3F80147; Thu, 13 Feb 2020 20:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B0C7F80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 20:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B0C7F80138
Received: by mail-oi1-f193.google.com with SMTP id q84so6986701oic.4
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 11:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5EM0RgnUTNWODqZzobMUi09w/3LfolH4SIDh9tQKPk=;
 b=jNrC+dZnGQoFRsfTCPPwHetboHrjO6v6DxgnvPHbdyyHK53eV/FHwTWSbZ/Il8uAhx
 B/U8wIjYjfnsdv3KsvGTN5bBerbhEPc4675tZdkFyDOYZFq1wMF8Q/aH0C1tyZ3I4h3d
 h9ahLklV6BGm71RdFYqHUsmLNvp4NlQB1bIPYIJQtLmZ7gzzE3pOxbTP3OxFQHvI80vS
 BWBA4AkjYshM8W+G3Z9g3uEsMBhzSQV3VlRFVIWFtTHqYJbBT7udY4/Aka73N1D0e3B2
 BTu72cB+jAv0q+JQMfO3V4fkM1TeiRLg4GHMb3uC2FDzDmJwwYOvoZAP9xlHM576Bgzx
 qjWg==
X-Gm-Message-State: APjAAAWiNMcyWsckMnS6Rw1aXmWKrqe4goGW7NBUO66vvvLjgmSz+NfZ
 bsN7xbJ9gEHFNmYb2sxHA9oV4kOguwKYF1VsyLQ=
X-Google-Smtp-Source: APXvYqx1aFT+mAkIsBCyJmbfRN6elDm/k7oARKr9GA9dIpi8l19F7unEfkZKEa+wTFDdd2Ywd5z6YOc6xOgMS4a0/2U=
X-Received: by 2002:a54:4707:: with SMTP id k7mr3807992oik.153.1581622321623; 
 Thu, 13 Feb 2020 11:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20200213145240.2ff2b6a2@canb.auug.org.au>
 <d8dbd288-5270-42f1-0d55-b0f1516addb1@infradead.org>
 <d0d9a245-f336-1334-90a8-631faf95d071@infradead.org>
In-Reply-To: <d0d9a245-f336-1334-90a8-631faf95d071@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2020 20:31:50 +0100
Message-ID: <CAMuHMdVLbVsgTC9R6qk=TOGKwmXpg+attNq=SYhR5y807L+DAA@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] linux-next: Tree for Feb 13
	(sound/soc/codecs/snd-soc-ab8500-codec)
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

Hi Randy,

On Thu, Feb 13, 2020 at 6:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 2/13/20 9:06 AM, Randy Dunlap wrote:
> > On 2/12/20 7:52 PM, Stephen Rothwell wrote:
> >> Changes since 20200212:
 >
> > on x86_64:
> >
> > # CONFIG_ABX500_CORE is not set [this is in MFD]
> >
> > ERROR: "abx500_set_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!
> > ERROR: "abx500_get_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!

Yeah, commit d8dd3f92a6ba11f9 ("ASoC: Fix SND_SOC_ALL_CODECS imply misc
fallout") is in sound-asoc/for-next, but didn't make it in next-20200213.
I expect this to be fixed tomorrow.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
