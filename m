Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B51F4BA65C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 17:48:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2403192A;
	Thu, 17 Feb 2022 17:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2403192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645116521;
	bh=yLrFIsE9bo3p9BnVIL7Uc7sprqnSKm0YOW7fBIQdERM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HECxw4CiLS0s6niG35cWuKAylPD7DnUUH8h7vGaHVDm7pT8QbAyokLAnqzCPRk9q0
	 fTpjcBWZyyO3wlM9g57LHn6+D/4hHyKLfgleCOEWFeu+8pW4PWriMFUaUOgKnww1B+
	 vo+Fx/vI/wwtbyCE659kkZfjNL6fHNWpFJdyAH/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAF0AF804D6;
	Thu, 17 Feb 2022 17:47:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76FA4F80128; Thu, 17 Feb 2022 00:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DATE_IN_PAST_03_06,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F515F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 00:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F515F800C0
Received: by mail-ot1-f49.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso243328oti.3
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 15:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLrFIsE9bo3p9BnVIL7Uc7sprqnSKm0YOW7fBIQdERM=;
 b=IrQxOnXwqCUgsQ7Unagpd/jkbjlvaIOwm/Wahkck53zHhvBK/Z5S4tbEGsclch2eni
 IqKvgzmgkRlywcyVM8D2C+a9KTHD7gp+PKjzxoskHJRJ8o23/Q3cbMiRF6RW6lMonS4c
 XIlinHShvRnhnoT85WxvNp4dFXhRu+dR3LIfDucNPhAk+UKzdfSSzzk/2TVY70TlbC8R
 tAN7x3ojGXLHS6yF9is2Hu/3FxwNSOUJUfsKwoMYaQOLjkeoUIVK11Pl02CP1nALx+6R
 7AbKBFxicBW6AnnOYGRwfU1w+AcM0E//liUVKTGdMDQ46rKXaQPgVCz/6isQgCb9sH/t
 G34Q==
X-Gm-Message-State: AOAM5301Be0mJZZHvD4AusiEAIwvqt0MxVWtfDXZw/VYRVt9wGFfpadQ
 udgj05ClS1TO9IehltKSI54d77iOAX7UrOE9uf+9xiWPcCmlzQ==
X-Google-Smtp-Source: ABdhPJyFOmiGOmRDkw8czUhuWEAUWZI3b6hfKAcdDSxdtm3oSTgs7z2noREt7vOvPl7JarLhxJEUxltkCz2WrL99cSU=
X-Received: by 2002:a0d:c244:0:b0:2d1:1fbb:180d with SMTP id
 e65-20020a0dc244000000b002d11fbb180dmr3902361ywd.196.1645038358332; Wed, 16
 Feb 2022 11:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal>
 <20220215193221.GA884407@embeddedor>
In-Reply-To: <20220215193221.GA884407@embeddedor>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Feb 2022 20:05:47 +0100
Message-ID: <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Feb 2022 17:46:58 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, mpi3mr-linuxdrv.pdl@broadcom.com,
 coresight@lists.linaro.org, sparmaintainer@unisys.com,
 linux-um@lists.infradead.org, greybus-dev@lists.linaro.org,
 linux-rpi-kernel@lists.infradead.org,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 linux-cifs@vger.kernel.org,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-alpha@vger.kernel.org
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

On Tue, Feb 15, 2022 at 8:24 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> > On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > >
> > > > These all look trivially correct to me. Only two didn't have the end of
> > > > the struct visible in the patch, and checking those showed them to be
> > > > trailing members as well, so:
> > > >
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > I'll add this to my -next tree.
> >
> > I would like to ask you to send mlx5 patch separately to netdev. We are working
> > to delete that file completely and prefer to avoid from unnecessary merge conflicts.
>
> Oh OK. Sure thing; I will do so.

Can you also send the ACPI patch separately, please?

We would like to route it through the upstream ACPICA code base.
