Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5FA44B22D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 18:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E89E3166A;
	Tue,  9 Nov 2021 18:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E89E3166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636480230;
	bh=OaNcdG5Pnc2D5M+85QjcSc0U+ILnbe4jn9W4G/CHlLk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HfAbIxH6rE6kMHOo/dxio/kKQMa9IxKOQKgGDmJ7S+1plc1Pc1mA/e02iLxxuA9tQ
	 22rebfnSQcc0f0K/v83GfLFOc6bfY4bShl0VIMj1I5Eh1oFM+L6vWWZ/sO3Ao8zSgA
	 Fdc8ZvBJMaglnTurEJVyoLv82dgs3pejXaeEvE0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7B25F800C9;
	Tue,  9 Nov 2021 18:49:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28366F802E3; Tue,  9 Nov 2021 18:49:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B0417F800C9
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 18:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0417F800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636480169411818981-webhooks-bot@alsa-project.org>
References: <1636480169411818981-webhooks-bot@alsa-project.org>
Subject: aaf plugin not working raspberry pi  cm4
Message-Id: <20211109174936.28366F802E3@alsa1.perex.cz>
Date: Tue,  9 Nov 2021 18:49:36 +0100 (CET)
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

alsa-project/alsa-plugins issue #39 was edited from steeley:

trying to send to the ALSA device aaf0. pI cm4 with kernel setup to support avb/tsn correctly. 
(Linux cm432 5.10.76-v7l-AVB_KERNEL+ #3 SMP Sat Nov 6 22:50:41 GMT 2021 armv7l GNU/Linux).

PCIe i210 network card is the interface set up correctly according to: https://tsn.readthedocs.io/avb.html

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
