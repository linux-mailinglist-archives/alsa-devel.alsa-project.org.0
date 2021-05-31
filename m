Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23715395987
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 13:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A4815DC;
	Mon, 31 May 2021 13:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A4815DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622459653;
	bh=vqZ7f7YOA+n/zqKPqOAk4zWwLfVC6ktsbnkSXgski+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOIz7s42ilJGZBDZNw5zlqykpRYdpg5XgEPAUtlUSZY4BZdGNigV5QyXbb0cWdfdw
	 Q9+Ki7BIbIE8b0b/AzmMRINwBmRC5cm9Vrwfpeg263MjDSAaF7iTSALpvHiiN5C7XH
	 cFCZLPTeBau+UNSN7ce/SJaMauz5Vmslp1NKQv3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E577F80431;
	Mon, 31 May 2021 13:13:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3D72F80430; Mon, 31 May 2021 13:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_10,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15A2FF80273
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 13:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15A2FF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H+I960k7"
Received: by mail-ej1-x62d.google.com with SMTP id g8so7692374ejx.1
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CRaLvLXh68H09Zfp4seCpIdzZFvvlshqCqJckzDqmc=;
 b=H+I960k746ql73un5xNsHeDl+HqmrhExRw8VJA0AnvSaliaY8kQcw/DKPsZoYwCNC5
 cQ1hsBRTEgfTlEO9qwbYYPon3jDiJULGt9JFjOHWiNYa8EXnodRprTOZS5SkXihHdCRF
 18fyKaf9VBGdqZZEjZkodq0/nmy+Wl3a42rLaBs9WJEXvjYHM1kbxdmgoNZCk1lEr+B8
 hsmoqFUFZOg3XC4M+2uWpb6ll63GUO5Kb6iuTjd8iOub+YmdM5ueaz23xEa1nraK/F0b
 Y5Y8wZZxGVuyzvUgvenjsuj4p5ccNZt0/7w2hOBU4eSdnduFTMj3ESD89VDSH65T4d+Z
 hvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CRaLvLXh68H09Zfp4seCpIdzZFvvlshqCqJckzDqmc=;
 b=mXifRFl8nk8lFC2WBs5KiKJz6oAJFm9IFWas0nA1Ll2BlpamKHjnVkuPazb/fvZ+dh
 Il6Gzg8MIAuDjatWX2yfDddZ2i9ZK8u8zhJfOgyKEZfSNbgXWTO1Ah2J4ZkxK2fq8Rkf
 dvFNHNjzL4pur7X5e2fxGBh2KTS3XhceIMpkHvEkfsqu8/ZXnaRO706dh43KG6v3UAYH
 YpNS2Hoshyio6dpQNEoNru5lCpLbsl/o1oyASOdNP0i+C+p79/9Ei5ihsYb69lAvaNkE
 9oMiQJOErV/bgmlIhDhAdW3iRLfEiq28jFADyYpI9+BdvoxvN42tQRyNFnrhFcGditBB
 bn0A==
X-Gm-Message-State: AOAM530Plm13RLiY56/b7BgKXTpQrZJeCo9wdWjcqKOti6i4jntgVoQB
 xxad0iH8EKuJDHc8qZTd7Mz/Hr70TtuYlFN9AV0=
X-Google-Smtp-Source: ABdhPJxPMYA4RvOOpmuxpdIkn9OTBgTkBiOKjJDd58HQSAarNrG5xrH0C/ICHXC/R3X0Hydy9/XkI8XUGDZ6+Uu73n4=
X-Received: by 2002:a17:906:6d17:: with SMTP id
 m23mr22979526ejr.73.1622459503577; 
 Mon, 31 May 2021 04:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210531110144.GA24442@kadam> <20210531110742.GB24442@kadam>
In-Reply-To: <20210531110742.GB24442@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 31 May 2021 19:11:16 +0800
Message-ID: <CAD-N9QU8uLE=0r3x7dvoSctMnOapr9OyFbCjb=ytO=qC6GCe4g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On Mon, May 31, 2021 at 7:07 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> I've also created a Smatch check for missing ->release() functions.  It
> find one bug in that file.  There are other bugs, but the static checker
> is not clever enough to find them.  I expect Smatch will get smarter
> about this in the coming year.
>
> sound/core/control_led.c:685 snd_ctl_led_sysfs_add() warn: calling put_device() with no ->release() function
>
> So, yeay, I feel like this thread has been useful and I now understand
> put_device() a little better.  Please review the email thread again and
> send a v2 patch.  :)

Sure. No problem. I will send a v2 patch after reading the whole thread again.

>
> regards,
> dan carpenter
>
> /*
>  * Copyright (C) 2021 Oracle.
>  *
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU General Public License
>  * as published by the Free Software Foundation; either version 2
>  * of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
>  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>  * GNU General Public License for more details.
>  *
>  * You should have received a copy of the GNU General Public License
>  * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
>  */
>
> #include "smatch.h"
> #include "smatch_extra.h"
>
> static int my_id;
>
> static void match_put_device(struct expression *expr, const char *name, struct symbol *sym, void *data)
> {
>         struct smatch_state *state;
>
>         state = get_state(SMATCH_EXTRA, name, sym);
>         if (!state ||
>             estate_min(state).value != 0 ||
>             estate_max(state).value != 0)
>                 return;
>
>         sm_warning("calling put_device() with no ->release() function");
> }
>
> void check_no_release(int id)
> {
>         my_id = id;
>
>         if (option_project != PROJ_KERNEL)
>                 return;
>
>         add_function_param_key_hook("put_device", &match_put_device, 0, "$->release", NULL);
>         add_function_param_key_hook("device_unregister", &match_put_device, 0, "$->release", NULL);
> }
>
