Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA4B7B1EEA
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 15:48:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BBADDEE;
	Thu, 28 Sep 2023 15:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BBADDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695908890;
	bh=Ts1jWghxO7+K+RS1Bn9wr6DL0aupcZhr5qnKqSn6f9w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eD8F2O/hC+aoc3Y3R7Kx3FNUm+ld3+kMwIsMB964yhbH61BaIa+hsFtiG2Vzr6Sfd
	 AjBUf9c0mvaS5QUtgRKHsg79MsK6FJz9HzVjNLfDaLf3elSRQYJQ6G4KoAiwsvYpVD
	 jkb3k+W94qv2/Sny6Dlca65kgBREg3YexT6m7oxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5832F80549; Thu, 28 Sep 2023 15:47:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA20F8016A;
	Thu, 28 Sep 2023 15:47:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA5C6F801D5; Thu, 28 Sep 2023 15:47:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB1CCF80130
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 15:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB1CCF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fg9Ix3fz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695908829; x=1727444829;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ts1jWghxO7+K+RS1Bn9wr6DL0aupcZhr5qnKqSn6f9w=;
  b=fg9Ix3fzDLSMsYM+c6vMAO1pRlFiJKeaCSRjYPwuiCqn4siFnr+8ZCbV
   uGRy5p+DbhDSwtWs5W9f4CQSobQisW7xyqarvFRb6V+4vOwBC81fmV9N6
   +KbixshOPivLcVYlq9YxdnPh6U6PLuWbEoZsz9z8B2GBwnGBumyz/BWLd
   1h+di0PhA+EvIVTnk6vD7fB9Fp2Sgi+JUpZdzQ7OmGFba+AEmo917Uqa5
   yJHoiW8X8YVKV30S12RhwMlkLfgLjkFqcOKH3Dq3ie4zieVPNI6y1CsnL
   cZMUF0u2vPDvc8p96P4Nx0vCX1FfVed9vQZ66yVWHsR4Y5sYdrkwl3njx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380944720"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200";
   d="scan'208";a="380944720"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839871129"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200";
   d="scan'208";a="839871129"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 06:47:03 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	Jonathan Corbet <corbet@lwn.net>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: doc: Update codec to codec examples
Date: Thu, 28 Sep 2023 15:47:06 +0200
Message-Id: <20230928134706.662947-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 56I776TRB2YBJ5EVYAX52P4HL6WJ7BP6
X-Message-ID-Hash: 56I776TRB2YBJ5EVYAX52P4HL6WJ7BP6
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56I776TRB2YBJ5EVYAX52P4HL6WJ7BP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are examples in documentation for codec to codec connection.
However they show method before recent series of patches which renamed
the fields. Update documentation accordingly.

Fixes: 7ddc7f91beb2 ("ASoC: soc.h: clarify Codec2Codec params")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 Documentation/sound/soc/codec-to-codec.rst | 8 +++++---
 Documentation/sound/soc/dpcm.rst           | 3 ++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/soc/codec-to-codec.rst b/Documentation/sound/soc/codec-to-codec.rst
index 4eaa9a0c41fc..0418521b6e03 100644
--- a/Documentation/sound/soc/codec-to-codec.rst
+++ b/Documentation/sound/soc/codec-to-codec.rst
@@ -70,7 +70,8 @@ file:
     .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
             | SND_SOC_DAIFMT_CBM_CFM,
     .ignore_suspend = 1,
-    .params = &dsp_codec_params,
+    .c2c_params = &dsp_codec_params,
+    .num_c2c_params = 1,
  },
  {
     .name = "DSP-CODEC",
@@ -81,12 +82,13 @@ file:
     .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
             | SND_SOC_DAIFMT_CBM_CFM,
     .ignore_suspend = 1,
-    .params = &dsp_codec_params,
+    .c2c_params = &dsp_codec_params,
+    .num_c2c_params = 1,
  },
 
 Above code snippet is motivated from sound/soc/samsung/speyside.c.
 
-Note the "params" callback which lets the dapm know that this
+Note the "c2c_params" callback which lets the dapm know that this
 dai_link is a codec to codec connection.
 
 In dapm core a route is created between cpu_dai playback widget
diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 77f67ded53de..2d7ad1d91504 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -368,7 +368,8 @@ The machine driver sets some additional parameters to the DAI link i.e.
 		.codec_name = "modem",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &dai_params,
+		.c2c_params = &dai_params,
+		.num_c2c_params = 1,
 	}
 	< ... more DAI links here ... >
 
-- 
2.34.1

