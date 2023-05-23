Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E415370D67A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58002DF3;
	Tue, 23 May 2023 09:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58002DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828845;
	bh=JaUED+G155puuptz0gwi+7lH9b4tOqmNtl/tWfoSQ7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ti+sjX3F5QcLPDpnaZF90hC+krFChsV2SfJSkITCXJrYJ20ZcbeCKzbea9JUp4iwO
	 VGT5zcVZx4A/8rtTghqmNZFyl6pWVxK0KXSZybcALbn1rGC4bSXpnFHEoqU4wTADMV
	 VkS7KYVZZ21LzQEdjd6+V91e0zNOahgUxEgknw7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B1AF8057B; Tue, 23 May 2023 09:55:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0833F80570;
	Tue, 23 May 2023 09:55:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5803FF80567; Tue, 23 May 2023 09:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81070F80567
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81070F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mXRFpVPR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fbSDasF5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2F89E20412;
	Tue, 23 May 2023 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjHzsw6r5GBiZYln6HcaZ/+TH4q9OK+QhfwKeMGSpWE=;
	b=mXRFpVPRbXHozl7d1VkD3iVHJmQDfzORkMV/xuSFRbCEGbENe7osSTvazlzCP1ZtAnwZoB
	8tShtavyMOM5UdrZvJMTphi40/hkFq40UBXWw2Tj/t0zWRjBwX+AS8+23r7k2Y9D3KSMzM
	awQOg5RO/I966kYcNPck0faRTzG1fKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjHzsw6r5GBiZYln6HcaZ/+TH4q9OK+QhfwKeMGSpWE=;
	b=fbSDasF5r7cHUc9ts/b0FjjsJCe/Typ/AGsvhMkrWS1mppHCQjO+NO6LRgZtDfbUgMwHXR
	xvebhLiQIytW8PDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF11E13588;
	Tue, 23 May 2023 07:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KG1oOSBxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/37] ALSA: seq: Check validity before creating a port
 object
Date: Tue, 23 May 2023 09:53:43 +0200
Message-Id: <20230523075358.9672-23-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BIGFCRPRID2PUIQGFTSYAROX2YBJJKXY
X-Message-ID-Hash: BIGFCRPRID2PUIQGFTSYAROX2YBJJKXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIGFCRPRID2PUIQGFTSYAROX2YBJJKXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The client type and the port info validity check should be done before
actually creating a port, instead of unnecessary create-and-scratch.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 06743114cabf..2dac8c3355fd 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1199,6 +1199,8 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 	/* it is not allowed to create the port for an another client */
 	if (info->addr.client != client->number)
 		return -EPERM;
+	if (client->type == USER_CLIENT && info->kernel)
+		return -EINVAL;
 
 	if (info->flags & SNDRV_SEQ_PORT_FLG_GIVEN_PORT)
 		port_idx = info->addr.port;
@@ -1208,12 +1210,6 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 	if (err < 0)
 		return err;
 
-	if (client->type == USER_CLIENT && info->kernel) {
-		port_idx = port->addr.port;
-		snd_seq_port_unlock(port);
-		snd_seq_delete_port(client, port_idx);
-		return -EINVAL;
-	}
 	if (client->type == KERNEL_CLIENT) {
 		callback = info->kernel;
 		if (callback) {
-- 
2.35.3

