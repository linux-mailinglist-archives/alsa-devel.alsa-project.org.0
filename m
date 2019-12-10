Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8100118044
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:18:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648181662;
	Tue, 10 Dec 2019 07:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648181662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958704;
	bh=kc4e9rtWLVtmg1MY2laixboc7Gbl03yXpCAaAXQl80M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NU9K8d49LA3XC/M8/J6U1SyNWngD5znCCzXCLBu5TEDgERRUM0k8v7REXDh9lHXWY
	 59AamFUGxmhDHelAUBkWc+qk5x1OhZHBuTWQDQEhcTRkotX0HMS7F+5Eaz5tJbeHoV
	 gf5cw9H/vT3IpA+rKAwN5TIYRLRXL6Xe8/4BJ+rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D80DEF8020C;
	Tue, 10 Dec 2019 07:12:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87025F8028A; Tue, 10 Dec 2019 07:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 829EFF80257
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829EFF80257
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ADB2EB1D7
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:28 +0100
Message-Id: <20191210061145.24641-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 06/23] ALSA: es1688: Drop superfluous ioctl PCM
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

snd_es1688_ioctl() does nothing but calling the default handler.
Now PCM core accepts NULL as the default ioctl ops, so let's drop
altogether.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es1688/es1688_lib.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index d2c268595168..474d713085c7 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -309,12 +309,6 @@ static void snd_es1688_set_rate(struct snd_es1688 *chip, struct snd_pcm_substrea
 	snd_es1688_write(chip, 0xa2, divider);
 }
 
-static int snd_es1688_ioctl(struct snd_pcm_substream *substream,
-			    unsigned int cmd, void *arg)
-{
-	return snd_pcm_lib_ioctl(substream, cmd, arg);
-}
-
 static int snd_es1688_trigger(struct snd_es1688 *chip, int cmd, unsigned char value)
 {
 	int val;
@@ -681,7 +675,6 @@ int snd_es1688_create(struct snd_card *card,
 static const struct snd_pcm_ops snd_es1688_playback_ops = {
 	.open =			snd_es1688_playback_open,
 	.close =		snd_es1688_playback_close,
-	.ioctl =		snd_es1688_ioctl,
 	.prepare =		snd_es1688_playback_prepare,
 	.trigger =		snd_es1688_playback_trigger,
 	.pointer =		snd_es1688_playback_pointer,
@@ -690,7 +683,6 @@ static const struct snd_pcm_ops snd_es1688_playback_ops = {
 static const struct snd_pcm_ops snd_es1688_capture_ops = {
 	.open =			snd_es1688_capture_open,
 	.close =		snd_es1688_capture_close,
-	.ioctl =		snd_es1688_ioctl,
 	.prepare =		snd_es1688_capture_prepare,
 	.trigger =		snd_es1688_capture_trigger,
 	.pointer =		snd_es1688_capture_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
