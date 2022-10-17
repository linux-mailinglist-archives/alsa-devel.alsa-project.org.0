Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5260166F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 20:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF82A867E;
	Mon, 17 Oct 2022 20:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF82A867E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666031866;
	bh=DvISbfS+hNL0OeZ4Z7A9YgJPC2YrHx5SRn04hy5l66s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M33uZJilJio0+N31zh0gpfzhGOdI4BdzzLy/6Ov6qiBqCURQwHwfPaqR3FmkChL9L
	 Y9JMdc7dJOOWasCLml1CAZl380B4fozvdoZAea3GHGie10pk6jGNuzHF8YOXC+PPKv
	 PReAXlWdDNPrudE5ekb42IV99Ux2Cp863bv1j5DA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33ECCF80496;
	Mon, 17 Oct 2022 20:36:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35B09F8025E; Mon, 17 Oct 2022 20:36:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B2E58F80149
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 20:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E58F80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666031805928993940-webhooks-bot@alsa-project.org>
References: <1666031805928993940-webhooks-bot@alsa-project.org>
Subject: controlC1 no longer show up after USBDEVFS_DISCONNECT
Message-Id: <20221017183649.35B09F8025E@alsa1.perex.cz>
Date: Mon, 17 Oct 2022 20:36:49 +0200 (CEST)
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

alsa-project/alsa-lib issue #276 was opened from robertwu1:

After running the following IOCTL on some MIDI devices, the control C1 device node is gone.

~~~
struct usbdevfs_ioctl ctl;

ctl.ifno = interface; // MIDI interface
ctl.ioctl_code = USBDEVFS_DISCONNECT;
ctl.data = NULL;
return ioctl(device->fd, USBDEVFS_IOCTL, &ctl);
~~~

Under /dev/snd, the following disappears: controlC1, midiC1D0, pcmC1D0c, pcmC1D0p.

MidiControl, AudioStreaming, and AudioControl are under separate interfaces. If some of these were to disappear, I expect only midiC1D0 to disappear.

I've tested the following devices:

/dev/snd looks the same after USBDEVFS_DISCONNECT: PreSonus AudioBox 96, Alesis iO4, Komplete Audio 6.

controlC1, midiC1D0, pcmC1D0c, pcmC1D0p are gone: PreSonus Studio 26c, Yamaha AG06.

Here is a public Android bug of users having issues of this on Android: https://issuetracker.google.com/issues/251050530

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/276
Repository URL: https://github.com/alsa-project/alsa-lib
