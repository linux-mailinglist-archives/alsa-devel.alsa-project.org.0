Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD2463851
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:56:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA912172;
	Tue, 30 Nov 2021 15:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA912172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638284181;
	bh=oYA65Mz1tebzDVy9kSsFd0niXTSnr3fsrQDgHn9FQ0U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6840FyFlrK+LSbxeo82R0oc/bOcgE2SqJpCEiSMu9QrEuVT4XisuvIuDj4oxRXCJ
	 3XQx1S7dZmE7GIgfFZCIS5Yo8YnUywWXzMlY7LLiBXRnH0u2/ZHEZy1TEjooiRvLDA
	 WtO2tVvtbOTFhV5I7DXIYYzXsNCE0gqkCn2sVBvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B503F80506;
	Tue, 30 Nov 2021 15:50:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D338F80564; Tue, 30 Nov 2021 15:50:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DADF4F80506
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DADF4F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RtKSegVC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C94BFB817AB;
 Tue, 30 Nov 2021 14:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6950C53FD1;
 Tue, 30 Nov 2021 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283845;
 bh=oYA65Mz1tebzDVy9kSsFd0niXTSnr3fsrQDgHn9FQ0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RtKSegVCE1+2ExnU24T/3MIG9y7NsV5o+Uo6eAQ3x3xLmT+roieFCRJbyQbxcS2/K
 ze83ECwiVlEkPMWs/JQEfj9eEI9pbd5PQ9hhI2eEcmqNX001wAwPr8v2uj9i99ElRJ
 gVxqOCuwOnP5CvJ91sVaqtMFVQdqVTyguqHXWVVpBql+loCAyXcpN/+csxDArKk4hD
 BKITcDGi9gfMnwFioibuqEoPzyx/YeMKemMcN49TZNwCT+qf2G/swaCwxGTbJ1JP9i
 BBZkr66nE4hgEBhb7zXTe/rcwjVTTvLiLXBcI6aFrL9zs21PMU/6pl5AyAptxrkcPS
 jM7BeLzmnRiew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 07/43] ASoC: Intel: sof_sdw: Add support for SKU
 0B12 product
Date: Tue, 30 Nov 2021 09:49:44 -0500
Message-Id: <20211130145022.945517-7-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, Sasha Levin <sashal@kernel.org>,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Gongjun Song <gongjun.song@intel.com>, tiwai@suse.com,
 yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, vamshi.krishna.gopal@intel.com,
 yong.zhi@intel.com
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

From: Gongjun Song <gongjun.song@intel.com>

[ Upstream commit f55af7055cd465f6b767a0c1126977d4529c63c8 ]

This product supports a SoundWire headset codec, SoundWire
capture from local microphones and two SoundWire amplifiers.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20211105022646.26305-10-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index de3706125fe1a..2a128a911dbe8 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -239,6 +239,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B12")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.33.0

