Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05A65D6EB
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 16:10:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD59B624;
	Wed,  4 Jan 2023 16:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD59B624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672845051;
	bh=asD75WQ1JZ05Bqj+PZcO+Mr7ThZw7d4DsFTf94chIVQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MoeJSTDl+LQYMRPe5gopIDfpDgVOeWpdWRnGsdCsUCSwiUnJ6arKvLH8bOAJFyOlt
	 GkuFrBr3Dw2M7zsNSpV+azWBqOhzzRUpPt8evCEP5XygrHm8WXw0FhqeVJxxBLcEld
	 GyCX+6f5vM73xGyXFk2gOOTjtU+sJrKVoV2tnv6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24353F8024D;
	Wed,  4 Jan 2023 16:09:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93B9FF8024D; Wed,  4 Jan 2023 16:09:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9664F8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 16:09:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9664F8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=A68eHuwQ; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IWEP3vG/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 195F13F2BC;
 Wed,  4 Jan 2023 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672844988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Eyx2VCXv/44IIaceO31IA3mmOKXzAkZ91aCVdNo7eVw=;
 b=A68eHuwQOT5cKA4uDWUYniwmRrH7m26tkTf4wp2D258+7tnhExjn0oO3gDSvlF5lG0v+YI
 vXsJyWV+EvKx0sB+bFBfgi/2MXfvQlGaFJyRCR7ZVfB/8/WqeyJxSpsfL/xmyTNf5wtYIf
 Ja2Ax7VOhxXfaD3aP86O0jaGSiq5G+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672844988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Eyx2VCXv/44IIaceO31IA3mmOKXzAkZ91aCVdNo7eVw=;
 b=IWEP3vG/D8++RzBZX5RaqaSwecZ3qDL8EZDxYxsDYdtt5VyASeK36hdG0z/ljCevcMaRUC
 Btx1WRhthiTx9IBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED4BC1342C;
 Wed,  4 Jan 2023 15:09:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oSE0ObuWtWM/aAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 04 Jan 2023 15:09:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: usb-audio: Drop superfluous interface setup at
 parsing"
Date: Wed,  4 Jan 2023 16:09:44 +0100
Message-Id: <20230104150944.24918-1-tiwai@suse.de>
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
Cc: Michael Ralston <michael@ralston.id.au>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This reverts commit ac5e2fb425e1121ceef2b9d1b3ffccc195d55707.

The commit caused a regression on Behringer UMC404HD (and likely
others).  As the change was meant only as a minor optimization, it's
better to revert it to address the regression.

Reported-and-tested-by: Michael Ralston <michael@ralston.id.au>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index f75601ca2d52..f10f4e6d3fb8 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1222,6 +1222,12 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 			if (err < 0)
 				return err;
 		}
+
+		/* try to set the interface... */
+		usb_set_interface(chip->dev, iface_no, 0);
+		snd_usb_init_pitch(chip, fp);
+		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
+		usb_set_interface(chip->dev, iface_no, altno);
 	}
 	return 0;
 }
-- 
2.35.3

