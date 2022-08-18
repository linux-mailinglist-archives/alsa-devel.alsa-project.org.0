Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD9599052
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 00:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD0E1638;
	Fri, 19 Aug 2022 00:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD0E1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660860856;
	bh=XciOTR/Wkwkohf5UM8AvQbDKTHccIMrNx6IU1ASDYs4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SfWW1rcgNQGZwcgy2/2bCMwSoa7l1RBY9SiccnBgF0Gvgx9Sqkj4VxMmL5ooc3M9Q
	 9kIHw5XisZ9OP2j6PMabYMw9bH3NwbWTgEW2amuXUJvjwmuE5sPOv38c/s/iLCpEC8
	 a3c2VqSXe+mhpKHKb1Y7dspkg/KqGshQjTobYiU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E77F800B5;
	Fri, 19 Aug 2022 00:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A198F800E9; Fri, 19 Aug 2022 00:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 17B64F800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 00:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B64F800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660860791542484045-webhooks-bot@alsa-project.org>
References: <1660860791542484045-webhooks-bot@alsa-project.org>
Subject: snd_hda_intel: Woke up but no data
Message-Id: <20220818221314.8A198F800E9@alsa1.perex.cz>
Date: Fri, 19 Aug 2022 00:13:14 +0200 (CEST)
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

alsa-project/alsa-lib issue #262 was reopened from shmohawk:

```
Aug 17 01:11:23 hellokitty pulseaudio[12938]: [alsa-sink-CX20590 Analog] alsa-sink.c: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Aug 17 01:11:23 hellokitty pulseaudio[12938]: [alsa-sink-CX20590 Analog] alsa-sink.c: Most likely this is a bug in the ALSA driver 'snd_hda_intel'. Please report this issue to the ALSA developers.
Aug 17 01:11:23 hellokitty pulseaudio[12938]: [alsa-sink-CX20590 Analog] alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
```

It is symptomous with a crackling sound for ~5 seconds after any playback starts. 

alsa-lib 1.2.7.2
alsa-utils 1.2.7
alsa-plugins 1.2.2

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/262
Repository URL: https://github.com/alsa-project/alsa-lib
