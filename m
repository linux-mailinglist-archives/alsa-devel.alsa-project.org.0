Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB902B2EC6
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Nov 2020 18:13:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85E8C17FB;
	Sat, 14 Nov 2020 18:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85E8C17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605374030;
	bh=fFxeXBlrBXCM+4IEZbcYhdQZkqO3AWBybCG5GiU7M2I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ODShs60desLS+FbJRMaEBk6p9dRDxSCdFJjhU99G+NhBYG0F2LG4wKqZslkYjVvKe
	 csXWh8T54Lq8iRWh/bWtx6+wGf5ypm0BP48mWGNjgV05co2O6Y7IBt+sVniK4TXiZ1
	 +HqChgueKva7zsbnV0PhGy3DopTGU04zIuFCQyig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D097F801EB;
	Sat, 14 Nov 2020 18:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB3B4F801D5; Sat, 14 Nov 2020 18:12:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 23703F80086
 for <alsa-devel@alsa-project.org>; Sat, 14 Nov 2020 18:12:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23703F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605373931116064072-webhooks-bot@alsa-project.org>
References: <1605373931116064072-webhooks-bot@alsa-project.org>
Subject: [Question]: Mute all channels at boot
Message-Id: <20201114171215.CB3B4F801D5@alsa1.perex.cz>
Date: Sat, 14 Nov 2020 18:12:15 +0100 (CET)
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

alsa-project/alsa-utils issue #72 was opened from atreyasha:

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
