Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51B7A18E5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16531DF5;
	Fri, 15 Sep 2023 10:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16531DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766751;
	bh=6GZW4VYhO334GqcfA5kviI5VKIrWka/VZiKPx+hb7FU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n6ejPWTxmC3NAmIOUmDaN/2WnZfWImtDQTler+DM0BN3VygXsLjympClwhqWcnxwX
	 tNEm/rO5PoGT5YDhAbm0NfO/+aJCaqKiOsLSKFaqhtW8TT9sO+1hNSghqDueMcGs2a
	 oksOQL6BfOfCJh4XdnxB7l2boJjHvzZR988MIU34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 792B1F805FB; Fri, 15 Sep 2023 10:28:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 843DAF805F6;
	Fri, 15 Sep 2023 10:28:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42868F805B5; Fri, 15 Sep 2023 10:28:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CA7CF8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CA7CF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=P7hk2bvQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XNCNWWRY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1D211F8A4;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQJxCdg9ODZSuVocQvmMXvKBjHqFBwvUWUlcedySRp4=;
	b=P7hk2bvQR9O8DqKYLIvCPwifNwdU+KWN34WL0r4H06pBKmgi6V7h8rZjUVFQUH3K6qbTuz
	YZmjP6jE2APhvjyPyXFXljje+SQlBpmK4jC9gAwbQlc36PHbyjPU/BCeZdh84kdkVtfLgS
	0JUpCxVBmqY0gmvBKE12iKH6tzfIFk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQJxCdg9ODZSuVocQvmMXvKBjHqFBwvUWUlcedySRp4=;
	b=XNCNWWRYZLy1w40+h85xDA28c3vkYPI//VQ91KQ5PbHwLMvr8M8WjATHyFWkOhcOWUhsTY
	vxTEgRJ54znNWpAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 924761358A;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0FCKIpcVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/13] ALSA: xen: Fix -Wformat-truncation warning
Date: Fri, 15 Sep 2023 10:27:58 +0200
Message-Id: <20230915082802.28684-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GGHQSDBC2X754A35LLWCYZ4YPBJCDNHZ
X-Message-ID-Hash: GGHQSDBC2X754A35LLWCYZ4YPBJCDNHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGHQSDBC2X754A35LLWCYZ4YPBJCDNHZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The compile warning with -Wformat-truncation at
xen_snd_front_cfg_card() is false-positive; the loop can be only for
SNDRV_PCM_DEVICES which is at most 32.

For suppressing the warning, replace snprintf() with scnprintf().
As stated in the above, truncation doesn't matter.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/xen/xen_snd_front_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/xen/xen_snd_front_cfg.c b/sound/xen/xen_snd_front_cfg.c
index 63b0398c3276..55ecf766ca67 100644
--- a/sound/xen/xen_snd_front_cfg.c
+++ b/sound/xen/xen_snd_front_cfg.c
@@ -483,7 +483,7 @@ int xen_snd_front_cfg_card(struct xen_snd_front_info *front_info,
 	*stream_cnt = 0;
 	num_devices = 0;
 	do {
-		snprintf(node, sizeof(node), "%d", num_devices);
+		scnprintf(node, sizeof(node), "%d", num_devices);
 		if (!xenbus_exists(XBT_NIL, xb_dev->nodename, node))
 			break;
 
-- 
2.35.3

