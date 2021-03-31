Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F992350600
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 20:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157CE166C;
	Wed, 31 Mar 2021 20:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157CE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617214131;
	bh=3/CE3oRHg72V8b7Fk1805AAHlnolMUCDJnxX0kHho/s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hBiCC37lrQWVgaXIW09lGyfCLIQonPfEVTSDsPKnW2l9h8Z8OwzZWuVCcl0sNcc9f
	 59iBYIU2dqwXphdUiELl6oZbKYzwwxBhaGvrv3DgU3uhvmsQgRyAqfT88Cke0Edvsm
	 TwI9HOt6gLObnt+VQ1BBxIQNpGuKQXldHdnMXZF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 557A1F8013C;
	Wed, 31 Mar 2021 20:07:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92908F80166; Wed, 31 Mar 2021 20:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B265F8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 20:07:15 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DFDF9A003F;
 Wed, 31 Mar 2021 20:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DFDF9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617214034; bh=89UAT3H+FudHBByiG5r5QCfyI3+anXMRf4mS7bBqg20=;
 h=From:To:Cc:Subject:Date:From;
 b=33+TmjtETzmL/Xj5aH9GDwBhnzPnIPeh+bL3jV/YjCW03W8+7UZCMf5PzsUpYmTr3
 5H/XDyzJs2tFGiCMzkNNzAC3lQmOYdevtd3djPL6MfpwjqZAf0GwsADffyxcO7Kfux
 yuC9tReDlxmhUyZK1lTwSe7h9YUfqCK04tFnre7Y=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 31 Mar 2021 20:07:11 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: control - add the missing prev_lops2 initialization
Date: Wed, 31 Mar 2021 20:07:02 +0200
Message-Id: <20210331180702.663489-1-perex@perex.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

As static analysis reported, the prev_lops2 should contain
the previous lops2 pointer in snd_ctl_disconnect_layer().

Link: https://lore.kernel.org/alsa-devel/96e9bd5c-c8db-0db8-b393-fbf4a047dc80@canonical.com/
Fixes: 3f0638a0333b ("ALSA: control - add layer registration routines")
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/control.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 6825ca75daf5..20d707d4ef40 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2074,7 +2074,7 @@ void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops)
 	struct snd_ctl_layer_ops *lops2, *prev_lops2;
 
 	down_write(&snd_ctl_layer_rwsem);
-	for (lops2 = snd_ctl_layer, prev_lops2 = NULL; lops2; lops2 = lops2->next)
+	for (lops2 = snd_ctl_layer, prev_lops2 = NULL; lops2; lops2 = lops2->next) {
 		if (lops2 == lops) {
 			if (!prev_lops2)
 				snd_ctl_layer = lops->next;
@@ -2082,6 +2082,8 @@ void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops)
 				prev_lops2->next = lops->next;
 			break;
 		}
+		prev_lops2 = lops2;
+	}
 	up_write(&snd_ctl_layer_rwsem);
 }
 EXPORT_SYMBOL_GPL(snd_ctl_disconnect_layer);
-- 
2.30.2
