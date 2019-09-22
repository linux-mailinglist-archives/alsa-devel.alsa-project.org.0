Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC76BA064
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Sep 2019 05:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 915F71678;
	Sun, 22 Sep 2019 05:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 915F71678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569123134;
	bh=f05tLhV8N5L9Tm071jk7zw4H04Rgmjg8pqH09tsuwAo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kd1fPuDnC1mUtYJyjVvZrMoSzzc2bOrQzABA/0S9SSjS6HX5oC3pzJe/EUDBjkptW
	 X5wHKM6nKXUxIejZ0EU+Gf71OapTJTre+X7qppe+YINDiaPnEVW3nwE9z6UFTl7vwu
	 0lwTUxCl5YfU6MfYgAsSPlkp/NiQqo097WODJ9ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1E8F80533;
	Sun, 22 Sep 2019 05:30:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08BE0F8045F; Sun, 22 Sep 2019 05:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODYSUB_19, PRX_BODY_14, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E965AF8036B
 for <alsa-devel@alsa-project.org>; Sun, 22 Sep 2019 05:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E965AF8036B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WBgHYuxs"
Received: by mail-pl1-x643.google.com with SMTP id 4so4949052pld.10
 for <alsa-devel@alsa-project.org>; Sat, 21 Sep 2019 20:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kt+qUYbrlkP6a9k88YbwSrkEz8/wwtZdQKAUYkFW+JI=;
 b=WBgHYuxsTfa5l0GDTfPbzuLZ3wj4r6tJ5RPoWvAiOo7LX38m95nV/fdrs9zop/FFv7
 VJeq3s6uQOgxOGNNP5j/cUKWEhKJHHYhh2DW/g9+uwhSKf1Of3can+LyQnyQO1C7dMtx
 xiX+e4ucCj+oE/3VR8CTI/Fnjwrsd6AeZempA42ObNO/ucBsYBoX6gEk67EUxACvasYo
 8DvGYFZQv4v7FOgEK0XVJATxSBfZYyysqBAu1sl6uuxIYM2HSisS404x2b5VmdRbK6/Z
 uuUhZqegCSNV/Z0FhO48ut2IPVIq1gphmMxVxdGTYft4Sr0L6HlpCdCqIsxp45k8A50Z
 X+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kt+qUYbrlkP6a9k88YbwSrkEz8/wwtZdQKAUYkFW+JI=;
 b=N3iFDb/4YF/A604Qxv514XrskvUIi007CkUfupXVdNZmDwMsTJV396pQRFFkGtFVp+
 PQ1w2z8Fjf1ZcRZp44Eq9XWQQ2365Y3AN0s9BLIGrcIBSQad95ABbQrU6ZQpW0YZQO96
 4peBe/DED4tauaCofaImiUFJCWrKMNi3xLqfTey5ML2gX7M2VBOHX2oDiy7RuhnwtmQv
 lyv39uJ/qejPU9KS1UOYBBYM3uBynHgJlcbwZB23dGZ/coLxb+MzMLTBFGXhfwZ6SVuL
 hp/PbaLiM2AvXmBNlBUeepr4k+T9S6tRM62j7asFigWVVOh76cgvgGnWiR3nbOfzCCnq
 3BNg==
X-Gm-Message-State: APjAAAW30lb2jyD1KMv7pVOT4uMEXxMYNo1XvHeUfMzhE36rd1cTSz+d
 1mAuvcIxBIprhRagHGV49+iXtTBE
X-Google-Smtp-Source: APXvYqzLLPiqdgh3DMhuOrHPsmk8e/tf/Td6UubrfrEY5zV56go2b0ReY2pL2iM7z1H9deHecO9JOg==
X-Received: by 2002:a17:902:7846:: with SMTP id
 e6mr22063804pln.136.1569123020613; 
 Sat, 21 Sep 2019 20:30:20 -0700 (PDT)
Received: from localhost.localdomain
 ([2407:7000:aa04:fb00:ce0f:a0bf:1ece:a196])
 by smtp.gmail.com with ESMTPSA id l12sm4559532pgs.44.2019.09.21.20.30.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 20:30:19 -0700 (PDT)
From: Ben Russell <thematrixeatsyou@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sun, 22 Sep 2019 15:28:50 +1200
Message-Id: <20190922032853.6123-1-thematrixeatsyou@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Ben Russell <thematrixeatsyou@gmail.com>
Subject: [alsa-devel] [PATCH 0/3] Make pcm_ioplug check lock status before
	locking (fixes pcm_jack lockups)
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

This is my first time contributing a patch to a mailing list. If I've made a mess, please let me know so I can learn how to avoid it in future.

The purpose of this patchset is to fix a specific common lockup in the pcm_jack plugin (from alsa-plugins). I'm not sure if this is the right approach to take, but at the very least it should make the pcm_ioplug code a bit more resilient.

The problem is this: When using the pcm_jack plugin, if a program attempts to play audio using the SND_PCM_FORMAT_FLOAT format, said program locks up.

This should be enough to reproduce the bug:

    pcm.rawjack {
        type jack
        playback_ports {
            0 system:playback_1
            1 system:playback_2
        }
        capture_ports {
            0 system:capture_1
            1 system:capture_2
        }
    }
    
    pcm.!default {
        type plug
        slave.pcm "rawjack"
    }

What's happening is that several snd_pcm_ioplug_* functions assume that the pcm mutex is locked already. It then proceeds to unlock the mutex, call a function, and then relock the mutex. When the mutex isn't locked already, the initial unlock results in a silently ignored pthread error, and the lock results in the program eventually deadlocking as it doesn't expect the mutex to be held at that point.

Patch 2 modifies pcm_ioplug to check if the mutex is held before doing the unlock-act-lock sequence, and if the mutex is not held then it skips the unlock and lock stages. This depends on Patch 1, which adds a snd_pcm_is_locked function to give the state of the mutex.

Patch 3 is completely optional. It adds assertions which make sure that all uses of snd_pcm_lock/snd_pcm_unlock are correct. On one hand this will likely result in crashes in some of the less refined parts of the code. On the other hand, when that happens, you'll know which parts need a bit more love. I know it was useful for finding this issue in the first place.

These patches fix the problems I am having, but if you have a more suitable approach to fixing this problem then please let me know.

Regards,
Ben R

Ben Russell (3):
  pcm_local: Add snd_pcm_is_locked
  pcm_ioplug: Don't unlock+lock if we're not locked
  pcm_local: assert() when using mutexes incorrectly

 src/pcm/pcm_ioplug.c | 50 +++++++++++++++++++++++-----------
 src/pcm/pcm_local.h  | 64 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 91 insertions(+), 23 deletions(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
