Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A037E7FA043
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:03:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108A3A4A;
	Mon, 27 Nov 2023 14:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108A3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701090207;
	bh=kZLOygxvuWEPWWyBCeKU0iS+fkvL9wRcEYuTra47C1E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k0DEEu2iKJ4Md23WxoiOTDyIPjUTdoJUEiD5ds295qNhkLK4uBVWsh5tM7Ldrk+6+
	 h/x5HSDVMN/bbGavSLe873vwaw5wYYojdLR5cx4ddJ33k6Ut36hF+DvHpkpB7FimVn
	 ziuCGdpEc/MAVzjZJGbxbaH6qDNdkX2VpBxkg/sY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 310BBF8057F; Mon, 27 Nov 2023 14:02:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7A3F80570;
	Mon, 27 Nov 2023 14:02:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6902F80236; Mon, 27 Nov 2023 14:02:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 544B9F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 544B9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c5FyD/7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701090165; x=1732626165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kZLOygxvuWEPWWyBCeKU0iS+fkvL9wRcEYuTra47C1E=;
  b=c5FyD/7dC5IYFGpYY9d11YwyVlX5hXIsPkodnRRK4Bu9hnrX5tJ+S1Im
   vrd+4WbBqGFOyUMpLSdIfhOHoQVkq1d8oeZd+OoJmRqaEiael8qy/yp3N
   OPU/qoLSjzSUAe9bq9+Qg7LevgFbZia6vLMx/tOuGYBqMiVyXZwrv4xHj
   4VsTEwmN3jxkk5Q8+EDvhuFmqCn8cUhNFfIZ9DKNC2m5Grb8lz36apyAU
   nOc7jQ2nv6cOR7oFHr/Z8lZq8cMaDnze5xDzRXG1qWRgdmkmD4bIGgo+y
   GM54x/AfaPn2rCmuV0ihJuPdI0YUle5hzQyCh19IPfSSFi2Iri3oX1vle
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391568002"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="391568002"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:02:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797228683"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="797228683"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:02:10 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/2] ALSA/ASoC: hdmi/hdac_hda: Conditionally register dais
Date: Mon, 27 Nov 2023 15:02:43 +0200
Message-ID: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6VHZPV44MY7GUSSRSOFGOTGBNDRCPU5O
X-Message-ID-Hash: 6VHZPV44MY7GUSSRSOFGOTGBNDRCPU5O
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VHZPV44MY7GUSSRSOFGOTGBNDRCPU5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Each instance of the hdac_hda registers DAIs to be used for analog and HDMI
audio.
When the system have more than one HDA codec - like most devices then the kernel
log will include the following warning prints:

snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1TX overwritten
snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF1RX overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten

These are printed when the second instance of the hdac_hda is probing since it
is re-registering the DAIs with the same name.
Using some clever way of prefixing might solve the issue but that would need non
backwards compatible changes to topology files.

Pragmatically the hdac_hda instance fro the normal codec should not register
DAIs for HDMI and the hdac_hda instance for the HDMI should not register DAIs
for the analog codec - for example on a SDW device where we have HDA-HDMI and
sdw codecs.

To keep the hdac_hda vendor neutral (altrough it is only used on Intel platforms
afaik) add a helper function to answer the question: is this codec HDMI?
Use the new helper to decide which sets of DAIs to register for the probing
hdac_hda instance.

Regards,
Peter
---
Peter Ujfalusi (2):
  ALSA: hda/hdmi: Add helper function to check if a device is HDMI codec
  ASoC: hdac_hda: Conditionally register dais for HDMI and Analog

 include/sound/hdaudio.h     | 10 ++++++++++
 sound/pci/hda/patch_hdmi.c  | 13 +++++++++++++
 sound/soc/codecs/hdac_hda.c | 22 +++++++++++++++++++---
 3 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.43.0

