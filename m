Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E232123CD75
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 19:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68C8382A;
	Wed,  5 Aug 2020 19:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68C8382A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596648792;
	bh=PvulZKbdedmiAl5NS68rqiDUbfy2jes0G2xXVebIZJQ=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=It/mPgpL+DUvk6wjEdRi01EwLoLlivPb9H97mcQxBl2jwkZqUegzQNchfL1fB0VhQ
	 mQPLuXxf5CfW5huZW52glu2V3hkjbIXKHJrMe+pHRBDdqhhlZHDckJsEt/6Nz7eYkB
	 CuliS2QzZFB0PBgysqrvSTRcjgHD1uwhLa5r5kDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CD0BF80112;
	Wed,  5 Aug 2020 19:31:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EB1CF80218; Wed,  5 Aug 2020 19:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODYSUB_1,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8FC5F80112;
 Wed,  5 Aug 2020 19:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FC5F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g/HeNb5d"
Received: by mail-ed1-x543.google.com with SMTP id i26so29815948edv.4;
 Wed, 05 Aug 2020 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PvulZKbdedmiAl5NS68rqiDUbfy2jes0G2xXVebIZJQ=;
 b=g/HeNb5dV3khPtr593QGjFlv+lPsZxh1ghUH/rfsP/bL5gFHsFB7K+OZ3ZwRlOYMDI
 d9yiEuYakHdnkxiZnmnwMA0aD7it/L+xZnLrT2LJdGNlpIbevW6kYrqHA9h5+DAZ3doJ
 dS9xWmdjm7vZvIHUN0SnYVJDBVOx1IXC9C9KsBDmo0KABc7v9DGx77BXWKsoR5weEZAr
 rxesWZF14oJ/kFBaAEttbz+HKklOL2ciW+vsLN9G5LcqNKXN1mLRwovUfhIXSYyrkU9B
 6XZQjKqu3lVM61ErqGiKNX1iFeLdcSp6FSW4u+WAm3JrkzI3D3rAh11fa+2Mn7TsHPH/
 3kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PvulZKbdedmiAl5NS68rqiDUbfy2jes0G2xXVebIZJQ=;
 b=izN0F575i0HSSQTKY1uHaxzsANRq9gRbI0TpfCfe8pw+9wJ+/xTiyDnt554j9Co0R7
 9LR4+3/BIgZksx+qu/m0P/Qnp2BUYxGvG1t1aLJKAkG5fPKrrxfKJOZxp3OFEHhLOJVl
 W4G0Ux50Bi4bAyzFHCobz3niu3ukpfFYOyBobgd5kq01ZL205FV0+CP8zhcIXyKvspGP
 Nh/XbPr4Dt/EGhcFQU+Wh72n+79z7C1FnXgfAaLHJ3L1lcRmq1w2twIG/V4FRMkizyZO
 /SBOWStPOZsWvL2Lqq+f1gXAt97upcJxY1NE+2feIBK5CtYAEcjrFMuJwIMhsW015daD
 Ck3Q==
X-Gm-Message-State: AOAM532dNKK3lJTuakTapE6dFnhfdp4Xt44kAOGOWH4ldGdHz0t8kLds
 If+EIz5LVSmCj3bWYByPhCFBW+8SgASsoT8u9ipWvIAg
X-Google-Smtp-Source: ABdhPJwQBeW15jU3bbdo7quGazwyzI5HpGUcGYAGR66XH3ilvOk6QYOMkfpHHQd8rPkYrlFQskGfppFkSnV3FbMfKDs=
X-Received: by 2002:aa7:c88f:: with SMTP id p15mr327247eds.33.1596648674775;
 Wed, 05 Aug 2020 10:31:14 -0700 (PDT)
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 6 Aug 2020 01:31:03 +0800
Message-ID: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
Subject: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
To: alsa-devel@alsa-project.org, alsa-user@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Cc: pulseaudio-discuss@lists.freedesktop.org
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

Hi all,

I just wonder if it's a "no one cares" or a "no one was aware of it"
issue (or maybe both?).

When you change (integer) values (e.g. volume) of a mixer control, it
usually (if not always) involves calling two functions/methods of a
snd_kcontrol_new, which are get and put, in order to do relative
volume adjustments. (Apparently it is often done relatively even if we
have absolute values, for reasons.)

While these two "actions" can be and probably are mostly "atomic"
(with the help of mutex) in the kernel drivers *respectively*, they
are not and cannot be atomic as a whole.

This won't really be an issue when the actions (either for one or
multiple channels) are done "synchronously" in *one* program run (e.g.
amixer -c STX set Master 1+). However, if such a program run is issued
multiple times "asynchronously" (e.g. binding it to some
XF86Audio{Raise,Lower}Volume scroll wheel), volume adjustment becomes
a total mess / failure.

If it isn't obvious enough. it could happen like the following:
get1(100 100)
set1(101 100)
get2(101 100)
set2(102 100)
...

Or worse:
get1(100 100)
get2(100 100)
set1(101 100)
set2(100 101)
...

Not only that it may/will not finish the first set of adjustments for
all channels before the second, get() from the second set could happen
before set() from the first, reverting the effect of the earlier
one(s).

Certainly one can use something like `flock` with amixer to make sure
the atomicity of each issue/run, but not only that it looks silly and
primitive, we don't always manipulate the mixer control with an
"executable". For example, this weird issue in pulseaudio is probably
related: https://bugs.freedesktop.org/show_bug.cgi?id=92717

So I wonder, is there a particular reason that mixer control doesn't
possess some form of lock, which allows any form of userspace
manipulation to lock it until what should be / is considered atomic is
finished?
