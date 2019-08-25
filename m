Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1F9C277
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2019 09:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9EC166B;
	Sun, 25 Aug 2019 09:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9EC166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566718650;
	bh=g2P9JIBebYzzN2XG43UcqxqVyJO5f+eHil6X3GwevIQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L35Y3l7dsfwZ1bKGyCM/D2C8WqDSGkVvODr9GITkQxVmC+SStNSs0JJOdc/zoxqju
	 yI8GVskCUuu161P1/K2eTGmGuhJzcUNK39avpJAjShZ8oFfgeUN/IBXNgrZ1hxMmwm
	 E9aD+D/MdGQf6BUvtx2LmheTE2ro90xMozBqY0wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BCB1F801ED;
	Sun, 25 Aug 2019 09:35:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B8F9F80212; Sun, 25 Aug 2019 09:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CD06F80213
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 09:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD06F80213
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0FDD4AE0C
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 07:35:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 25 Aug 2019 09:35:34 +0200
Message-Id: <20190825073534.25918-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Clean up check_input_term()
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

The primary changes in this patch are cleanups of __check_input_term()
and move to a non-nested switch-case block by evaluating the pair of
UAC version and the unit type, as we've done for parse_audio_unit().
Also each parser is split into the function for readability.

Now, a slight behavior change by this cleanup is the handling of
processing and extension units.  Formerly we've dealt with them
differently between UAC1/2 and UAC3; the latter returns an error if no
input sources are available, while the former continues to parse.

In this patch, unify the behavior in all cases: when input sources are
available, it parses recursively, then override the type and the id,
as well as channel information if not provided yet.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 401 ++++++++++++++++++++++++++++--------------------------
 1 file changed, 209 insertions(+), 192 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index c9777d8a76f5..5291739cab57 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -758,224 +758,242 @@ static int uac_mixer_unit_get_channels(struct mixer_build *state,
 }
 
 /*
- * parse the source unit recursively until it reaches to a terminal
- * or a branched unit.
+ * Parse Input Terminal Unit
  */
 static int __check_input_term(struct mixer_build *state, int id,
-			    struct usb_audio_term *term)
+			      struct usb_audio_term *term);
+
+static int parse_term_uac1_iterm_unit(struct mixer_build *state,
+				      struct usb_audio_term *term,
+				      void *p1, int id)
 {
-	int protocol = state->mixer->protocol;
+	struct uac_input_terminal_descriptor *d = p1;
+
+	term->type = le16_to_cpu(d->wTerminalType);
+	term->channels = d->bNrChannels;
+	term->chconfig = le16_to_cpu(d->wChannelConfig);
+	term->name = d->iTerminal;
+	return 0;
+}
+
+static int parse_term_uac2_iterm_unit(struct mixer_build *state,
+				      struct usb_audio_term *term,
+				      void *p1, int id)
+{
+	struct uac2_input_terminal_descriptor *d = p1;
 	int err;
-	void *p1;
-	unsigned char *hdr;
 
-	memset(term, 0, sizeof(*term));
-	for (;;) {
-		/* a loop in the terminal chain? */
-		if (test_and_set_bit(id, state->termbitmap))
-			return -EINVAL;
+	/* call recursively to verify the referenced clock entity */
+	err = __check_input_term(state, d->bCSourceID, term);
+	if (err < 0)
+		return err;
 
-		p1 = find_audio_control_unit(state, id);
-		if (!p1)
-			break;
-		if (!snd_usb_validate_audio_desc(p1, protocol))
-			break; /* bad descriptor */
+	/* save input term properties after recursion,
+	 * to ensure they are not overriden by the recursion calls
+	 */
+	term->id = id;
+	term->type = le16_to_cpu(d->wTerminalType);
+	term->channels = d->bNrChannels;
+	term->chconfig = le32_to_cpu(d->bmChannelConfig);
+	term->name = d->iTerminal;
+	return 0;
+}
 
-		hdr = p1;
-		term->id = id;
+static int parse_term_uac3_iterm_unit(struct mixer_build *state,
+				      struct usb_audio_term *term,
+				      void *p1, int id)
+{
+	struct uac3_input_terminal_descriptor *d = p1;
+	int err;
 
-		if (protocol == UAC_VERSION_1 || protocol == UAC_VERSION_2) {
-			switch (hdr[2]) {
-			case UAC_INPUT_TERMINAL:
-				if (protocol == UAC_VERSION_1) {
-					struct uac_input_terminal_descriptor *d = p1;
-
-					term->type = le16_to_cpu(d->wTerminalType);
-					term->channels = d->bNrChannels;
-					term->chconfig = le16_to_cpu(d->wChannelConfig);
-					term->name = d->iTerminal;
-				} else { /* UAC_VERSION_2 */
-					struct uac2_input_terminal_descriptor *d = p1;
-
-					/* call recursively to verify that the
-					 * referenced clock entity is valid */
-					err = __check_input_term(state, d->bCSourceID, term);
-					if (err < 0)
-						return err;
+	/* call recursively to verify the referenced clock entity */
+	err = __check_input_term(state, d->bCSourceID, term);
+	if (err < 0)
+		return err;
 
-					/* save input term properties after recursion,
-					 * to ensure they are not overriden by the
-					 * recursion calls */
-					term->id = id;
-					term->type = le16_to_cpu(d->wTerminalType);
-					term->channels = d->bNrChannels;
-					term->chconfig = le32_to_cpu(d->bmChannelConfig);
-					term->name = d->iTerminal;
-				}
-				return 0;
-			case UAC_FEATURE_UNIT: {
-				/* the header is the same for v1 and v2 */
-				struct uac_feature_unit_descriptor *d = p1;
+	/* save input term properties after recursion,
+	 * to ensure they are not overriden by the recursion calls
+	 */
+	term->id = id;
+	term->type = le16_to_cpu(d->wTerminalType);
 
-				id = d->bSourceID;
-				break; /* continue to parse */
-			}
-			case UAC_MIXER_UNIT: {
-				struct uac_mixer_unit_descriptor *d = p1;
-
-				term->type = UAC3_MIXER_UNIT << 16; /* virtual type */
-				term->channels = uac_mixer_unit_bNrChannels(d);
-				term->chconfig = uac_mixer_unit_wChannelConfig(d, protocol);
-				term->name = uac_mixer_unit_iMixer(d);
-				return 0;
-			}
-			case UAC_SELECTOR_UNIT:
-			case UAC2_CLOCK_SELECTOR: {
-				struct uac_selector_unit_descriptor *d = p1;
-				/* call recursively to retrieve the channel info */
-				err = __check_input_term(state, d->baSourceID[0], term);
-				if (err < 0)
-					return err;
-				term->type = UAC3_SELECTOR_UNIT << 16; /* virtual type */
-				term->id = id;
-				term->name = uac_selector_unit_iSelector(d);
-				return 0;
-			}
-			case UAC1_PROCESSING_UNIT:
-			/* UAC2_EFFECT_UNIT */
-				if (protocol == UAC_VERSION_1)
-					term->type = UAC3_PROCESSING_UNIT << 16; /* virtual type */
-				else /* UAC_VERSION_2 */
-					term->type = UAC3_EFFECT_UNIT << 16; /* virtual type */
-				/* fall through */
-			case UAC1_EXTENSION_UNIT:
-			/* UAC2_PROCESSING_UNIT_V2 */
-				if (protocol == UAC_VERSION_1 && !term->type)
-					term->type = UAC3_EXTENSION_UNIT << 16; /* virtual type */
-				else if (protocol == UAC_VERSION_2 && !term->type)
-					term->type = UAC3_PROCESSING_UNIT << 16; /* virtual type */
-				/* fall through */
-			case UAC2_EXTENSION_UNIT_V2: {
-				struct uac_processing_unit_descriptor *d = p1;
-
-				if (protocol == UAC_VERSION_2 &&
-					hdr[2] == UAC2_EFFECT_UNIT) {
-					/* UAC2/UAC1 unit IDs overlap here in an
-					 * uncompatible way. Ignore this unit for now.
-					 */
-					return 0;
-				}
+	err = get_cluster_channels_v3(state, le16_to_cpu(d->wClusterDescrID));
+	if (err < 0)
+		return err;
+	term->channels = err;
 
-				if (d->bNrInPins) {
-					id = d->baSourceID[0];
-					break; /* continue to parse */
-				}
-				if (!term->type)
-					term->type = UAC3_EXTENSION_UNIT << 16; /* virtual type */
+	/* REVISIT: UAC3 IT doesn't have channels cfg */
+	term->chconfig = 0;
 
-				term->channels = uac_processing_unit_bNrChannels(d);
-				term->chconfig = uac_processing_unit_wChannelConfig(d, protocol);
-				term->name = uac_processing_unit_iProcessing(d, protocol);
-				return 0;
-			}
-			case UAC2_CLOCK_SOURCE: {
-				struct uac_clock_source_descriptor *d = p1;
+	term->name = le16_to_cpu(d->wTerminalDescrStr);
+	return 0;
+}
 
-				term->type = UAC3_CLOCK_SOURCE << 16; /* virtual type */
-				term->id = id;
-				term->name = d->iClockSource;
-				return 0;
-			}
-			default:
-				return -ENODEV;
-			}
-		} else { /* UAC_VERSION_3 */
-			switch (hdr[2]) {
-			case UAC_INPUT_TERMINAL: {
-				struct uac3_input_terminal_descriptor *d = p1;
-
-				/* call recursively to verify that the
-				 * referenced clock entity is valid */
-				err = __check_input_term(state, d->bCSourceID, term);
-				if (err < 0)
-					return err;
+static int parse_term_mixer_unit(struct mixer_build *state,
+				 struct usb_audio_term *term,
+				 void *p1, int id)
+{
+	struct uac_mixer_unit_descriptor *d = p1;
+	int protocol = state->mixer->protocol;
+	int err;
 
-				/* save input term properties after recursion,
-				 * to ensure they are not overriden by the
-				 * recursion calls */
-				term->id = id;
-				term->type = le16_to_cpu(d->wTerminalType);
+	err = uac_mixer_unit_get_channels(state, d);
+	if (err <= 0)
+		return err;
 
-				err = get_cluster_channels_v3(state, le16_to_cpu(d->wClusterDescrID));
-				if (err < 0)
-					return err;
-				term->channels = err;
+	term->type = UAC3_MIXER_UNIT << 16; /* virtual type */
+	term->channels = err;
+	if (protocol != UAC_VERSION_3) {
+		term->chconfig = uac_mixer_unit_wChannelConfig(d, protocol);
+		term->name = uac_mixer_unit_iMixer(d);
+	}
+	return 0;
+}
+
+static int parse_term_selector_unit(struct mixer_build *state,
+				    struct usb_audio_term *term,
+				    void *p1, int id)
+{
+	struct uac_selector_unit_descriptor *d = p1;
+	int err;
 
-				/* REVISIT: UAC3 IT doesn't have channels cfg */
-				term->chconfig = 0;
+	/* call recursively to retrieve the channel info */
+	err = __check_input_term(state, d->baSourceID[0], term);
+	if (err < 0)
+		return err;
+	term->type = UAC3_SELECTOR_UNIT << 16; /* virtual type */
+	term->id = id;
+	if (state->mixer->protocol != UAC_VERSION_3)
+		term->name = uac_selector_unit_iSelector(d);
+	return 0;
+}
 
-				term->name = le16_to_cpu(d->wTerminalDescrStr);
-				return 0;
-			}
-			case UAC3_FEATURE_UNIT: {
-				struct uac3_feature_unit_descriptor *d = p1;
+static int parse_term_proc_unit(struct mixer_build *state,
+				struct usb_audio_term *term,
+				void *p1, int id, int vtype)
+{
+	struct uac_processing_unit_descriptor *d = p1;
+	int protocol = state->mixer->protocol;
+	int err;
 
-				id = d->bSourceID;
-				break; /* continue to parse */
-			}
-			case UAC3_CLOCK_SOURCE: {
-				struct uac3_clock_source_descriptor *d = p1;
+	if (d->bNrInPins) {
+		/* call recursively to retrieve the channel info */
+		err = __check_input_term(state, d->baSourceID[0], term);
+		if (err < 0)
+			return err;
+	}
 
-				term->type = UAC3_CLOCK_SOURCE << 16; /* virtual type */
-				term->id = id;
-				term->name = le16_to_cpu(d->wClockSourceStr);
-				return 0;
-			}
-			case UAC3_MIXER_UNIT: {
-				struct uac_mixer_unit_descriptor *d = p1;
+	term->type = vtype << 16; /* virtual type */
+	term->id = id;
 
-				err = uac_mixer_unit_get_channels(state, d);
-				if (err <= 0)
-					return err;
+	if (protocol == UAC_VERSION_3)
+		return 0;
 
-				term->channels = err;
-				term->type = UAC3_MIXER_UNIT << 16; /* virtual type */
+	if (!term->channels) {
+		term->channels = uac_processing_unit_bNrChannels(d);
+		term->chconfig = uac_processing_unit_wChannelConfig(d, protocol);
+	}
+	term->name = uac_processing_unit_iProcessing(d, protocol);
+	return 0;
+}
 
-				return 0;
-			}
-			case UAC3_SELECTOR_UNIT:
-			case UAC3_CLOCK_SELECTOR: {
-				struct uac_selector_unit_descriptor *d = p1;
-				/* call recursively to retrieve the channel info */
-				err = __check_input_term(state, d->baSourceID[0], term);
-				if (err < 0)
-					return err;
-				term->type = UAC3_SELECTOR_UNIT << 16; /* virtual type */
-				term->id = id;
-				term->name = 0; /* TODO: UAC3 Class-specific strings */
+static int parse_term_uac2_clock_source(struct mixer_build *state,
+					struct usb_audio_term *term,
+					void *p1, int id)
+{
+	struct uac_clock_source_descriptor *d = p1;
 
-				return 0;
-			}
-			case UAC3_PROCESSING_UNIT: {
-				struct uac_processing_unit_descriptor *d = p1;
+	term->type = UAC3_CLOCK_SOURCE << 16; /* virtual type */
+	term->id = id;
+	term->name = d->iClockSource;
+	return 0;
+}
 
-				if (!d->bNrInPins)
-					return -EINVAL;
+static int parse_term_uac3_clock_source(struct mixer_build *state,
+					struct usb_audio_term *term,
+					void *p1, int id)
+{
+	struct uac3_clock_source_descriptor *d = p1;
 
-				/* call recursively to retrieve the channel info */
-				err = __check_input_term(state, d->baSourceID[0], term);
-				if (err < 0)
-					return err;
+	term->type = UAC3_CLOCK_SOURCE << 16; /* virtual type */
+	term->id = id;
+	term->name = le16_to_cpu(d->wClockSourceStr);
+	return 0;
+}
 
-				term->type = UAC3_PROCESSING_UNIT << 16; /* virtual type */
-				term->id = id;
-				term->name = 0; /* TODO: UAC3 Class-specific strings */
+#define PTYPE(a, b)	((a) << 8 | (b))
 
-				return 0;
-			}
-			default:
-				return -ENODEV;
-			}
+/*
+ * parse the source unit recursively until it reaches to a terminal
+ * or a branched unit.
+ */
+static int __check_input_term(struct mixer_build *state, int id,
+			      struct usb_audio_term *term)
+{
+	int protocol = state->mixer->protocol;
+	void *p1;
+	unsigned char *hdr;
+
+	for (;;) {
+		/* a loop in the terminal chain? */
+		if (test_and_set_bit(id, state->termbitmap))
+			return -EINVAL;
+
+		p1 = find_audio_control_unit(state, id);
+		if (!p1)
+			break;
+		if (!snd_usb_validate_audio_desc(p1, protocol))
+			break; /* bad descriptor */
+
+		hdr = p1;
+		term->id = id;
+
+		switch (PTYPE(protocol, hdr[2])) {
+		case PTYPE(UAC_VERSION_1, UAC_FEATURE_UNIT):
+		case PTYPE(UAC_VERSION_2, UAC_FEATURE_UNIT):
+		case PTYPE(UAC_VERSION_3, UAC3_FEATURE_UNIT): {
+			/* the header is the same for all versions */
+			struct uac_feature_unit_descriptor *d = p1;
+
+			id = d->bSourceID;
+			break; /* continue to parse */
+		}
+		case PTYPE(UAC_VERSION_1, UAC_INPUT_TERMINAL):
+			return parse_term_uac1_iterm_unit(state, term, p1, id);
+		case PTYPE(UAC_VERSION_2, UAC_INPUT_TERMINAL):
+			return parse_term_uac2_iterm_unit(state, term, p1, id);
+		case PTYPE(UAC_VERSION_3, UAC_INPUT_TERMINAL):
+			return parse_term_uac3_iterm_unit(state, term, p1, id);
+		case PTYPE(UAC_VERSION_1, UAC_MIXER_UNIT):
+		case PTYPE(UAC_VERSION_2, UAC_MIXER_UNIT):
+		case PTYPE(UAC_VERSION_3, UAC3_MIXER_UNIT):
+			return parse_term_mixer_unit(state, term, p1, id);
+		case PTYPE(UAC_VERSION_1, UAC_SELECTOR_UNIT):
+		case PTYPE(UAC_VERSION_2, UAC_SELECTOR_UNIT):
+		case PTYPE(UAC_VERSION_2, UAC2_CLOCK_SELECTOR):
+		case PTYPE(UAC_VERSION_3, UAC3_SELECTOR_UNIT):
+		case PTYPE(UAC_VERSION_3, UAC3_CLOCK_SELECTOR):
+			return parse_term_selector_unit(state, term, p1, id);
+		case PTYPE(UAC_VERSION_1, UAC1_PROCESSING_UNIT):
+		case PTYPE(UAC_VERSION_2, UAC2_PROCESSING_UNIT_V2):
+		case PTYPE(UAC_VERSION_3, UAC3_PROCESSING_UNIT):
+			return parse_term_proc_unit(state, term, p1, id,
+						    UAC3_PROCESSING_UNIT);
+		case PTYPE(UAC_VERSION_2, UAC2_EFFECT_UNIT):
+		case PTYPE(UAC_VERSION_3, UAC3_EFFECT_UNIT):
+			return parse_term_proc_unit(state, term, p1, id,
+						    UAC3_EFFECT_UNIT);
+		case PTYPE(UAC_VERSION_1, UAC1_EXTENSION_UNIT):
+		case PTYPE(UAC_VERSION_2, UAC2_EXTENSION_UNIT_V2):
+		case PTYPE(UAC_VERSION_3, UAC3_EXTENSION_UNIT):
+			return parse_term_proc_unit(state, term, p1, id,
+						    UAC3_EXTENSION_UNIT);
+		case PTYPE(UAC_VERSION_2, UAC2_CLOCK_SOURCE):
+			return parse_term_uac2_clock_source(state, term, p1, id);
+		case PTYPE(UAC_VERSION_3, UAC3_CLOCK_SOURCE):
+			return parse_term_uac3_clock_source(state, term, p1, id);
+		default:
+			return -ENODEV;
 		}
 	}
 	return -ENODEV;
@@ -2712,7 +2730,6 @@ static int parse_audio_unit(struct mixer_build *state, int unitid)
 		return 0; /* skip invalid unit */
 	}
 
-#define PTYPE(a, b)	((a) << 8 | (b))
 	switch (PTYPE(protocol, p1[2])) {
 	case PTYPE(UAC_VERSION_1, UAC_INPUT_TERMINAL):
 	case PTYPE(UAC_VERSION_2, UAC_INPUT_TERMINAL):
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
