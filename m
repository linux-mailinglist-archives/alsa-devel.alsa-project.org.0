Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD944B22C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 18:49:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DCD71614;
	Tue,  9 Nov 2021 18:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DCD71614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636480197;
	bh=Cwt+X274R02nsxn7Bvu1JEqwcj20hwFnqX2yC+xC0iU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gm0XiiNctT8e7nMWOW4hItX7fTpcBl5JbDHg4r++oUnnskjW/jAj4HDrOCXXjdtIo
	 M+kNGWDLUNH+cpJNYR9vz5S7P7aAWmIk0f726BTDWyyuA5c4Sb+e6LF2Lr2pZsfkra
	 abOspA3+SZHrAXYJ+GWtay0NDEzFWDWt5blJxYok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C111FF80224;
	Tue,  9 Nov 2021 18:48:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96DBAF802D2; Tue,  9 Nov 2021 18:48:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1A691F800C1
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 18:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A691F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636480104621305943-webhooks-bot@alsa-project.org>
References: <1636480104621305943-webhooks-bot@alsa-project.org>
Subject: aaf plugin not working raspberry pi  cm4
Message-Id: <20211109174837.96DBAF802D2@alsa1.perex.cz>
Date: Tue,  9 Nov 2021 18:48:37 +0100 (CET)
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

alsa-project/alsa-plugins issue #39 was opened from steeley:

trying to send to the ALSA device aaf0. pI cm4 with kernel setup to support avb/tsn correctly. PCIe i210 network card is the interface set up correctly according to: https://tsn.readthedocs.io/avb.html

Error is:
`sudo speaker-test -p 2500 -F S16_BE -c 2 -r 48000 -D aaf0

speaker-test 1.1.9

Playback device is aaf0
Stream parameters are 48000Hz, S16_BE, 2 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 1 to 206158430
Period size range from 0 to 206158431
Requested period time 2500 us
Periods = 4
was set period_size = 120
was set buffer_size = 480
 0 - Front Left
ALSA lib pcm_aaf.c:670:(aaf_tx_pdu) Failed to send AAF PDU
Write error: -5,Input/output error
xrun_recovery failed: -5,Input/output error
Transfer failed: Input/output error
`

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/39
Repository URL: https://github.com/alsa-project/alsa-plugins
