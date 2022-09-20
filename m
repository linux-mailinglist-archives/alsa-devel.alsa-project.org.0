Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A372B5BED4B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 21:04:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58243851;
	Tue, 20 Sep 2022 21:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58243851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663700656;
	bh=q3RwxKX7JoEX36f4ab87vDhUIC3iP2DwiHGYq4QsSr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=L7FmUhSM7+Rkj2O5D9lwvbfzX5zxdxGRVcxqsUxZsabfj07c3Pae26kFXV0mPPg/T
	 v3bo85hbF75oOrkTuXIblgbCsd9RdZu+bRG+PG4tcnHDJ0GX3GRo26f2C9bVpmBJkY
	 tGKIP0WgINCXJWmoNHUT9xvGq4cahvaDfp+MBnkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8955F80171;
	Tue, 20 Sep 2022 21:03:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EF07F8012B; Tue, 20 Sep 2022 21:03:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC5FF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 21:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC5FF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ORWogssx"
Received: by mail-yb1-xb2d.google.com with SMTP id s14so4771378ybe.7
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=q3RwxKX7JoEX36f4ab87vDhUIC3iP2DwiHGYq4QsSr4=;
 b=ORWogssxg406/mc0M4Ec8Pr7ZI+9rYb2cNw6GokwwRrb5KUwJ/umHxfskQUuDwjxPR
 4CxnUQ967hjPO6zDJCAsfZ9BglhU3U5kJJJBacg8kr4Acny7F9M5VYxAkxSFQT9AvdSS
 /4gnuPQyfJE2c0ZZarCT5LMEU3e1uADUrF6OTgAg5j+8OHiOcLN6u9JJd5auTRnknkL4
 h4NoiXEk2huhJV6tU/WrzPDFLbdkZlGt/p6Npe6POLNG+3vmJkKQyoBhOKRV3ZvayRJx
 i/NpJETQXGoYxLuvqgn1X1KOIYVWZ7+p3fqT4rkkiHseLEOkRQfDfQhzzUuB4BW4GWrF
 0t1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=q3RwxKX7JoEX36f4ab87vDhUIC3iP2DwiHGYq4QsSr4=;
 b=ihivp83/Vmr/pE2pASe3+V3PZ1To94bsECFaEtlw+W2TDIwhsEhHLaIbzMWQUJtj8a
 EZLh59sIxHG0KAq5NyPmBjvcwipAw4aNcI6zXgg32WPWW0xlH3ZYIwACrD7usPekFrkG
 NyZlaILahr8Hoojd27YKwLC1jCx9lVud2hZoV8fXR9mNtXqXIvE9KneMAR1szTDUBlGm
 aKSMEfpnV1lMV+/nySF/jH6zQF2QP7/bIZ3XTcDZt3etIzwB4zqcZVKTRzkqKKjqXxa7
 r4divKRNsnZvt6gh6DLt8uD4+ePxDDlE6wMmrQFM1KOgRvHk7OcGtCCQ0T7WBFVkjZeM
 zjKw==
X-Gm-Message-State: ACrzQf1c1uK3zwJncREcOsQvaaaq7uL3f0WNoRp8mxlMhUw6JQoGnaKt
 YmRefB2kLhooc0KQU1Z08pqsPv0SvV12x6Z/aJg=
X-Google-Smtp-Source: AMsMyM66XlyyIc+xabqeYkCDbqAVOumLcyVtK9XtKwNPDgd5RY8uKYcOjUQOwDtbQQNKzrR1pHyaP/KaHk6k3K3Jd0U=
X-Received: by 2002:a05:6902:1003:b0:6ae:6b25:dd0 with SMTP id
 w3-20020a056902100300b006ae6b250dd0mr22515786ybt.552.1663700587810; Tue, 20
 Sep 2022 12:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHrUA35O4Av+-+dbr69LrgHfXAWF1+d4xwJSF7k2Tx4YWrQ8kw@mail.gmail.com>
 <6a869047-4bb6-86a2-012b-1c5aed5a9d56@linux.intel.com>
In-Reply-To: <6a869047-4bb6-86a2-012b-1c5aed5a9d56@linux.intel.com>
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Tue, 20 Sep 2022 14:02:55 -0500
Message-ID: <CAHrUA36ibs+LJF1NrqNpzpAX-tD_BYjMWgVgCdyUaEyCOV=4xQ@mail.gmail.com>
Subject: Re: "no soundcard" for GeminiLake High Definition Audio (rev 06)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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
Reply-To: linasvepstas@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

So ... good news and bad news.

On Mon, Sep 19, 2022 at 3:50 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 9/17/22 20:53, Linas Vepstas wrote:
> > Kernel reports "no soundcard". Presumably, this is why I don't have
> > sound. Let me dive right in with details:
>
> > FWIW, more about this hardware:
> > -- It's a cheap laptop, from newegg, Ipason MaxBook P1X, 4-core Intel
> > Celeron, 12GB RAM, great price.
>
> and no linux support. Yay.
>
> see https://github.com/thesofproject/linux/wiki/ES8336-support

Good news: The driver seems to be talking to the sound card.
Bad news: No sound, except for a faint pop when muting, and when the
driver closes the card. No error messages in dmesg.

So:
-- I git cloned https://github.com/thesofproject/linux/ and git
checkout es8336-v5.19
-- make menuconfig to enable the es8336 modules, then make; make
modules_install etc.
-- copy the firmware into place as suggested by the wiki page
-- enable dynamic debug as suggested by wiki pages
-- reboot.

I see lots of debug messages in dmesg. None of them appear to be
warnings or errors.
But /usr/bin/speaker-test does not result in any sound. It does cause
some dmesg messages
to print when started, but none appear to be errors. Some more
messages print when its stopped.
/usr/bin/alsabat seems to think everything is OK.

The driver seems to be responsive, in that mixers and volume controls
seem to actually talk
to the driver, and "do things".

I'm stumped as to what to try next. Recommendations?

Should I be using github issues for this, instead of email? I'm
thinking the answer is yes, I should.
It's somehow easier to track issues via github.

alsoinfo at
 http://alsa-project.org/db/?f=6f84cae386786c6ac8314c78cbaabde0abe33f3c

--linas
