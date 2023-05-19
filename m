Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8737093BE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2E6F0;
	Fri, 19 May 2023 11:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2E6F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489108;
	bh=xH87bVni2lAz+mq2GlNvJeQMn99xaTgBGvS8Y7hxvWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OpknCAdSsxAzoThetMEVatNGv7EeCtZ2SAxS2sf5FAd6HC/iito1YAuMRKIRJTB4z
	 GMk5jommaK8ezQGLkt5v1iLaetViMlR6KDasm+7YJTCmBOZhMjrfl+qi/ODUBilY0l
	 O54ydU2wyerI2SEjfv/eHLK46ELaFpuLkmXa6Ol4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A9F9F80675; Fri, 19 May 2023 11:32:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A69F80683;
	Fri, 19 May 2023 11:32:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D376F80579; Fri, 19 May 2023 11:32:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43123F80579
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43123F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=u9szvi6t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/ncDqhV1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F02D2222C0;
	Fri, 19 May 2023 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asADGQrckU3mOGi94QuYAt/bgLuAwUWDYqi0ci8KrMs=;
	b=u9szvi6tsh8sGSKf7fv1dTDPVidUrngjiSf+T0kYt5tYz8VlMpxhJa+TEptmbMVcxcn87V
	+UkdHNqrQtGSjlZIaAyBoGDn+mA8lh7pvynBz52PNSvj9XSo4fyqbQUQvILQt3tfPvcM2D
	0dn6uKHMxQ8ZhFpiFso3nWUis5/7uL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asADGQrckU3mOGi94QuYAt/bgLuAwUWDYqi0ci8KrMs=;
	b=/ncDqhV1spkY7V8mrScJjXn9ZpI7Xk/OL3z/j7JANPmLVrfaAa4Ii1u49g+ge7msbwI/tN
	LHmvTQ33VLriJNCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF31E13A12;
	Fri, 19 May 2023 09:31:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eOzNMf1BZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 20/36] ALSA: seq: Check the conflicting port at port creation
Date: Fri, 19 May 2023 11:30:58 +0200
Message-Id: <20230519093114.28813-21-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YD42SFNH6K2FLJ7UZCCZCB4C5GMRO2VR
X-Message-ID-Hash: YD42SFNH6K2FLJ7UZCCZCB4C5GMRO2VR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YD42SFNH6K2FLJ7UZCCZCB4C5GMRO2VR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We didn't check if a port with the given port number has been already
present at creating a new port.  Check it and return -EBUSY properly
if the port number conflicts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 12 ++++++++----
 sound/core/seq/seq_ports.c     | 24 ++++++++++++++++--------
 sound/core/seq/seq_ports.h     |  5 +++--
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 019af1343325..06743114cabf 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1194,15 +1194,19 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 	struct snd_seq_port_info *info = arg;
 	struct snd_seq_client_port *port;
 	struct snd_seq_port_callback *callback;
-	int port_idx;
+	int port_idx, err;
 
 	/* it is not allowed to create the port for an another client */
 	if (info->addr.client != client->number)
 		return -EPERM;
 
-	port = snd_seq_create_port(client, (info->flags & SNDRV_SEQ_PORT_FLG_GIVEN_PORT) ? info->addr.port : -1);
-	if (port == NULL)
-		return -ENOMEM;
+	if (info->flags & SNDRV_SEQ_PORT_FLG_GIVEN_PORT)
+		port_idx = info->addr.port;
+	else
+		port_idx = -1;
+	err = snd_seq_create_port(client, port_idx, &port);
+	if (err < 0)
+		return err;
 
 	if (client->type == USER_CLIENT && info->kernel) {
 		port_idx = port->addr.port;
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 25fcf5a2c71c..188262b04b72 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -107,28 +107,30 @@ static void port_subs_info_init(struct snd_seq_port_subs_info *grp)
 }
 
 
-/* create a port, port number is returned (-1 on failure);
+/* create a port, port number or a negative error code is returned
  * the caller needs to unref the port via snd_seq_port_unlock() appropriately
  */
-struct snd_seq_client_port *snd_seq_create_port(struct snd_seq_client *client,
-						int port)
+int snd_seq_create_port(struct snd_seq_client *client, int port,
+			struct snd_seq_client_port **port_ret)
 {
 	struct snd_seq_client_port *new_port, *p;
-	int num = -1;
+	int num;
 	
+	*port_ret = NULL;
+
 	/* sanity check */
 	if (snd_BUG_ON(!client))
-		return NULL;
+		return -EINVAL;
 
 	if (client->num_ports >= SNDRV_SEQ_MAX_PORTS) {
 		pr_warn("ALSA: seq: too many ports for client %d\n", client->number);
-		return NULL;
+		return -EINVAL;
 	}
 
 	/* create a new port */
 	new_port = kzalloc(sizeof(*new_port), GFP_KERNEL);
 	if (!new_port)
-		return NULL;	/* failure, out of memory */
+		return -ENOMEM;	/* failure, out of memory */
 	/* init port data */
 	new_port->addr.client = client->number;
 	new_port->addr.port = -1;
@@ -143,6 +145,10 @@ struct snd_seq_client_port *snd_seq_create_port(struct snd_seq_client *client,
 	mutex_lock(&client->ports_mutex);
 	write_lock_irq(&client->ports_lock);
 	list_for_each_entry(p, &client->ports_list_head, list) {
+		if (p->addr.port == port) {
+			num = -EBUSY;
+			goto unlock;
+		}
 		if (p->addr.port > num)
 			break;
 		if (port < 0) /* auto-probe mode */
@@ -153,10 +159,12 @@ struct snd_seq_client_port *snd_seq_create_port(struct snd_seq_client *client,
 	client->num_ports++;
 	new_port->addr.port = num;	/* store the port number in the port */
 	sprintf(new_port->name, "port-%d", num);
+	*port_ret = new_port;
+ unlock:
 	write_unlock_irq(&client->ports_lock);
 	mutex_unlock(&client->ports_mutex);
 
-	return new_port;
+	return num;
 }
 
 /* */
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index b1f2c4943174..44f0e9e96bbf 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -86,8 +86,9 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 /* unlock the port */
 #define snd_seq_port_unlock(port) snd_use_lock_free(&(port)->use_lock)
 
-/* create a port, port number is returned (-1 on failure) */
-struct snd_seq_client_port *snd_seq_create_port(struct snd_seq_client *client, int port_index);
+/* create a port, port number or a negative error code is returned */
+int snd_seq_create_port(struct snd_seq_client *client, int port_index,
+			struct snd_seq_client_port **port_ret);
 
 /* delete a port */
 int snd_seq_delete_port(struct snd_seq_client *client, int port);
-- 
2.35.3

