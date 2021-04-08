Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE07357BE1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 07:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 346DC1681;
	Thu,  8 Apr 2021 07:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 346DC1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617860279;
	bh=EcPvaWQQLwehLR0dGRah2wsTShBORLyO1QTRk9LdJco=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCleDg1hlQUwPgAbcTrHLFuKCb9QPkd+FH14mRQabMIagaB6rYCpOR8UhPFzdBvXa
	 X/Z5HvKPltr4yzbKo0KxNGOJcxHaYCajHHsbilM19p6B5LuCBJJhEgxUN313rKuj28
	 3tYf5k/WbgC0CzsdD7IUkt2VtVyKvCQbukLk5sAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D69F80169;
	Thu,  8 Apr 2021 07:36:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 172AFF8020B; Thu,  8 Apr 2021 07:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59B1FF800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 07:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59B1FF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yojn+OlB"
Received: by mail-ed1-x529.google.com with SMTP id f8so835512edd.11
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 22:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bUNGd9ipWlbSa7jK/jTIdhWIGg+TMz/spIM3oZE1Ug4=;
 b=Yojn+OlBM3xqkNtFJHjK1Gc7nH4ePS+PlBShESrzujHLFLAG0xUfpBPpbABBwSlZAs
 KKftJ2xFStudkxCqcpaDNNzQvsGKLpHJu15K0tiK2wJZ1b6oqJrmXAhEtXh5/SN8MCNw
 ipoCosD9nqXieH4LJ3NcSmWfiXUASnmUuSiik+NfilmvJ3q9H79fKCsFP1A0Z2Wh2Xuj
 +DOFIXAqlBp75fOc0KOSzjrVALlR6J0mbVct4txr3f9YyJhNnDWLK5FbVyrHHe96tqwF
 tli9kpl+lMEnij4ahrtE7Ql0wlrEexO6R7ANUTwRKOahkfsGmItefM0jhbV5zgJ+rd8b
 og1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bUNGd9ipWlbSa7jK/jTIdhWIGg+TMz/spIM3oZE1Ug4=;
 b=Rk+rtS+u1YoWL4vVuNoe/RYPSOWTkfolIP+9rcUEbaGzcWBH4IjiAEDr6tzgHGq/LJ
 OS810mWaLpv+YCyvoGLSg4u3vpTrQGCEnzqIa/bWAdt5/iylGdF9vhjVPFaNVLVxZ9Xb
 t2nI5dBQI9G9KXKbpe9XH5Hpd8zd0sJzceyUBfh1VImfAm3Shxk3RmyPT3PYicddG3bj
 bryuErSYlo6X0TSYIxqZSTEHN+dRFzV0UwsCXSuDD3Mkojo/kWpfx5kOOXljSHZWJY3y
 ybmb3A07vc3wfU89h2Rs1tOfS7QMxbKXD10deJcjFxXcDMkhHYx7kytexHbbtMOOSuL8
 plPQ==
X-Gm-Message-State: AOAM531hF7nypCnwTgUY6QQFVFsUkf+jXtRJAlZLjiPzyCn/xKMUJdDG
 tcmcC6zww2ggR8UN/53P6F/n5fykokGlcieUr4I=
X-Google-Smtp-Source: ABdhPJx31BVwrzNFqXKn/kJiRlEGqV6u9Oio+BBc1KYn0n9/5XfGpgPcgXtA1uLPDVAJEivAp14wXZxVP/llc/mMl4s=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr8979526edt.187.1617860183235; 
 Wed, 07 Apr 2021 22:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
In-Reply-To: <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 8 Apr 2021 00:36:11 -0500
Message-ID: <CAOsVg8raD8enyWELM4w17dZCe=1Vy2s+7RLszVko4aRLmj7jDA@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Well, I just got back from testing Mike's suggestion of setting the Roland
Boutique D-05 as a playback quirk, disabling its capture quirk, and setting
that endpoint test section to always be skipped.  Sure, enough, the D-05's
playback is now perfectly crystal clear without the crackles associated
with an LP record.

This is just a guess until I recompile again, but my capture from the D-05
reports a read error, seemingly just as the vanilla mainline kernel does,
and I think it's because I disabled its capture quirk line.  So, it seems
to me that the D-05 needs both quirk table entries, whether or not the GT-1
does.
