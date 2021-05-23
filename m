Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D538DC6C
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 20:31:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6BB01666;
	Sun, 23 May 2021 20:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6BB01666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621794677;
	bh=HGmAR/5AAEK1MS6Nh/HUqS2oOwAWfW5/4DTThPl6kMM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYwG+M9jwZSaazCoB2Gm2oXnynthWT0hUsOJiIY4PEFc3d7JwTKqEjb1SGkWcrRd+
	 cZAddlKBTPfNnFQf4S/5WGceYrp1iDJFBExMVfxgrIKiSvYyePOGJF6fYWxEcVLX6y
	 lMhcrTD1iLoJztg8+P6NPe+va712+Wt0yb2Pd2uU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF812F8019D;
	Sun, 23 May 2021 20:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2FF5F801EB; Sun, 23 May 2021 20:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AE200F800DF
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 20:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE200F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1621794556934490919-webhooks-bot@alsa-project.org>
References: <1621794556934490919-webhooks-bot@alsa-project.org>
Subject: Dmix plugin does not update state when sound card is removed.
Message-Id: <20210523182933.B2FF5F801EB@alsa1.perex.cz>
Date: Sun, 23 May 2021 20:29:33 +0200 (CEST)
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

alsa-project/alsa-lib issue #137 was opened from MHoyer12345678:

Playing sound using snd_pcm_writei in a dmix setup might result in an infinite loop when sound card is removed.

**Setup:**

- dmix setup
- pcm dmix device opened non blocking
- snd_pcm_writei used with poll (POLLERR is not evaluated)

**Trigger:**
- usb sound card is removed (e.g. by  "echo 0 > /sys/bus/usb/x-x/authorized")

**Observation:**
- snd_pcm_writei returns -EAGAIN on each call
- snd_pcm_state report state RUNNING

**Expected:**
- snd_pcm_writei returns -ENODEV (as happening in case a pure hw configuration is used without dmix plugin)
- snd_pcm_state report state DISCONNECTED (as happening in case a pure hw configuration is used without dmix plugin)

**Root Cause:**
- snd_pcm_writei calls snd_pcm_write_areas
- snd_pcm_write_areas requests state of dmix pcm device (state = __snd_pcm_state(pcm);)
- dmix implementation of snd_pcm_state requests state from slave hw device (state = snd_pcm_state(dmix->spcm);)
- hw implementation of snd_pcm_state executes an ioctl (query_status -> sync_ptr1)
- the ioctl call fails with -ENODEV (after the device has been  removed)
- pcm_hw returns -ENODEV as state
- dmix implementation of snd_pcm_state ends in default section of the switch block
- this leads to the unchanged dmix->state returned
- this way, the -ENODEV from the slave device is finally ignored in dmix plugin

**Potential Fix:**
- Add the following three lines to snd_pcm_hw_state in pcm_hw.c after query_status_data 

```
//disconnected HW is reported via a failed IOCTL return -ENODEV
if (err == -ENODEV)
	return SND_PCM_STATE_DISCONNECTED;
```
- The fix takes -ENODEV as trigger to return state DISCONNECTED

Hope this helps ...

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/137
Repository URL: https://github.com/alsa-project/alsa-lib
