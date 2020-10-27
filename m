Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B061F29C582
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4723C1699;
	Tue, 27 Oct 2020 19:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4723C1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603822254;
	bh=lzp9flCUanNB/9ztEK5+MoHGbSMCLV+CrnCW8FjQofg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVaWxgyWOFAt00mD8LVCcLbY3OJyruSJPIxW1GpDyxUxy/Yj5W5ZVsfGJprhqjbzj
	 I1I2D8fsbcS3DDV+g3fbsGTrely28qGRJV5FAJ+VPzjruvh7ElMxJFNb0gbA+Q4F8y
	 9pluJH8xN9j4CCZbr0GkCFCzFbRXnJWCGlgtphLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA111F8019D;
	Tue, 27 Oct 2020 19:09:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D88F8020D; Tue, 27 Oct 2020 19:09:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 09F8FF80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F8FF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603822155188082933-webhooks-bot@alsa-project.org>
References: <1603822155188082933-webhooks-bot@alsa-project.org>
Subject: how to properly release all memory after use?
Message-Id: <20201027180919.92D88F8020D@alsa1.perex.cz>
Date: Tue, 27 Oct 2020 19:09:19 +0100 (CET)
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

alsa-project/alsa-lib issue #93 was edited from xatian:

```C++
int main () {
    snd_pcm_t* handle;
    int err;
    err = ::snd_pcm_open (&handle, "default", SND_PCM_STREAM_PLAYBACK, SND_PCM_NONBLOCK);
    ::printf ("snd_pcm_open: %d\n", err);
    err = ::snd_pcm_close (handle);
    ::printf ("snd_pcm_close: %d\n", err);
    ::snd_config_update_free_global ();
    return 0;
}
```

```
==51583== Memcheck, a memory error detector
==51583== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==51583== Using Valgrind-3.16.1 and LibVEX; rerun with -h for copyright info
==51583== Command: ./alsa-leak
==51583== 
snd_pcm_open: 0
snd_pcm_close: 0
==51583== 
==51583== HEAP SUMMARY:
==51583==     in use at exit: 64,140 bytes in 140 blocks
==51583==   total heap usage: 2,937 allocs, 2,797 frees, 635,030 bytes allocated
==51583== 
==51583== 4 bytes in 1 blocks are definitely lost in loss record 3 of 71
==51583==    at 0x483AB65: calloc (vg_replace_malloc.c:760)
==51583==    by 0x58E0A3E: pa_xmalloc0 (in /usr/lib/x86_64-linux-gnu/libpulse.so.0.21.1)
==51583==    by 0x58B5F9E: pa_context_new_with_proplist (in /usr/lib/x86_64-linux-gnu/libpulse.so.0.21.1)
==51583==    by 0x4848216: ???
==51583==    by 0x4904ABD: ??? (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x4904F24: ??? (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x4905849: snd_config_searcha_hooks (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x4905940: snd_config_searchva_hooks (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x4905A42: ??? (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x49042D8: snd_config_search_definition (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x4920255: ??? (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x4923227: snd_pcm_open (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583== 
==51583== 4 bytes in 1 blocks are definitely lost in loss record 4 of 71
==51583==    at 0x483AB65: calloc (vg_replace_malloc.c:760)
==51583==    by 0x58E0A3E: pa_xmalloc0 (in /usr/lib/x86_64-linux-gnu/libpulse.so.0.21.1)
==51583==    by 0x58B5F9E: pa_context_new_with_proplist (in /usr/lib/x86_64-linux-gnu/libpulse.so.0.21.1)
==51583==    by 0x5892577: ???
==51583==    by 0x5891F42: ???
==51583==    by 0x491FC84: ??? (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x49202E6: ??? (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x4923227: snd_pcm_open (in /usr/lib/x86_64-linux-gnu/libasound.so.2.0.0)
==51583==    by 0x404A5B: main (src/main.cpp:15)
==51583== 
==51583== LEAK SUMMARY:
==51583==    definitely lost: 8 bytes in 2 blocks
==51583==    indirectly lost: 0 bytes in 0 blocks
==51583==      possibly lost: 0 bytes in 0 blocks
==51583==    still reachable: 64,132 bytes in 138 blocks
==51583==         suppressed: 0 bytes in 0 blocks
==51583== Reachable blocks (those to which a pointer was found) are not shown.
==51583== To see them, rerun with: --leak-check=full --show-leak-kinds=all
==51583== 
==51583== For lists of detected and suppressed errors, rerun with: -s
==51583== ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 from 0)
```

Did I do something wrong?
What makes matters worse is that if I duplicate the code more leaks get reported so this is not just some global state that gets left behind.
I am using libasound2 1.2.3.2-1 amd64

Thank you!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/93
Repository URL: https://github.com/alsa-project/alsa-lib
