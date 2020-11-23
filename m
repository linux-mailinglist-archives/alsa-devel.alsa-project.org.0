Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E82C2E2B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:14:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E93E517C7;
	Tue, 24 Nov 2020 18:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E93E517C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606238046;
	bh=hpzmbQO3ukpaSeFKIRE1jh1hQHTalBalrnavSV3mrW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JNpGypoLo9HZTC8VhAo0ApdgAoqVgOkAuJPN4oHsTwi9qYcuS8aDyAtc4R/0G6tu9
	 a6EL4DCjUWqCSdQV/klh3kLrT+u6ktLXAUG9O+2IcJ7lCC6hu8v6NRL4v4HEL8TlKq
	 5Y8ubUInAMYQ/+0FG47YyadLPfUwJOSn6+L+lbew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 375C2F805F1;
	Tue, 24 Nov 2020 17:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A63BFF80128; Mon, 23 Nov 2020 15:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FF41F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 15:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF41F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b0LkeT2q"
Received: by mail-yb1-xb42.google.com with SMTP id e81so14496918ybc.1
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 06:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WUYMqcUnfpAQa1YuH9tQ3ze5bp2bxaoGLXc9Sg/470Y=;
 b=b0LkeT2q71Z3peIccxL7MkU5QadaCN3igdEC89IE4ykmdOxIlhuoo/0+H7pQCoNmlh
 0UX19Z7soasUpz2fDZHX56luUWrH4GLKAJ9K28HwPu9km7qlcvasqfBffaQW+LtXvh6a
 fVP4J8wQFxbi1QWFB10Wsq9dLONxRShLcqQtcaktrZCy3tSRV5R4FOw2MSdgwNuCxNwd
 cKQMyE/jYgmlc9Qm972BZKz9xJaasT5iW6gpZgai8YpCh1sxJNgZFzlfCpv21Fvd7rwb
 akOsznbnFT4mJT95mXFDUPnplTdAJirWAcm8YfzHFRAfOGn9Vk91PuRcq7JipLelDPMB
 VWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUYMqcUnfpAQa1YuH9tQ3ze5bp2bxaoGLXc9Sg/470Y=;
 b=Oed8zGwdhP0d9WWZ+7yPxG00PkZw2CXHjrKfXkCXalMJ63JG5C/lK6SQJc9C6Gtd/h
 i4gdMCPK9OGiVj6FP0XHAgrlXOYaRLMwvgca9bgYsjncl34n728yJvE/w/nL1FgHzdRQ
 92d+UCtqGrGtp9uSUrU4flNjuTBfw8+bTDt79aUqwV/A3IjnOW/+YFa3X1kNHKlRoRw2
 ROCFpkpUwLQ0uw36EAPCfI12XoqD7bo6y0Pf1TaMeBmueHKNSEFlkjfcb3tYluTTwjX7
 AnttBIbcr4zMawjXk7jV6RHn+pnyWYgvf7buHlvZb5X8jOoOPuG+3eh8wsV/jF9AjkFm
 fieA==
X-Gm-Message-State: AOAM532sC2km1Nb7+/54ttScp6Lqc9rSGOqT73szUKHhagcIhMsaJsQC
 IbSxJ5W53kwLPk5sS5bCCUYeJoPCbmh0kjKfF4Y=
X-Google-Smtp-Source: ABdhPJyiJqjBIpEzWlk5pyqpoGG3+KpoWdKnlyza2YA6ODhXnRhATytwh5Bq+iGOzNqc5gs+zuqHC8iB1cjfDTXU/ik=
X-Received: by 2002:a25:bcc7:: with SMTP id l7mr32380985ybm.115.1606141205830; 
 Mon, 23 Nov 2020 06:20:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
In-Reply-To: <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 15:19:55 +0100
Message-ID: <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
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

On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, it seems to be three years of someone's time plus the maintainer
> review time and series disruption of nearly a thousand patches.  Let's
> be conservative and assume the producer worked about 30% on the series
> and it takes about 5-10 minutes per patch to review, merge and for
> others to rework existing series.  So let's say it's cost a person year
> of a relatively junior engineer producing the patches and say 100h of
> review and application time.  The latter is likely the big ticket item
> because it's what we have in least supply in the kernel (even though
> it's 20x vs the producer time).

How are you arriving at such numbers? It is a total of ~200 trivial lines.

> It's not about the risk of the changes it's about the cost of
> implementing them.  Even if you discount the producer time (which
> someone gets to pay for, and if I were the engineering manager, I'd be
> unhappy about), the review/merge/rework time is pretty significant in
> exchange for six minor bug fixes.  Fine, when a new compiler warning
> comes along it's certainly reasonable to see if we can benefit from it
> and the fact that the compiler people think it's worthwhile is enough
> evidence to assume this initially.  But at some point you have to ask
> whether that assumption is supported by the evidence we've accumulated
> over the time we've been using it.  And if the evidence doesn't support
> it perhaps it is time to stop the experiment.

Maintainers routinely review 1-line trivial patches, not to mention
internal API changes, etc.

If some company does not want to pay for that, that's fine, but they
don't get to be maintainers and claim `Supported`.

Cheers,
Miguel
