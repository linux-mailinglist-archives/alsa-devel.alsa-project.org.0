Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5F41C05E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:13:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F1D16BA;
	Wed, 29 Sep 2021 10:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F1D16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903185;
	bh=K87iE6vOZ2wXOiabUXzxaiwno8r/wyh5Cvz515VFnBs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Er3RKKJVBwRP8p+uw3fK32cemqWcBLgACx/YSHrYS/F6hnBawggDFcq4L8dj/kCvl
	 W+CU0VHPViHyGFmGQB7V2dOPeKvHmoOnH9FyzhRxmezx9repC4zxkjiGLXuz4PKkl/
	 DbyC3yxypKYIgzwmZr53KP1eQLSWiUV8/V+GLF70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD56F804E5;
	Wed, 29 Sep 2021 10:10:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFEAEF80227; Wed, 29 Sep 2021 10:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 767CEF8026D
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767CEF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zA6HkOUm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="bt0H4QYi"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9655B1FDCE
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kXwh40KTwJbe+weQSAMUUmLiwm/9sP7Q4Z+mBI36YTE=;
 b=zA6HkOUmf7aoiH1Zpw/qi0Idt/7AXSJUy1wkMetKDTzwQmqa8aWiUhRdN74yoMEXeruxgI
 Q6btj+zKv2NzoVBPxijV5gXgeXzASJZ3a7jtzbe4y8br542knBpwYmajgZpfWpm5iF+9xW
 /P7mqDknkUrmzYn+LWLML16IUHLjlfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kXwh40KTwJbe+weQSAMUUmLiwm/9sP7Q4Z+mBI36YTE=;
 b=bt0H4QYimZ4lWWn9bxYx+nr+yyZEjkV9C3qc6a0qFbGqKCPlH9N11hWuyBjiDek6llj/bT
 Sa5Zqo5OxVxsgiAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id 855FF25D65;
 Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/9] ALSA: usb-audio: More fixes / improvements on PCM
Date: Wed, 29 Sep 2021 10:08:35 +0200
Message-Id: <20210929080844.11583-1-tiwai@suse.de>
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

this is a patch set for USB-audio to fix and improve the PCM stream
handling.  The primary target is the enhancement of the low-latency
playback that was introduced recently for dealing with the small
period size (that is used typically by JACK).  There are a few other
fixes that are relevant with it.

The current patches are found in topic/usb-audio branch of sound.git
tree, too.


Takashi

===

Takashi Iwai (9):
  ALSA: usb-audio: Restrict rates for the shared clocks
  ALSA: usb-audio: Fix possible race at sync of urb completions
  ALSA: usb-audio: Rename early_playback_start flag with
    lowlatency_playback
  ALSA: usb-audio: Disable low-latency playback for free-wheel mode
  ALSA: usb-audio: Disable low-latency mode for implicit feedback sync
  ALSA: usb-audio: Check available frames for the next packet size
  ALSA: usb-audio: Add spinlock to stop_urbs()
  ALSA: usb-audio: Improved lowlatency playback support
  ALSA: usb-audio: Avoid killing in-flight URBs during draining

 sound/usb/card.h     |  11 ++-
 sound/usb/endpoint.c | 230 +++++++++++++++++++++++++++++++------------
 sound/usb/endpoint.h |  13 ++-
 sound/usb/pcm.c      | 157 ++++++++++++++++++++++-------
 4 files changed, 305 insertions(+), 106 deletions(-)

-- 
2.26.2

