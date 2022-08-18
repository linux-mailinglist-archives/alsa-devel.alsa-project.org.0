Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728FD59905B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 00:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2414584B;
	Fri, 19 Aug 2022 00:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2414584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660861242;
	bh=xV6QPMtBoBG3MPXdYhPydNPLU90gTnwNcUB/xOq3RnY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNj/K3Ne2NWp1FwA+9C3Y+rFy9Vkp+nNWFYAS1Fk3zrnr+VYoDiYgeYBhb6LjIojT
	 Z280+Ev0Shmkib3lt9fezumvXMRp/oFn4DJyJ0u+b3c+arZGj12wQH6wWfeJaK4YyQ
	 ydu/STn5Zg1lpkl9k2fNy+6JQGRZ01OboKIjIaL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96C0FF80495;
	Fri, 19 Aug 2022 00:19:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8048F80430; Fri, 19 Aug 2022 00:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 36F3AF800E9
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 00:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F3AF800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660861178776273966-webhooks-bot@alsa-project.org>
References: <1660861178776273966-webhooks-bot@alsa-project.org>
Subject: cracking pulseaudio issue
Message-Id: <20220818221941.A8048F80430@alsa1.perex.cz>
Date: Fri, 19 Aug 2022 00:19:41 +0200 (CEST)
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

alsa-project/alsa-lib issue #262 was edited from shmohawk:

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
