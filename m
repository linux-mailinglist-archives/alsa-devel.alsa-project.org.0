Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351D7E4190
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 15:09:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB19829;
	Tue,  7 Nov 2023 15:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB19829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699366154;
	bh=BivUlGGJjBirPNGQ9joja8B71KbKr66xCsFUIiDWsbY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aFGe5whlOvWDTlC1oK081RdE5CiHuxibEagEX0aU2Tu23yIoTg6/uvMM0bWHQoK4U
	 k58ZMGbdhOCBK6QwmZhVlrdEQr9oncnS4jGrxsgB5swe4D0ODaG3Ez4u3HHm6CWlJk
	 poKqnhiEe7SsU1xlXN0qSe3HCTYS9n7s48/2DMBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 881D1F80557; Tue,  7 Nov 2023 15:08:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 443E4F80169;
	Tue,  7 Nov 2023 15:08:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CCCFF8016D; Tue,  7 Nov 2023 15:08:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B1A95F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 15:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A95F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hZcCtDXz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mik+rtjQ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 066F31F37C;
	Tue,  7 Nov 2023 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699366091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSrkYQDoLXFDIUjrexsBt3bSAcbPEgKQcFp/xkQ+oQ4=;
	b=hZcCtDXz9Rrb1snToMmcR6BBWoGvj9yGd+YgS6KKUyrGBrBP/ABiTfcRosA/SCLh5R9imb
	pcjAb5gglg6JgRbqmoD3R5FeH1OJl1t9hrNLzpGLJcxKOdIYtzdNa2QMA7i9YoDjXy/14g
	G6rrNzcspoLiOVwR+UN2pguLWTYU1kM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699366091;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSrkYQDoLXFDIUjrexsBt3bSAcbPEgKQcFp/xkQ+oQ4=;
	b=mik+rtjQO+ps7qn2ELG4cxlvHm2XfiuDnbrxcLaemr23Bz0iKHYZInd7p7k/9/nTszNfnC
	lrqc0xVEmRz8kDBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C192A13907;
	Tue,  7 Nov 2023 14:08:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id K3pCLspESmXDdQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 07 Nov 2023 14:08:10 +0000
Date: Tue, 07 Nov 2023 15:08:10 +0100
Message-ID: <87y1f9r705.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?EUC-KR?B?sK29xcf8?= <s47.kang@samsung.com>
Cc: <kuninori.morimoto.gx@renesas.com>,
	<alsa-devel@alsa-project.org>,
	<lgirdwood@gmail.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>,
	<cpgs@samsung.com>,
	<pilsun.jang@samsung.com>,
	<seungbin.lee@samsung.com>,
	<donghee.moon@samsung.com>
Subject: Re: [PATCH] ALSA: core: Replace mutex_lock with mutex_trylock
In-Reply-To: <664457955.21699345385931.JavaMail.epsvc@epcpadp4>
References: 
 <CGME20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf@epcas2p2.samsung.com>
	<664457955.21699345385931.JavaMail.epsvc@epcpadp4>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L3KLWI4VRQ4WHYLIDZNAJ4QHOT6DAXNX
X-Message-ID-Hash: L3KLWI4VRQ4WHYLIDZNAJ4QHOT6DAXNX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L3KLWI4VRQ4WHYLIDZNAJ4QHOT6DAXNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Nov 2023 09:17:59 +0100,
°­½ÅÇü wrote:
> 
> Task1 waits for mutex_lock, and task2 waits for pde to be unused.(deadlock)
> /*call trace*/
>     task1 Call trace:
>             __switch_to+0x174/0x338
>             schedule+0x7c/0xe8
>             schedule_preempt_disabled+0x24/0x40
>             mutex_lock+0x40/0xec
>             snd_info_text_entry_open+0x28/0x120
>             proc_reg_open+0xe4/0x248
>             do_dentry_open+0x2a4/0x4e0
> 
>     task2 Call trace:
>             schedule_timeout+0x44/0x1c8
>             wait_for_completion+0x18/0x24
>             proc_entry_rundown+0x60/0xf0
>             remove_proc_subtree+0x180/0x218
>             proc_remove+0x20/0x30
>             snd_info_disconnect+0x4c/0x68
>             snd_info_card_disconnect+0x3c/0x58
>             snd_card_disconnect+0x130/0x264
>             usb_audio_disconnect+0xc0/0x24c
> 
> /*the sequence*/
>     task1:
>             - proc_reg_open: set the use_pde
>     task2:
>             - usb_audio_disconnect: usb device disconnection occurs
>             - snd_info_card_disconnect: acquire the mutex_lock(&info_mutex)
>             - proc_entry_rundown: wait_for_completion(unuse_pde)
>     task1:
>             - wait for mutex_lock in snd_info_text_entry_open
> 
> To avoid it, a mutex without wating(mutex_trylock) shoud be used in
> snd_info_text_entry_open(task1).
> Then, when mutex_lock acquisition fails, an error is returned, and the pde
> becomes unused, and the mutex_lock held by task2 is released.
> 
> 
> Signed-off-by: Shinhyung Kang <s47.kang@samsung.com>

Thanks for the patch.  But this change may break the current working
behavior; e.g. when two proc reads are running concurrently, one would
be aborted unexpectedly.

IIUC, the problem is the call of proc_remove(), and this call itself
can be outside the global mutex.

Could you check whether the patch below works instead?  (Note that
it's only compile-tested.)  It makes the proc_remove() called at
first, then clearing the internal entries.  The function was renamed
accordingly for avoiding confusion, too.


Takashi

--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -56,7 +56,7 @@ struct snd_info_private_data {
 };
 
 static int snd_info_version_init(void);
-static void snd_info_disconnect(struct snd_info_entry *entry);
+static void snd_info_clear_entries(struct snd_info_entry *entry);
 
 /*
 
@@ -569,11 +569,16 @@ void snd_info_card_disconnect(struct snd_card *card)
 {
 	if (!card)
 		return;
-	mutex_lock(&info_mutex);
+
 	proc_remove(card->proc_root_link);
-	card->proc_root_link = NULL;
 	if (card->proc_root)
-		snd_info_disconnect(card->proc_root);
+		proc_remove(card->proc_root->p);
+
+	mutex_lock(&info_mutex);
+	if (card->proc_root)
+		snd_info_clear_entries(card->proc_root);
+	card->proc_root_link = NULL;
+	card->proc_root = NULL;
 	mutex_unlock(&info_mutex);
 }
 
@@ -745,15 +750,14 @@ struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 }
 EXPORT_SYMBOL(snd_info_create_card_entry);
 
-static void snd_info_disconnect(struct snd_info_entry *entry)
+static void snd_info_clear_entries(struct snd_info_entry *entry)
 {
 	struct snd_info_entry *p;
 
 	if (!entry->p)
 		return;
 	list_for_each_entry(p, &entry->children, list)
-		snd_info_disconnect(p);
-	proc_remove(entry->p);
+		snd_info_clear_entries(p);
 	entry->p = NULL;
 }
 
@@ -770,8 +774,9 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 	if (!entry)
 		return;
 	if (entry->p) {
+		proc_remove(entry->p);
 		mutex_lock(&info_mutex);
-		snd_info_disconnect(entry);
+		snd_info_clear_entries(entry);
 		mutex_unlock(&info_mutex);
 	}
 
