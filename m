Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7287075A915
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72E731F7;
	Thu, 20 Jul 2023 10:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72E731F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841444;
	bh=7TDGZhqC9Vb7sNgIsaqQ74vomAC+1aAikC3adFunV90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gYOedM7kTadsezi4w4fV8975cuS5c1fLwFzrEAnRSj+pFITutbqkRNXAkT1ewXRs5
	 39F50FvWPPuJyntz1CnA96HZgFx82uK/pJIzhYv7A2u4DzMijvdVeemntb4hL0h7S4
	 /3zA7KVAJLfqlVs9oIIYaR18dd54ZBgE0kZ0tEL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 238C7F805D2; Thu, 20 Jul 2023 10:21:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7346F805BF;
	Thu, 20 Jul 2023 10:21:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8A20F805BA; Thu, 20 Jul 2023 10:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7C7FF8057A
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C7FF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=g5cixmiD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fKbnbnA0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F0712059E;
	Thu, 20 Jul 2023 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841277;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UqSylQW4mlUNtN8vqZjztHnvqbzIMxqmyeP/M13SHzo=;
	b=g5cixmiD9ymttVLwgZxiGa8YcC9Sz1aJ8SQIeoj64dS1I4QTRaVgrMEhe/efWUlNZvkpog
	h1TMf0XtO/LeL3DCUiTMcfReHfMVLkVfT44I3AQHzjkp+CiCbl5AhRuq5ul+e41m24m3Kr
	FHL2YNjIJqcbDBK8Uv7B9NYq/e5PCDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841277;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UqSylQW4mlUNtN8vqZjztHnvqbzIMxqmyeP/M13SHzo=;
	b=fKbnbnA0rpb7KqsGeVEdlA8fqzvL5Fh+K7TJ8GjBhWV2IGbimH+bUZ2JtwHE7bNOyFpg+k
	Fi12BSfHnWjQBPBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 05C1B13924;
	Thu, 20 Jul 2023 08:21:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cO2DAH3uuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 09/11] ALSA: cmipci: Simplify with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:21:06 +0200
Message-Id: <20230720082108.31346-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ILWCH3INGKR2HXEPXXPNA4IUZ2DUYXEA
X-Message-ID-Hash: ILWCH3INGKR2HXEPXXPNA4IUZ2DUYXEA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILWCH3INGKR2HXEPXXPNA4IUZ2DUYXEA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace an open code with the new snd_ctl_find_id_mixer().
There is no functional change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 6d25c12d9ef0..1415baac9c36 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2734,12 +2734,8 @@ static int snd_cmipci_mixer_new(struct cmipci *cm, int pcm_spdif_device)
 	}
 
 	for (idx = 0; idx < CM_SAVED_MIXERS; idx++) {
-		struct snd_ctl_elem_id elem_id;
 		struct snd_kcontrol *ctl;
-		memset(&elem_id, 0, sizeof(elem_id));
-		elem_id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		strcpy(elem_id.name, cm_saved_mixer[idx].name);
-		ctl = snd_ctl_find_id(cm->card, &elem_id);
+		ctl = snd_ctl_find_id_mixer(cm->card, cm_saved_mixer[idx].name);
 		if (ctl)
 			cm->mixer_res_ctl[idx] = ctl;
 	}
-- 
2.35.3

