Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A05763CC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C701903;
	Fri, 15 Jul 2022 16:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C701903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896222;
	bh=+MMIquig5cpoyfTPaYiOzpz2GbcUScDh41aFsbkQyz8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YqMkWwNau7OrA97OhzyrhyTBeGvbIqtvYR6NbhpY8NkheA8Ds3nqWOVHwAey1JyRJ
	 371SmKFcijMVAacCCpURRzsdLmavlRW5OMr1jFQAj15Zy+7yJCcb58+ZX+RvrL59A0
	 UQOhcTgvJi8CjHcRnwTBKppIwqMZ+nTR0Ttp78Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D992FF80542;
	Fri, 15 Jul 2022 16:42:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C270F8053D; Fri, 15 Jul 2022 16:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B5C1F800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B5C1F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DsSXMm1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896120; x=1689432120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+MMIquig5cpoyfTPaYiOzpz2GbcUScDh41aFsbkQyz8=;
 b=DsSXMm1rXufgbAppkppazPX6vOME0FZZjUq4N2ZTxh7bBvANbxoAL+2r
 ZApgX4l2tN2TabUN8jtqkM5qahxNCtJWgF7jpiVgtthgyoGGF2Hx7uAyp
 Uqiv1kkwMXJW71S2It+DzRUx4xI4q6zoF5nnFhPu1UhN+OeeOvq6uRWv/
 IoJNZ2Rj0u2I2pA45YrsHX/GmidC07HE1W+n9AH0u/LOIXf7OdSFcY1yt
 0tAR/ClwxKD0K+Fz+xs4rTzNkcO6Ed37ucX7oCB/96JKG0xZdH4h/gJK6
 uKpAH/3ZLXLfwGQ1K7hJPCRHpqPu/iWcnQzPo92JSv30RQ5w+B0Bh594P Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286947087"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="286947087"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="593756519"
Received: from lgonzal1-mobl02.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.14.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: sof_sdw: avoid oops in error handling
Date: Fri, 15 Jul 2022 09:41:41 -0500
Message-Id: <20220715144144.274770-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
References: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>
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

While tinkering with ACPI work-arounds for the HP Omen 16 support, we
identified a corner case where the headset codec device properties are
not set in the codec .init when -EPROBE_DEFER is returned, but
released unconditionally in the .exit().

This leads to a kernel oops

[    4.186891] sof_sdw sof_sdw: snd_soc_register_card failed -517
[    4.186896] BUG: kernel NULL pointer dereference, address: 00000000000003f0
[    4.186914] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    4.186926] RIP: 0010:dev_fwnode+0x5/0x20
[    4.186974]  device_remove_software_node+0x10/0x80
[    4.186982]  sof_sdw_rt711_exit+0x19/0x30 [snd_soc_sof_sdw]
[    4.186990]  mc_dailink_exit_loop+0x94/0xc0 [snd_soc_sof_sdw]
[    4.186996]  ? rt711_rtd_init+0x170/0x170 [snd_soc_sof_sdw]

A similar error case can occur if the addition of the device property
fails. We need to test if the property was successfully added before
removing it.

BugLink: https://github.com/thesofproject/linux/issues/3727
Fixes: 768ad6d80db2d ("ASoC: Intel: sof_sdw: handle errors on card registration")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt711.c      | 3 +++
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 49ff0871e9e7..8291967f23f3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -139,6 +139,9 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
+	if (!ctx->headset_codec_dev)
+		return 0;
+
 	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
index b3fc32bacfa8..7f16304d025b 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
@@ -140,6 +140,9 @@ int sof_sdw_rt711_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
+	if (!ctx->headset_codec_dev)
+		return 0;
+
 	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 
-- 
2.34.1

