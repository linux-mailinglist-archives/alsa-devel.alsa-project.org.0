Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E2B867575
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 13:45:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A27BB70;
	Mon, 26 Feb 2024 13:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A27BB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708951507;
	bh=cewHMOUP9XE8f1iBRQp0XY/AtymJk2wyw8t26geqAWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZPVdgfSlNyFPhkQrxqthrSqYFZfF33d6//1qI1x5pGDyOtUq/4/0PxfskeKGlusfe
	 U0e05R1HE/9iQwnL9GZD0zO9yIR5lZPHLFxfXmLn1lat3u+h8o1/7/NMrgoOxXfTO3
	 w9t62eRgljGT8vvhSQtBqhUtGQq6FGihyndd1xA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2003AF8067D; Mon, 26 Feb 2024 13:43:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ABDEF8065A;
	Mon, 26 Feb 2024 13:43:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C8F1F80600; Mon, 26 Feb 2024 13:43:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57E86F805D8
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 13:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57E86F805D8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jg6za7fK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951396; x=1740487396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cewHMOUP9XE8f1iBRQp0XY/AtymJk2wyw8t26geqAWQ=;
  b=Jg6za7fK83y8rOScQdzoAYZWhUSipTqO8zcwf3XcXIjEGRnH45UbmVBK
   FdpKzF/ejfBEjQHkjXjKMc8gbiZ+MPkfcNPEil7nqfu2fnIVmLsvlJut4
   1n4bBLNWl9RnFSJ9XavX/pgue8EpIP6HTaFssBtcIPHuKtXK3kBkhtYgZ
   9aqw4whgeIpfuyiQmgugrPgAiN3zFFCMghf4JLQIdS8GOHGfLZUOR44Hy
   mg3DeAdH6xxsrGSsTBOMXWclANsyWfV0YZkn3qGSWvNu2+noij4m3YLsx
   b+rGv8r4nPRASaBA+7DIbpirDs5w4ab4zi7gNG7A/+hzIT/7gHFW/xvtl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658271"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="28658271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="6688625"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:43:11 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 5/5] ALSA: hda: Reuse for_each_pcm_streams()
Date: Mon, 26 Feb 2024 13:44:32 +0100
Message-Id: <20240226124432.1203798-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226124432.1203798-1-cezary.rojewski@intel.com>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PAE7VDBYFCGS3UU3SJCQ62YTYXOWEANY
X-Message-ID-Hash: PAE7VDBYFCGS3UU3SJCQ62YTYXOWEANY
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAE7VDBYFCGS3UU3SJCQ62YTYXOWEANY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the macro to improve readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 12f02cdc9659..2cac337f5263 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3313,7 +3313,7 @@ int snd_hda_codec_parse_pcms(struct hda_codec *codec)
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list) {
 		int stream;
 
-		for (stream = 0; stream < 2; stream++) {
+		for_each_pcm_streams(stream) {
 			struct hda_pcm_stream *info = &cpcm->stream[stream];
 
 			if (!info->substreams)
-- 
2.25.1

