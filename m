Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C997A18DE
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326AD206;
	Fri, 15 Sep 2023 10:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326AD206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766677;
	bh=64GaH0oooIFdtwpnWvKYtjQNMFrlPwkMx1quPMiNx5c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oWvnyhZWJgv82A4v/K9BmH/8iko+ad2BmJ9ft2RPnjcG36il/xG8ngqgMYv15uhNR
	 9UhoQDfUJDZRunWCIXGIAFtBVapGS7dX/GFqA2EKu0uArF/NsfaXoRzc6AgIDWgzOq
	 Mrpe8WSpkt7q20cJT/6qF7D9M3enqsotJmeWEwUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B4ADF805C7; Fri, 15 Sep 2023 10:28:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E232F8007C;
	Fri, 15 Sep 2023 10:28:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91E08F805A8; Fri, 15 Sep 2023 10:28:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58B94F80563
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58B94F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jlo/yAhN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TyDkbwzN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF0C51F8A8;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b60E0xS621M3O/TdqkzzeOhA3W5/KDpMUMFZUqL/NdM=;
	b=jlo/yAhNAFVvYgMv4RIqy6UKSCyXBg4VqW7n55C7uoBzk79FDdTTc/iFvYNCgzLiL/XDxD
	bRR20yXk76evXC3goR6rPzzRB6RqKSZpAQB/750sS36GmXBki+Z8NBHqq2Dz4cXxCLDxVY
	sV7eG2fk1uADT7VFCAf7HV6jJcS3qjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b60E0xS621M3O/TdqkzzeOhA3W5/KDpMUMFZUqL/NdM=;
	b=TyDkbwzNrFD90/pTPp7yHfYwaHqVwCo/AisbSgcsDQ2qg3Z8xiBnYIwUsuqFjz7/ATDrqa
	kmWQGs/DrWjiIhDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3D1D1358A;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iI51MpcVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/13] ALSA: firewire: Fix -Wformat-truncation warning for
 MIDI stream names
Date: Fri, 15 Sep 2023 10:28:00 +0200
Message-Id: <20230915082802.28684-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YYIDKUOKL5C2CZSBPUPVNF7LSV7TOF55
X-Message-ID-Hash: YYIDKUOKL5C2CZSBPUPVNF7LSV7TOF55
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYIDKUOKL5C2CZSBPUPVNF7LSV7TOF55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The compile warnings at filling MIDI stream name strings are all
false-positive; the number of streams can't go so high.

For suppressing the warning, replace snprintf() with scnprintf().
As stated in the above, truncation doesn't matter.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/bebob/bebob_midi.c         |  6 +++---
 sound/firewire/dice/dice-midi.c           |  4 ++--
 sound/firewire/digi00x/digi00x-midi.c     | 14 +++++++-------
 sound/firewire/fireface/ff-midi.c         |  4 ++--
 sound/firewire/fireworks/fireworks_midi.c |  4 ++--
 sound/firewire/motu/motu-midi.c           |  4 ++--
 sound/firewire/oxfw/oxfw-midi.c           |  6 +++---
 sound/firewire/tascam/tascam-midi.c       | 12 ++++++------
 8 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/sound/firewire/bebob/bebob_midi.c b/sound/firewire/bebob/bebob_midi.c
index 6f597d03e7c1..b1425bf98c3b 100644
--- a/sound/firewire/bebob/bebob_midi.c
+++ b/sound/firewire/bebob/bebob_midi.c
@@ -84,9 +84,9 @@ static void set_midi_substream_names(struct snd_bebob *bebob,
 	struct snd_rawmidi_substream *subs;
 
 	list_for_each_entry(subs, &str->substreams, list) {
-		snprintf(subs->name, sizeof(subs->name),
-			 "%s MIDI %d",
-			 bebob->card->shortname, subs->number + 1);
+		scnprintf(subs->name, sizeof(subs->name),
+			  "%s MIDI %d",
+			  bebob->card->shortname, subs->number + 1);
 	}
 }
 
diff --git a/sound/firewire/dice/dice-midi.c b/sound/firewire/dice/dice-midi.c
index 4c2998034313..78988e44b8bc 100644
--- a/sound/firewire/dice/dice-midi.c
+++ b/sound/firewire/dice/dice-midi.c
@@ -88,8 +88,8 @@ static void set_midi_substream_names(struct snd_dice *dice,
 	struct snd_rawmidi_substream *subs;
 
 	list_for_each_entry(subs, &str->substreams, list) {
-		snprintf(subs->name, sizeof(subs->name),
-			 "%s MIDI %d", dice->card->shortname, subs->number + 1);
+		scnprintf(subs->name, sizeof(subs->name),
+			  "%s MIDI %d", dice->card->shortname, subs->number + 1);
 	}
 }
 
diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index 68eb8c39afa6..8f4bace16050 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -100,14 +100,14 @@ static void set_substream_names(struct snd_dg00x *dg00x,
 
 		list_for_each_entry(subs, &str->substreams, list) {
 			if (!is_console) {
-				snprintf(subs->name, sizeof(subs->name),
-					 "%s MIDI %d",
-					 dg00x->card->shortname,
-					 subs->number + 1);
+				scnprintf(subs->name, sizeof(subs->name),
+					  "%s MIDI %d",
+					  dg00x->card->shortname,
+					  subs->number + 1);
 			} else {
-				snprintf(subs->name, sizeof(subs->name),
-					 "%s control",
-					 dg00x->card->shortname);
+				scnprintf(subs->name, sizeof(subs->name),
+					  "%s control",
+					  dg00x->card->shortname);
 			}
 		}
 	}
diff --git a/sound/firewire/fireface/ff-midi.c b/sound/firewire/fireface/ff-midi.c
index 25821d186b87..da3054fdcc7d 100644
--- a/sound/firewire/fireface/ff-midi.c
+++ b/sound/firewire/fireface/ff-midi.c
@@ -79,8 +79,8 @@ static void set_midi_substream_names(struct snd_rawmidi_str *stream,
 	struct snd_rawmidi_substream *substream;
 
 	list_for_each_entry(substream, &stream->substreams, list) {
-		snprintf(substream->name, sizeof(substream->name),
-			 "%s MIDI %d", name, substream->number + 1);
+		scnprintf(substream->name, sizeof(substream->name),
+			  "%s MIDI %d", name, substream->number + 1);
 	}
 }
 
diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index 84621e356848..350bf4d299c2 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -84,8 +84,8 @@ static void set_midi_substream_names(struct snd_efw *efw,
 	struct snd_rawmidi_substream *subs;
 
 	list_for_each_entry(subs, &str->substreams, list) {
-		snprintf(subs->name, sizeof(subs->name),
-			 "%s MIDI %d", efw->card->shortname, subs->number + 1);
+		scnprintf(subs->name, sizeof(subs->name),
+			  "%s MIDI %d", efw->card->shortname, subs->number + 1);
 	}
 }
 
diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index 2365f7dfde26..eebc7e790ee2 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -88,8 +88,8 @@ static void set_midi_substream_names(struct snd_motu *motu,
 	struct snd_rawmidi_substream *subs;
 
 	list_for_each_entry(subs, &str->substreams, list) {
-		snprintf(subs->name, sizeof(subs->name),
-			 "%s MIDI %d", motu->card->shortname, subs->number + 1);
+		scnprintf(subs->name, sizeof(subs->name),
+			  "%s MIDI %d", motu->card->shortname, subs->number + 1);
 	}
 }
 
diff --git a/sound/firewire/oxfw/oxfw-midi.c b/sound/firewire/oxfw/oxfw-midi.c
index 775cba3f1f02..c215fa6f7a03 100644
--- a/sound/firewire/oxfw/oxfw-midi.c
+++ b/sound/firewire/oxfw/oxfw-midi.c
@@ -129,9 +129,9 @@ static void set_midi_substream_names(struct snd_oxfw *oxfw,
 	struct snd_rawmidi_substream *subs;
 
 	list_for_each_entry(subs, &str->substreams, list) {
-		snprintf(subs->name, sizeof(subs->name),
-			 "%s MIDI %d",
-			 oxfw->card->shortname, subs->number + 1);
+		scnprintf(subs->name, sizeof(subs->name),
+			  "%s MIDI %d",
+			  oxfw->card->shortname, subs->number + 1);
 	}
 }
 
diff --git a/sound/firewire/tascam/tascam-midi.c b/sound/firewire/tascam/tascam-midi.c
index 02eed2dce435..c57fac4f1968 100644
--- a/sound/firewire/tascam/tascam-midi.c
+++ b/sound/firewire/tascam/tascam-midi.c
@@ -108,9 +108,9 @@ int snd_tscm_create_midi_devices(struct snd_tscm *tscm)
 		/* TODO: support virtual MIDI ports. */
 		if (subs->number < tscm->spec->midi_capture_ports) {
 			/* Hardware MIDI ports. */
-			snprintf(subs->name, sizeof(subs->name),
-				 "%s MIDI %d",
-				 tscm->card->shortname, subs->number + 1);
+			scnprintf(subs->name, sizeof(subs->name),
+				  "%s MIDI %d",
+				  tscm->card->shortname, subs->number + 1);
 		}
 	}
 
@@ -123,9 +123,9 @@ int snd_tscm_create_midi_devices(struct snd_tscm *tscm)
 	list_for_each_entry(subs, &stream->substreams, list) {
 		if (subs->number < tscm->spec->midi_playback_ports) {
 			/* Hardware MIDI ports only. */
-			snprintf(subs->name, sizeof(subs->name),
-				 "%s MIDI %d",
-				 tscm->card->shortname, subs->number + 1);
+			scnprintf(subs->name, sizeof(subs->name),
+				  "%s MIDI %d",
+				  tscm->card->shortname, subs->number + 1);
 		}
 	}
 
-- 
2.35.3

