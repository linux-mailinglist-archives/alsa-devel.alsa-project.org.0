Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9561D4624
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 08:51:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767AD1666;
	Fri, 15 May 2020 08:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767AD1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589525462;
	bh=lAazAiUUZTbr0pEDkoo869HbiGx5mjz22Dvth92MiQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4J2QmTMGgmCOZKQVIT0X5sMWf2FLp4fHQIXVCQmD4kOW3FbKNKO/3X8ShNOYQ9jo
	 X05zeski2Fuc259FxYCO1LODXySTBBW1deDtAzthqRmR+t4tJMgJYzo+pM2iU/Q9rA
	 XvKUvYMDkyqqOTTutMv9yGOAdIEsvuO1Q7JaqfIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72582F800E3;
	Fri, 15 May 2020 08:49:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E51AFF80247; Fri, 15 May 2020 08:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA779F800E3
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 08:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA779F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NhDw5VYz"
Received: by mail-io1-xd42.google.com with SMTP id d7so1506068ioq.5
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 23:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lAazAiUUZTbr0pEDkoo869HbiGx5mjz22Dvth92MiQY=;
 b=NhDw5VYzttGyQNenbMc/ylR7EC1byInlrgUQSa89mC4KHDutwLYcXmg6u2IcwDpnrL
 zX6O0Db67w36Wib4vhPxzx581G0D1rxIAxV57kcjqJHSUYLph1RrjbJUJiOSyu9OxxYX
 HXYgI4naGdq0jkImr1k9vcsDNTG8Crj/F7hIdiFmuvHs1P6+OORneOWrwCG6J7ME0WhA
 Enpne3kgRCpEBCKcFAnvJcNTn9yZS0rhqxmY39IYUxb05gOZnISUS6pACIAV8fM/dcNA
 KFMLMYEbj8QCBxpCoafiCQdpq/muz49eFsQAiKFlq5DEU/ektLrMdDk6K1+EIXPEppI6
 +FyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAazAiUUZTbr0pEDkoo869HbiGx5mjz22Dvth92MiQY=;
 b=PctH3L5o1h6Tm52f6f7si7ITZRT3+78ph8CIzUiIJYbkzWwk7di7B+GsTSsak/28av
 7OBCZtD9YIqWYycdduk0b/+IvryykQPjr9JdKNIGgYTTCFJ6ZalGvbx5gq1GhSDew06z
 Ew+RMsmfk9qbOtxZybyPqfLWQUG/e+sVqCqrOrnbXzqGrNMbiFyVlnGzcPAIlopHCzl7
 +7HaMczmQeKuOur+d3Ie/elxHVuh/ew0rKyWgInFpzJMqJbzdsHAdOloQep5LVRSiFv1
 l1RKr0XNkH16vu7YCEq4VQsoZcuzjhlfU0xgSc7wKODoyF25mHRszt6wEguHxFvZ2qVX
 F6hQ==
X-Gm-Message-State: AOAM532Av0Wu0rdv1Pl2a0pyPW+rtymZjdoOYDPy3K4KgTCZyZGMPDmd
 PhyXCJPAxJdlq+bLvk6Qt0cda2FPlKdgxG+Fzp/tDA==
X-Google-Smtp-Source: ABdhPJxr2DQlSMvSaZ/UQbXieTwt7s7gOCjwn2Dz/Zxpwh/VXH6TkC1m7rbQ1I/LTYz38byeZJj9ldszky1WG4WV2gQ=
X-Received: by 2002:a5e:9904:: with SMTP id t4mr1624660ioj.59.1589525348149;
 Thu, 14 May 2020 23:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200514161847.6240-1-ardb@kernel.org>
 <20200514162548.GA141824@google.com>
 <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
 <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
 <CA+Px+wV1w4gFcV+ABtK44ec0aPTT9APkpFMUyLMUh5tStgHstQ@mail.gmail.com>
In-Reply-To: <CA+Px+wV1w4gFcV+ABtK44ec0aPTT9APkpFMUyLMUh5tStgHstQ@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 15 May 2020 14:48:57 +0800
Message-ID: <CA+Px+wXbHzGajsNQ=W6Smn+uKe85v-wYyEDZ=xYYyrJhHaxZFg@mail.gmail.com>
Subject: Re: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@google.com>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

Oh, and just notice your patch title should be "ASoC:" instead of "SoC:".
