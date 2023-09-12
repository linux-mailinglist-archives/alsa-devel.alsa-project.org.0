Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7979C922
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 10:00:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DFBF820;
	Tue, 12 Sep 2023 09:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DFBF820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694505648;
	bh=UMlqvftHd71InXkEEH8GqtJoRPeKoeI1iePTNtzy02Y=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kI80n5Zoiq+aoygQ5yQEfzEY/ne9EDadYDsHxc9InI2e5WIBdeg9QO9ojXRYxR1m0
	 2ts9n+LWYLF2FhxmfEVqWkMwuCHiDwZmq7eN5ZIEv/uzNoKOU0yuMGBxyh3PTJW7I9
	 oBi+ptFJVUzQD610T6pKe9wOgZfllLcGiatfVWFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCA10F80537; Tue, 12 Sep 2023 09:59:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 931CFF80212;
	Tue, 12 Sep 2023 09:59:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F5DBF80246; Tue, 12 Sep 2023 09:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DB88F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 09:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB88F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Keqtg3gP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Y5oWG33o
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 127CB1F74A;
	Tue, 12 Sep 2023 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694505588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=q6dLD9wEF7wEtB19ToFRzV85Vn1IyawFIpEmwm2C/B4=;
	b=Keqtg3gPFQuyOco3l2ueAurraCzM3dji74FW4o5tCIeajx1U/eLGLRthZjgrFjyLjY1BgG
	IrmmAfkjPFrzWAyEIZMfexezbDHpwVBZFJlQpFaz+iXM+fCc2vCkygZcUYw9+b0N26dHNL
	OWTGBe7gp9MWvPqKmgUDID6mmYBosa8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694505588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=q6dLD9wEF7wEtB19ToFRzV85Vn1IyawFIpEmwm2C/B4=;
	b=Y5oWG33ostgzrqGVjAtnyY9Qf6Ke88hDEkK31xJzlKAvjb625XF1qWvkBmokI951NBqv4I
	YKNvNp/+vrAUPNAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7A5D13A39;
	Tue, 12 Sep 2023 07:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mT59N3MaAGV0DQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 12 Sep 2023 07:59:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: docs: Fix a typo of midi2_ump_probe option for
 snd-usb-audio
Date: Tue, 12 Sep 2023 09:59:44 +0200
Message-Id: <20230912075944.14032-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YLBJCLNHLSSTYHDB47VEBCWGXSUINT2F
X-Message-ID-Hash: YLBJCLNHLSSTYHDB47VEBCWGXSUINT2F
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLBJCLNHLSSTYHDB47VEBCWGXSUINT2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A simple typo fix: midi2_probe => midi2_ump_probe.

Fixes: febdfa0e9c8a ("ALSA: docs: Update MIDI 2.0 documentation for UMP 1.1 enhancement")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/designs/midi-2.0.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/designs/midi-2.0.rst b/Documentation/sound/designs/midi-2.0.rst
index 45987f256b97..086487ca7ab1 100644
--- a/Documentation/sound/designs/midi-2.0.rst
+++ b/Documentation/sound/designs/midi-2.0.rst
@@ -74,8 +74,8 @@ topology based on those information.  When the device is older and
 doesn't respond to the new UMP inquiries, the driver falls back and
 builds the topology based on Group Terminal Block (GTB) information
 from the USB descriptor.  Some device might be screwed up by the
-unexpected UMP command; in such a case, pass `midi2_probe=0` option to
-snd-usb-audio driver for skipping the UMP v1.1 inquiries.
+unexpected UMP command; in such a case, pass `midi2_ump_probe=0`
+option to snd-usb-audio driver for skipping the UMP v1.1 inquiries.
 
 When the MIDI 2.0 device is probed, the kernel creates a rawmidi
 device for each UMP Endpoint of the device.  Its device name is
-- 
2.35.3

