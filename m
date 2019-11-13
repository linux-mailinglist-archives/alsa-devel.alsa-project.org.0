Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E6FBA3B
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 21:50:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA7531660;
	Wed, 13 Nov 2019 21:49:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA7531660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573678226;
	bh=/kaQKprO9+oGDv9hzLQ3aH5I4+nPRlqtlkNJxahDawI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jphjI3TGRHZOEtscDX3sLU9Jg8X05pjihWJQ/eMnJCfvNVdQkDJwSv1/M9r+2Thm1
	 nNI5oQWFdJnlPv9OMf8arJrgutz1AzBTAp1zMlJ8hUOhTA3hyNkeh3HEOXZNncwpyt
	 nGXSKjjOMoaVVuBs+2Cvfv/Ru8NxG2qYuvWniW2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B86FF80085;
	Wed, 13 Nov 2019 21:48:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB71F80085; Wed, 13 Nov 2019 21:48:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AED01F80084
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 21:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED01F80084
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MJVY8-1iB7Gc12U4-00Jqil for <alsa-devel@alsa-project.org>; Wed, 13 Nov
 2019 21:48:34 +0100
Received: by mail-qk1-f178.google.com with SMTP id e2so3043482qkn.5
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 12:48:33 -0800 (PST)
X-Gm-Message-State: APjAAAX6JORpwNEQ+uiJZkKmI/VKAxDlEqxkjZox+tVvrn41M8oXrOKv
 j/C1/TgUhA6qwUWA420YGutS1OEX/TRfApR9vkA=
X-Google-Smtp-Source: APXvYqx7UkBV/kC0is9Dpo8dDdWGF+Zki5016/BoG73dW6kFhspK8vxYn64om37wWSVD3T/yekPlGM3LvP76mG8ZG74=
X-Received: by 2002:a37:4f13:: with SMTP id d19mr890459qkb.138.1573678112912; 
 Wed, 13 Nov 2019 12:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20191112151642.680072-1-arnd@arndb.de>
 <s5hk1847rvm.wl-tiwai@suse.de>
 <CAK8P3a2TMEUhzxH7RKvAW9STk33KrbCriUaQawOMffoFC6UTQw@mail.gmail.com>
 <s5hzhgzn304.wl-tiwai@suse.de>
 <CAK8P3a3n9hrb-qfAYW9=eYApSX=pkOK5p6iGe0T29-KqGuh0tg@mail.gmail.com>
 <s5hy2wjn1w2.wl-tiwai@suse.de>
 <CAK8P3a2+DgOBXS9MmPfvyyCUmqMB-pOx-qLjTV-VjDgStP6tww@mail.gmail.com>
 <s5h1rub7ih0.wl-tiwai@suse.de>
In-Reply-To: <s5h1rub7ih0.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Nov 2019 21:48:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zNKyauCpZKoXuAeFmpJ-LAY8XhzwhxhMNAJsdbYdKAA@mail.gmail.com>
Message-ID: <CAK8P3a0zNKyauCpZKoXuAeFmpJ-LAY8XhzwhxhMNAJsdbYdKAA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Provags-ID: V03:K1:Q+Iu5APqFqu61I6/JkXSLl7jWn70eg+Gb23YmJ71aCAY5bf1E1G
 OsQRsO/vTy7WhQH5UTTuwDrlJYCls/4VILKcbBttlM0IAiBqlyYsFsudnUik0GtbnA5gg7Q
 lyy2vjiH+j1MOFAetCaCtdmbCKrkriwRyAIqnsqhhut0VDTO0SxM/c6baC/kVSL9GFrQkuu
 NpyKzGjuUYfcL2RpvBy8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FCfW6ioqUyA=:UzYxXDJQeJ8GBsX/ecC3SX
 kFa7vZ6RZxTUBaEP7nyNooEAwmRrte713EAp5F2CjATpbI1J5FRnMMN2wV9EHOvC4aSMuGyLo
 hQvbNoMEfNfuLCf5786irrK30m/Qx4CER6pFiDJYHSmXO44Vah80YgS8OHKqFAm1r0BmcTW2p
 KiO4TAe+lSxN4pXgHuXhf/3fQyoFLDc0ioC2nU2/q0O6mu4pJykP0hsBQO0k8/phjzABxvebV
 rDF0qwv39pfCTkWoY+heck1zXQ/PD2nrQCVKIxXPp3rVvAZrToaY3Hoi8g4vwdCQk0U0njovH
 JF837BSK582v2FLxlCPKcPGj/55Xf8W47w1ex+mFqbcaYvcjj0qGdntyNPwmnHX8t/vlG8IPl
 nu3TUtXqZUl6DSwX8Vunb194Eu131IgZsDoOCpzsBpkLyF2KjWKvPVrhgIVz/e47g1cKRkIWB
 EEZuc5VJY8yPtEasECg76/GbsRkExfh2rjqg6f5NPauPb/lCjPtKT1PzL6MFHwKRxjmdUw0P7
 CorBOc8n/blaso3wOIm/r1MvQiIL/A4HvWbjizlcMvsq6Kp+mOfPluymZMxiQCX3iMgk/cttK
 cLIBoRVfieTp/seu3nmn1dY/005P7yR0qmyGcxwnL2WAm+EZBff/3g/i1LmYEEH5m0ksfJBoM
 Xm76bfNnoDXD7PAkD+Jz8ONBDNU98LgwxKNNVtjG50wGJQ9Pqa42FNZbXaBCoLBAPBEhzJBIF
 /RkQGGHnY+U+OADAi7XzjEbIbmGGi0Aenb/ehuQlQQwBtmTeHSuSwzo/M8Yo31jwE1MIargul
 jCnGQdziznhhEDnZwGFH6t4ztE5q/dYoh9quAXo9a0EbCBus+Nc/jiFXJ1PTP+A21TqDnIQDJ
 lDC4GpVW1gzKmQHESFJg==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [PATCH v6 0/8] Fix year 2038 issue for sound
	subsystem
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

On Wed, Nov 13, 2019 at 7:13 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Wed, 13 Nov 2019 18:19:56 +0100, Arnd Bergmann wrote:
> > On Wed, Nov 13, 2019 at 6:04 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > I don't mind much about that, so it's up to you -- we can fold this
> > > change into the patch that actually adds or modifies the ioctl, too.
> >
> > I've added the patch below to the end of the series now, will repost
> > the series  after no more comments come in for this version.
> > Having a single patch to update the version seems better than updating
> > it multiple times with each patch touching the ABI in this series.
>
> I wasn't clear enough.  Each ALSA device API has a protocol version,
> not only PCM, so we need updating SNDRV_RAWMIDI_VERSION and
> SNDRV_TIMER_VERSION as well.

Ok, I see. I've updated the patch to include all three, and adapted the
changelog text. There are still multiple changes for the PCM interface,
so this avoids having the version number change attached to half the
code changes.

     Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
