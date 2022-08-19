Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F9599B54
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D375F84C;
	Fri, 19 Aug 2022 14:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D375F84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660910576;
	bh=xV6QPMtBoBG3MPXdYhPydNPLU90gTnwNcUB/xOq3RnY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e76GPXUSjab6WJ/PR6era7K7PqlcdCAgl/v48KMaWH+gqscEzfpsXYdBIXff5SWxB
	 vhB24cNmMSNFWJfg/u8BLvDn38J9S9yw2c9DEUwFD2etOX57UscOmmiHzbYmoC6W3M
	 vp0dpbLeVZkjgt/hhaadbigZBTWMpqHPeZV5oDfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE1F8F80217;
	Fri, 19 Aug 2022 14:01:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCE53F800EE; Fri, 19 Aug 2022 14:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5A8F5F800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A8F5F800EE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660910511407147884-webhooks-bot@alsa-project.org>
References: <1660910511407147884-webhooks-bot@alsa-project.org>
Subject: chromium - cracking pulseaudio issue (small buffer size settings -
 512)
Message-Id: <20220819120154.DCE53F800EE@alsa1.perex.cz>
Date: Fri, 19 Aug 2022 14:01:54 +0200 (CEST)
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
