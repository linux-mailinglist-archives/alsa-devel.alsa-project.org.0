Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E725B5DC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:30:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9C316B2;
	Wed,  2 Sep 2020 23:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9C316B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599082234;
	bh=3z36l9vVtDg6LRaVSiuueU8BXzhuPF2T8gBz0Y7fgCs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+SxTBAYGlZ/td8Avsi7UBtJPmQ+o1MHv6nC3lxK5MC/joxowZgHSiCfiGXnMde+Q
	 tKkksmJ7lm2KHISkEcXw16ia26s5q7SfZPz6Vm15NaHZxYh36Xa85Irtzyed/LhJqV
	 cEZ21KZmka5c8mt9OrwMSkexfyRK01QWr+7uqWdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F8A6F80335;
	Wed,  2 Sep 2020 23:22:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18407F8026F; Wed,  2 Sep 2020 23:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC87BF802DC
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC87BF802DC
IronPort-SDR: 6nRPuyIIH2ZEDTC+mmqPw5C5UjRm0hyn41pdqDuEE/IOGIxxDRgsyX8/MKhC7YMxQSeNM4Vsik
 o5UP+Vaj29rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482876"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482876"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:07 -0700
IronPort-SDR: BDhV0Uc0I0qCGCEGQtZE454H2S92MgDX3rS2QSs8AYQpsF0SGk8nPFIkAfnt0UdrSPSbbGlUDN
 VMkYePEljtZA==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798287"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/18] ALSA: hda: (cosmetic) align function parameters
Date: Wed,  2 Sep 2020 16:21:26 -0500
Message-Id: <20200902212133.30964-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warnings and use same names in headers and C code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/hda_jack.h  | 2 +-
 sound/pci/hda/hda_local.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/hda_jack.h b/sound/pci/hda/hda_jack.h
index 727b6d3ba454..8ceaf0ef5df1 100644
--- a/sound/pci/hda/hda_jack.h
+++ b/sound/pci/hda/hda_jack.h
@@ -77,7 +77,7 @@ int snd_hda_jack_detect_enable(struct hda_codec *codec, hda_nid_t nid,
 
 struct hda_jack_callback *
 snd_hda_jack_detect_enable_callback_mst(struct hda_codec *codec, hda_nid_t nid,
-					int dev_id, hda_jack_callback_fn cb);
+					int dev_id, hda_jack_callback_fn func);
 
 /**
  * snd_hda_jack_detect_enable - enable the jack-detection
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 8c28b1022f49..5beb8aa44ecd 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -100,7 +100,7 @@ int snd_hda_mixer_amp_volume_get(struct snd_kcontrol *kcontrol,
 int snd_hda_mixer_amp_volume_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol);
 int snd_hda_mixer_amp_tlv(struct snd_kcontrol *kcontrol, int op_flag,
-			  unsigned int size, unsigned int __user *tlv);
+			  unsigned int size, unsigned int __user *_tlv);
 int snd_hda_mixer_amp_switch_info(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_info *uinfo);
 int snd_hda_mixer_amp_switch_get(struct snd_kcontrol *kcontrol,
@@ -119,7 +119,7 @@ int snd_hda_mixer_amp_switch_put_beep(struct snd_kcontrol *kcontrol,
 int snd_hda_codec_amp_update(struct hda_codec *codec, hda_nid_t nid,
 			     int ch, int dir, int idx, int mask, int val);
 int snd_hda_codec_amp_stereo(struct hda_codec *codec, hda_nid_t nid,
-			     int dir, int idx, int mask, int val);
+			     int direction, int idx, int mask, int val);
 int snd_hda_codec_amp_init(struct hda_codec *codec, hda_nid_t nid, int ch,
 			   int direction, int idx, int mask, int val);
 int snd_hda_codec_amp_init_stereo(struct hda_codec *codec, hda_nid_t nid,
@@ -198,7 +198,7 @@ int snd_hda_input_mux_put(struct hda_codec *codec,
 			  unsigned int *cur_val);
 int snd_hda_add_imux_item(struct hda_codec *codec,
 			  struct hda_input_mux *imux, const char *label,
-			  int index, int *type_index_ret);
+			  int index, int *type_idx);
 
 /*
  * Multi-channel / digital-out PCM helper
@@ -642,7 +642,7 @@ unsigned int snd_hda_codec_eapd_power_filter(struct hda_codec *codec,
  */
 int snd_hda_enum_helper_info(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_info *uinfo,
-			     int num_entries, const char * const *texts);
+			     int num_items, const char * const *texts);
 #define snd_hda_enum_bool_helper_info(kcontrol, uinfo) \
 	snd_hda_enum_helper_info(kcontrol, uinfo, 0, NULL)
 
-- 
2.25.1

