Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA212388C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 22:17:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B68791670;
	Tue, 17 Dec 2019 22:16:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B68791670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576617437;
	bh=Z2k5iUuurRAgBCodjF+WzOSqOk/19U8gGXcHuWNRQ90=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LL6tbqtaSIUNlBVc3NY/70bulBbJJuvI8pMRYNvtzWMVrtSE/NNWcThyF+g7Ij3xu
	 9cXm1IfNLRG9kgRcQNr/3k6PimXGyYFHuafxUkd9AoYsRCIVV6N2ildIp2WG8bR9ua
	 NQI28KybyLQuyFgbuFlUuzXAgzL/47xMR9MpcEcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED10F8020B;
	Tue, 17 Dec 2019 22:15:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95773F8023F; Tue, 17 Dec 2019 22:15:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D92E9F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 22:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D92E9F8020B
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M3Upe-1ihsQR3XN4-000bTU for <alsa-devel@alsa-project.org>; Tue, 17 Dec
 2019 22:15:50 +0100
Received: by mail-qt1-f180.google.com with SMTP id e12so78880qto.2
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:15:49 -0800 (PST)
X-Gm-Message-State: APjAAAU2abO5UbSoNUM7LCM+XRJ1ejfzw9O3xyddmJ+Sq+QURTKoDzvn
 sguX2ULxzXfJQ1u4Le84pQiF+MoJ5V6k690UAiA=
X-Google-Smtp-Source: APXvYqy7B0yAuutBabtpxZAD4q9oCuIdKTJ/s6uAQ2ZKYGBWmxxVMFU8CMT20J9fghezOmHOWFZajbDQKTvpdR049S8=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr6536373qto.304.1576617348814; 
 Tue, 17 Dec 2019 13:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <s5htv5z1bes.wl-tiwai@suse.de>
In-Reply-To: <s5htv5z1bes.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Dec 2019 22:15:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3um5paR7DoNE3Qa9pjJx4jDfzsCbh+ihSPf1aGA10Niw@mail.gmail.com>
Message-ID: <CAK8P3a3um5paR7DoNE3Qa9pjJx4jDfzsCbh+ihSPf1aGA10Niw@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Provags-ID: V03:K1:x6dve+vqjrk2hDjlm1NJgcSNWcbd6rcDpd5EY4ucNzwd3iHeal0
 aA95gJfmiRP6cidX+YcsX4UpcpOCC9gzKA+/14dWMIvWwRfvhXiyW1kkmKFb4fiIXLrPvFW
 fNqW4idjaR3SNPojMN0GMhzjvCTuuhTcW8YB5gbbaBDH0M2p+S7ryW5ygbOBYhCBR8ku5Qo
 lNrJao8mFUoPfAp+mtLLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gSecO8UVMgg=:yozMXKuxX9M0ePvRVldEkT
 PCwNcmS6QDuFpFxXI6Y8b8PpNyKvKQjju40XDVzxm83WMejJUK54ha8vqKPcw6Uy7JlBgOOsV
 +GeD0EeALeefJqCdKP3jkR1YzJrSp/AykHlRJTiH0ZYyWk6Pc81nM3uaeuyqUFHmLAqUF0pZO
 XBMmPBdisVUFSK/U0CPDlZRYQ5AXP0cKTAg4xuIg6ZnKGi6RTQUUnB6J2lPQ1FIm/xV+9bR4A
 GtmaCr28a4wuRf7lzroJ9SJrkvrxBzCho2OvfspMmr9ZNPoynkNCKcslP0W2QC6iQOgWnTRyr
 HAKEMYQF/2YjkxXD8uucE/8MyfwXLyesWGU5Iv1L54NeaaB3yQuiO8RjI14WedrGGVKe+Svpy
 LS+XyW+FVU6lEb+71hgpDZWZKKkcgkekmM123LwY99wokDxlDHxOiysWFh1GkhJyIYb1dYgpg
 FTziNkhxO6sXmsPjMK8A5r5D76x3S3oinnIiL8rMiOreQ+/uPrvkxX1Qp/8f8pbX6S84FyPD1
 COnDq+DyB5zhgfuSrjpVN4VJAGdxwzEwdp/I9gCURht4F+8uGBgLN3ZsW/E7uicAfQkrB2epU
 reSXa5h4+fD53F4guS4VuiE3/vn1N5zlQEuhEMAVVVX5IN6FS7jRB8BdjGjUtBT13jGpALwQl
 WNnTPM80p1ghXuU8WVI3t1EYZDT1yXOq2cbfTyD16qxacxvOnxfuZam/C4SQeJ6XRBGL4tJXG
 NIfvYLGGP4OziAxy/tJScFK96JVAukNZvcteVV6M10et6GMfCBJhgRu9vcEBWyZuxiDboVISE
 tiGcrV1+gCJXPTBSr5IXVhutsyFwfylp7JmAvmctO8TZId4tBP18kbYASUS471EDwHYNF9XMt
 fCUJ9KiJVBeexa+T/QxA==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [PATCH v7 0/8] Fix year 2038 issue for sound
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

On Tue, Dec 17, 2019 at 11:42 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Wed, 11 Dec 2019 22:20:16 +0100,
> Arnd Bergmann wrote:

> >
> > I hope I addressed all review comments by now, so please pull this
> > for linux-5.6.
> >
> > A git branch with the same contents is available for testing at [1].
> >
> >      Arnd
>
> I see no issue other than the timer API patch Ben pointed.
>
> Could you resubmit that patch?  Or just submit the whole as v8, I
> don't mind either way.  Then we'll get this done for 5.6.

Can you take this as a pull request? That would be ideal for me,
as I can then use it as a parent for a shared branch with additional
cleanups on top (removing time_t etc) in linux-next. It also provides
a nice place to preserve the series cover letter.

I'm sending you the pull request now, and the last modified patch,
in case you prefer the patch over a git tag.

Thanks,

        Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
