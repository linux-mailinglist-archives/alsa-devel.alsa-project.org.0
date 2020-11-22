Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A132C2E0E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2A51788;
	Tue, 24 Nov 2020 18:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2A51788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237831;
	bh=lkY+Zo/3gkMyVctMppFhe2E5hKkja1bq/MgmxVSVEUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rXn26le/LdSBZ+WVR0hZhLHTyrDs9o4m7u0Oo2abSvS2FkC7FiLls1qJpBIUZOj1D
	 VBsMKEwalxUdiFdKzeW7aBaRs1LJT+7hgCo+8qtkB0Tct+jcBJzy4YZIZRuJoLmu/G
	 7xlIUQ8wQyBgVd4MGHLtakTMTRdwZ5l67PAtbJ98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12EF7F805AF;
	Tue, 24 Nov 2020 17:58:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4125F80165; Sun, 22 Nov 2020 21:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2C91F8015B
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 21:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2C91F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tX7AFJY3"
Received: by mail-yb1-xb2d.google.com with SMTP id v92so14063931ybi.4
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 12:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GG13N+h9bYKW0tA8PzZdEh0PqD5/qSPuWfMm4/MLZZE=;
 b=tX7AFJY3IoP+sTWjLWjwUeA0EiMqyjgmEMGUK52Uheybmur4GieXYHjq/4452d4+Q2
 I9IJc2W+KgP7eM5cLMrffBSaL1fq5VPLYq7a7Nqy7aqiJs+SWc7hYJy9lsWlIs20dLH2
 W28Iwaw2K1E1/9bR59jMmk/7Gq8vv14a82SqbrX8Cr26/AWqo5ergIUL6PfX6EI1DxrF
 H3tDAymEGdy6lnWgT39rAP3JOfP6UnfKa9FSSCeE7ggKiNT9+2hZ/9zdGiTOU+6HH+d5
 TmFQQAuEaRP9Z2Bh9bU0txdUhaZCbT+Ezs+qExtvq1zOJlrZzRYF6kJpZnKXIPWyTN/2
 bJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GG13N+h9bYKW0tA8PzZdEh0PqD5/qSPuWfMm4/MLZZE=;
 b=tydH2iMc0idrQPjoBMVxFrYdOlXATQItWRGiAf5kxEFYRh8iBvh+2gHMtD0SCO9nzb
 5tATZeGbCXAr+WGRpmC8AH6AJV5/DcUhiNgOANUodfDVfEnGdrz+Yu99GwprBzJHoS9w
 JcZvgQ2AVBETZHqwW4vkvJjLlki6lk27r2qe2jgy3AueAZUSxFLk/qO1u9tY5OkoW8Ot
 AbuOlYHNU7Pb1DxVgrKoo1KwfQQlGYVFP1eEIe9jioLQvSCYbUvTAhxaAmVGvAMZwgUG
 OA+Cibf1/RwXtVNI/3rPqBm6348XPvwtfasJ0AlTDb3BJRZf/7op9/lQ1PgG8mwPMru8
 tv+w==
X-Gm-Message-State: AOAM530q9HJy89lu5oa8gsei7qOcHozlUvtJ0m+av/9l72QYYeE/OF0F
 WWTgGnWRUMdYknX9NXvEWtxbyuBmd4tcpmg0C3Y=
X-Google-Smtp-Source: ABdhPJzCLkP7XKvI+ogPcqXNjFlbBz0ulixnxLa8L+LTJiC1sb757UHHSouM0vJ9LX/4+Ocy8hzM6Anb9s4lPpy7cZY=
X-Received: by 2002:a25:6986:: with SMTP id e128mr4956056ybc.93.1606077369721; 
 Sun, 22 Nov 2020 12:36:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
In-Reply-To: <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2020 21:35:58 +0100
Message-ID: <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:08 +0100
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
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

On Sun, Nov 22, 2020 at 7:22 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, it's a problem in an error leg, sure, but it's not a really
> compelling reason for a 141 patch series, is it?  All that fixing this
> error will do is get the driver to print "oh dear there's a problem"
> under four more conditions than it previously did.
>
> We've been at this for three years now with nearly a thousand patches,
> firstly marking all the fall throughs with /* fall through */ and later
> changing it to fallthrough.  At some point we do have to ask if the
> effort is commensurate with the protection afforded.  Please tell me
> our reward for all this effort isn't a single missing error print.

It isn't that much effort, isn't it? Plus we need to take into account
the future mistakes that it might prevent, too. So even if there were
zero problems found so far, it is still a positive change.

I would agree if these changes were high risk, though; but they are
almost trivial.

Cheers,
Miguel
