Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C73FF88F
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 09:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEE4168C;
	Sun, 17 Nov 2019 09:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEE4168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573980911;
	bh=JBjNWF96kyxAFIM023p0cqv00TaTnQkk23uSBgO0x9Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RZ5CTllNqwD44ZQH4/goVvlHNFqakb/0S8WPio5Pyj4Z0d3UP8oTAfgEBeTBxiFYL
	 orNecpN8wEs81/oModTvfkJfIgFpfcjYZaJlHK3sgfR26GMY8hnDLzjUtYHYIGaMvZ
	 edncsaG5u3vCGlXMr6NNd+IwfRPORL/W4oQgsmko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AEAF8013D;
	Sun, 17 Nov 2019 09:53:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B3DCF8013D; Sun, 17 Nov 2019 09:53:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56CC4F80137
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56CC4F80137
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 031EBB206
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:04 +0100
Message-Id: <20191117085308.23915-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191117085308.23915-1-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 4/8] ALSA: docs: Update document about the
	default PCM ioctl ops
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

Mention that it's completely optional now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 1086b35db2af..145bf6aad7cb 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1341,7 +1341,6 @@ shows only the skeleton, how to build up the PCM interfaces.
       static struct snd_pcm_ops snd_mychip_playback_ops = {
               .open =        snd_mychip_playback_open,
               .close =       snd_mychip_playback_close,
-              .ioctl =       snd_pcm_lib_ioctl,
               .hw_params =   snd_mychip_pcm_hw_params,
               .hw_free =     snd_mychip_pcm_hw_free,
               .prepare =     snd_mychip_pcm_prepare,
@@ -1353,7 +1352,6 @@ shows only the skeleton, how to build up the PCM interfaces.
       static struct snd_pcm_ops snd_mychip_capture_ops = {
               .open =        snd_mychip_capture_open,
               .close =       snd_mychip_capture_close,
-              .ioctl =       snd_pcm_lib_ioctl,
               .hw_params =   snd_mychip_pcm_hw_params,
               .hw_free =     snd_mychip_pcm_hw_free,
               .prepare =     snd_mychip_pcm_prepare,
@@ -1456,7 +1454,6 @@ The operators are defined typically like this:
   static struct snd_pcm_ops snd_mychip_playback_ops = {
           .open =        snd_mychip_pcm_open,
           .close =       snd_mychip_pcm_close,
-          .ioctl =       snd_pcm_lib_ioctl,
           .hw_params =   snd_mychip_pcm_hw_params,
           .hw_free =     snd_mychip_pcm_hw_free,
           .prepare =     snd_mychip_pcm_prepare,
@@ -1913,7 +1910,10 @@ ioctl callback
 ~~~~~~~~~~~~~~
 
 This is used for any special call to pcm ioctls. But usually you can
-pass a generic ioctl callback, :c:func:`snd_pcm_lib_ioctl()`.
+leave it as NULL, then PCM core calls the generic ioctl callback
+function :c:func:`snd_pcm_lib_ioctl()`.  If you need to deal with the
+unique setup of channel info or reset procedure, you can pass your own
+callback function here.
 
 hw_params callback
 ~~~~~~~~~~~~~~~~~~~
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
