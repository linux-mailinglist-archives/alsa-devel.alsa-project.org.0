Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D436480D3
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 11:20:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10AB021BC;
	Fri,  9 Dec 2022 11:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10AB021BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670581245;
	bh=pxUMBLjt7yZoC5tJjDbXBzENM6MF7qHjgkxlHXw784A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WYma6EZv+9jyB9LfiNI9VyzilrF7NTfla60h9Rt/yc3QR/CBjIDhcqoQLY4ZsyaKJ
	 JbfkK+0qFYrUh37VJfsXuzdSFbdkS5FubDhfSTLj1CKssi4MjtPG4c82d+I5mM67vb
	 5MxskiOP60Y5sKRqDlzlufYC3eF+FCsEqcy4yh5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39AD6F8024D;
	Fri,  9 Dec 2022 11:18:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 488CFF8024D; Fri,  9 Dec 2022 11:18:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58AD1F8024D
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 11:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58AD1F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hUbG4aaO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670581135; x=1702117135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxUMBLjt7yZoC5tJjDbXBzENM6MF7qHjgkxlHXw784A=;
 b=hUbG4aaOpllV80+ijRLp3OmCBzeyg2oWZMrCMDsYAZPh4ji4gQj4p6Yo
 X3HvZhoeUzUSOJichRYLek6pxCT7JjKcDZuTrKfomzPev+IvEDMNeoskX
 GqSEuvxPQMIK/BWFZJd7g/E4eYul8TRekxg4jmTyasKbce2scek2cV4IX
 ww2UfxAD/ASKQ06un77YtukB+wYAxZzZMSAJ9kPte5qAZuJIc6uld1B2f
 7OP9K0q0BR81rCAM5Nrcg6gwI6eemDL4vnp/AwK1ZEBCdIgNc1OgyOcR+
 bbxPWHX524b6a3zXwgakqvMt4wrxMTQpAHvgBZqX4Agb5UD/KZHABnxCl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="316135200"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="316135200"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 02:18:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="649510770"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="649510770"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2022 02:18:48 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2 2/3] ALSA: hda/hdmi: set default audio parameters for KAE
 silent-stream
Date: Fri,  9 Dec 2022 12:18:21 +0200
Message-Id: <20221209101822.3893675-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209101822.3893675-1-kai.vehmanen@linux.intel.com>
References: <20221209101822.3893675-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If the stream-id is zero, the keep-alive (KAE) will only ensure clock is
generated, but no audio samples are sent over display link. This happens
before first real audio stream is played out to a newly connected
receiver.

Reuse the code in silent_stream_enable() to set up stream parameters
to sane defaults values, also when using the newer keep-alive flow.

Fixes: 15175a4f2bbb ("ALSA: hda/hdmi: add keep-alive support for ADL-P and DG2")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 48bb23745ed3..f8e6ff7f8820 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1738,6 +1738,7 @@ static void silent_stream_enable(struct hda_codec *codec,
 
 	switch (spec->silent_stream_type) {
 	case SILENT_STREAM_KAE:
+		silent_stream_enable_i915(codec, per_pin);
 		silent_stream_set_kae(codec, per_pin, true);
 		break;
 	case SILENT_STREAM_I915:
-- 
2.38.1

