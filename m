Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F99346D94
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 23:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A86AE167A;
	Tue, 23 Mar 2021 23:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A86AE167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616539890;
	bh=/JC2WWMUs5g3ESmAYEusP1t/wdE8qRVZLNmpwAENbac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rffm+yGjo5MZ7o69xz8Fwrr6827AJSbfcfxbeBg1jtBtIEiHFncLY8CpjcyDbGixg
	 cL11+10nv6bekE/2XB5XlWB/bNmCJ6rVlpHBuiiMXUDqgu7Hz+hdh+T4MxJa51iwfw
	 UqtCyEaZpQ5ZU8fnbdFFQGiX2XElBh3N+8Yinn0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21227F80257;
	Tue, 23 Mar 2021 23:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA9F4F8025F; Tue, 23 Mar 2021 23:50:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B89FF80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 23:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B89FF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="OMPN7pUF"
Received: by mail-vs1-xe2d.google.com with SMTP id l13so10296874vst.8
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 15:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZj17CbAhPV0BOUrIhSGjBZvBrtI35jH8ivTaVwdIvs=;
 b=OMPN7pUFEP9QlCz9mzW11sDqR+bcXJJU+VyoL0Ord/LhAiMnbFp3U1gv1A53UVpRo3
 pGZ7S+AQGUipcnv4rpM55wPOC2LuQmES4Zh5K/Ed2tm0cC4F4U6SBgDKG0RRKhHgzaaa
 mhvuWUUSf6q20jx4PHOfcirPyv1oQ/eI5OtVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZj17CbAhPV0BOUrIhSGjBZvBrtI35jH8ivTaVwdIvs=;
 b=dy4kNCAN6jrsdjif4bFkyTfVXaqLBq0KdzZKR2gMffPolaDIZhSJY1JkUUTmqkbE+8
 dvmkMA5NzILRmJjMW3hXiYkKQe+lEANxw2BrOoavJtJI8RHkODYJuPet7OiYlrG7b2Jk
 XuKX7+bkiilo04R7JnP2E3tAemsJKgjgXoXo91wJMcsUyHFapCB9HCn4Bq2/tXwxB9ju
 dQfEk1Yno9dMvAhxaWWbbfOMLZC9m6enU1TcoDjKytLh8F12561n6cLT0CEJnH7PKx9D
 B31UXpyCgTcVojiCDDmtx5uuLW+sKXrqfUtHzq8fPVMrmYGOyz2suD6NcpLXi2gQbME9
 5hqA==
X-Gm-Message-State: AOAM5332gxIZMcinvsmXLx1kKORgEgRF99n6bLkR48awwq5O+VxbQUHM
 i0uWWmkN2dqY9s4odMgFdSSyAE60lXu44gyl1CBIsA==
X-Google-Smtp-Source: ABdhPJwckSkJtU1LzKoFGeFTfaM4SDYgjQVY67jVUWs75Uxv4Iu0h6f7t2CEPRK6PcZLsMfytIvJPqfZHk0X6tK6g/g=
X-Received: by 2002:a05:6102:ce:: with SMTP id u14mr249633vsp.28.1616539792777; 
 Tue, 23 Mar 2021 15:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
 <s5h5z1nf47r.wl-tiwai@suse.de>
 <3820909c-29ce-9f3f-d1e6-c4611e06abe4@redhat.com>
 <s5h35wqff1m.wl-tiwai@suse.de>
 <a2018c94-8731-de29-e447-92457176a1b4@redhat.com>
 <s5hy2eidul2.wl-tiwai@suse.de>
 <a9a62884-da5b-ef2a-10ec-e414e6784677@perex.cz>
 <CAOReqxh-ztd-FWvhoipUbkhzfhZCyH5KY8v1VwjswNFH7OnARg@mail.gmail.com>
In-Reply-To: <CAOReqxh-ztd-FWvhoipUbkhzfhZCyH5KY8v1VwjswNFH7OnARg@mail.gmail.com>
From: Dylan Reid <dgreid@chromium.org>
Date: Tue, 23 Mar 2021 15:49:40 -0700
Message-ID: <CAEUnVG6ZO+kiPMnebG6pq3NkRqvP80Q8cB5bPJdgPt9DUgALzw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Curtis Malainey <cujomalainey@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>
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

On Tue, Mar 23, 2021 at 2:40 PM Curtis Malainey <cujomalainey@google.com>
wrote:

> On Mon, Mar 22, 2021 at 7:16 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> > Dne 20. 03. 21 v 10:48 Takashi Iwai napsal(a):
> >
> > >> With other OS you mean e.g. Android?  Android has device-specific
> > >> init-scripts which can either call alsactl or directly do the
> > >> echo-s.
> > >
> > > Also ChromeOS.  I'd like to get a general consensus before moving
> > > forward.
> >
> > Where are ChromeOS people? They could join to the discussion which is
> > floating
> > few months now. Perhaps, the gmail's spam filter does not allow them to
> > communicate with us ;-)
> >
> > Hi Sorry, i missed this was directly to dgreid and me. Will try to get up
> to speed on this.
>

Sorry, this one wasn't gmail's fault, it was my manual filtering of emails
about LEDs:)

Chrome OS is supportive of user space control when possible. We will work
with partners to establish a standard in Chrome OS for mute LED meaning
(built in, headset, usb, etc). Having user space control allows different
ecosystems to make different policy decisions. For us, the UCM-specified
mute on/off will be driven exclusively by the audio daemon.


>
> Curtis
>
> >                                                 Jaroslav
> >
> > --
> > Jaroslav Kysela <perex@perex.cz>
> > Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> >
>
