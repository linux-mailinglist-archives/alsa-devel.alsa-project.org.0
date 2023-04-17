Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9366E3F19
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 07:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA04082C;
	Mon, 17 Apr 2023 07:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA04082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681710202;
	bh=gPule4YgBO0YTeDbkLpunILQHLF7l07Axl1vWy1t5B8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VX5YXDJOhZBksA/tPRRVaTr3CU+2y3ewyKTNBCFdhAqYHNfn1UPh3D4xr1lZyKARU
	 ajOc3pLIr10v2j3dkq8Kv2Kv3SqgtbY4qTlVTAwmxh+tKlBO5iCF0SXn7aR05g9Q3n
	 fcANMXsfkILTUD1TDr00DvJhxABraarrkWM3J4ko=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1350BF8025D;
	Mon, 17 Apr 2023 07:42:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC060F80266; Mon, 17 Apr 2023 07:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr
 [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5874FF8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 07:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5874FF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=orange.fr header.i=@orange.fr header.a=rsa-sha256
 header.s=t20230301 header.b=h2icvuNG
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id oHcbphe3Z7JnhoHcbpmzfe; Mon, 17 Apr 2023 07:41:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1681710110;
	bh=sEYIqrDOhNyLMdiTxKCtoht7+kSYTCD6ktbTcZil0+w=;
	h=From:To:Cc:Subject:Date;
	b=h2icvuNGfnX0QFaJHHSig4FFCB1cMfbshNi5NVWSETKCWjW7O0rhH0azthFF/3hkw
	 axbW6bIUYO+SF1H2FyEhzrK++EBFeXGh6U1SQOD/dY3EqdS6+CxIwDJJEgg9Di0mN2
	 nGGnN7Sa4doqgnfNtRe1bFDO0odjWP3mAgWSoUdLPLh4bwW+tHW3uOXcHiwtnsgHkD
	 sh4ll6TNiyPjV7s47pFc7seP9HdZvUEhQCZcO01FjlB8gOL4AmMUfxNEFqN7ua3ILT
	 aGp5uz3PPjwfl+aUdL12Mpm7C15qj5BGbINA33NSqMprWi4kabhMLhTQALl7vbqdai
	 xKGyt5f0R1GVA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Apr 2023 07:41:50 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/hdmi: Remove some dead code
Date: Mon, 17 Apr 2023 07:41:48 +0200
Message-Id: 
 <91a31341f32d493bcc6c4515178ce0755ac1aa70.1681710069.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H3BHO5C6H5HIANUOROCPBUV2E7DOGE2X
X-Message-ID-Hash: H3BHO5C6H5HIANUOROCPBUV2E7DOGE2X
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3BHO5C6H5HIANUOROCPBUV2E7DOGE2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These snd_BUG_ON() can never trigger, so just remove them to save a few
LoC.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative. Maybe the other "if"s should be removed and the
error code returned instead.

I chose to remove these ones and the corresponding error code, because it
seems that it is already handled this way in hdmi_pcm_open().

I don't know the code enough, so it is only my guess.

Review with care :)
---
 sound/pci/hda/patch_hdmi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 5c6980394dce..ee051bdfaff6 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2104,10 +2104,6 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 		goto unlock;
 	}
 
-	if (snd_BUG_ON(pin_idx < 0)) {
-		err = -EINVAL;
-		goto unlock;
-	}
 	per_pin = get_pin(spec, pin_idx);
 
 	/* Verify pin:cvt selections to avoid silent audio after S3.
@@ -2199,13 +2195,13 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 		snd_hda_spdif_ctls_unassign(codec, pcm_idx);
 		clear_bit(pcm_idx, &spec->pcm_in_use);
 		pin_idx = hinfo_to_pin_index(codec, hinfo);
+		/*
+		 * In such a case, return 0 to match the behavior in
+		 * hdmi_pcm_open()
+		 */
 		if (pin_idx < 0)
 			goto unlock;
 
-		if (snd_BUG_ON(pin_idx < 0)) {
-			err = -EINVAL;
-			goto unlock;
-		}
 		per_pin = get_pin(spec, pin_idx);
 
 		if (spec->dyn_pin_out) {
-- 
2.34.1

