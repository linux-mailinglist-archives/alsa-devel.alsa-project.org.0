Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4782E2F2B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 22:38:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F7CA17C9;
	Sat, 26 Dec 2020 22:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F7CA17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609018702;
	bh=HyVFUKovSroEQSZcsWGwgAaaGyrzKda/7IN0Z4SLjjc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l4LtpAs0ukTmbDdWcryaOEyeZM2jn3/GKL2hYqlPffO3CPuMlGuTprMPwhchxdCIx
	 LxYCsGPC7NAFES/LT5eZhzx6z2OEzxd1ZXcVPsJ79PlIE+l+FzgW+EQZge8fFqBLGU
	 vvar0f1hpre2+KLM3le0oIs8hiTRk959tLGGR4cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE351F80264;
	Sat, 26 Dec 2020 22:36:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AED39F80232; Sat, 26 Dec 2020 22:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_25,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93046F80128
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 22:36:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93046F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pUoavlfV"
Received: by mail-pj1-x1035.google.com with SMTP id l23so4382848pjg.1
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 13:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xjzhpfsCQyQXKKwXkaUEIaIfplUefgqvvqDXQf47X0=;
 b=pUoavlfVA0H2kRutaR+kuVx6asqADxklItpfrzqiWT3rUTarVyZsFKV40VlKpqhuWl
 ZdJuO7mjxZCe0Icy1yH9+bBEodTeaxpzkT7SDMyZ3BB1+/AKLBhng7eRj8qMzScmUq2l
 +3Aiz5pvYEo8wppS8JXD/cImdS8Z9r2tNRTq3sgGe/Rg0rD4hih7rDvEmiapRE+jbsUb
 mHb1KLPAWhOeZ92uZhaBUm2IkqOaxo/EhAIugl0LGFZFuc/Lgsqlw6eueqISc6Hd6s42
 Nd0i/o+0eNlkq0xx/aB43ruhcR7D/wozQiUAC5ZeJeFhHesnxyHOt75Li/AJoJypsLxA
 zDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xjzhpfsCQyQXKKwXkaUEIaIfplUefgqvvqDXQf47X0=;
 b=iP7/IyP69fcwhD/5/o6RuOLya2BzJB20R22fghyJgX8QNXi4TsIS2BQNz9AbjfxRu8
 fAWm6E3xl5QXUTBc+mywD6heX6GyuTgps1jnNhTJt3F5Ai4Re8CJUr36/OEMn5JfvUmT
 Hi2v/n6NyfKA9qjH5WE/vXY2/xpaIC3gr0hcecv6q6IpRK56w3MNW05mEorOVXtZXINz
 c/R1TLNGzh98FO6Df+bYTtm5ZkQck8o0s3q3RaG9xh/38iraFVMe2N5P2ScETKvxn9mk
 iQq74NyT7d643IUkHV+DXTOAMevrUYJF3RjDo95prObo7XMOJRLZOIyO1B2lZ4CiLmuK
 F0ew==
X-Gm-Message-State: AOAM531b/1YzJSQWmcsqncr3NtNL91tqZE+jbF602K+GkqVig14xe6bu
 nT4Xrc7hkcD6xhu3kV4MbMlaous8rxey6g==
X-Google-Smtp-Source: ABdhPJyVvs6htesdzZigQYnOgI4+FJL87AOiWQ3CFgX1zZbmcMu7VMlVFnBzzvk8Sur9hygTQ76QgA==
X-Received: by 2002:a17:902:d351:b029:db:d63d:d0e with SMTP id
 l17-20020a170902d351b02900dbd63d0d0emr19788602plk.75.1609018584776; 
 Sat, 26 Dec 2020 13:36:24 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm30990560pft.114.2020.12.26.13.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 13:36:24 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH 0/9] scan-build fixes
Date: Sat, 26 Dec 2020 14:35:38 -0700
Message-Id: <20201226213547.175071-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.29.2.368.ge46b91665e.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Henrie <alexhenrie24@gmail.com>
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

These defects were identified by scan-build
<https://clang-analyzer.llvm.org/scan-build.html>.

I hope that drawing attention to the problems helps even if you decide
to fix some of them in different ways than I am proposing.

Happy holidays!

-Alex

Alex Henrie (9):
  conf: fix use after free in _snd_config_load_with_include
  ucm: fix bad frees in get_list0 and get_list20
  rawmidi: fix memory leak in snd_rawmidi_virtual_open
  confmisc: fix memory leak in snd_func_concat
  timer: fix sizeof operator mismatch in snd_timer_query_hw_open
  pcm: remove dead assignments from
    snd_pcm_rate_(commit_area|grab_next_period)
  pcm_multi: remove dead assignment from _snd_pcm_multi_open
  pcm: fix undefined bit shift in bad_pcm_state
  conf: remove dead code from get_hexachar

 include/pcm.h              |  4 +++-
 src/conf.c                 | 13 ++++---------
 src/confmisc.c             |  2 +-
 src/pcm/pcm.c              |  2 ++
 src/pcm/pcm_local.h        |  2 +-
 src/pcm/pcm_multi.c        |  1 -
 src/pcm/pcm_rate.c         |  2 --
 src/rawmidi/rawmidi_virt.c |  3 ++-
 src/timer/timer_query_hw.c |  2 +-
 src/ucm/main.c             |  4 ++--
 10 files changed, 16 insertions(+), 19 deletions(-)

-- 
2.29.2.368.ge46b91665e.dirty

