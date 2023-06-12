Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2BE72BA00
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF1B850;
	Mon, 12 Jun 2023 10:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF1B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557714;
	bh=oUXeyBNR6tzZ43fs93lTF6SmJ+Ib+zuqUVh4G8k7A0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aXXtYvuVUhlmVmxxYVNHP3/fcYqQTuFeN9jJQnSw6MBltVMGlgIVZ9vwis0TrS6ad
	 t2iUrWD9j9HbKT2nwO5OE03Mn91BXC7dQTbDu6Xp+ru5fTXO0SpD+RyeDntByXSSSq
	 +q0tVoSVa7yPxdFKVkYSGO6xEzwfNsXVSRD3YLNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E396FF8057E; Mon, 12 Jun 2023 10:13:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F561F80571;
	Mon, 12 Jun 2023 10:13:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E1EAF80301; Mon, 12 Jun 2023 10:13:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCC59F8025E
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCC59F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UF+soOXC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Qeg1nXCr
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0077D20489;
	Mon, 12 Jun 2023 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZ6Jn+89eBIHgVAM96uOHKXFiJ5ayjFK1sJ6wbr/Oo8=;
	b=UF+soOXCKMaWmkwnHVwFhGBGmc7/TNQ/eh4oY2PJzdIbwl64uHr5UyLQyu+sG/yYh36PC0
	0Qc1zakcs171aHuMpfGFimcFnZnLy7eA1nbACAzpbidJgoiLO4wwyRrppX5pVPlJvb5nOo
	lv8Tb/DCoHoIfjsX11NoksJ1/EP5Mcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZ6Jn+89eBIHgVAM96uOHKXFiJ5ayjFK1sJ6wbr/Oo8=;
	b=Qeg1nXCrcRUvYfb3XduhiuHuoXZHSoY4DNdYQtwSOu3kv3SFIVUaPy1LL0Cx3qZneGaVea
	l0WNGREebRkCi+DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D369713A67;
	Mon, 12 Jun 2023 08:11:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2DGlMhrThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] ALSA: seq: ump: Notify port changes to system port
Date: Mon, 12 Jun 2023 10:10:51 +0200
Message-Id: <20230612081054.17200-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081054.17200-1-tiwai@suse.de>
References: <20230612081054.17200-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ATI6QRXXB3EQXM2SHMFRKB52ML2VJAL4
X-Message-ID-Hash: ATI6QRXXB3EQXM2SHMFRKB52ML2VJAL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATI6QRXXB3EQXM2SHMFRKB52ML2VJAL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For allowing applications to track the FB active changes, this patch
adds the notification from the system port at each time a FB change is
handled and the active flag or re-grouping happens.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_system.c     | 1 +
 sound/core/seq/seq_ump_client.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_system.c b/sound/core/seq/seq_system.c
index 32c2d9b57751..80267290190d 100644
--- a/sound/core/seq/seq_system.c
+++ b/sound/core/seq/seq_system.c
@@ -85,6 +85,7 @@ void snd_seq_system_broadcast(int client, int port, int type)
 	ev.type = type;
 	snd_seq_kernel_client_dispatch(sysclient, &ev, 0, 0);
 }
+EXPORT_SYMBOL_GPL(snd_seq_system_broadcast);
 
 /* entry points for broadcasting system events */
 int snd_seq_system_notify(int client, int port, struct snd_seq_event *ev)
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 2f93d76b05ce..901a670dcb36 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -13,6 +13,7 @@
 #include <sound/seq_kernel.h>
 #include <sound/seq_device.h>
 #include "seq_clientmgr.h"
+#include "seq_system.h"
 
 struct seq_ump_client;
 struct seq_ump_group;
@@ -273,6 +274,8 @@ static void update_port_infos(struct seq_ump_client *client)
 						new);
 		if (err < 0)
 			goto error;
+		/* notify to system port */
+		snd_seq_system_client_ev_port_change(client->seq_client, i);
 	}
  error:
 	kfree(new);
-- 
2.35.3

