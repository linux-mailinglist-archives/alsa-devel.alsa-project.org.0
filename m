Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4B647392
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 16:53:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FAE0193D;
	Thu,  8 Dec 2022 16:52:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FAE0193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670514784;
	bh=oMk+BMYL1mwY3ubzcp9/orDKGI0N1dRNC1MgAh2MVBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iE7bfr+90ilQGnoeXQwxhRxxg11znXmqgJk0khtB7F5wSmxfhoRXkSknkaq4+elXr
	 Uz433/S20Wby5ZUFAUBssvflsrpmJ5XZ93LjvFRUUsQef/xjAPbQMpmS9DGsgOZNf8
	 7tEiNjmBwwqi3XIvG0dsSPJNh1Nk3Lr3Txnsh1S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94CB1F80564;
	Thu,  8 Dec 2022 16:51:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A692F8024C; Thu,  8 Dec 2022 16:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A9A6F8024C
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 16:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A9A6F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="knwC2yG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670514679; x=1702050679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMk+BMYL1mwY3ubzcp9/orDKGI0N1dRNC1MgAh2MVBE=;
 b=knwC2yG0lsZDa2pX8Y0uC0DD9Wd07HM4qK45Ggz0HIxvRs54JAZY2T83
 W6+7yIupvKc1gD/4GmQCZtCElsiVkK18vpwZGCHZIvHVH4vc0rhocRgoK
 9UenbzowLfhuoqZcpyOwcDgg/mx49Hac2XYs9up/rMpJJtUVMd3tWn1c4
 UlRVV1sLptU8fGy8OFxu1GeWx7kbWuxgUSsMwPvHI1YGY18YVsf88er8p
 p+/S6FlJNCoyirnSe9sp+TISD5Ij68O24eqF7JJczAJQAsONcE81BQm1H
 ow3MgBzVqcEh2NRjQ9sBXqECoH/7GC0F/dexiXW30DjFuPTHfZ19rlZQZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="304856986"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="304856986"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 07:44:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="710514728"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="710514728"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2022 07:44:30 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 3/3] ALSA: hda/hdmi: fix stream-id config keep-alive for rt
 suspend
Date: Thu,  8 Dec 2022 17:43:58 +0200
Message-Id: <20221208154358.3848764-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208154358.3848764-1-kai.vehmanen@linux.intel.com>
References: <20221208154358.3848764-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: intel-gfx@lists.freedesktop.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When the new style KAE keep-alive implementation is used on compatible
Intel hardware, the clocks are maintained when codec is in D3. The
generic code in hda_cleanup_all_streams() can however interfere with
generation of audio samples in this mode, by setting the stream and
channel ids to zero.

To get full benefit of the keepalive, set the new
no_stream_clean_at_suspend quirk bit on affected Intel hardware. When
this bit is set, stream cleanup is skipped in hda_call_codec_suspend().

Special handling is needed for the case when system goes to suspend. The
stream id programming can be lost in this case. This will also cause
codec->cvt_setups to be out of sync. Handle this by implementing custom
suspend/resume handlers. If keep-alive is active for any converter, set
the quirk flags no_stream_clean_at_suspend and forced_resume. Upon
resume, keepalive programming is restored if needed.

Fixes: 15175a4f2bbb ("ALSA: hda/hdmi: add keep-alive support for ADL-P and DG2")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/hda_codec.h  |  1 +
 sound/pci/hda/hda_codec.c  |  3 +-
 sound/pci/hda/patch_hdmi.c | 90 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 25ec8c181688..eba23daf2c29 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -258,6 +258,7 @@ struct hda_codec {
 	unsigned int link_down_at_suspend:1; /* link down at runtime suspend */
 	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
 	unsigned int forced_resume:1; /* forced resume for jack */
+	unsigned int no_stream_clean_at_suspend:1; /* do not clean streams at suspend */
 
 #ifdef CONFIG_PM
 	unsigned long power_on_acct;
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index b4d1e658c556..edd653ece70d 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2886,7 +2886,8 @@ static unsigned int hda_call_codec_suspend(struct hda_codec *codec)
 	snd_hdac_enter_pm(&codec->core);
 	if (codec->patch_ops.suspend)
 		codec->patch_ops.suspend(codec);
-	hda_cleanup_all_streams(codec);
+	if (!codec->no_stream_clean_at_suspend)
+		hda_cleanup_all_streams(codec);
 	state = hda_set_power_state(codec, AC_PWRST_D3);
 	update_power_acct(codec, true);
 	snd_hdac_leave_pm(&codec->core);
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1618419647aa..dfae3443f6bd 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2921,6 +2921,88 @@ static void i915_pin_cvt_fixup(struct hda_codec *codec,
 	}
 }
 
+#ifdef CONFIG_PM
+static int i915_adlp_hdmi_suspend(struct hda_codec *codec)
+{
+	struct hdmi_spec *spec = codec->spec;
+	bool silent_streams = false;
+	int pin_idx, res;
+
+	res = generic_hdmi_suspend(codec);
+
+	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
+		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
+
+		if (per_pin->silent_stream) {
+			silent_streams = true;
+			break;
+		}
+	}
+
+	if (silent_streams && spec->silent_stream_type == SILENT_STREAM_KAE) {
+		/*
+		 * stream-id should remain programmed when codec goes
+		 * to runtime suspend
+		 */
+		codec->no_stream_clean_at_suspend = 1;
+
+		/*
+		 * the system might go to S3, in which case keep-alive
+		 * must be reprogrammed upon resume
+		 */
+		codec->forced_resume = 1;
+
+		codec_dbg(codec, "HDMI: KAE active at suspend\n");
+	} else {
+		codec->no_stream_clean_at_suspend = 0;
+		codec->forced_resume = 0;
+	}
+
+	return res;
+}
+
+static int i915_adlp_hdmi_resume(struct hda_codec *codec)
+{
+	struct hdmi_spec *spec = codec->spec;
+	int pin_idx, res;
+
+	res = generic_hdmi_resume(codec);
+
+	/* KAE not programmed at suspend, nothing to do here */
+	if (!codec->no_stream_clean_at_suspend)
+		return res;
+
+	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
+		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
+
+		/*
+		 * If system was in suspend with monitor connected,
+		 * the codec setting may have been lost. Re-enable
+		 * keep-alive.
+		 */
+		if (per_pin->silent_stream) {
+			unsigned int param;
+
+			param = snd_hda_codec_read(codec, per_pin->cvt_nid, 0,
+						   AC_VERB_GET_CONV, 0);
+			if (!param) {
+				codec_dbg(codec, "HDMI: KAE: restore stream id\n");
+				silent_stream_enable_i915(codec, per_pin);
+			}
+
+			param = snd_hda_codec_read(codec, per_pin->cvt_nid, 0,
+						   AC_VERB_GET_DIGI_CONVERT_1, 0);
+			if (!(param & (AC_DIG3_KAE << 16))) {
+				codec_dbg(codec, "HDMI: KAE: restore DIG3_KAE\n");
+				silent_stream_set_kae(codec, per_pin, true);
+			}
+		}
+	}
+
+	return res;
+}
+#endif
+
 /* precondition and allocation for Intel codecs */
 static int alloc_intel_hdmi(struct hda_codec *codec)
 {
@@ -3051,8 +3133,14 @@ static int patch_i915_adlp_hdmi(struct hda_codec *codec)
 	if (!res) {
 		spec = codec->spec;
 
-		if (spec->silent_stream_type)
+		if (spec->silent_stream_type) {
 			spec->silent_stream_type = SILENT_STREAM_KAE;
+
+#ifdef CONFIG_PM
+			codec->patch_ops.resume = i915_adlp_hdmi_resume;
+			codec->patch_ops.suspend = i915_adlp_hdmi_suspend;
+#endif
+		}
 	}
 
 	return res;
-- 
2.38.1

