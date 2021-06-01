Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DED397806
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 18:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6374216E7;
	Tue,  1 Jun 2021 18:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6374216E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622564849;
	bh=g+oSq2jB+0GHRH20JrZdpppUBub7eGrrxXZzOU0ggfM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QIFpqdFNJzp2PGwZ0Qpi9tY5DvXuKzjPiZIrOJzsdSWWeI3RsN4i9qmL+pmwiLt3A
	 5y7j58gxuWTPYj34QCmFDRVAgiWuLjbEGWBWeqtwkIgaW5vzx71iuz+9qf5dCyH3U5
	 xv7BWQbF+ygj7KqgfGQExF3ZX3lMUB9CsJ145AcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5B24F804C2;
	Tue,  1 Jun 2021 18:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC334F804C2; Tue,  1 Jun 2021 18:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFDF4F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFDF4F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hMhgd+MW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="BitIRvqO"
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8D2BB1FD3F
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622564698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eKpr0G/ycR9AQLuUDiCOGxtLZKGpk+iBP4tmWdOWJ2g=;
 b=hMhgd+MWdYvQSqDgNmJBAqM2KQRWseYiCiTmmflXVMF3by14cLR5IzwVLlhJmGcrCqTzTz
 ok6typZyEQLMRZ3u1uY8PVz15zYyL08Dg3PFvv9i2MO0NtPEC/pAi3LLVdsEcC6TTzYzML
 Cg13l856aCT0uI9ZvRzwSHvl3yKN/vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622564698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eKpr0G/ycR9AQLuUDiCOGxtLZKGpk+iBP4tmWdOWJ2g=;
 b=BitIRvqOQVh0UUjrMnUARBv0K8mTtyXRPk0u2J1sOiS+i0qOJN069+dA9e48roxgCME1Ro
 rUjBkkpQ4K0mZHDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7DFF7A3B83;
 Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ALSA: usb-audio: Delay account cleanup and latency
 reduction
Date: Tue,  1 Jun 2021 18:24:52 +0200
Message-Id: <20210601162457.4877-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

this is a patch set for USB-audio driver for the code refactoring of
PCM delay account as well as the reduction of the playback latency.
The last change is a bit intrusive (despite of the smallness), and
hopefully it won't break things.  My initial tests through various
backends were OK, but if anyone finds a problem, please let me know.


Takashi

===

Takashi Iwai (5):
  ALSA: usb-audio: Make snd_usb_pcm_delay() static
  ALSA: usb-audio: Pre-calculate buffer byte size
  ALSA: usb-audio: Refactoring delay account code
  ALSA: usb-audio: Factor out DSD bitrev copy function
  ALSA: usb-audio: Reduce latency at playback start

 sound/usb/card.h     |   8 +-
 sound/usb/endpoint.c |   1 +
 sound/usb/pcm.c      | 202 ++++++++++++++++++++-----------------------
 sound/usb/pcm.h      |   3 -
 4 files changed, 101 insertions(+), 113 deletions(-)

-- 
2.26.2

