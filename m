Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FB38DA9E
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:12:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E0A516BD;
	Sun, 23 May 2021 11:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E0A516BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621761124;
	bh=GGNeA05x7NyYMP3p5cuvtQTMgEhv1do4Oq+7yzZJVWc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eyp78oMWbsl+sg0CR+J7wDzrWKYZ8FP98HnJIk4JKm8lvlFiP5QxyVRvBKAtKnTei
	 ELs2ODWrirKoEW9T/MAT/v7xX/1z+Z9CdbzVtXogKA46QHdwADOSewurvuHhqm5VZS
	 AeZj2Y0wfG+98SCmd1bzFvihV+8Qz4Lfuz3bKhW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F2AF80482;
	Sun, 23 May 2021 11:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1415F80431; Sun, 23 May 2021 11:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD00F8019D
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD00F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="i8WYleaE"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="pOf7WpWB"
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621760963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kksj6JAYCRyfPoOofXMhONWKLLpL61DABkFjrb0ECks=;
 b=i8WYleaE5ZS9dvOkbVw+1MBeMF7lrBeqQJPGIis+dHpKymtixYZ99CYzay2Hq9iOeP2Hdv
 XirYFbPowimJz0yVjDd7KTQKfuPTvx6iuZtzlzckZ06CG4vxrXGpvgurNg8Y6ySYGkubpW
 rujqKBYlDpc+lZe/4DGkjrhdzi+fMIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621760963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kksj6JAYCRyfPoOofXMhONWKLLpL61DABkFjrb0ECks=;
 b=pOf7WpWBpWKpP4gbIqAG6niUTn84CB/mfLNLX+mg2IfwVEJIfubNAGQVVE6Z8bxXKfmnW/
 Gt5Xjt/tCZAmKdDA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27FB3AC8B;
 Sun, 23 May 2021 09:09:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/6] ALSA: control: Minor optimization for
 SNDRV_CTL_IOCTL_POWER_STATE
Date: Sun, 23 May 2021 11:09:18 +0200
Message-Id: <20210523090920.15345-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210523090920.15345-1-tiwai@suse.de>
References: <20210523090920.15345-1-tiwai@suse.de>
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

Long long time ago, before the proper PM framework was introduced, it
was still possible to reach SNDRV_CTL_IOCTL_POWER ioctl during the
power off state.  This ioctl existed as a main control for the suspend
resume state in the past, but the feature was already dropped along
with the standard PM framework.  Now the read part,
SNDRV_IOCTL_POWER_STATE ioctl, returns practically always D0, and we
can do some minor optimization there.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 7fe901384c9c..a25c0d64d104 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1817,11 +1817,7 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 	case SNDRV_CTL_IOCTL_POWER:
 		return -ENOPROTOOPT;
 	case SNDRV_CTL_IOCTL_POWER_STATE:
-#ifdef CONFIG_PM
-		return put_user(card->power_state, ip) ? -EFAULT : 0;
-#else
 		return put_user(SNDRV_CTL_POWER_D0, ip) ? -EFAULT : 0;
-#endif
 	}
 	down_read(&snd_ioctl_rwsem);
 	list_for_each_entry(p, &snd_control_ioctls, list) {
-- 
2.26.2

