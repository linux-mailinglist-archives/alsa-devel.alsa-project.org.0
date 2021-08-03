Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944A3DEC84
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 13:44:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D821760;
	Tue,  3 Aug 2021 13:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D821760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627991059;
	bh=dXQcLnBF9FUl3JXT/Hg928qManKhAisgRsJsp8kdLEw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ICp/caJtXUSyFNwe4+jeL5yTIGdT8fawnmOfP4Dyz6hYztu3ZucGUL+PF4VFVBIyu
	 LYMewbQwzOFdZNB9nWmoRVmDuyb0wwQcLGmnW8n9GuEXW0QwqYO6c0JfdNS0dOmtAx
	 Omt63KcfOEuxNn0lhAQJY4Dcn/2vIKFLOPVZEqeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AA4AF80082;
	Tue,  3 Aug 2021 13:43:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7C5FF8032D; Tue,  3 Aug 2021 13:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4DC0F80082
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 13:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4DC0F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BaeZeEOy"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="YOx1iHig"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C4EBC22017
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627990993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LWHmPHh8rg78j913kcUT6Sd6LMBqxaEHeiRD2di1Pys=;
 b=BaeZeEOyU3c7+QIXOzsR1wCtMjCOBg0kDog9S2SUlV7nZJOvC1YG4hrufH8qCsPjo9DzKN
 cwmpGWtsaiuTpRvXnYs/oE2LtxTLRLr2QZPH9/rONFba0bkpj/KW5Bocs4Ealsapk5pYCp
 CmKTet1A7C6LR1qk8kyjS11mpr3S5Kg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627990993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LWHmPHh8rg78j913kcUT6Sd6LMBqxaEHeiRD2di1Pys=;
 b=YOx1iHigZYvp7LUKDZcUW1t7qIsFkktXfj4R169zMAAAMvDM1MkTRE2NzDwv19JUnwzwPe
 3Zr4UucW6Hk7GTCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B5067A3BD1;
 Tue,  3 Aug 2021 11:43:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: Fix racy deletion of subscriber
Date: Tue,  3 Aug 2021 13:43:12 +0200
Message-Id: <20210803114312.2536-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

It turned out that the current implementation of the port subscription
is racy.  The subscription contains two linked lists, and we have to
add to or delete from both lists.  Since both connection and
disconnection procedures perform the same order for those two lists
(i.e. src list, then dest list), when a deletion happens during a
connection procedure, the src list may be deleted before the dest list
addition completes, and this may lead to a use-after-free or an Oops,
even though the access to both lists are protected via mutex.

The simple workaround for this race is to change the access order for
the disconnection, namely, dest list, then src list.  This assures
that the connection has been established when disconnecting, and also
the concurrent deletion can be avoided.

Reported-and-tested-by: folkert <folkert@vanheusden.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20210801182754.GP890690@belle.intranet.vanheusden.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ports.c | 39 ++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index b9c2ce2b8d5a..84d78630463e 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -514,10 +514,11 @@ static int check_and_subscribe_port(struct snd_seq_client *client,
 	return err;
 }
 
-static void delete_and_unsubscribe_port(struct snd_seq_client *client,
-					struct snd_seq_client_port *port,
-					struct snd_seq_subscribers *subs,
-					bool is_src, bool ack)
+/* called with grp->list_mutex held */
+static void __delete_and_unsubscribe_port(struct snd_seq_client *client,
+					  struct snd_seq_client_port *port,
+					  struct snd_seq_subscribers *subs,
+					  bool is_src, bool ack)
 {
 	struct snd_seq_port_subs_info *grp;
 	struct list_head *list;
@@ -525,7 +526,6 @@ static void delete_and_unsubscribe_port(struct snd_seq_client *client,
 
 	grp = is_src ? &port->c_src : &port->c_dest;
 	list = is_src ? &subs->src_list : &subs->dest_list;
-	down_write(&grp->list_mutex);
 	write_lock_irq(&grp->list_lock);
 	empty = list_empty(list);
 	if (!empty)
@@ -535,6 +535,18 @@ static void delete_and_unsubscribe_port(struct snd_seq_client *client,
 
 	if (!empty)
 		unsubscribe_port(client, port, grp, &subs->info, ack);
+}
+
+static void delete_and_unsubscribe_port(struct snd_seq_client *client,
+					struct snd_seq_client_port *port,
+					struct snd_seq_subscribers *subs,
+					bool is_src, bool ack)
+{
+	struct snd_seq_port_subs_info *grp;
+
+	grp = is_src ? &port->c_src : &port->c_dest;
+	down_write(&grp->list_mutex);
+	__delete_and_unsubscribe_port(client, port, subs, is_src, ack);
 	up_write(&grp->list_mutex);
 }
 
@@ -590,27 +602,30 @@ int snd_seq_port_disconnect(struct snd_seq_client *connector,
 			    struct snd_seq_client_port *dest_port,
 			    struct snd_seq_port_subscribe *info)
 {
-	struct snd_seq_port_subs_info *src = &src_port->c_src;
+	struct snd_seq_port_subs_info *dest = &dest_port->c_dest;
 	struct snd_seq_subscribers *subs;
 	int err = -ENOENT;
 
-	down_write(&src->list_mutex);
+	/* always start from deleting the dest port for avoiding concurrent
+	 * deletions
+	 */
+	down_write(&dest->list_mutex);
 	/* look for the connection */
-	list_for_each_entry(subs, &src->list_head, src_list) {
+	list_for_each_entry(subs, &dest->list_head, dest_list) {
 		if (match_subs_info(info, &subs->info)) {
-			atomic_dec(&subs->ref_count); /* mark as not ready */
+			__delete_and_unsubscribe_port(dest_client, dest_port,
+						      subs, false,
+						      connector->number != dest_client->number);
 			err = 0;
 			break;
 		}
 	}
-	up_write(&src->list_mutex);
+	up_write(&dest->list_mutex);
 	if (err < 0)
 		return err;
 
 	delete_and_unsubscribe_port(src_client, src_port, subs, true,
 				    connector->number != src_client->number);
-	delete_and_unsubscribe_port(dest_client, dest_port, subs, false,
-				    connector->number != dest_client->number);
 	kfree(subs);
 	return 0;
 }
-- 
2.26.2

