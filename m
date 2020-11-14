Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1CC2B2EC7
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Nov 2020 18:14:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE6818A1;
	Sat, 14 Nov 2020 18:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE6818A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605374041;
	bh=EodgIkWJNZ5yFYvwYcknO1ekCClsTs2R4rhVjBN7/58=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVHul8va7RLsbkbUiMMJ6Cm32LtVaofhPe2tsLD4bUUJjPIG4fPBEIgBsX4NAgAzI
	 xoeYbNpcvLCPnnE9arakhunUvSHUhe9qB4MldTabG7Ly0eKvzbO5y4n2L9/acJqRt4
	 D9JYnb3h0SzBg7pWhhR2SV/ggTsxUjjGbjcybxaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC42CF800F1;
	Sat, 14 Nov 2020 18:12:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BE5FF80161; Sat, 14 Nov 2020 18:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0E0EEF80161
 for <alsa-devel@alsa-project.org>; Sat, 14 Nov 2020 18:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E0EEF80161
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605373953013941050-webhooks-bot@alsa-project.org>
References: <1605373953013941050-webhooks-bot@alsa-project.org>
Subject: [Question]: Mute all channels when starting X11
Message-Id: <20201114171236.6BE5FF80161@alsa1.perex.cz>
Date: Sat, 14 Nov 2020 18:12:36 +0100 (CET)
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

alsa-project/alsa-utils issue #72 was edited from atreyasha:

Hello, thank you for developing `alsa-utils`. I have a specific question pertaining to `amixer`.

## Current behaviour

When starting `X11` and `i3` (my window manager), I would like to have all audio channels (speaker, headphones, etc.) muted. At the moment, I have the following command in my `i3` configuration file:

```
amixer -q sset Master mute
```

And as expected, the Master channel is indeed muted after starting `X11`. However, when I connect or disconnect my headphones, the volume automatically reverts back to the volume that was saved during the last boot.

## Expected behaviour

I would like all volume channels to stay muted. So for example after starting `X11` and `i3`, I would like to see that both my speakers and headphones are muted, even when I plug/unplug the jack. Would you have any recommendations on how to do this?

I was considering manually muting both headphones and speakers with `amixer` and then re-using the `alsa` state file during boots. But I am unsure because this seems like a hack'ish solution.

## System specifications

OS/Kernel: Linux lt410 5.9.8-arch1-1 #1 SMP PREEMPT Tue, 10 Nov 2020 22:44:11 +0000 x86_64 GNU/Linux
alsa-utils: 1.2.4-2 (installed via `pacman` package manager)
wm: `i3-gaps`

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/72
Repository URL: https://github.com/alsa-project/alsa-utils
