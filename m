Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A658FAD9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 12:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BEFB83D;
	Thu, 11 Aug 2022 12:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BEFB83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660214779;
	bh=H61td1qt4uOuQl9C9WSfD/5OWnwPWpUoZVtG9+brf1U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BzcrXbO41QX0iFiaSksf9GTRlbi52xB1cvCJaxcPvWswtzFSZd/EqIZ9SgxJ5F0PF
	 ViGKUHrt2qD8Hy8rNBlbtDIsP/Le5iQM3EvsNNngqU7pL+ZLU9fkgRRY5hUdJ+UMfy
	 w3V+2kJJDOJuBlQl3T5+H9DH1R0/ZHP2zfjuzUAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA01CF802DB;
	Thu, 11 Aug 2022 12:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C15BCF80246; Thu, 11 Aug 2022 12:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4F2E7F800FB
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 12:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F2E7F800FB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660214714498842955-webhooks-bot@alsa-project.org>
References: <1660214714498842955-webhooks-bot@alsa-project.org>
Subject: snd_pcm_hw_params_current() always returning zero for periods and
 buffer_time
Message-Id: <20220811104517.C15BCF80246@alsa1.perex.cz>
Date: Thu, 11 Aug 2022 12:45:17 +0200 (CEST)
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

alsa-project/alsa-lib issue #258 was opened from ossilator:

as can be reproduced rather easily using pyalsaaudio's pcm.dumpinfo(), snd_pcm_hw_params_current() seems to always return zero for periods and buffer_time, at least for playback streams (i didn't test capture).

the sequence is basically this:
```
snd_pcm_hw_params_any(...);
...
unsigned periods = 4;
snd_pcm_hw_params_set_periods_near(..., &periods, ...);
// periods is still fine here
snd_pcm_hw_params(...);

snd_pcm_hw_params_current(...);
snd_pcm_hw_params_get_periods(..., &periods, ...);
// nope, zero periods
```

i tested this with two completely different setups on two different machines (one a raw driver, another one with pipewire), so it doesn't appear related to the driver.

from the other returned parameters it can be inferred that the period count is actually fine.

one thing i noticed is that snd_pcm_hw_params_current() uses snd_interval_copy() instead of snd_interval_set_value() for exactly these two parameters. but min & max are both zero. i wasn't able to trace it down so far; both the library and the kernel code look fine.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/258
Repository URL: https://github.com/alsa-project/alsa-lib
