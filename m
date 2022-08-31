Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057D5A7E2C
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 15:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0991016DA;
	Wed, 31 Aug 2022 14:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0991016DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661950847;
	bh=ns/0eGKf3ZGfZHDYuR1QKNX0edBW8Ck848SZeuFzKnk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWZ6KrPoXFuOgOA/Pf4H1yuNiOWky8RNZtAZi/EW+T9pBA8Fu3LxgZT8nmrX1KfVc
	 Qc2E7QFgQSfCKsbxzDi5td5Sw6/LC0CSGLh38RlTlAG/x1bTwlpR1AYaJHn1s/CayN
	 432bWYjEDBYLqxbMWsXHD+Himvc00nSLSXEK9ys4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 895FDF804AA;
	Wed, 31 Aug 2022 14:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BBF0F8012A; Wed, 31 Aug 2022 14:59:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B9FF80236
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 14:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B9FF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="EwCjc/ty"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1TBXOiGT"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD5901F85D;
 Wed, 31 Aug 2022 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661950748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2WcNl21tqiIqJma1/v60ED5kjw4ECYCIBoTdL0aQHc=;
 b=EwCjc/ty5mI+ol5SMTboqRtMEzVDW1EGppdkpo+ACyX7yyXxEfJm9P4uTLi2yngGKeO3CI
 Ml34Zin6BLuqO1UhR33vJPSvsLnpt0rUVUXQOs9L89Xa7HSVl9EQGIEVRAG78te15Qt7CS
 +keyu+6+GzOVq6/pxno5JLO19HRF2mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661950748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2WcNl21tqiIqJma1/v60ED5kjw4ECYCIBoTdL0aQHc=;
 b=1TBXOiGTrYg0mJ6vFs0RBJNGt0erXy2rojCt2jqtd7WwKWjdOxGlQ1/XwAA+diaRYbLjLN
 xuli2IAOaeCDveBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3E3F13A7C;
 Wed, 31 Aug 2022 12:59:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cIA9JxxbD2NOKgAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 31 Aug 2022 12:59:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Register card again for iface over
 delayed_register option
Date: Wed, 31 Aug 2022 14:59:01 +0200
Message-Id: <20220831125901.4660-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220831125901.4660-1-tiwai@suse.de>
References: <20220831125901.4660-1-tiwai@suse.de>
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

When the delayed registration is specified via either delayed_register
option or the quirk, we delay the invocation of snd_card_register()
until the given interface.  But if a wrong value has been set there
and there are more interfaces over the given interface number,
snd_card_register() call would be missing for those interfaces.

This patch catches up those missing calls by fixing the comparison of
the interface number.  Now the call is skipped only if the processed
interface is less than the given interface, instead of the exact
match.

Fixes: b70038ef4fea ("ALSA: usb-audio: Add delayed_register option")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216082
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c   | 2 +-
 sound/usb/quirks.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index d356743de2ff..706d249a9ad6 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -699,7 +699,7 @@ static bool check_delayed_register_option(struct snd_usb_audio *chip, int iface)
 		if (delayed_register[i] &&
 		    sscanf(delayed_register[i], "%x:%x", &id, &inum) == 2 &&
 		    id == chip->usb_id)
-			return inum != iface;
+			return iface < inum;
 	}
 
 	return false;
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 9bfead5efc4c..5b4d8f5eade2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1764,7 +1764,7 @@ bool snd_usb_registration_quirk(struct snd_usb_audio *chip, int iface)
 
 	for (q = registration_quirks; q->usb_id; q++)
 		if (chip->usb_id == q->usb_id)
-			return iface != q->interface;
+			return iface < q->interface;
 
 	/* Register as normal */
 	return false;
-- 
2.35.3

