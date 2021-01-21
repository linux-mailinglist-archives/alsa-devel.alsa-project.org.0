Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB632FFDB6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:58:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F232D1AA8;
	Fri, 22 Jan 2021 08:57:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F232D1AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611302304;
	bh=j96Ln7ZT4wvRWc5O/15NLrOnQPo7WJgQFYyt38K2H2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cq44rH0KDhmipd70PKzpBLBEo+ATCuzIp2vhOB0Ha+aDBpUSsb8R7fM1JFZ7+MabB
	 fSKCHveqZ23ztfzr2LywbK00mNqMz5+dXjQeLKUIJhqezT00YI5Nv/HF4BFJYLI70v
	 +Q1bDZnz6V/NPbZJ6EE8lqk2yfySm7FyAVEInErc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 339FDF804E7;
	Fri, 22 Jan 2021 08:55:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9301FF80257; Thu, 21 Jan 2021 18:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1A5FF80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A5FF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YZPWDlNJ"
Received: by mail-wr1-x42e.google.com with SMTP id m4so2592741wrx.9
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j96Ln7ZT4wvRWc5O/15NLrOnQPo7WJgQFYyt38K2H2U=;
 b=YZPWDlNJiVde0uSZg0Ea6OMOi8zIH3rq5ghid4RrVCt8WU2nLqZnS2NknZ6iPF52Bw
 hQLh+7kxhIaYRIilZ2DVREqsg4Zxx9/KwzO5U/SYes/kKdIZdHhx4xuGA4vGqWzT/TDz
 +MMhTtlj3AKNuPI8jNBXXtaPKlV8tNhZ/JMu5rapSN+uG7mLCCse1BUeLvVAVepgDGt/
 U4qKyM3Tega1Nb4SDzCswHbxZxWfGcHt3wOg/IXTl+W5kRqdrLeknobNFk2xueZiWMYa
 FjX734Ude125jIA0ATTFT6rUvkkMD8mYlpTz+B0X4/T+GWq5flRo0sM8uPUFAwTJRZMk
 Cb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j96Ln7ZT4wvRWc5O/15NLrOnQPo7WJgQFYyt38K2H2U=;
 b=n/kT1brMwMhjvLKcQp+0MFN1ECaftLxzFXbsvG3Ld8izM1r0hlOy1jKaG/AGYEgJ4j
 Odk9Fm3ZE3DWqNX6vh2DiKFwraMBtiXthHAn1BWjoMnkcoElNKeLVK+4kCiLe1B7derx
 0ZNBKHlT81znqBxPnUR65FL7bzqMHqDVWG+Znbks4tVjVBzBUjvcxM7MPcCKzxv4UCUS
 XtyY5fLKCKDrTXRyjwM2azGRVzulR6pPnSoIdzAtV7Mn4McOIWWUqKHOST8a7KhglDfV
 ur12zBQ3jkhMmhE83OE5onhhwKqOWyALjLg4IznHZCG2Iwy0Q/D81/J+o7GXQ0kUg9cu
 is7g==
X-Gm-Message-State: AOAM530OJV+h/pFrd90lCc6WfdpC0LsHFEN45tpNOlX54mRWLbrqzKs1
 gYsaWj0oi3MoM/zkVT/nmAYReyBk6Z//Dqxq/zo=
X-Google-Smtp-Source: ABdhPJwDQ6YlIILLhhEEoueRGp1tt+aH9BWGM2mi38mPJ5EJ8cIvyDtU84gSIjUw7023Vj9C/nnT4tBDIhcgRKNtAu0=
X-Received: by 2002:adf:fa92:: with SMTP id h18mr615603wrr.142.1611251261301; 
 Thu, 21 Jan 2021 09:47:41 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
In-Reply-To: <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Thu, 21 Jan 2021 18:47:29 +0100
Message-ID: <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:54:44 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

=C5=9Br., 20 sty 2021 o 23:28 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> >> Linux 5.10 fails to boot on my IceLake laptop, where 5.9 worked fine.
> >> I'm not sure whether it's a bug in ACPI or Soundwire subsystem, so I'm
> >> sending this to both
> >> lists. The W taint flag is because of an unrelated nouveau failure (It
> >> was busted on 5.9, and is
> >> still on 5.10). Full kernel log down below.
> >> It's from a distro kernel, but I can build my own kernel with patches =
if needed.
> >
> > Please try to add a check for handle against NULL to
> > snd_intel_dsp_check_soundwire() after
> >
> > handle =3D ACPI_HANDLE(&pci->dev);
> >
> > and see if this makes any difference.
> >
> > This should check handle against NULL anyway, even if it didn't crash l=
ater on.

I'll do that later.

>
> Is there a way you can share the DSDT?

I uploaded it here: https://people.freedesktop.org/~mslusarz/tmp/dsdt.dat

>
> The only thing we do in that sdw_intel_acpi_scan() function is check for
> an _ADR and read two _DSD properties. I think it's been 2 years since we
> wrote it and never had an issue, never say never I guess...
>
> If you want to bypass this problem for the time being, you can add a
> kernel option in /etc/modprobe.d/alsa-base.conf
>
> options snd-intel-dspcfg dsp_driver=3D1
>
> that will force the use of the HDaudio legacy driver and bypass the
> driver autodetection.

Thanks.
