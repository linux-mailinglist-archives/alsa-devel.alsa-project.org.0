Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F675BF78
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 09:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73888207;
	Fri, 21 Jul 2023 09:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73888207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689924107;
	bh=5aDbR0rcIvStY/gkqXGjQ2njbW6sQPKaMDoX3HBZfxE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QfI52wWrmJrznCj7OjfuhGnRCmlvMchmfdep1yBGqcW9UZGjVo029emvuVpLzX9BT
	 fQEiGVSbYQ9thipzBgufB9vbw8H9GHbcuTUdRDipq/PgFm3Vh3Q4bpWWVfmL/a8deg
	 5oMGqdZxL2w/BUTktVd5ph/TsPCtxnGZ1CRjtRnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C765DF80549; Fri, 21 Jul 2023 09:20:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66BF9F80548;
	Fri, 21 Jul 2023 09:20:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E36BF80520; Fri, 21 Jul 2023 09:17:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B421FF8032D
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 09:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B421FF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QsrdYL82;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lpeTQfSE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D594B201BA;
	Fri, 21 Jul 2023 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689923827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGd6lolCzPLtqPxMQTOpzs7vGp6Mt/dtkutzkMydvWo=;
	b=QsrdYL82NRCorWAFbCuFarIRSiKBHmoFT815/j1/3Bv1IOMC6MEZ9Lvicj+kcvrL1Vmw/E
	wLUhI/rXZFk5CGEobK7jSCcOG9NKTAPlWZH/BccbHnnEH3GFFSLf/MmSIdxxxSReKuBZZ9
	qjW7BrM9/NpIKrJeaQacxX5H2Dax3PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689923827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGd6lolCzPLtqPxMQTOpzs7vGp6Mt/dtkutzkMydvWo=;
	b=lpeTQfSEo6cIgsJD+/3PB6hf1cohZTZEecBntqBDQdwb0JenMYyIFw8OcrJmS2/8atxZ7J
	lkaUhc/0UIg3vaCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7B1B139AF;
	Fri, 21 Jul 2023 07:17:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OEMILPMwumRdLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 07:17:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ALSA: vmaster: Add snd_ctl_add_followers() helper
Date: Fri, 21 Jul 2023 09:16:40 +0200
Message-Id: <20230721071643.3631-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230721071643.3631-1-tiwai@suse.de>
References: <20230721071643.3631-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MUNDIJSBMRNKWOILBZQB5TVLWA7H2UPS
X-Message-ID-Hash: MUNDIJSBMRNKWOILBZQB5TVLWA7H2UPS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUNDIJSBMRNKWOILBZQB5TVLWA7H2UPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new helper to add multiple vmaster followers in a shot.  The
same function was open-coded in various places, and this helper
replaces them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h |  3 +++
 sound/core/vmaster.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sound/control.h b/include/sound/control.h
index 69d950a34ca3..9a4f4f7138da 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -262,6 +262,9 @@ snd_ctl_add_follower(struct snd_kcontrol *master, struct snd_kcontrol *follower)
 	return _snd_ctl_add_follower(master, follower, 0);
 }
 
+int snd_ctl_add_followers(struct snd_card *card, struct snd_kcontrol *master,
+			  const char * const *list);
+
 /**
  * snd_ctl_add_follower_uncached - Add a virtual follower control
  * @master: vmaster element
diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index d0f11f37889b..378d2c7c3d4a 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -280,6 +280,34 @@ int _snd_ctl_add_follower(struct snd_kcontrol *master,
 }
 EXPORT_SYMBOL(_snd_ctl_add_follower);
 
+/**
+ * snd_ctl_add_followers - add multiple followers to vmaster
+ * @card: card instance
+ * @master: the target vmaster kcontrol object
+ * @list: NULL-terminated list of name strings of followers to be added
+ *
+ * Adds the multiple follower kcontrols with the given names.
+ * Returns 0 for success or a negative error code.
+ */
+int snd_ctl_add_followers(struct snd_card *card, struct snd_kcontrol *master,
+			  const char * const *list)
+{
+	struct snd_kcontrol *follower;
+	int err;
+
+	for (; *list; list++) {
+		follower = snd_ctl_find_id_mixer(card, *list);
+		if (follower) {
+			err = snd_ctl_add_follower(master, follower);
+			if (err < 0)
+				return err;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_ctl_add_followers);
+
 /*
  * ctl callbacks for master controls
  */
-- 
2.35.3

