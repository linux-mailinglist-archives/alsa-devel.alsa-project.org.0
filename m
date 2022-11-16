Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6A62BA62
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 11:58:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DFB1692;
	Wed, 16 Nov 2022 11:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DFB1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668596284;
	bh=HFRe090hAoSvhl+M81s+hiIdoXrnNZ/L/mLvAv94oq4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUdwTbFj4n9t+FZm7ia0cQSD2B/9yA0f5JaET6y+cVekV1tElQSxQesidjLbUQZzj
	 Qgt1N2M6c7vSI7cUZGqSGgivtPNuWrXHqpB3I2oLz+mmS0thvtIbs3fuV2lGvKn4hB
	 48QLW+9X/kKZsexf6F/NFQJ/Q/Ymjmas7XYM1r1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC4EF800B5;
	Wed, 16 Nov 2022 11:57:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0485F80169; Wed, 16 Nov 2022 11:57:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7F9FAF800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 11:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F9FAF800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1668596226079504013-webhooks-bot@alsa-project.org>
References: <1668596226079504013-webhooks-bot@alsa-project.org>
Subject: bug in the ALSA driver 'snd_usb_audio'
Message-Id: <20221116105708.E0485F80169@alsa1.perex.cz>
Date: Wed, 16 Nov 2022 11:57:08 +0100 (CET)
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

alsa-project/alsa-lib issue #284 was opened from Konfekt:

Hello,

`journalctl -p err` showed the message

```
pulseaudio[15806]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
```

Hopefully this bug tracker reaches the ALSA developers?
Here's more output:

```sh
Nov 15 10:28:58 notebook bluetoothd[1340]: src/profile.c:ext_io_disconnected() Unable to get io data for Hands-Free Voice gateway: getpeername: Transport endpoint is not connected (107)
Nov 15 10:28:58 notebook kernel: Bluetooth: hci0: SCO packet for unknown connection handle 6
Nov 15 10:28:58 notebook kernel: Bluetooth: hci0: SCO packet for unknown connection handle 6
Nov 15 10:28:48 notebook pulseaudio[15806]: mSBC decoding error (-2)
Nov 15 10:14:35 notebook pulseaudio[15806]: Playback too far ahead (4591), drop source 1168
Nov 15 10:14:35 notebook pulseaudio[15806]: Doing resync
Nov 15 10:12:28 notebook pulseaudio[15806]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
Nov 15 10:12:28 notebook pulseaudio[15806]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
Nov 15 10:12:28 notebook pulseaudio[15806]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
Nov 15 10:12:26 notebook pulseaudio[15806]: Playback too far ahead (4613), drop source 1176
Nov 15 10:12:26 notebook pulseaudio[15806]: Doing resync
Nov 15 09:33:13 notebook pulseaudio[15806]: Playback too far ahead (2931), drop source 744
Nov 15 09:33:13 notebook pulseaudio[15806]: Doing resync
Nov 15 09:32:29 notebook bluetoothd[1340]: src/profile.c:ext_io_disconnected() Unable to get io data for Hands-Free Voice gateway: getpeername: Transport endpoint is not connected (107)
Nov 15 09:32:24 notebook bluetoothd[1340]: src/profile.c:ext_io_disconnected() Unable to get io data for Hands-Free Voice gateway: getpeername: Transport endpoint is not connected (107)
```

Curiously my bluetooth headset switches off in Zoom after around five minutes and can't be reenabled. In the hope that this error message gives a hint.
Attached further alsa-infos.

[alsa-info.txt.yOxa5XAE9C.txt](https://github.com/alsa-project/alsa-lib/files/10020916/alsa-info.txt.yOxa5XAE9C.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/284
Repository URL: https://github.com/alsa-project/alsa-lib
