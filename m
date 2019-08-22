Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4B98C7C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 09:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83BC41671;
	Thu, 22 Aug 2019 09:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83BC41671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566459404;
	bh=bcYizlhDMhn5Oc2mPiml3kh76Bjj23MLW3owRSlAOy8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f0BeivkAViCJi90HXlYSdV3bzrNhGkwDxRBdq2ZrdbXXJCpB0QY4IzUuX1Byaqe6s
	 OESB5M3zQZU+HCIZgdp6u34rR4BhYwaibttEntbshhqtllcrJm3eP9wcwj4YXSdTvu
	 TuLZVgPLF9EUVwEVfQbFgpAy7xFuG+zTroAHpe0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA90F80600;
	Thu, 22 Aug 2019 09:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96B96F804CB; Thu, 22 Aug 2019 09:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_32,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9390BF8036E
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 09:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9390BF8036E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29F6FAFF4
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 07:32:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 09:32:05 +0200
Message-Id: <20190822073207.8696-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190822073207.8696-1-tiwai@suse.de>
References: <20190822073207.8696-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/4] ALSA: usb-audio: Simplify
	parse_audio_unit()
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Minor code refactoring by combining the UAC version and the type in
the switch-case flow, so that we reduce the indentation and
redundancy.  One good bonus is that the duplicated definition of the
same type value (e.g. UAC2_EFFECT_UNIT) can be handled more cleanly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 95 +++++++++++++++++++++++--------------------------------
 1 file changed, 39 insertions(+), 56 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b4be226e07f3..2628697353bb 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2780,62 +2780,45 @@ static int parse_audio_unit(struct mixer_build *state, int unitid)
 		return 0; /* skip invalid unit */
 	}
 
-	if (protocol == UAC_VERSION_1 || protocol == UAC_VERSION_2) {
-		switch (p1[2]) {
-		case UAC_INPUT_TERMINAL:
-			return parse_audio_input_terminal(state, unitid, p1);
-		case UAC_MIXER_UNIT:
-			return parse_audio_mixer_unit(state, unitid, p1);
-		case UAC2_CLOCK_SOURCE:
-			return parse_clock_source_unit(state, unitid, p1);
-		case UAC_SELECTOR_UNIT:
-		case UAC2_CLOCK_SELECTOR:
-			return parse_audio_selector_unit(state, unitid, p1);
-		case UAC_FEATURE_UNIT:
-			return parse_audio_feature_unit(state, unitid, p1);
-		case UAC1_PROCESSING_UNIT:
-		/*   UAC2_EFFECT_UNIT has the same value */
-			if (protocol == UAC_VERSION_1)
-				return parse_audio_processing_unit(state, unitid, p1);
-			else
-				return 0; /* FIXME - effect units not implemented yet */
-		case UAC1_EXTENSION_UNIT:
-		/*   UAC2_PROCESSING_UNIT_V2 has the same value */
-			if (protocol == UAC_VERSION_1)
-				return parse_audio_extension_unit(state, unitid, p1);
-			else /* UAC_VERSION_2 */
-				return parse_audio_processing_unit(state, unitid, p1);
-		case UAC2_EXTENSION_UNIT_V2:
-			return parse_audio_extension_unit(state, unitid, p1);
-		default:
-			usb_audio_err(state->chip,
-				"unit %u: unexpected type 0x%02x\n", unitid, p1[2]);
-			return -EINVAL;
-		}
-	} else { /* UAC_VERSION_3 */
-		switch (p1[2]) {
-		case UAC_INPUT_TERMINAL:
-			return parse_audio_input_terminal(state, unitid, p1);
-		case UAC3_MIXER_UNIT:
-			return parse_audio_mixer_unit(state, unitid, p1);
-		case UAC3_CLOCK_SOURCE:
-			return parse_clock_source_unit(state, unitid, p1);
-		case UAC3_SELECTOR_UNIT:
-		case UAC3_CLOCK_SELECTOR:
-			return parse_audio_selector_unit(state, unitid, p1);
-		case UAC3_FEATURE_UNIT:
-			return parse_audio_feature_unit(state, unitid, p1);
-		case UAC3_EFFECT_UNIT:
-			return 0; /* FIXME - effect units not implemented yet */
-		case UAC3_PROCESSING_UNIT:
-			return parse_audio_processing_unit(state, unitid, p1);
-		case UAC3_EXTENSION_UNIT:
-			return parse_audio_extension_unit(state, unitid, p1);
-		default:
-			usb_audio_err(state->chip,
-				"unit %u: unexpected type 0x%02x\n", unitid, p1[2]);
-			return -EINVAL;
-		}
+#define PTYPE(a, b)	((a) << 8 | (b))
+	switch (PTYPE(protocol, p1[2])) {
+	case PTYPE(UAC_VERSION_1, UAC_INPUT_TERMINAL):
+	case PTYPE(UAC_VERSION_2, UAC_INPUT_TERMINAL):
+	case PTYPE(UAC_VERSION_3, UAC_INPUT_TERMINAL):
+		return parse_audio_input_terminal(state, unitid, p1);
+	case PTYPE(UAC_VERSION_1, UAC_MIXER_UNIT):
+	case PTYPE(UAC_VERSION_2, UAC_MIXER_UNIT):
+	case PTYPE(UAC_VERSION_3, UAC3_MIXER_UNIT):
+		return parse_audio_mixer_unit(state, unitid, p1);
+	case PTYPE(UAC_VERSION_2, UAC2_CLOCK_SOURCE):
+	case PTYPE(UAC_VERSION_3, UAC3_CLOCK_SOURCE):
+		return parse_clock_source_unit(state, unitid, p1);
+	case PTYPE(UAC_VERSION_1, UAC_SELECTOR_UNIT):
+	case PTYPE(UAC_VERSION_2, UAC_SELECTOR_UNIT):
+	case PTYPE(UAC_VERSION_3, UAC3_SELECTOR_UNIT):
+	case PTYPE(UAC_VERSION_2, UAC2_CLOCK_SELECTOR):
+	case PTYPE(UAC_VERSION_3, UAC3_CLOCK_SELECTOR):
+		return parse_audio_selector_unit(state, unitid, p1);
+	case PTYPE(UAC_VERSION_1, UAC_FEATURE_UNIT):
+	case PTYPE(UAC_VERSION_2, UAC_FEATURE_UNIT):
+	case PTYPE(UAC_VERSION_3, UAC3_FEATURE_UNIT):
+		return parse_audio_feature_unit(state, unitid, p1);
+	case PTYPE(UAC_VERSION_1, UAC1_PROCESSING_UNIT):
+	case PTYPE(UAC_VERSION_2, UAC2_PROCESSING_UNIT_V2):
+	case PTYPE(UAC_VERSION_3, UAC3_PROCESSING_UNIT):
+		return parse_audio_processing_unit(state, unitid, p1);
+	case PTYPE(UAC_VERSION_1, UAC1_EXTENSION_UNIT):
+	case PTYPE(UAC_VERSION_2, UAC2_EXTENSION_UNIT_V2):
+	case PTYPE(UAC_VERSION_3, UAC3_EXTENSION_UNIT):
+		return parse_audio_extension_unit(state, unitid, p1);
+	case PTYPE(UAC_VERSION_2, UAC2_EFFECT_UNIT):
+	case PTYPE(UAC_VERSION_3, UAC3_EFFECT_UNIT):
+		return 0; /* FIXME - effect units not implemented yet */
+	default:
+		usb_audio_err(state->chip,
+			      "unit %u: unexpected type 0x%02x\n",
+			      unitid, p1[2]);
+		return -EINVAL;
 	}
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
