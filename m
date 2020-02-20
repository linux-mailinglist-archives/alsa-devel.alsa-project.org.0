Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FC8166442
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 18:21:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0512216D5;
	Thu, 20 Feb 2020 18:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0512216D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582219312;
	bh=yWpfudbWH+WHfCTUsrDNeEM6tr8tTymlcrjd0ZTCezk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEF+aeHcMOSQYV4lRKsIX2epRmhqB7NBMGMuQFevr6UMIhjZ1P3xQ/amOBY4d1Ja+
	 59dVgLl1vzvTo222jSfsRO7E8DSvLckn/z1LMgolzXCwsLLujXLEwo1Dm8ajC/XShf
	 M8ywvNucxhXzZvDDsMPtrHHuQHPmoyvo4eGGzzAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA35BF80114;
	Thu, 20 Feb 2020 18:20:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0AF0F8011D; Thu, 20 Feb 2020 18:20:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A160FF8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 18:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A160FF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ojab.ru header.i=@ojab.ru
 header.b="FaLnXbz7"
Received: by mail-ua1-x941.google.com with SMTP id 1so1870893uao.1
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 09:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yWpfudbWH+WHfCTUsrDNeEM6tr8tTymlcrjd0ZTCezk=;
 b=FaLnXbz7Ka3HCZh/wK93pUvOoLGvjz9g3mhfMWPfuVuWoKGjthvdIItRxyjk9vwJD9
 54ExRqyJirxBrshvhy46xLNX2Ukylb1lKlTfDB18Un96Ap704cMSg6Qs93kH4TjTd8ME
 Ts9E/JuN25tWaK1CIuGYywmintCUREmotq+U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWpfudbWH+WHfCTUsrDNeEM6tr8tTymlcrjd0ZTCezk=;
 b=G618AC3Crov2MN4lBYZgeizE9xnxEQ4iQVL/C38aRY3aVf2cUNRdcBkEmabG8VLcFo
 jWaQYphJNvFw9uaevCzS0Q4tVAmP4NWHNZAaYL/Hy76bKGdCiPCn++Ri3saf3kzB73mL
 EsskHdGqDkitbg+8W6yhmU3N5Dmy5Xf39LiEErjrybYeyEGLfh0B51Gm9EoYz/ivufUN
 P38ybekZy8LTMt9a/8P9eH8R6zuCmbVKpPYllL52N4sxQOvA/q3T6mtB1P2twMOwCsjn
 M97NljMdlJikISkg1B6qXBP00lhoMUnvGHbLKsbjD7D93yMu0qwzhD60dfonmld8JOqN
 zauQ==
X-Gm-Message-State: APjAAAXnXWlHRUhcEFWPsBLfct9lA6LyZViDdK9rnoydo1l6gOdfWBvT
 rqKogZniI5N+wHSsVQPjCVnsK3xe5aipFWwb3f92Cw==
X-Google-Smtp-Source: APXvYqxKTk3gr+IkDMYsL01owPur/tgA+5KklVeXSNhyeQdFg2iFbrH7dDd9sJZlHR7a38MwwNtrb8t7VYmUSc8kaKY=
X-Received: by 2002:ab0:7550:: with SMTP id k16mr8210397uaq.51.1582219203449; 
 Thu, 20 Feb 2020 09:20:03 -0800 (PST)
MIME-Version: 1.0
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
 <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
 <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
 <7de214eb-d6a0-3f86-9eb3-76488f0ec99f@linux.intel.com>
 <87r2001bsi.wl-kuninori.morimoto.gx@renesas.com>
 <6d0f1830-a2f0-997a-99cc-05c268acefc6@linux.intel.com>
 <20200116145708.GQ3897@sirena.org.uk>
 <CAKzrAgQapgQtxMLYjEe9mSaXp_uYxMyH8fwvoJqM3Or0sqqfiw@mail.gmail.com>
 <394de883-f044-44cb-9b09-a4fbe2e14b75@linux.intel.com>
In-Reply-To: <394de883-f044-44cb-9b09-a4fbe2e14b75@linux.intel.com>
From: "ojab //" <ojab@ojab.ru>
Date: Thu, 20 Feb 2020 20:19:52 +0300
Message-ID: <CAKzrAgSiCVttuAnjGdb9N3z6crpi4ChGEB+L2YLvbMco48Dfeg@mail.gmail.com>
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Tue, Feb 18, 2020 at 8:24 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 2/17/20 9:10 AM, ojab // wrote:
> > On Thu, Jan 16, 2020 at 5:57 PM Mark Brown <broonie@kernel.org> wrote:
> >>
> >> On Wed, Jan 15, 2020 at 07:04:48PM -0600, Pierre-Louis Bossart wrote:
> >>
> >>> Maybe we could have some sort of boolean flag in the component->driver
> >>> definition and explicitly request a backwards-compatible behavior (e.g. for
> >>> all SKL/KBL machine drivers) when that driver is known to be flaky. There's
> >>> already things like 'fully_routed', maybe we can add something such as
> >>> 'disable_route_check'?
> >>
> >> A quirk for old stuff that can't be fixed sounds like a sensible
> >> solution to this.
> >
> > Any update on this?
>
> Sorry, this is what I had in mind (not even compile-tested). I don't
> know if the checks need to be disabled twice.

Unfortunately no sound with this patch on top of 5.6-rc2
http://alsa-project.org/db/?f=0f5049d8f7dc906bd13f354056282a48d2e626cc

//wbr ojab
