Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEF75F8AB8
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 12:44:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D23041699;
	Sun,  9 Oct 2022 12:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D23041699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665312268;
	bh=7QpxV0g7vvFkYEskhnouI40Pm1s1Ztcw7wVbN4T/3kU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKWV+WIbF+UcOsqXnw5M1xM2VnXp/y5eJYvpFkWC1gq10zKpMdhc0ZIXEoZLnQqaP
	 FqHbZN15cVrwsxGP24LHeTfYo4RrBV2vo/YFWPSDHb7iDGoUyPziHRk3XNuUa1rbcN
	 ARG1/SnbIkXuvQCMvuitCzvPuuVfyKhDH6nYnf9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A2D5F80552;
	Sun,  9 Oct 2022 12:42:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D04A8F80137; Sun,  9 Oct 2022 12:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 588CFF8052D
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 12:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 588CFF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="UtvuoI8G"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Biyt6ivu"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB00E218D6;
 Sun,  9 Oct 2022 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665312135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVj340hVAF1Zp0Hd1iqtwpnN1AONA+fMt1ZEUSy1EFE=;
 b=UtvuoI8GZQlTjMfVpDRP49rDgoYIQOtVfiOsnNRf2Fi+WlvdvlFz0H+Q4274BmlPLd8Lp9
 dQ8ZYd6nvn0S5VhEVjRMCLmrSE1EuVZNgrzhOzyK3G+XzfMXiJQSWia/PiIz6zC41WFToG
 9HK8gDAM68AHm35YCsDmwtl/itvzSOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665312135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVj340hVAF1Zp0Hd1iqtwpnN1AONA+fMt1ZEUSy1EFE=;
 b=Biyt6ivu/VNFJLu42IEDwbQT0CrvgBJ95VvcJ8IdgyF/2UXS6yEw1aUm5PC5CGhbFLwUVm
 cBSJnZqlpfZXnfAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FBB913AC8;
 Sun,  9 Oct 2022 10:42:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6OlDJoelQmMsfAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 09 Oct 2022 10:42:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: usb-audio: Avoid unnecessary interface change at EP
 close
Date: Sun,  9 Oct 2022 12:42:09 +0200
Message-Id: <20221009104212.18877-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221009104212.18877-1-tiwai@suse.de>
References: <20221009104212.18877-1-tiwai@suse.de>
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

We toggle USB interface at PCM prepare and reset at close.  When the
PCM isn't prepared, resetting again makes little sense.
Check the current altset and avoid unnecessary interface reset at EP
close.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 48a3843a08f1..f21acbc9f4f4 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -32,6 +32,7 @@ struct snd_usb_iface_ref {
 	unsigned char iface;
 	bool need_setup;
 	int opened;
+	int altset;
 	struct list_head list;
 };
 
@@ -899,6 +900,9 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 	int altset = set ? ep->altsetting : 0;
 	int err;
 
+	if (ep->iface_ref->altset == altset)
+		return 0;
+
 	usb_audio_dbg(chip, "Setting usb interface %d:%d for EP 0x%x\n",
 		      ep->iface, altset, ep->ep_num);
 	err = usb_set_interface(chip->dev, ep->iface, altset);
@@ -910,6 +914,7 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 
 	if (chip->quirk_flags & QUIRK_FLAG_IFACE_DELAY)
 		msleep(50);
+	ep->iface_ref->altset = altset;
 	return 0;
 }
 
-- 
2.35.3

