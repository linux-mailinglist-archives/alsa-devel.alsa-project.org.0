Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47384F88D0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 23:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F213185A;
	Thu,  7 Apr 2022 23:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F213185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649366932;
	bh=k5Mar86CNsyDfkxz8JiWBxcfFXFhQ5wQfXpIynJ+yfE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qOO8hWpd0OeezLQn1Vmx0zxXWW48izYoR6E1zY5ed6UWSBXlUJrrPd+Rz5SX9RQhL
	 5yo5B1vRvRfIdx4zB2b+TrkZF1y13+UnnEUeOURzrJ5658xoOQI5a/H4fwT5EyHHIm
	 7fQFxYzPgB+6VAGwXY+nff5I7wbl278Xa0qmE9qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5F87F80085;
	Thu,  7 Apr 2022 23:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A2A6F8024C; Thu,  7 Apr 2022 23:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28199F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 23:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28199F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="jlQY6f4B"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Ui6lv4bq"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1CF1B215FC
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649366862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2DzTawTuxO+bRleok6q8WKcvEQkXZJPzRC91/R8m3KQ=;
 b=jlQY6f4BEMIiFhvfGfOjoD0Rxh7ujml5M5RshHoOBBy+733JN77hpSGhVW82cZAnZZ60Qn
 jZehdkwLzv0KqlM8eZVwAH2Yy+yEG1cAJtOyfNwPcA4q6xAuCxLwAbfNyX/bmUxzKl8z4b
 cBKVhhQPCpX55SeJnKWM0jfJvgh07SY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649366862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2DzTawTuxO+bRleok6q8WKcvEQkXZJPzRC91/R8m3KQ=;
 b=Ui6lv4bq6stl2cultax8aivZ4QF3PAUKyjN9or7ewUCmehFxqMY1YQ0/GklMNepq1s4fWr
 8cj0GCclaTTssiAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0CC06A3B82;
 Thu,  7 Apr 2022 21:27:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Increase max buffer size
Date: Thu,  7 Apr 2022 23:27:40 +0200
Message-Id: <20220407212740.17920-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

The current limit of max buffer size 1MB seems too small for modern
devices with lots of channels and high sample rates.
Let's make bigger, 4MB.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 6a460225f2e3..37ee6df8b15a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -659,7 +659,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 #define hwc_debug(fmt, args...) do { } while(0)
 #endif
 
-#define MAX_BUFFER_BYTES	(1024 * 1024)
+#define MAX_BUFFER_BYTES	(4 * 1024 * 1024)
 #define MAX_PERIOD_BYTES	(512 * 1024)
 
 static const struct snd_pcm_hardware snd_usb_hardware =
-- 
2.31.1

