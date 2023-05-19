Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63207093B2
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256BB9F6;
	Fri, 19 May 2023 11:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256BB9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489098;
	bh=6Wi3I3PFwhH1euNvFgCHo8L1/L6RP/Er0VFyxFcfemc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N/QKo6vhXl4U44rrGv2zdS5tCZtxxBEa4Y+lN+7PjQHqDF0P/xD6HE95rzU6u1BKz
	 itcPfUJYGfxIk6CoTlepXD0FR8eqHshL5vvaClFjYbPg9Y86ClaS4JQe8bStjYQpMI
	 LWQ9QzD90Zri5Obk1NZMWEJEx/vo87VIyPt+Bq4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97F04F80681; Fri, 19 May 2023 11:32:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAAAAF80675;
	Fri, 19 May 2023 11:32:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A791F80578; Fri, 19 May 2023 11:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D856F8057A
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D856F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JQbHU5G+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=96UAUeAL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7FF391FE3D;
	Fri, 19 May 2023 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MgnbPU5OxNR58kbXTDxnCalMNCAoR86IpQnF9YZNg4=;
	b=JQbHU5G+rVXX4eGX0w/eykC0meoBaVIsGgo47/Mcj8tcNQU33V2s1S9nmk4yvAl49bFCdo
	rHfOTmNDW1LM3NgjV6ek+4MQjIGPKEu1ogJZOW47mFnAjriZdPRj6nBjqnQORIolCafvu/
	HSzcNl8YMSc3iNgiddYSYmIKYyJd/yM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MgnbPU5OxNR58kbXTDxnCalMNCAoR86IpQnF9YZNg4=;
	b=96UAUeALXMUPrN1d6Jb9j234WJCU/S1hHfsSziVYbn2j2Mc3KF3DGKWcThV8482jplLcTn
	XEfrqHY4GDKwCpBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60D8113A12;
	Fri, 19 May 2023 09:31:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yJq4Fv5BZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 21/36] ALSA: seq: Check validity before creating a port object
Date: Fri, 19 May 2023 11:30:59 +0200
Message-Id: <20230519093114.28813-22-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6PFLEYWLX5VVAROWNBOVOLDPGQBDRBYQ
X-Message-ID-Hash: 6PFLEYWLX5VVAROWNBOVOLDPGQBDRBYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PFLEYWLX5VVAROWNBOVOLDPGQBDRBYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The client type and the port info validity check should be done before
actually creating a port, instead of unnecessary create-and-scratch.

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

