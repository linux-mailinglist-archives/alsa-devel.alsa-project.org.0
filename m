Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5F2535B4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 19:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 528191784;
	Wed, 26 Aug 2020 19:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 528191784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598461579;
	bh=KuzlyNHbxe3wMteY71196r68tG2C+GYcW0hND44Jgec=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vVpOsi3KprzTGycR+i1pEtfER0JBH4Ak2Flss6DaI6vfBmVnxx3XrtXe3chpcmEu6
	 UimkVn9Mj87AbfEoBMmQobDRjJKsfZXXAeYQFaRkHTqc7zmVsGJuE+gKzanN2kNFFm
	 5yXfLQT7sVBMo00pqDunw5rPEnVoY7y0nQ3WFI/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B6DFF80143;
	Wed, 26 Aug 2020 19:04:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4C01F801D9; Wed, 26 Aug 2020 19:04:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E844FF80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 19:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E844FF80143
IronPort-SDR: VWDQadDNrzKUcPg+W3SIAlpDRC8UwVRXc+LHsXDHR2uHVB4lwl7ZsC1wZ3JPBXmN7epsIacIHY
 pvP1VBcV3o4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="155597933"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="155597933"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 10:04:16 -0700
IronPort-SDR: y+wrMmF0cJN7S/DwLAxtCY1wPEkiSPZWVRltXocSVcWjApnJ5djBzCl62J9Hx9+ZDZJjXJloP5
 QUGQdIbnMVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="499800261"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2020 10:04:15 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: always check pin power status in i915 pin
 fixup
Date: Wed, 26 Aug 2020 20:03:06 +0300
Message-Id: <20200826170306.701566-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

When system is suspended with active audio playback to HDMI/DP, two
alternative sequences can happen at resume:
  a) monitor is detected first and ALSA prepare follows normal
     stream setup sequence, or
  b) ALSA prepare is called first, but monitor is not yet detected,
     so PCM is restarted without a pin,

In case of (b), on i915 systems, haswell_verify_D0() is not called at
resume and the pin power state may be incorrect. Result is lack of audio
after resume with no error reported back to user-space.

Fix the problem by always verifying converter and pin state in the
i915_pin_cvt_fixup().

BugLink: https://github.com/thesofproject/linux/issues/2388
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 3259d713ace9..1e1b13eb7829 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2794,6 +2794,7 @@ static void i915_pin_cvt_fixup(struct hda_codec *codec,
 			       hda_nid_t cvt_nid)
 {
 	if (per_pin) {
+		haswell_verify_D0(codec, per_pin->cvt_nid, per_pin->pin_nid);
 		snd_hda_set_dev_select(codec, per_pin->pin_nid,
 			       per_pin->dev_id);
 		intel_verify_pin_cvt_connect(codec, per_pin);
-- 
2.27.0

