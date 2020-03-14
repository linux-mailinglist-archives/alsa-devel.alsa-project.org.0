Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509F185B40
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:37:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1241872;
	Sun, 15 Mar 2020 09:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1241872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261428;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tYEI86OQHssGJ12JEm8UqwcgEf/v8ppatSX2dsiCo/yonxYLbo4Wgmmp7eZgvOxA9
	 fiQD9D0efsVbnsUIcuEF3qFpLuWdXRB2qAtAbdTAi5ikXGqXoC97CkC1moGeyV8nV6
	 stydv1M5iNor8Te7kPfZuFavNdINYTWXvK9Esn9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA8E0F8029A;
	Sun, 15 Mar 2020 09:33:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65ED3F801D9; Sat, 14 Mar 2020 13:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF013F8013C
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 13:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF013F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hBcHKtXE"
Received: by mail-lj1-x241.google.com with SMTP id o10so13509402ljc.8
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aD4cpDKpd4yHjF7FyPfDtJiJuoOQywL6BBbaB8QBvho=;
 b=hBcHKtXEYTWAHKK0Fi0YNfW+T6SpImTYM/XKKOcB4gBeW8o3Nl9uVs/z+taKpCYAo6
 RsLN1neZA2GJnBH7+hOiJHe/oJkWY+m/5rIKwDSDMIv3ghG4vePZv8SBZ9YsTq+lhAYb
 dLFpKyOy0UaBsCg/Ik3peHGYbAM+bPWDdh1E5PV2mPyOFuxe+9AxRw01nYFkrm6NaWZB
 7jwcAdQqKU8z47xjg9QiER4lJFn82oo1I5YNGuX7KsHDWK+2YRGg/HLTS1hDd76C1wSb
 +ZCGM83CxQDwptmL6MuV/+xER0xS/Ibbq+KkSUsxnIJp9nOaVnEGKCmdJmYFRHsVpnMT
 3emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aD4cpDKpd4yHjF7FyPfDtJiJuoOQywL6BBbaB8QBvho=;
 b=VeuNjCK559vpbFT4YP562ZRnqLSSBJmyDxuR0AlHDkrG2PQQAB8kViBYEWgcjKH8Ih
 FM/0X9RhdzsT6yUVZ6Xna312wpgF9prHpEJq2aa9mFN6Jx4QXBpnfA4srbcba3CoSbr/
 BSUYcSnkvlmizoWtukN7G908ligrW2a0/M46WODyibcPgCSj0gOFq8Sc4TfUhNe/8Ro/
 Q9bNQa0i04P3pTLhLMDohbYXRuyRs3VApxPegWpW+4PEEpjEVtmnZO4iKnEbJ+e17DZe
 I9zNQyc2iG+4HpzHb+o5zQMNTflvBt/fr5UjJ5yLQgaQIJw1QQGe/zjIIaZb2e0B+Q0b
 v3fw==
X-Gm-Message-State: ANhLgQ3DS0I98gnEilN7nBxErfw5FdaLZXD5W5dUbqOtK2UAXS4sRQbV
 VC1s0t7OfMDBXxEPlUrq0XC+FmS8Z+aZ35RUqGZeZHk=
X-Google-Smtp-Source: ADFU+vtAfKJ7D4+HxSawNtWzFXYaY81iLOhi/xVmWUqY15Xipx45j4FnyXmyx3ao38HrjWgkpw/aY6azvU5SFBTShVM=
X-Received: by 2002:a2e:8991:: with SMTP id c17mr9939903lji.278.1584188840063; 
 Sat, 14 Mar 2020 05:27:20 -0700 (PDT)
MIME-Version: 1.0
From: sandra luna <sandraluna1945@gmail.com>
Date: Sat, 14 Mar 2020 07:27:09 -0500
Message-ID: <CAKnm+F-tzQ1PM5ZZJNyCBrTcZcKoQ8BcTMt829CF9NPtzpX77g@mail.gmail.com>
Subject: Re: Re: [alsa-devel] [PATCH 4/7] ALSA: intel8x0: constify snd_pcm_ops
 structures
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sun, 15 Mar 2020 09:32:59 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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


