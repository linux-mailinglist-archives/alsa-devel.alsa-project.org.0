Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C10AD21AEFA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725441655;
	Fri, 10 Jul 2020 07:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725441655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594360144;
	bh=L84t8abv0xyfD18UPWNAkY9iZAsxIghfZzcWsh83U8M=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rae8Yg1P5GwmEbNi4WezxfVwc+nLOVz/WQJStUUgJfKEU2d6UYpxL9Z3svTM910ol
	 0oFeVid5v+8tQhPdoswp/tHvH3iNXMhJuWE2drdPLhGxJBTpJ7l5x2m9jM2j+IBwjK
	 7NxT28t2S8VYbU1CwNTEuwstteXxTfuintgfjOOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56D62F8015C;
	Fri, 10 Jul 2020 07:47:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E1EF8015A; Fri, 10 Jul 2020 07:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90CA9F8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90CA9F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pagi6d2o"
Received: by mail-io1-xd2b.google.com with SMTP id q74so4858338iod.1
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 22:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=L84t8abv0xyfD18UPWNAkY9iZAsxIghfZzcWsh83U8M=;
 b=Pagi6d2oZiSFd0VM59aHdfpwoMfL4/Q3+CXdGIDISzViXc5AlNK10W+GRDqNWdKq+P
 EZTaTApX3xKeuZwGZBtFVaYE5qTyaOgN7qUsnG3wc3HTVgpsRm9eaacE+ugK9fbPFneh
 st+KmEtjBH3SR/TFWhk9tq3yBOI+6+9NA61hBJnFiVQICME8AuX+D2JsSgz/N13eEUSN
 tgEUdbeo/idS++fQErV8PSq0Wa/0q+v3KRuraowaha7KQI/FpBWzv2YGarspr1MhLm2t
 SsZDDQxzcgRwy3AozmBpFiFQb5cSW47mJjNgVtqIA+AhOz6/7leJ2BzRmJwcwkM+nnA4
 WElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L84t8abv0xyfD18UPWNAkY9iZAsxIghfZzcWsh83U8M=;
 b=Bn/h9QZI3Q0iUyN7Q1jpCyjbk8FPMJ2NiEBpDwuv5fPR4I7ctq2+SFMNh6U84X3zmj
 WIgGJEky/b3EIl8Js9hE4ZqcEa85KFjFBbdG3cqol1Rx8diR2DEnAH4A+zfD8J5cglCG
 +hkFbcsv3n9nbivmWwASPddnqE84cRU4ZDj0CBAZB6Npg+DqAxpkQlH4vTpImPFkTKiM
 5Nompen2QgWpeMAmuzPdYzMAzw68HoiIzOiGMQo1TYcU5B5KyynDnCUr3LGcm1OaAlTb
 pS9B1x2Bsn4LnN68DgB6Mg6uw/3mlrLXtrPsMtvWCGc5oTMY0D2xkGpu6pHOye36MPUj
 HkAA==
X-Gm-Message-State: AOAM533D2l99grZXaGQbu5mSb3iT5h8jh3+1wKWFPIEbgMZYsV9PrfHI
 C/3K1wAD39TSoSSGQ+MsAirnWxiGM7fYWiQ11mY=
X-Google-Smtp-Source: ABdhPJxBmBm3gdS4ixe6FJyYmaDD5u6dgfZZ+aq85HFSqq+2JHPHB7iTAZq6eft2Ind3MXvTZO4et1u10VtiDKlERmg=
X-Received: by 2002:a05:6602:15ca:: with SMTP id
 f10mr46899167iow.52.1594360006561; 
 Thu, 09 Jul 2020 22:46:46 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 10 Jul 2020 10:46:35 +0500
Message-ID: <CABXGCsN2-TTemU8JOnh3YErxe2GH7xtG+EZrF9gn_JWLmMxRag@mail.gmail.com>
Subject: Beginning 5.8rc1 kernel USB headsets (ASUS ROG Delta and HyperX Cloud
 Orbit S) play sound as if in slow-motion.
To: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Beginning 5.8rc1 (git 69119673bd50) kernel USB headsets (ASUS ROG
Delta and HyperX Cloud Orbit S) play sound as if in slow-motion.

And in 5.8rc4 (git dcde237b9b0e) this still not fixed yet.
The bisecting is problematic because rc1 also has another issue
https://lkml.org/lkml/2020/6/22/21 which completely breaks the sound
subsystem.
If anyone said how to fix https://lkml.org/lkml/2020/6/22/21 I can
bisect this issue.

--
Best Regards,
Mike Gavrilov.
