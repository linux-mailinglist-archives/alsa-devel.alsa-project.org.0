Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7014E252E
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 12:22:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4258E1700;
	Mon, 21 Mar 2022 12:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4258E1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647861775;
	bh=kBd5J8GmExW/nH/OyArd9xGZPncS1P4U0dsKzfBFdjU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ubBpl/6gnA9hMlsTGHC8rdnsvGzgTN9VBwWgtRMM7GVlMqHGI90y1xzsaIPuLHG+/
	 PZ9u5NKlpk8iKA1mOunO+QhOAtw0gBZDJLXoI8DbwxZfuV2WCLujxIaNEQVLXRUZ/9
	 yX9NOH//R+oZkD214ClblbtjaSAfYWbTgbtDKZK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DBEF80238;
	Mon, 21 Mar 2022 12:21:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07311F800FD; Mon, 21 Mar 2022 12:21:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6AE32F800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 12:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE32F800FD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647861701073087931-webhooks-bot@alsa-project.org>
References: <1647861701073087931-webhooks-bot@alsa-project.org>
Subject: Huge avail value caused by inconsistency between
 snd_pcm_multi_status() and snd_pcm_multi_hwptr_update()
Message-Id: <20220321112146.07311F800FD@alsa1.perex.cz>
Date: Mon, 21 Mar 2022 12:21:46 +0100 (CET)
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

alsa-project/alsa-lib issue #217 was opened from infmagic2047:

## Symptom
Using the following configuration with plugin `type multi`, `snd_pcm_avail()` may return huge values.
```
pcm.combined {
    type multi;
    slaves.a.pcm "dmix:CARD=0";
    slaves.a.channels 2;
    slaves.b.pcm "dmix:CARD=1";
    slaves.b.channels 2;
    bindings.0.slave a;
    bindings.0.channel 0;
    bindings.1.slave a;
    bindings.1.channel 1;
    bindings.2.slave b;
    bindings.2.channel 0;
    bindings.3.slave b;
    bindings.3.channel 1;
}
```
The problem still occurs even when I set both slaves to `dmix:CARD=0`, so use this to reproduce the issue if you don't have multiple output devices.

It can be verified with `aplay --test-position -D plug:combined /dev/urandom`. The output looks like this:
```
Playing raw data '/dev/urandom' : Unsigned 8 bit, Rate 8000 Hz, Mono
Suspicious buffer position (1 total): avail = 765611936652984468, delay = 2582, buffer = 2730
Suspicious buffer position (2 total): avail = 762797186885877738, delay = 2752, buffer = 2730
Suspicious buffer position (3 total): avail = 759982437118771178, delay = 2752, buffer = 2730
Suspicious buffer position (4 total): avail = 757167687351664448, delay = 2922, buffer = 2730
Suspicious buffer position (5 total): avail = 754352937584557888, delay = 2922, buffer = 2730
Suspicious buffer position (6 total): avail = 751538187817451158, delay = 3092, buffer = 2730
Suspicious buffer position (7 total): avail = 748723438050344598, delay = 3092, buffer = 2730
Suspicious buffer position (8 total): avail = 745908688283237868, delay = 3262, buffer = 2730
Suspicious buffer position (9 total): avail = 743093938516131308, delay = 3262, buffer = 2730
Suspicious buffer position (10 total): avail = 740279188749024578, delay = 3432, buffer = 2730
```

I'm using alsa-lib-1.2.6.1 on Gentoo Linux, kernel version is 5.16.15.

## Cause
For `type multi` plugins, `snd_pcm_multi_status()` returns the hwptr of its master_slave, while `snd_pcm_multi_hwptr_update()` sets the hwptr based on all slaves. They are inconsistent, and can lead to problems for plugins in upper levels.

In this particular case, there is a `type rate` plugin on top of `type multi`. It requires the underlying hwptr to be monotonic, and may either read the hwptr directly (in `snd_pcm_rate_sync_hwptr()`) or use the value from status (in `snd_pcm_rate_status()`). The inconsistency can cause hwptr to decrease, breaking the code of `type rate`.

## Attempted solution
I'm able to fix the problem with the following patch, and haven't run into any problems. I'm unfamiliar with the code though, so the patch may be inefficient or incorrect in some way.
```
diff -uNar --no-dereference alsa-lib-1.2.6.1/src/pcm/pcm_multi.c alsa-lib-1.2.6.1-new/src/pcm/pcm_multi.c
--- alsa-lib-1.2.6.1/src/pcm/pcm_multi.c	2021-12-09 21:17:59.000000000 +0800
+++ alsa-lib-1.2.6.1-new/src/pcm/pcm_multi.c	2022-03-21 16:20:32.096036522 +0800
@@ -388,11 +388,21 @@
 	return 0;
 }
 
+static snd_pcm_sframes_t snd_pcm_multi_avail_update(snd_pcm_t *pcm);
 static int snd_pcm_multi_status(snd_pcm_t *pcm, snd_pcm_status_t *status)
 {
 	snd_pcm_multi_t *multi = pcm->private_data;
 	snd_pcm_t *slave = multi->slaves[multi->master_slave].pcm;
-	return snd_pcm_status(slave, status);
+
+	int err = snd_pcm_status(slave, status);
+	if (err < 0)
+		return err;
+	snd_pcm_sframes_t avail = snd_pcm_multi_avail_update(pcm);
+	if (avail < 0)
+		return avail;
+	status->hw_ptr = *pcm->hw.ptr;
+	status->avail = avail;
+	return 0;
 }
 
 static snd_pcm_state_t snd_pcm_multi_state(snd_pcm_t *pcm)
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/217
Repository URL: https://github.com/alsa-project/alsa-lib
