Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED32D163CCE
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 06:53:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8883516D2;
	Wed, 19 Feb 2020 06:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8883516D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582091610;
	bh=/cPuSPHCa8yhtyme52EVKZPMCJygtIPuM5pWxUWwhYo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=la4rRDA7KQ4JyXVEffrqELuptFZYN3jP3PDbed6W/1i/d7mOd0Jd2U2OmT6ZgCN22
	 tclJ0O5yj2DRwY7kAnbi42Rt6cU2kZAa58YA4YE9VaWBnhd0LEdyTEIhqGEpw8ybhz
	 MVMlXHmGjGL5yA+8lsGWhKp8sk1X6WSGAJg1Bjeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 968A4F800C4;
	Wed, 19 Feb 2020 06:51:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B6C1F80172; Wed, 19 Feb 2020 06:51:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BE40EF800C4
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 06:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE40EF800C4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582091501705790043-webhooks-bot@alsa-project.org>
References: <1582091501705790043-webhooks-bot@alsa-project.org>
Subject: ALSA raw MIDI API - client hangup and amidi exits midiC3D0 failed:
 Device or resource busy
Message-Id: <20200219055146.6B6C1F80172@alsa1.perex.cz>
Date: Wed, 19 Feb 2020 06:51:46 +0100 (CET)
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

alsa-project/alsa-lib issue #25 was opened from MusicMaker:

While developing a client using the raw MIDI interface, bumped into an issue that
went away after rebooting Ubuntu 19.10 - 64 bit. Using a MIDISPORT 4x4 one of the 4 ports could not be opened. The client (written in C) call hang and the client thus went unresponsive. No timeout, no error, no nothing. CTRL-BREAK the client and retrying many times gave the exact same result, no other apps were using the port. The other 3 ports on the interface and any other MIDI USB device connected could be opened and used without any problem.

When opening the port with amidi, an error was reported, it seems amidi did not gracefully exit as well.

amidi -receive -p hw:3,0,1
ALSA lib rawmidi_hw.c:233:(snd_rawmidi_hw_open) open /dev/snd/midiC3D0 failed: Device or resource busy
cannot open port "hw:3,0,1": Device or resource busy

Looking at the rawmidi_hw.c code there is a GOTO and SYSERR statement. Not sure if those caused this .

   if (fd < 0) {
            snd_ctl_close(ctl);
            SYSERR("open %s failed", filename);
            return -errno;
.
After reboot the problem went away. The problem could have been caused while fixing some by coding issue. Maybe someone with more understanding of the code can spot an issue in the code. While  many applications use the raw MIDI interface. believe Bitwig and most others use the sequencer API to open ports.

Just wanted to log this just in case anyone else experiences this

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/25
Repository URL: https://github.com/alsa-project/alsa-lib
