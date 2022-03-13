Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6024D773B
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Mar 2022 18:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8907B16E2;
	Sun, 13 Mar 2022 18:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8907B16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647192147;
	bh=S06y2ze+uQcOW+X8ghtZmYlPUwSbjAJQdpdGB7TEIiw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osx0PctDlx56JDgKfYe9lgsKkksrXn1pD9xFwM8zBHS0DZRp0G4UAETLqQ4I/IITJ
	 FRlXWEA1a94TC1OkGQ8QxfeczjXJ63gIrSULmOB+G2DdZe4Hash52qhSi7skcMbiLG
	 EwZv68/540aDNj1jMvfaXx97D8cwtCTH81In03Rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF7FF8047C;
	Sun, 13 Mar 2022 18:21:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E72E3F80095; Sun, 13 Mar 2022 18:21:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B425BF80095
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 18:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B425BF80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647192071875688076-webhooks-bot@alsa-project.org>
References: <1647192071875688076-webhooks-bot@alsa-project.org>
Subject: Sound automatically switch from USB Speaker to HeadSet
Message-Id: <20220313172118.E72E3F80095@alsa1.perex.cz>
Date: Sun, 13 Mar 2022 18:21:18 +0100 (CET)
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

alsa-project/alsa-lib issue #215 was opened from modulusmath:

Ubuntu 21.10 / Codename: impish

Running LXDE if it matters

I watch youtube listening on my external usb speakers and sounds plays just fine.

All of a sudden they go silent and sound is played on the plugged in headset (Plantronics, Inc. DA40 Adapter) without my intervention...Even if I unplug the headset it will switch over to the 'default usb audio analog stereo'. 


I do see some logs via journalctl near the time of the switch:

Mar 01 10:04:57 wilddog pulseaudio[1678]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Mar 01 10:04:57 wilddog pulseaudio[1678]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Mar 01 10:04:57 wilddog pulseaudio[1678]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.

This is a pretty fresh install.

How can I keep it stable on the external speakers?

Here's my also info: http://alsa-project.org/db/?f=3589356420b912e19608eaee1960f19b3f0a4e22

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/215
Repository URL: https://github.com/alsa-project/alsa-lib
