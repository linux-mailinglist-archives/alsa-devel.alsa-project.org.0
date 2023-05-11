Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B006FF9AA
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 20:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 854451CF;
	Thu, 11 May 2023 20:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 854451CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683831376;
	bh=eVz9oztp6sTOr/EZz5SzgkYFdSkl8hKTzunVRs5rPhA=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E+7FQj6Aw+rZQfa9GnP0+FRS8hoA9Kv2mVGGgrQS2EattMP/i+BE2I2V6KWBwaQxS
	 waJnQSJI4k5bhSI8UnE1T5GkoF39C1+qQjoItOr1qXNaZZ6u1vI04MzHmJAYyegKiZ
	 0KW/vRazLn4j8rDYT9EuoZzDyCcOZklBl/k0vF4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E88AEF80549; Thu, 11 May 2023 20:54:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05C29F80549;
	Thu, 11 May 2023 20:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF2DDF8032D; Thu, 11 May 2023 14:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 026FDF80217
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 14:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026FDF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=2jcOSJhm
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-b9a7766d220so10550826276.2
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 05:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683806944; x=1686398944;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4BIGv8cvhYCnj6Dn22WjXXNn/Va5F3LdRC3PtF/nvIA=;
        b=2jcOSJhmLEN7/bRj7Sj6znaj1Kl0FHZXElxAlbn6RkdBwDTuGByQ3mWkAGu9MMPYsf
         7RpDO2qYYqXMrz7jKDpAUD7ybqdtzRcCvy+sH8ofFNtv0UpHkGTXzgBh9Mpjz7yTnxZz
         yw95lVbx+YCVSGglSUunEeQGj37yy4fJP5uW2Bs9pN0xZBBFfUscjGPRSJX1OHZ1d0eM
         Q4IO16YOw9aV10I0AnXHjxaiw8x3YW+xSP1vEWSbOsIs/ybMwlnkP3K09hLE8FhdA8gm
         zNYnl40i5eTBuFbUBWGpK02SoOrDKJgc/aSlIqRqSs9WqzdHYUNqrootAX0oPeHFPH3f
         2fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806944; x=1686398944;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4BIGv8cvhYCnj6Dn22WjXXNn/Va5F3LdRC3PtF/nvIA=;
        b=Re9SjA+ghOXlH0AgmwcFOK3e3awf0NbYwnlTJhiwUrCxWw/akg6urV5EZh0xWd9cbY
         RhBfLH6UlknnzIc1mLjrG5KbnHkjcF/OrKz9nEfo8LCvJhK9cl1fyDCz7jAzxQWj3BZR
         hdmwUlfQUNwep2nP9sXFMqazvSxkJeRMd6GCaCYbjEAjsN+CPyoirpz2YF/mUe90Smn8
         +iWJ7IAyPxZhlReIr9VR5TS7iGTqRLG833r2dBdOaVB+nZrxP2CZnR1Ig73Jh+m3ncbc
         /YHJvTgjn0tWpR9fsEv4GwLgOFd/N8ala7e76lcCOZQNaF8tZ/c3T+a1AwTVWN0rOza3
         wqcg==
X-Gm-Message-State: AC+VfDyYuhkdpjb1lMvDFe/SkICU+BTe0j0J1mAskq3lT92GMq0RFMGU
	5feJA7NIqCicSOteRTHT5EATWnR9IDufAcIb1A==
X-Google-Smtp-Source: 
 ACHHUZ4dvFqDJaqvl8s88DKFUSl7ZkE2AINynt5A9USiNed4MrNIKY0HgqUNVoSf+FaBQWxYBrI469iC5WrZlfaHHQ==
X-Received: from yixuanjiang.ntc.corp.google.com
 ([2401:fa00:fc:202:6c9a:64c9:7e44:6b1d])
 (user=yixuanjiang job=sendgmr) by 2002:a25:1d84:0:b0:ba2:526a:c84e with SMTP
 id d126-20020a251d84000000b00ba2526ac84emr10416404ybd.9.1683806944462; Thu,
 11 May 2023 05:09:04 -0700 (PDT)
Date: Thu, 11 May 2023 20:08:35 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230511120841.2096524-1-yixuanjiang@google.com>
Subject: [PATCH 0/6] Fix soc compress playback deadlock in 5.15
From: yixuanjiang <yixuanjiang@google.com>
To: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	yixuanjiang <yixuanjiang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 34NpcZAsKCjMnXmjPcYXPcVVddVaT.RdbPahP-STkTaPahP-egdYTRi.dgV@flex--yixuanjiang.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QXNXCIA3X7GPNA3NAUZUKJX2M4H2NZWN
X-Message-ID-Hash: QXNXCIA3X7GPNA3NAUZUKJX2M4H2NZWN
X-Mailman-Approved-At: Thu, 11 May 2023 18:54:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXNXCIA3X7GPNA3NAUZUKJX2M4H2NZWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch in 5.15
 aa9ff6a4955f ("ASoC: soc-compress: Reposition and add pcm_mutex")
will cause the deadlock when close compress playback.

It needs backport patch
 b7898396f4 ("ASoC: soc-pcm: Fix and cleanup DPCM locking commit")
to prevent the deadlock issue.

Rootcause is patch b7898396f4 will remove pcm_mutex in soc_pcm_hw_clean
 then patch aa9ff6a4955f add pcm_mutex acqurie back in snd_compr_free
 to fix regression cause from b7898396f4.
If only apply aa9ff6a4955f, it will acqurie pcm_mutex twice cause the deadlock.

There are total 6 patches on these related backport

[  212.063445] sysrq: Show Blocked State
[  212.064964] Call trace:
[  212.064974] __switch_to+0x244/0x454
[  212.065075] __schedule+0x5fc/0xbdc
[  212.065092] schedule+0x154/0x258
[  212.065103] schedule_preempt_disabled+0x30/0x50
[  212.065115] __mutex_lock+0x36c/0x794
[  212.065135] __mutex_lock_slowpath+0x1c/0x2c
[  212.065145] soc_pcm_hw_clean+0x6c/0x364
[  212.065177] dpcm_be_dai_hw_free+0x20c/0x304
[  212.065188] soc_compr_free_fe+0x130/0x448
[  212.065230] snd_compr_free+0xac/0x148
[  212.065316] __fput+0x104/0x438
[  212.065347] ____fput+0x18/0x28
[  212.065409] task_work_run+0x144/0x1f8
[  212.065474] do_notify_resume+0x1d24/0x27b0
[  212.065518] el0_svc+0x68/0xc4
[  212.065601] el0t_64_sync_handler+0x8c/0xfc
[  212.065610] el0t_64_sync+0x1b0/0x1b4

*** BLURB HERE ***

Pierre-Louis Bossart (4):
  ASoC: soc-pcm: use GFP_ATOMIC for dpcm structure
  ASoC: soc-pcm: align BE 'atomicity' with that of the FE
  ASoC: soc-pcm: test refcount before triggering
  ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE

Takashi Iwai (2):
  ASoC: soc-pcm: Fix and cleanup DPCM locking
  ASoC: soc-pcm: serialize BE triggers

 include/sound/soc-dpcm.h |   2 +
 include/sound/soc.h      |   2 -
 sound/soc/soc-core.c     |   1 -
 sound/soc/soc-pcm.c      | 351 +++++++++++++++++++++++++++------------
 4 files changed, 246 insertions(+), 110 deletions(-)

-- 
2.40.1.521.gf1e218fcd8-goog

