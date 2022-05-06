Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4634051E038
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 22:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A98183E;
	Fri,  6 May 2022 22:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A98183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651869486;
	bh=ESIx2x+6+uGTCP2unKKIQb/lL1DorfqjzlVZMk5rGYo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=US5oaSFxbyf3Fx/mSVEdexyDTawHue+MX+ydSLPYc3Tp7GJfnSwiSoXDvh55oH2jI
	 yqfzdepF/FgdRzyIIZ+GQHESvKFoxWwIFuS9Wa4Pe6yrAz3OzOPdtFpN9ul4S1n1cz
	 GKVU7pfC5VIo02LrcVW0IlWCIqTCN9fCsKrPjmYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 424B3F800D3;
	Fri,  6 May 2022 22:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B4F9F8014B; Fri,  6 May 2022 22:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 66395F800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 22:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66395F800D3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651869417347031116-webhooks-bot@alsa-project.org>
References: <1651869417347031116-webhooks-bot@alsa-project.org>
Subject: Lenovo ThinkPad T14 AMD - Broken headphone detection
Message-Id: <20220506203705.3B4F9F8014B@alsa1.perex.cz>
Date: Fri,  6 May 2022 22:37:05 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #152 was opened from xsmile:

### Summary

Booting the system with headphones plugged in results in a broken volume control. Sometimes the headphones are not recognized at all.

### Environment

- Lenovo ThinkPad T14 Gen 1 (AMD), BIOS 1.40
- Onboard Realtek ALC257

### Steps to reproduce

- plug in headphones
- boot the system
- play back audio and try changing the volume

### What is the current *bug* behavior?

The previously set volume level is ignored and set to the maximum, despite PulseAudio telling otherwise. Changing the volume has no effect.

Occasionally, headphone presence is not recognized after a reboot instead and audio is played back through the speakers.

### What is the expected *correct* behavior?

The volume level is persisted between reboots, headphones are recognized reliably and volume control is functional.

### Additional Information

As a workaround, headphones can be removed and plugged in again, which restores the normal volume level and the ability to control volume.

The bug does not happen when using ALSA without PulseAudio or when using PulseAudio without UCM.

Here is a series of `pa-info` log files where volume control was functional but both speakers and headphones were active after the reboot.

[1-speakers.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8643462/1-speakers.txt) headphones are not plugged in; speakers are active
[2-headphones.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8643463/2-headphones.txt) headphones were plugged in; headphones are active and speakers are muted
[3-reboot-with-headphones.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8643464/3-reboot-with-headphones.txt) rebooted the notebook with headphones plugged in; both speakers and headphones are active, while speakers should have been muted; volume control changes speaker instead of headphone volume
[4-speakers.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8643465/4-speakers.txt) removed headphones; speakers are active
[5-headphones.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8643466/5-headphones.txt) plugged in headphones; headphones are active and speakers are muted

---

Related issue: https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1356

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/152
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
