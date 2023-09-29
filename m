Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210417B377D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 18:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DCC8DEC;
	Fri, 29 Sep 2023 18:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DCC8DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696003667;
	bh=JjvdY6vNRaU1rCbwGgkNSNDb81US03BKyTCcV+LEmPM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tzq9HVbBW7X6t/8n7WvvHvrZudFBK+qSuP9Bm4m6bEnJN+DZIvziNAC0b0zRYabVP
	 BknaXNvBrFW6mephYHm+kvOCB6fe9EnP0fRFmngEpyWmzfvOXOE6cEtxA4iVcNR2uG
	 ERN6NguGmKAFKyfx1+DErl5EkMXAiNSC4I1HzBWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A69F80553; Fri, 29 Sep 2023 18:06:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8C8F8016A;
	Fri, 29 Sep 2023 18:06:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC2CF801D5; Fri, 29 Sep 2023 18:06:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 883AEF8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 18:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 883AEF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e30T/zR3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D69461E5F;
	Fri, 29 Sep 2023 16:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E10C433C7;
	Fri, 29 Sep 2023 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696003598;
	bh=JjvdY6vNRaU1rCbwGgkNSNDb81US03BKyTCcV+LEmPM=;
	h=Date:From:To:Cc:Subject:From;
	b=e30T/zR3Px8FY8bLmSHYEjXs067XxvqClj1EJBQHwpfJQBDSKfIUYiDAqJnrACHgL
	 ar2NOy1poMvsQsZFHuAP7WtSeEHsX1xrHfkABQgjApuw4IpBPZyaUOTdDN4b+W0tOa
	 FVR6oL2W9qAep9+fTN8nOD93r6n8TA6P64JmUr6q1OFetkZhEjMrY2EySQdES1wcv/
	 0ewYZ3u+FKNvtFxeFG6CFSmTpsFC4sqqDryE2lr2DgH15NNcOr33pnHti682imoHjc
	 c9KoRsJHI0PxhF6iVdprbM1byqep7GcCeCqlXiwx2nFjlZGKDlt04FTospMVv4hjG6
	 bdv/SgZsrBSGA==
Date: Fri, 29 Sep 2023 18:06:32 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Torsten Schenk <torsten.schenk@zoho.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] ALSA: 6fire: Fix undefined behavior bug in struct
 midi_runtime
Message-ID: <ZRb2CKHuaCu0u38i@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 33UXJ5NHC2LDLYH5KPCWOCGSLZK2MCZK
X-Message-ID-Hash: 33UXJ5NHC2LDLYH5KPCWOCGSLZK2MCZK
X-MailFrom: gustavoars@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33UXJ5NHC2LDLYH5KPCWOCGSLZK2MCZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`struct urb` is a flexible structure, which means that it contains a
flexible-array member at the bottom. This could potentially lead to an
overwrite of the objects following `out_urb` in `struct midi_runtime`,
among them a function pointer.

Fix this by placing the declaration of object `out_urb` at the end of
`struct midi_runtime`.

Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/usb/6fire/midi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/6fire/midi.h b/sound/usb/6fire/midi.h
index 47640c845903..df3f41913274 100644
--- a/sound/usb/6fire/midi.h
+++ b/sound/usb/6fire/midi.h
@@ -22,12 +22,12 @@ struct midi_runtime {
 	spinlock_t in_lock;
 	spinlock_t out_lock;
 	struct snd_rawmidi_substream *out;
-	struct urb out_urb;
 	u8 out_serial; /* serial number of out packet */
 	u8 *out_buffer;
 	int buffer_offset;
 
 	void (*in_received)(struct midi_runtime *rt, u8 *data, int length);
+	struct urb out_urb;
 };
 
 int usb6fire_midi_init(struct sfire_chip *chip);
-- 
2.34.1

