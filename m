Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340BC6D2247
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 16:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 140681F4;
	Fri, 31 Mar 2023 16:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 140681F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680272601;
	bh=pMbn/keYuRq1wybLbMXPwLJt+Z4c6h3kLfduI67Mxio=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iqLRyHxoQIYmP29g1VAUUpPXAo6F8lVGzNlKn7NnTyKHLxZVXhemZURqSMJYHFX8P
	 b1GEI/cn3/uu1Np1mQzXLNyGpOdDM49RSwIuQo3uz2UYRaxywfSzbcSvpGNLFujEcY
	 eCTKAzBNbnB2uxPnAealmil4M/TGEr8eGlZgkQw4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B532F8021D;
	Fri, 31 Mar 2023 16:22:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CB30F8024E; Fri, 31 Mar 2023 16:22:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DECDF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 16:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DECDF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BI2c//Cy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0QdhZyQq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1E33D1F38D;
	Fri, 31 Mar 2023 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1680272540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=uJG6oLic2lPhCafieYdDAHvsBdaWP6uC54ZO4+WfWao=;
	b=BI2c//CyRzaAh5bq++f620NBzAd3tcxymF+Zpm/HqszDsznl5EacAZfmgusG8Q9xljqAPj
	sZaa3aEMEU7mg0B0V7zTAzrK4N4nT4aUnPMvbQE42kOjUaCiuV4626kLCXWOs02183ovfe
	/dLS7i4zMGekxsiSl7JxpMX7/GU17S0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680272540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=uJG6oLic2lPhCafieYdDAHvsBdaWP6uC54ZO4+WfWao=;
	b=0QdhZyQq5YSwTuK7+FvMWMKnkObEGCo7uyyaYmWL2ZqQEeqvL1fBj1ID/kwV2PxAqgl+FG
	vz3MS4MG0g2tQDDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00929134F7;
	Fri, 31 Mar 2023 14:22:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZRP5OpvsJmT7ZQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 31 Mar 2023 14:22:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Preserve the previous PCM device upon
 re-enablement
Date: Fri, 31 Mar 2023 16:22:17 +0200
Message-Id: <20230331142217.19791-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VCSQRCSP6F42WX4KKBBSSVNVZ5EC6SUH
X-Message-ID-Hash: VCSQRCSP6F42WX4KKBBSSVNVZ5EC6SUH
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCSQRCSP6F42WX4KKBBSSVNVZ5EC6SUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When a DRM driver turns on or off the screen with the audio
capability, it notifies the ELD to HD-audio HDMI codec driver via
component ops.  HDMI codec driver, in turn, attaches or detaches the
PCM stream for the given port on the fly.

The problem is that, since the recent code change, the HDMI driver
always treats the PCM stream assignment dynamically; this ended up the
confusion of the PCM device appearance.  e.g. when a screen goes once
off and on again, it may appear on a different PCM device before the
screen-off.  Although the application should treat such a change, it
doesn't seem working gracefully with the current pipewire (maybe
PulseAudio, too).

As a workaround, this patch changes the HDMI codec driver behavior
slightly to be more consistent.  Now it remembers the previous PCM
slot for the given port and try to assign to it.  That is, if a port
is re-enabled, the driver tries to use the same PCM slot that was
assigned to that port previously.  If it conflicts, a new slot is
searched and used like before, instead.

Fixes: ef6f5494faf6 ("ALSA: hda/hdmi: Use only dynamic PCM device allocation")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217259
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 9ea633fe9339..90352dbc8052 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -81,6 +81,7 @@ struct hdmi_spec_per_pin {
 	struct delayed_work work;
 	struct hdmi_pcm *pcm; /* pointer to spec->pcm_rec[n] dynamically*/
 	int pcm_idx; /* which pcm is attached. -1 means no pcm is attached */
+	int prev_pcm_idx; /* previously assigned pcm index */
 	int repoll_count;
 	bool setup; /* the stream has been set up by prepare callback */
 	bool silent_stream;
@@ -1380,9 +1381,17 @@ static void hdmi_attach_hda_pcm(struct hdmi_spec *spec,
 	/* pcm already be attached to the pin */
 	if (per_pin->pcm)
 		return;
+	/* try the previously used slot at first */
+	idx = per_pin->prev_pcm_idx;
+	if (idx >= 0) {
+		if (!test_bit(idx, &spec->pcm_bitmap))
+			goto found;
+		per_pin->prev_pcm_idx = -1; /* no longer valid, clear it */
+	}
 	idx = hdmi_find_pcm_slot(spec, per_pin);
 	if (idx == -EBUSY)
 		return;
+ found:
 	per_pin->pcm_idx = idx;
 	per_pin->pcm = get_hdmi_pcm(spec, idx);
 	set_bit(idx, &spec->pcm_bitmap);
@@ -1399,6 +1408,7 @@ static void hdmi_detach_hda_pcm(struct hdmi_spec *spec,
 	idx = per_pin->pcm_idx;
 	per_pin->pcm_idx = -1;
 	per_pin->pcm = NULL;
+	per_pin->prev_pcm_idx = idx;
 	if (idx >= 0 && idx < spec->pcm_used)
 		clear_bit(idx, &spec->pcm_bitmap);
 }
@@ -1924,6 +1934,7 @@ static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 
 		per_pin->pcm = NULL;
 		per_pin->pcm_idx = -1;
+		per_pin->prev_pcm_idx = -1;
 		per_pin->pin_nid = pin_nid;
 		per_pin->pin_nid_idx = spec->num_nids;
 		per_pin->dev_id = i;
-- 
2.35.3

