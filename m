Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CB2C2E30
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:15:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2F0C17BE;
	Tue, 24 Nov 2020 18:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2F0C17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606238139;
	bh=SWzdE85KMSmQ5K6aYMgWVQjn8/tst2VI3dLUnv/55SM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vYFwO3HoN+q3/tg5xUY7l9IoMugbmHqcfY7pgUa6Vq4JCJJSm6JI37LuOZzG6LC32
	 x11K/c42sCx5sJ8yf64Vunv9esTU01GdiTji8MUSC3lSI7E9MnYLFePivllGyejbvf
	 uWGbTaKwhZ1eZSKUh/hkRslI0MNVycLBKmVAidD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D6EF805FE;
	Tue, 24 Nov 2020 17:58:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 256AEF80255; Mon, 23 Nov 2020 17:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1F11F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 17:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1F11F80128
Received: by mail-ot1-f67.google.com with SMTP id o3so16422865ota.8
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 08:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SWzdE85KMSmQ5K6aYMgWVQjn8/tst2VI3dLUnv/55SM=;
 b=kV18Z4Uii1Y6ixVVi4PGb8jt4CWFd+Piw/XSNUQ8WaY6SLomRIz+ObXKsxBUVVfBRv
 PEgm8y7ZuFOL6vNPqDDY4pSUkZ871PFSARDXfgDZC8SmEynahH6LadUbuY6bFpp+yqWp
 YDP6TTZJlKCBRAgCsNVVKyw7QIh3gn4i4anwdhEA/y6oKQm4VELM4/TBCs0qLdkpCX/h
 adbLcN215/w6iBwjstHnrFMe3f5FsEeVkGf6G13LExzS8Msndu51wH5n/m4wLo9TllC5
 jqMP2LuvRbNeqZOfzmaz8Nu5HQcKNmOW8tZRC/buZGTVWG7lSt6mbfaXgvZPMqIWfC0d
 h13A==
X-Gm-Message-State: AOAM532beBiwz+71iyNZRBlzirKVniThU5mjReTQpVxejlgfJy7sqxo0
 Jbaw5yjCeb3Uh2qYyNaafxy+igr+EQfqw6qQlTA=
X-Google-Smtp-Source: ABdhPJxW9u67TbnPp8ObIChv5a6F+ncd8SoV+BFvs894Bl4MJzyAX0TVAjkpawJr+z1OvIzzPyEcIsCefAg0WelXSFg=
X-Received: by 2002:a9d:16f:: with SMTP id 102mr68959otu.206.1606148702991;
 Mon, 23 Nov 2020 08:25:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
In-Reply-To: <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Nov 2020 17:24:51 +0100
Message-ID: <CAJZ5v0jJ6GFm4LFCR2V3qvD9rZrVw=pXyXSjSWPYtQudg-F3xg@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:07 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, samba-technical@lists.samba.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 Nick Desaulniers <ndesaulniers@google.com>,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 linux-rdma@vger.kernel.org, oss-drivers@netronome.com,
 bridge@lists.linux-foundation.org, linux-security-module@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-geode@lists.infradead.org,
 linux-can@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 xen-devel@lists.xenproject.org, nouveau <nouveau@lists.freedesktop.org>,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc <linux-mmc@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-sctp@vger.kernel.org,
 "open list:ULTRA-WIDEBAND \(UWB\) SUBSYSTEM:" <linux-usb@vger.kernel.org>,
 netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Mon, Nov 23, 2020 at 4:58 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2020-11-23 at 15:19 +0100, Miguel Ojeda wrote:
> > On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:

[cut]

> >
> > Maintainers routinely review 1-line trivial patches, not to mention
> > internal API changes, etc.
>
> We're also complaining about the inability to recruit maintainers:
>
> https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
>
> And burn out:
>
> http://antirez.com/news/129

Right.

> The whole crux of your argument seems to be maintainers' time isn't
> important so we should accept all trivial patches ... I'm pushing back
> on that assumption in two places, firstly the valulessness of the time
> and secondly that all trivial patches are valuable.
>
> > If some company does not want to pay for that, that's fine, but they
> > don't get to be maintainers and claim `Supported`.
>
> What I'm actually trying to articulate is a way of measuring value of
> the patch vs cost ... it has nothing really to do with who foots the
> actual bill.
>
> One thesis I'm actually starting to formulate is that this continual
> devaluing of maintainers is why we have so much difficulty keeping and
> recruiting them.

Absolutely.

This is just one of the factors involved, but a significant one IMV.
