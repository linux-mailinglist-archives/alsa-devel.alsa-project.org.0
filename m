Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A779B723DFB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 11:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C39B850;
	Tue,  6 Jun 2023 11:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C39B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686044479;
	bh=FLCejHkX+lPkMMWSMQHSE/P5ImADM2X9Wx1tORx4CrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Voe4hsUe3kNzIMj5djkafd29xlshUptyeaw+LF9vu9Q3I51GOpynhzlDPgU2igc1w
	 HWbbePaCqHJQTlozBMQBGoHpvYQza3PsexxvLOmOoUI6oFbOKnKHy07EPM8P6L+/0j
	 5myQOWh3R0nsr3PuTog4Iampze3Sc3chivM7JwUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF5B6F8016C; Tue,  6 Jun 2023 11:39:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82BEFF80254;
	Tue,  6 Jun 2023 11:39:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94EEFF80199; Tue,  6 Jun 2023 11:39:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 43377F80254
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 11:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43377F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oJ0g/LtQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WR2Lus3+
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4EC91FD6A;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686044339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDtCM+7zLxqQ9M8JZksKc+T+VK9YtODPv5ipK4lNZW8=;
	b=oJ0g/LtQq0yfm729y4CFTzeqX6xWfy5Mk967LH6SzeTB5Nl9D3zKXjqSTbXzDCimhY+O5R
	5MgXEXk4xlBMslnXvtIauFsCUnc+v3NgcJLYeJalbvpEQi7VIrglRhHXt10pkNOG8zXkIG
	F1zxwAopGPwrn07o5qgDNwYD3DIssLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686044339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDtCM+7zLxqQ9M8JZksKc+T+VK9YtODPv5ipK4lNZW8=;
	b=WR2Lus3+Xbq1TRpVzV2Ax8cCv7q3HqVqtoeHmszC7Bny12EqR56RCZazNTyc0VY1ezfWWn
	13++8EPEJZZpWCDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0DC013A47;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WChMLrP+fmTiVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 09:38:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/4] ALSA: hda: Fix kctl->id initialization
Date: Tue,  6 Jun 2023 11:38:55 +0200
Message-Id: <20230606093855.14685-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230606093855.14685-1-tiwai@suse.de>
References: <20230606093855.14685-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZEQZNUYOR2F4PJH54CZMFK7ZSIQ7FFRN
X-Message-ID-Hash: ZEQZNUYOR2F4PJH54CZMFK7ZSIQ7FFRN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEQZNUYOR2F4PJH54CZMFK7ZSIQ7FFRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HD-audio core code replaces the kctl->id.index of SPDIF-related
controls after assigning via snd_ctl_add().  This doesn't work any
longer with the new Xarray lookup change.  The change of the kctl->id
content has to be done via snd_ctl_rename_id() helper, instead.

Fixes: c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 9f79c0ac2bda..bd19f92aeeec 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2458,10 +2458,14 @@ int snd_hda_create_dig_out_ctls(struct hda_codec *codec,
 		   type == HDA_PCM_TYPE_HDMI) {
 		/* suppose a single SPDIF device */
 		for (dig_mix = dig_mixes; dig_mix->name; dig_mix++) {
+			struct snd_ctl_elem_id id;
+
 			kctl = find_mixer_ctl(codec, dig_mix->name, 0, 0);
 			if (!kctl)
 				break;
-			kctl->id.index = spdif_index;
+			id = kctl->id;
+			id.index = spdif_index;
+			snd_ctl_rename_id(codec->card, &kctl->id, &id);
 		}
 		bus->primary_dig_out_type = HDA_PCM_TYPE_HDMI;
 	}
-- 
2.35.3

