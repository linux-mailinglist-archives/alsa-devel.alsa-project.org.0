Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46144269511
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 20:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61901687;
	Mon, 14 Sep 2020 20:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61901687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600108776;
	bh=HzCUO+XSeJId5doMKInDBqJdwZhr5kbJPs+mPvpxTYo=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PeFwIVDs5yGk+a3KToYMOcwNtK74BDlnLeTLeEG0TR+cBwo8osFSTMl0RMGINSt12
	 qn9MX8XezGNMbZxhp2xXpqaNhx4D0WvrhyciX2EVdmE1AihoUHIyFW4UMoYX8Didz/
	 uPC+QKHkC7EbEdj0Gw9ZsjwkfzOmiMX362KXXkI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F06F80105;
	Mon, 14 Sep 2020 20:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D1D5F8015C; Mon, 14 Sep 2020 20:37:17 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB07EF8015C
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 20:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB07EF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bHSQVtFh"
Received: by mail-wm1-x341.google.com with SMTP id k18so998583wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=j2KiOTZEnmKUMEZ5RPz4Z6ft8xQ9qT/S7kYyE2h4dHc=;
 b=bHSQVtFhlp8PWz4Rsv6SgCiA7ktvznGFvWYO4Df8DwSv7/9F8FuTy2dQgPyCdN3DMn
 Z5F+BO1MROIWnDCmiZlUbNQDpmkov+UxrwtCInD5t3ra313tJz0+mz8PIzj8Klkgcmge
 7a3lzpxqXJzLaoOuUGudi5LYEae7fEgL3u4rsWHizCSRBoXzNqAgiLxEso0ra0W+nwxF
 vUp9GHCrkzTkB2fGq1trck1VXv0Klx+Bb2tSqqEKWpNusyJBaTWiosrr3yNSLf+rSaE2
 2pou2NGvE/h0++il7MR7UhQ1Vy45nKA4yNZA0WBVTICnG70qsZjcnptrXU2nvOCjMaES
 cp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=j2KiOTZEnmKUMEZ5RPz4Z6ft8xQ9qT/S7kYyE2h4dHc=;
 b=GYPSa9PoPHddnvFnmmB53MvGpSaw2XRYaNqFpEjSoZin4jlt+Ul3YvmUsnNqJrq+qd
 h3zGwWu9JpVg6MCwSsLfOxbsl5NNpZCxAXg2Q9F5Ci/PZ9tQ9O+rLqwDPPB2aKaSN30D
 /tismKqfej2MQVZ5QPa79uECzVQvVn/sqy8192/0U2PVGKaSM9yvzLaHljXtTcUw4v49
 g6vzoNEg0UzpBxwG0JjTU/I+tfjSOj9sN0Fb5sj75MJJPcliZzbGxBT5DOTUE8qeZiQl
 lIL1pOhpa6prkmHQHTKOkLJ6kB0uM8X2t7++Yc4fnJdW1oEfaYq3j04anHUrBtkvfsWF
 P/PQ==
X-Gm-Message-State: AOAM5322N3eaIR28E9GAHbgeThUgvH5ovS4J690Q2QmfrwA2IKq1FlwZ
 RFxhciXVg6nZPyz+ENnEfqS93EN24nY=
X-Google-Smtp-Source: ABdhPJx/rsaXTXMhFC2t0U7annUVG2MpXu1xQ8dr74TTF5tLnsaU7Iw7c3IWOhUbWZ0+t8yzDowCqg==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr683413wmb.60.1600108030200;
 Mon, 14 Sep 2020 11:27:10 -0700 (PDT)
Received: from ?IPv6:2a01:cb10:469:be00:2641:8cff:fe08:f9f3?
 ([2a01:cb10:469:be00:2641:8cff:fe08:f9f3])
 by smtp.gmail.com with ESMTPSA id l8sm21849949wrx.22.2020.09.14.11.27.09
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Sep 2020 11:27:09 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Olivier SCHMITT <sc.olivier@gmail.com>
Subject: increase CONFIG_SND_MAX_CARDS and avalable sample rate
Message-ID: <2aaa6dd1-d254-5533-65ed-290be1fead74@gmail.com>
Date: Mon, 14 Sep 2020 20:27:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
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

Hello dear all,

It's possible de increase CONFIG_SND_MAX_CARDS to 256 and increse sample 
rate to 384khz.

Actualy i build my own kernel as:

sed -i 's/SNDRV_PCM_RATE_CONTINUOUS | 
SNDRV_PCM_RATE_8000_192000,/SNDRV_PCM_RATE_CONTINUOUS,/g' 
./sound/drivers/aloop.c
sed -i 's/192000/768000/g' ./sound/drivers/aloop.c
grep -rnl './' -e "CONFIG_SND_MAX_CARDS=32" | xargs -i@ sed -i 
's/CONFIG_SND_MAX_CARDS=32/CONFIG_SND_MAX_CARDS=256/g' @

search and replace 32 by 256 in  and 
./debian.master/config/annotations:CONFIG_SND_MAX_CARDS

and for alsa utils:

git clone git://git.alsa-project.org/alsa-lib.git alsa-lib
./gitcompile --with-max-cards=256
make install

git clone git://git.alsa-project.org/alsa-utils.git alsa-utils
./gitcompile --with-max-cards=256
make install

Thanks in advance.
