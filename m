Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B880A45C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 14:22:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2219B7F8;
	Fri,  8 Dec 2023 14:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2219B7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702041772;
	bh=7F9pKUKkgbIsuxLviTWduDuddL+0J+DEhNkNOFIdf8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ey+a2bTOEHBES26y54sYD2Y1ivGx2eF4MxaLef8nQ68s3BKbqLIxE/3bBKXMrV9rc
	 IeUqfPYXylsPwIiVMC+qGjnUlP2Q/Y54Bv8nXSUDFBWcD0iEMv0Bzex8yRLyMB3eUV
	 jLyFSZGhjAEK+aMsdh7Ju/fEPbpZpPCrrWi/URvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42A32F805E0; Fri,  8 Dec 2023 14:22:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81E13F805E1;
	Fri,  8 Dec 2023 14:22:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC8AF80563; Fri,  8 Dec 2023 14:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66F33F805BD
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 14:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F33F805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lFeMfBPN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702041725; x=1733577725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7F9pKUKkgbIsuxLviTWduDuddL+0J+DEhNkNOFIdf8w=;
  b=lFeMfBPNfhdXyQ7ClUGnmSMvp+2fRafQDYcWGdfZXn3mCBmSSEoZjCtk
   tSIKwU/hW8ieM9HI2+HcE57Xqks4yQLcvoVBJX8EukwpkMAxvt6VsiYmC
   Kw/9IYQLNuDztKLh/wBDQQdWiyQ4+5DQKGlMY2oNyT6xpu64AtdtkCAHG
   c94i6u0TsDez4oHcm4O1Imk6YHOG4qvu8PmL0bUUlkL+G+R/RPBUbbEQZ
   qmFFImDqJqNtgo9q2ZjwM7N3kSGhBt15rdE3NJYWvBqa59OZUJqhW57Si
   aLGFS6eEn5DoWsINcfyn6q+dfdwV08xD29ZW4q4C3+6oNfez3YS1Dxrdx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394141787"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="394141787"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 05:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915948551"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="915948551"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 05:21:59 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.de
Cc: kai.vehmanen@linux.intel.com,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Jani Saarinen <jani.saarinen@intel.com>
Subject: [PATCH 2/2] ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170
 variants
Date: Fri,  8 Dec 2023 15:21:27 +0200
Message-ID: <20231208132127.2438067-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
References: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GYP3PT7SYTMIEXFSZNTJMZA4LWWZU4KN
X-Message-ID-Hash: GYP3PT7SYTMIEXFSZNTJMZA4LWWZU4KN
X-MailFrom: kai.vehmanen@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYP3PT7SYTMIEXFSZNTJMZA4LWWZU4KN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On ASUSTeK Z170M PLUS and Z170 PRO GAMING systems, the display codec
pins are not registered properly without the force-connect quirk. The
codec will report only one pin as having external connectivity, but i915
finds all three connectors on the system, so the two drivers are not
in sync.

Issue found with DRM igt-gpu-tools test kms_hdmi_inject@inject-audio.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/9801
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Saarinen <jani.saarinen@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 88d7e037a57c..200779296a1b 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1993,6 +1993,8 @@ static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x8715, "HP", 1),
+	SND_PCI_QUIRK(0x1043, 0x86ae, "ASUS", 1),  /* Z170 PRO */
+	SND_PCI_QUIRK(0x1043, 0x86c7, "ASUS", 1),  /* Z170M PLUS */
 	SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
 	SND_PCI_QUIRK(0x8086, 0x2060, "Intel NUC5CPYB", 1),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", 1),
-- 
2.43.0

