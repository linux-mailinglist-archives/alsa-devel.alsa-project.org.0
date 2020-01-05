Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337CF130889
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:05:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABDBC17D1;
	Sun,  5 Jan 2020 16:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABDBC17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236755;
	bh=WCZZ8ofhST+wltPXjSN8Sah9YxfK+IoycfPUz43zYHI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9cj/CM7zfEkGoTfbQqiSkTYyvGBJT4mP+a2Q/RYsfJSBpwzZmko6hLXIFv+YPYux
	 XHlTYk1DtoD0PhkM5TBWev8Xg8KAvaEf59Bcy8xlV5BeqTpNnxUXLpPZUc/igZX0Pz
	 225p8OMffatMij1QtqbUZFwf2Cy6fWvxPvhm+nOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90688F802E7;
	Sun,  5 Jan 2020 15:49:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4227BF80347; Sun,  5 Jan 2020 15:49:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B8C7F8028A
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B8C7F8028A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C2138B233
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:37 +0100
Message-Id: <20200105144823.29547-23-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 22/68] ALSA: usx2y: More constifications
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

Apply const prefix to each possible place: the string array and the
parameter tables and callers.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usX2Yhwdep.c    | 2 +-
 sound/usb/usx2y/usbusx2yaudio.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index 0e6d82b5778e..22412cd69e98 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -94,7 +94,7 @@ static __poll_t snd_us428ctls_poll(struct snd_hwdep *hw, struct file *file, poll
 static int snd_usX2Y_hwdep_dsp_status(struct snd_hwdep *hw,
 				      struct snd_hwdep_dsp_status *info)
 {
-	static char *type_ids[USX2Y_TYPE_NUMS] = {
+	static const char * const type_ids[USX2Y_TYPE_NUMS] = {
 		[USX2Y_TYPE_122] = "us122",
 		[USX2Y_TYPE_224] = "us224",
 		[USX2Y_TYPE_428] = "us428",
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index c7dbc0f94efb..772f6f3ccbb1 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -549,7 +549,7 @@ static int snd_usX2Y_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
  * if sg buffer is supported on the later version of alsa, we'll follow
  * that.
  */
-static struct s_c2
+static const struct s_c2
 {
 	char c1, c2;
 }
@@ -589,7 +589,7 @@ static struct s_c2
 	{ 0x18, 0x7C},
 	{ 0x18, 0x7E}
 };
-static struct s_c2 SetRate48000[] =
+static const struct s_c2 SetRate48000[] =
 {
 	{ 0x14, 0x09},	// this line sets 48000, well actually a little less
 	{ 0x18, 0x40},	// only tascam / frontier design knows the further lines .......
@@ -642,7 +642,7 @@ static int usX2Y_rate_set(struct usX2Ydev *usX2Y, int rate)
 	int			err = 0, i;
 	struct snd_usX2Y_urbSeq	*us = NULL;
 	int			*usbdata = NULL;
-	struct s_c2		*ra = rate == 48000 ? SetRate48000 : SetRate44100;
+	const struct s_c2	*ra = rate == 48000 ? SetRate48000 : SetRate44100;
 
 	if (usX2Y->rate != rate) {
 		us = kzalloc(sizeof(*us) + sizeof(struct urb*) * NOOF_SETRATE_URBS, GFP_KERNEL);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
