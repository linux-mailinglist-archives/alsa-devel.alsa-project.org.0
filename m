Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C397669A11
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 15:27:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97597AAA8;
	Fri, 13 Jan 2023 15:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97597AAA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673620068;
	bh=jz1pMXh18ppcBDQ08RIRFkUrhb7QFjFVPCcYIKJU5zU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Es2RrX5uGUt+6oAkucgpsmXBVvRXwpjLGEKnlTje9P4aVDzNV2TKO5w5IRgSAPzlk
	 uqiugN+nw9KWTMAFAWc9PUyOnhn7F2jM5shDOUjVBPds+RM0ZaX8qG9J+X+wPTAELI
	 YuP4+52BdyJL1ZUVs9QvkyBw7fR5szPmAonsq45E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F78F8016D;
	Fri, 13 Jan 2023 15:26:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C3CF8030F; Fri, 13 Jan 2023 15:26:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6992F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 15:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6992F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Jtmx8qSh; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1XFKdmKo
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AEE356077A;
 Fri, 13 Jan 2023 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673620005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZlT0bW1RT1S/RjUud1OHBkBdTWci8dCpwsYwHEA60CU=;
 b=Jtmx8qSh10mse1aghzGf5O2OJpk2ANrzQQJ5UjROd+nkGRzzkpW181UYRfbFuNUdiZx/AR
 mP9smr3XuGiJPpkaCClRrUHpB5OLjkNkOmrbVeOKK3dxAkgSQRja2ayHRV2XxI7ks2di8b
 3SXt2oNX2EI1jeRd4c+CBnjsuRMGNGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673620005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZlT0bW1RT1S/RjUud1OHBkBdTWci8dCpwsYwHEA60CU=;
 b=1XFKdmKo9XRjBZi/aLaSro2SdtveCWAwmQm5jYelTynOhKUoWeko+Nsx4AREXPY9iHKZt0
 LaJJafmXd/Vr/FDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 84F701358A;
 Fri, 13 Jan 2023 14:26:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DeG5HyVqwWOTGAAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 13 Jan 2023 14:26:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH 5.10.y] ALSA: pcm: Properly take rwsem lock in
 ctl_elem_read_user/ctl_elem_write_user to prevent UAF
Date: Fri, 13 Jan 2023 15:26:39 +0100
Message-Id: <20230113142639.4420-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Clement Lecigne <clecigne@google.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Clement Lecigne <clecigne@google.com>

[ Note: this is a fix that works around the bug equivalently as the
  two upstream commits:
   1fa4445f9adf ("ALSA: control - introduce snd_ctl_notify_one() helper")
   56b88b50565c ("ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to prevent UAF")
  but in a simpler way to fit with older stable trees -- tiwai ]

Add missing locking in ctl_elem_read_user/ctl_elem_write_user which can be
easily triggered and turned into an use-after-free.

Example code paths with SNDRV_CTL_IOCTL_ELEM_READ:

64-bits:
snd_ctl_ioctl
  snd_ctl_elem_read_user
    [takes controls_rwsem]
    snd_ctl_elem_read [lock properly held, all good]
    [drops controls_rwsem]

32-bits (compat):
snd_ctl_ioctl_compat
  snd_ctl_elem_write_read_compat
    ctl_elem_write_read
      snd_ctl_elem_read [missing lock, not good]

CVE-2023-0266 was assigned for this issue.

Signed-off-by: Clement Lecigne <clecigne@google.com>
Cc: stable@kernel.org # 5.12 and older
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Greg, this is a patch for the last ALSA PCM UCM fix for the older
stable trees.  Please take this to 5.10.y and older stable trees.
Thanks!

 sound/core/control_compat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 97467f6a32a1..980ab3580f1b 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -304,7 +304,9 @@ static int ctl_elem_read_user(struct snd_card *card,
 	err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
 	if (err < 0)
 		goto error;
+	down_read(&card->controls_rwsem);
 	err = snd_ctl_elem_read(card, data);
+	up_read(&card->controls_rwsem);
 	if (err < 0)
 		goto error;
 	err = copy_ctl_value_to_user(userdata, valuep, data, type, count);
@@ -332,7 +334,9 @@ static int ctl_elem_write_user(struct snd_ctl_file *file,
 	err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
 	if (err < 0)
 		goto error;
+	down_write(&card->controls_rwsem);
 	err = snd_ctl_elem_write(card, file, data);
+	up_write(&card->controls_rwsem);
 	if (err < 0)
 		goto error;
 	err = copy_ctl_value_to_user(userdata, valuep, data, type, count);
-- 
2.35.3

