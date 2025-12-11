Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CFFCB652E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Dec 2025 16:24:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107F760238;
	Thu, 11 Dec 2025 16:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107F760238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765466666;
	bh=j865WFMy712Z4PIW1vr3sMX14j6ycCSCb5228p2gFVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=quNXm2KoK56SRB4G0RqcytwXR+lGigdcjUq3c+S7Z7bWLRBjC/EvU/C2Jb7mfJXWy
	 NQtBlmcG36/FxS8MLeBcfkkyJ5RPS+SQaLbOMy19oypeViL6d/ESMScITIONnSeYRk
	 mdXDmdBYpB96FrUhXVDYXZmWPr47o0t67YZiB4RI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0A17F8061D; Thu, 11 Dec 2025 16:23:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 675D4F80607;
	Thu, 11 Dec 2025 16:23:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E0B9F804CC; Thu, 11 Dec 2025 16:23:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail.sonarnerd.net (rankki.sonarnerd.net [213.186.235.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDB04F80448
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 16:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB04F80448
Received: from porkkala.uworld (porkkala.uworld [IPv6:fc00::2])
	by mail.sonarnerd.net (Postfix) with ESMTP id 018CB2311AB;
	Thu, 11 Dec 2025 17:23:08 +0200 (EET)
From: Jussi Laako <jussi@sonarnerd.net>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	Jussi Laako <jussi@sonarnerd.net>
Subject: [PATCH 3/3] ALSA: usb-audio: Do not expose PCM and DSD on same
 altsetting unless DoP
Date: Thu, 11 Dec 2025 17:22:23 +0200
Message-ID: <20251211152224.1780782-3-jussi@sonarnerd.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211152224.1780782-1-jussi@sonarnerd.net>
References: <20251211152224.1780782-1-jussi@sonarnerd.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V5LXFZTTNS3EPSM4GGRWT4M4LAZEZO6B
X-Message-ID-Hash: V5LXFZTTNS3EPSM4GGRWT4M4LAZEZO6B
X-MailFrom: jussi@sonarnerd.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5LXFZTTNS3EPSM4GGRWT4M4LAZEZO6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not expose DSD altsetting as a PCM one, even if the descriptor claims
it to be PCM instead of special format.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
---
 sound/usb/format.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index ec95a063beb1..64cfe4a9d8cd 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -34,6 +34,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 {
 	int sample_width, sample_bytes;
 	u64 pcm_formats = 0;
+	u64 dsd_formats = 0;
 
 	switch (fp->protocol) {
 	case UAC_VERSION_1:
@@ -154,7 +155,9 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 			 fp->iface, fp->altsetting, format);
 	}
 
-	pcm_formats |= snd_usb_interface_dsd_format_quirks(chip, fp, sample_bytes);
+	dsd_formats |= snd_usb_interface_dsd_format_quirks(chip, fp, sample_bytes);
+	if (dsd_formats && !fp->dsd_dop)
+		pcm_formats = dsd_formats;
 
 	return pcm_formats;
 }
-- 
2.43.0

