Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8AF118050
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2071660;
	Tue, 10 Dec 2019 07:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2071660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958874;
	bh=0tcEqTkP2VHHGhkbKySrswevi2EdlhJxA5gxflEL/08=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1cjQcLJrVMWX0+myvWVkW8Sy/AZjn4Fu6cIhTm3FUg7csoXPrB81vOBxMNzqLESz
	 VnTXWQTqNvaxCZIqIDfppOEM1KjwBxkjLYqak5jNG/rLf7WVyl5/ankJVsBxqmp2if
	 3LhhRjiOdjHy3ccqvWJhxIY6+WAMt/p7mBbTpNmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1821F8025F;
	Tue, 10 Dec 2019 07:13:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EE8F80299; Tue, 10 Dec 2019 07:12:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F10AF80256
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F10AF80256
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3206B1DB
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:31 +0100
Message-Id: <20191210061145.24641-10-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 09/23] ALSA: parisc: Drop superfluous ioctl PCM
	ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/parisc/harmony.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
index 1a4c40aafcbe..ea3630217d39 100644
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -578,7 +578,6 @@ snd_harmony_hw_params(struct snd_pcm_substream *ss,
 static const struct snd_pcm_ops snd_harmony_playback_ops = {
 	.open =	snd_harmony_playback_open,
 	.close = snd_harmony_playback_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_harmony_hw_params,
 	.prepare = snd_harmony_playback_prepare,
 	.trigger = snd_harmony_playback_trigger,
@@ -588,7 +587,6 @@ static const struct snd_pcm_ops snd_harmony_playback_ops = {
 static const struct snd_pcm_ops snd_harmony_capture_ops = {
         .open = snd_harmony_capture_open,
         .close = snd_harmony_capture_close,
-        .ioctl = snd_pcm_lib_ioctl,
         .hw_params = snd_harmony_hw_params,
         .prepare = snd_harmony_capture_prepare,
         .trigger = snd_harmony_capture_trigger,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
