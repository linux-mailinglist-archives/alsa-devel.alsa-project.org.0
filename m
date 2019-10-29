Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E43EDE7EE5
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 04:37:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3049521AC;
	Tue, 29 Oct 2019 04:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3049521AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572320239;
	bh=J9jYXTKN6+OpOK9DpezZOaW5nj2voUslk1OPKKAe4a4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F0YvQpxqq5PXdeduQwwHHXRaMHRQ6d3Rmwr+nzo/cxKMJ+FFHrlJcP5DIMf7D2Cd2
	 H7AElenTK/Pa8K2HdiGtDZGjK3Pz/bexuDGMSFk3wU+N9JDuzvQW3v5YEK/iBxMgi2
	 cnfgINB1IWfoWWqQeuO/SNX5i/Q89DSE9dNZkfXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 617F1F8036C;
	Tue, 29 Oct 2019 04:35:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3E5DF80392; Tue, 29 Oct 2019 04:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE6ACF8015A
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 04:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE6ACF8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 20:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,242,1569308400"; d="scan'208";a="229916864"
Received: from macchian.itwn.intel.com ([10.5.230.13])
 by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2019 20:35:25 -0700
From: mac.chiang@intel.com
To: alsa-devel@alsa-project.org
Date: Tue, 29 Oct 2019 11:35:24 +0800
Message-Id: <1572320124-13250-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com, mac.chiang@intel.com,
 broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH] ASoC: Intel: bxt_da7219_max98357a: update
	dai_link platform name
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

From: Mac Chiang <mac.chiang@intel.com>

redefine soc platform name "0000:00:1f.3" if cml core

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index ac1dea5..38b7dbe 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -40,6 +40,13 @@ struct bxt_card_private {
 	struct list_head hdmi_pcm_list;
 };
 
+static struct snd_soc_dai_link_component platform_component[] = {
+	{
+		/* name might be overridden during probe */
+		.name = "0000:00:1f.3"
+	}
+};
+
 enum {
 	BXT_DPCM_AUDIO_PB = 0,
 	BXT_DPCM_AUDIO_CP,
@@ -708,6 +715,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				broxton_dais[i].name = "SSP0-Codec";
 				broxton_dais[i].cpus->dai_name = "SSP0 Pin";
 			}
+			broxton_dais[i].platforms = platform_component;
 		}
 	}
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
