Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8D6C7939
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 08:51:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE94EA4;
	Fri, 24 Mar 2023 08:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE94EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679644270;
	bh=PpeC2kSZLueP37+OtHfyh/KphTecOrXsCZminWZQMJc=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VZw2KfrV4Z70p8c/s5UbZG73FmC+RIS0jj7GE+BmB4cC2c+Zx5O4v2xcO/2U3j+we
	 FxU+kJFJG4JSk3XpSy3zUpmn5DF/0WbWEKCZybCj+RtOa4qKdY16wj5G/pHnvzcGi5
	 6CoQ+wO9U7yu4l6nSBkhQBrJawAHfBTfj2RxTKd4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2AADF8027B;
	Fri, 24 Mar 2023 08:50:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFF7EF802E8; Fri, 24 Mar 2023 08:50:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10BC9F8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 08:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10BC9F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MtIrhOqL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=s1zIDQry
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 714C733A22;
	Fri, 24 Mar 2023 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1679644207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=8OPGJD3hGXAmJlmLOHSpjogu8H6Rg2+SmZ2zREq3gus=;
	b=MtIrhOqLz2SUV2oP9OAadpNCoy8c3E+ox0fyrNy5zS2IsW0zkyKtG+ewzO7IRNgoXj0U1G
	ToAFlWJKG0ZjASwQu0Bv2494WsmiFvux0Msrh71QprdcvNOhSjhbvOvaZEyLAWdrHzx1zI
	8pEyEVFahSDXx1siZHUxRHbXwQDycdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679644207;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=8OPGJD3hGXAmJlmLOHSpjogu8H6Rg2+SmZ2zREq3gus=;
	b=s1zIDQryUZCUvByNuBQtQoOBT/ciSQepqJoa5evY9cvompg3TKVWVN1yg3jF5tIt3zqidX
	SvmLHwq0fM5iEiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 533A913A26;
	Fri, 24 Mar 2023 07:50:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HkZdEy9WHWQ5ZwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 24 Mar 2023 07:50:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix regression on detection of Roland VS-100
Date: Fri, 24 Mar 2023 08:50:05 +0100
Message-Id: <20230324075005.19403-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 67O5RQDS7HJM56NZUJDZMHRFXY7CXTAM
X-Message-ID-Hash: 67O5RQDS7HJM56NZUJDZMHRFXY7CXTAM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67O5RQDS7HJM56NZUJDZMHRFXY7CXTAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's been reported that the recent kernel can't probe the PCM devices
on Roland VS-100 properly, and it turned out to be a regression by the
recent addition of the bit shift range check for the format bits.
In the old code, we just did bit-shift and it resulted in zero, which
is then corrected to the standard PCM format, while the new code
explicitly returns an error in such a case.

For addressing the regression, relax the check and fallback to the
standard PCM type (with the info output).

Fixes: 43d5ca88dfcd ("ALSA: usb-audio: Fix potential out-of-bounds shift")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217084
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/format.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 405dc0bf6678..4b1c5ba121f3 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -39,8 +39,12 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 	case UAC_VERSION_1:
 	default: {
 		struct uac_format_type_i_discrete_descriptor *fmt = _fmt;
-		if (format >= 64)
-			return 0; /* invalid format */
+		if (format >= 64) {
+			usb_audio_info(chip,
+				       "%u:%d: invalid format type 0x%llx is detected, processed as PCM\n",
+				       fp->iface, fp->altsetting, format);
+			format = UAC_FORMAT_TYPE_I_PCM;
+		}
 		sample_width = fmt->bBitResolution;
 		sample_bytes = fmt->bSubframeSize;
 		format = 1ULL << format;
-- 
2.35.3

