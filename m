Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F74C9F90
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:43:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD0831DFF;
	Wed,  2 Mar 2022 09:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD0831DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210630;
	bh=IBeoc8xzzgEpHWZoMYEPzfPDjh9jlHz6wdEGlhrp0FM=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rZI452hk1ebsyakVsXtKdMaZ4C0VTKrrysGuoyBjtxap893TJuDalrVMqXz3PumRw
	 PaqGCW5Gs0tiZvl1zbf5KPgpdo8wMoKVPNedrBtfQrDaWXHnHQr7oakyD+obNcP3fC
	 5lop5QczRiVyXXo3GLGBUn9tVdjY0LPgXtaLRySE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FF51F805F4;
	Wed,  2 Mar 2022 09:33:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC7A1F8013C; Mon, 28 Feb 2022 13:07:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6835F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6835F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P6Qm9QV+"
Received: by mail-ej1-x631.google.com with SMTP id qk11so24355041ejb.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mpq6EOSgaJN9TDHyutZ1vk7Ts/tQX7VWZG2tuQLEVnE=;
 b=P6Qm9QV+tKwfj02RvG70Y6RM578oBE7xk1h9xLRDl0Phoeno/cOg2X5jGG320h7a80
 51RqQzzCwbkind1CCh/PsD+YJ2xLuw3nTu9DY+Zris5SVOV1FI+8DsU52Jy5KlVydcNu
 G0XxThLJxiMxymk0pHTiYIUYA6Uj3RhvFK2FvOkFF3qdetV9R5zYggWzNl+ojj1OXKZf
 MkNjwD1Q29EHNb+3aSEEQSq9r3HlkkV49QyRIpbAEX1BAYg/I0l3VyVoctyp9PVfLMdm
 3mwm8jDaSc7WWe042oo4mIB/QOs4nHzHS6+i8MWcrLd/SBvvylJKxoeMQwrp3MTt3slq
 2wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mpq6EOSgaJN9TDHyutZ1vk7Ts/tQX7VWZG2tuQLEVnE=;
 b=YCiND4azk8D8gZ6KrXdczaS2hp3n3RnVbHgFoPn3HyJO/3uRMpzcQPcZj+UuWjakln
 Mvc9P7HDAxZI8B25zd8WlnzEGfPGcf5gQxqhKpmfo1IVVpdjmzG3UnH/uSchNlJuHI/H
 ZPUvTKMK/M0Jp98zLZ++Vu3TOlM3akoY2Vt8WmLZU6sWQn5rjr54TKDw3E2qIVM31EZt
 1zz6+HRMCDjcQp90FymK9BMExPBqqW/z13RRrf1IP90s7do7TjnlUXpmoOMe3h1xAy8y
 TGSQmyU427+qiCUAZDtvwOlZSq3ibHWwPt190oSY7qQDk+EEhPwjU/uwrrigjSIUek7t
 TNPg==
X-Gm-Message-State: AOAM530Asn1REkOvrQbqCSy1OsQBOYkswaWuRuQPviKEngjwUb28NtKy
 kvjKHTyRFJuf+VlKYfXFdgg=
X-Google-Smtp-Source: ABdhPJw3Wj1NaKaNlFGnSPXqnbDgppea1F4wGZoXZbWDfwDJgXssQhrPLcI1GM9ROPIg4DuPtt07Tg==
X-Received: by 2002:a17:907:248a:b0:6ce:e03c:e1df with SMTP id
 zg10-20020a170907248a00b006cee03ce1dfmr14689906ejb.258.1646050020495; 
 Mon, 28 Feb 2022 04:07:00 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a1709067a1700b006d0ebe4af89sm4282959ejo.20.2022.02.28.04.06.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:07:00 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <Yhyv42ONIxTj04mg@kroah.com>
Date: Mon, 28 Feb 2022 13:06:57 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <Yhyv42ONIxTj04mg@kroah.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
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



> On 28. Feb 2022, at 12:20, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Mon, Feb 28, 2022 at 12:08:18PM +0100, Jakob Koschel wrote:
>> If the list does not contain the expected element, the value of
>> list_for_each_entry() iterator will not point to a valid structure.
>> To avoid type confusion in such case, the list iterator
>> scope will be limited to list_for_each_entry() loop.
>> 
>> In preparation to limiting scope of a list iterator to the list traversal
>> loop, use a dedicated pointer to point to the found element.
>> Determining if an element was found is then simply checking if
>> the pointer is != NULL.
>> 
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> ---
>> arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
>> drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
>> drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
>> drivers/usb/gadget/configfs.c        | 22 ++++++++++------
>> drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
>> drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
>> drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
>> drivers/usb/musb/musb_gadget.c       | 11 +++++---
>> drivers/vfio/mdev/mdev_core.c        | 11 +++++---
>> 9 files changed, 88 insertions(+), 50 deletions(-)
> 
> The drivers/usb/ portion of this patch should be in patch 1/X, right?

I kept them separate since it's a slightly different case.
Using 'ptr' instead of '&ptr->other_member'. Regardless, I'll split
this commit up as you mentioned.

> 
> Also, you will have to split these up per-subsystem so that the
> different subsystem maintainers can take these in their trees.

Thanks for the feedback.
To clarify I understand you correctly:
I should do one patch set per-subsystem with every instance/(file?)
fixed as a separate commit?

If I understand correctly, I'll repost accordingly.

> 
> thanks,
> 
> greg k-h

thanks,
Jakob Koschel

