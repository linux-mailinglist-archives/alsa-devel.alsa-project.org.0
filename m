Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0CB13AB06
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:28:07 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D656A1894;
	Mon, 13 Jan 2020 15:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D656A1894
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B89F801EB;
	Mon, 13 Jan 2020 15:28:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63B5AF801EB; Mon, 13 Jan 2020 15:28:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F173F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 15:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F173F80122
Received: from localhost ([130.83.5.183]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis) id
 1MK3a4-1j5m7e1XFm-00LTid; Mon, 13 Jan 2020 15:27:56 +0100
Date: Mon, 13 Jan 2020 15:27:53 +0100
From: Tim Schumacher <tim@timakro.de>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200113142753.GA22538@impa>
References: <20200109221032.GA74081@impa>
 <7294fce2-716e-00c2-665f-587424b96eb0@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7294fce2-716e-00c2-665f-587424b96eb0@perex.cz>
X-Provags-ID: V03:K1:2odCcj3ieWPjU2jlQz8hhq/V+beJegbGesNpHRX53zhuaJpOkn2
 NMcprsMo4P0hQ2dZL8zcdcO5lUdte8zW6wmaBce+l+JjxkuoMYiAVONDMEw1A2msUDtcbCR
 j3dczoSkkTRthIXZxfqQJfPbhBxvpUW3B35/u6880411mhd1tSa43z4K0n4JBsshkeLFae9
 O3vFwTYxTuJK8t0nCnPfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0CwlWdJoECI=:X04HOV3DmzL4GA55QSRqUY
 0m805v9cNwK4FSVBtMIxscqWmpGakrjjoourkvF+GC7OXMacKi5rOv82q7jmvUL2Twztvwnue
 7NXys7L6cKNhSwXB8HWXGoabf9SEcv4KeSZaAgYuUhGHNksyG8f8hIb/OZFqhUtcHq7shmbbr
 jXo+Q3L7c9UMSf7lcGpmgnrBMl33SP3MSFLonYmyHC7EWpcmxL/sdfXH5tASSmaeN0A8LQPtP
 L+U8MjrkW0Uo6Q7ukYdJMQeWAYmVA7hLb9jPA6Iu2Cml8SeElPMwu5zszhCP/kuINwnvU3kvE
 Rhg9+g49CtmcNZhaSvH6lMaKuwd+VYseSDBmXPng4MePiABjfpkr+YvYB2iC7YBO3qkg/WZ7S
 gzeY+OEwL1LDk840GXKQJvRBmKn9lCDNFNkJxQw1XXN5okJRlfeueLEMMElouwPVvRP/W/nuY
 b1eOjtBeX1JoRbwfojLYLQDh4bUkxgVz2Q4z8s6OBuk/uM8llzDPz/elTGoRru2xxNar2sw/R
 Qfz0SAZyXWB42gElU6R5cV4w3A/O/3nssedz4Bskh5t+4W2FeO4ys5jy1+GkJrdr8TAyUio4P
 zXvkhVTWuJrc+7KPrxcOWPA3klm8ZJeAwteSTZX5MCxDw8Ag42Zt4qk+8HhP04whZ4OsevKId
 Hy46zTg5FCFYw2YEPj30kBaXIhRhGykUTSUYK21GFWaQGA83uOi+49CDQ3y3Ls97d/+nLKAmu
 2AZ0P+XwxfK7s/An1LgQ7yr5mr9MMOF7cdOeKeovcbDnmhGc69IMVlGDgJuNr4y7E/RyBt8eG
 oRwr/5S0jsfKlkt5tRzrHj6fm5ddPiOCDyy9zS8SZZN8wl7w6hzwTKSAcrxRZffkjjotyfgBk
 jn8B8FDNywtLTu97d4nQ==
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Bug report for changes in ucm2 with chtrt5645 card
 on Lenovo Miix 320
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

The patch doesn't help unfortunately. Deleting
LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf still works with the
patch installed. Can I help debug this somehow?

- Tim

On 2020-01-13, Jaroslav Kysela wrote:
> Dne 09. 01. 20 v 23:10 Tim Schumacher napsal(a):
> > Hi alsa devs,
> > 
> > I'm on Arch Linux on a rather uncommon laptop (Lenovo Miix 320) and my sound
> > stopped working on the upgrade from alsa-lib 1.1.9 to 1.2.1. wabbits on
> > IRC helped me track down the problem to a change in the
> > /usr/share/alsa/ucm (now /usr/share/alsa/ucm2) files. It seems like
> > /usr/share/alsa/ucm2/chtrt5645/HiFi-dmic2.conf and a symlink at
> > /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
> > were specifically added for this laptop but in the contrary they break the
> > sound for me.
> > 
> > After the upgrade to alsa-lib 1.2.1 the sound is not working. The commands play no sound:
> > 
> >      pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,0
> >      pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,1
> > 
> > And this is the alsa-info.sh output http://alsa-project.org/db/?f=f883910a5c5101b4b1ea4202d1fe84ccd139f796
> > 
> > After deleting the /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
> > symlink both commands from above play sound and this is the alsa-info.sh
> > output http://alsa-project.org/db/?f=e759eb9118a191b6c3b8c021fed58abc9cf95076
> 
> Thanks. I forgot to fix the file path in chtrt5645/chtrt5645-dmic2.conf .
> Could you test this patch?
> 
> https://github.com/alsa-project/alsa-ucm-conf/commit/74f2a0f0884df7b9f2d08d07456a3bc37d1a512e
> 
> 				Jaroslav
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
