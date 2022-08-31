Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8795A7E2D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 15:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A0F16E1;
	Wed, 31 Aug 2022 15:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A0F16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661950880;
	bh=hNTgPhMZOYlaQ2Bwk7BTaMctImoMyHbqGyNWoeYLmzg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fSyFg9u32hdDh9f4XVG1aIafbOP0WLCk0fvdvY7uWa9PaOW//gxbHiU2rebgH8LSB
	 Mv+dq9rJiXF7U30wGHFBFRacq6F0T4r1zUyH9o5xLJaw/Es77Gg0Psw8h+FUW2FdxB
	 Xa8BT8k02z6K7pPMsvFQjkSvaKT6jusjAtiqXLLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 243B9F8012A;
	Wed, 31 Aug 2022 15:00:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34B02F80448; Wed, 31 Aug 2022 15:00:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28298F8012A
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 15:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28298F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0iW5CQDH"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ONrfoXoo"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB52A1F893;
 Wed, 31 Aug 2022 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661950822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=izN0ojj1I8D9jdz8HTA6N9/BEZOPiFZCpfdkgqxfkh8=;
 b=0iW5CQDH2hUwGyQQ4w0BJJn1a1804Fjq7TR0Z2t+S3cUlNYiXTPQUkZpc9O8iW9qOvuLeJ
 zhfq9w+fVi/bwzHZUeChfXOaycTk4vCXxMFfM5uBrnIECQ5WEIEp7gvcmVnO+a58UfSTN0
 UthA5O+j4l3eP4pq6LVwyi6JHd4hxnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661950822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=izN0ojj1I8D9jdz8HTA6N9/BEZOPiFZCpfdkgqxfkh8=;
 b=ONrfoXooc97GEg16Uakdn5FBOqGntkdo27Qn2jilfoHTtnDgOXX9lZd/s/gtE9h532qnB6
 F6GUhxEc8oKVjVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F25A13A7C;
 Wed, 31 Aug 2022 13:00:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wWpHImZbD2MVKwAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 31 Aug 2022 13:00:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Drop superfluous interface setup at parsing
Date: Wed, 31 Aug 2022 15:00:21 +0200
Message-Id: <20220831130021.4762-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

We reset each interface that is being parsed for each stream, but this
is superfluous and even can lead to spurious errors.  Since the
interface is set up properly at opening the endpoint for each actual
stream operation, let's drop the superfluous one.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index ceb93d798182..99578e9a8af0 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1221,12 +1221,6 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 			if (err < 0)
 				return err;
 		}
-
-		/* try to set the interface... */
-		usb_set_interface(chip->dev, iface_no, 0);
-		snd_usb_init_pitch(chip, fp);
-		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
-		usb_set_interface(chip->dev, iface_no, altno);
 	}
 	return 0;
 }
-- 
2.35.3

