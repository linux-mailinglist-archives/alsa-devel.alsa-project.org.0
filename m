Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD66463798
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:51:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3713C20CE;
	Tue, 30 Nov 2021 15:51:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3713C20CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638283914;
	bh=YCNFjgzl5xSlYsZjUmZ88kzW4sN7GoaC5NxWdWNu+P0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UshDJlcHMGHQM3IcefiMGlzPCPkRKsIgpuxF1chqMu/HtmwFZVPoSq8uq/TPnTv3c
	 YcMdbi+JndeZ2GN61M66g3pDVDB3UvXLPgCrMRCcdbrF62VvGLEUltllXXF5COtiV+
	 NhDPPM2jBILSNdVPPkN/Z1quvOadL877t4cW/i/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF255F8052E;
	Tue, 30 Nov 2021 15:47:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D173F80520; Tue, 30 Nov 2021 15:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76C1AF8051B
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C1AF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eBOi5hzx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4D688CE1A3E;
 Tue, 30 Nov 2021 14:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34877C53FC1;
 Tue, 30 Nov 2021 14:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283666;
 bh=YCNFjgzl5xSlYsZjUmZ88kzW4sN7GoaC5NxWdWNu+P0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eBOi5hzxSsrcv8R27FhpsrNkVFG/v73sxBE/WoBDO7R67MpGhHW6YGWPv+0P18otj
 PR6DdixYKl98cxZRXVFKNHF3QBsMeOtW3LxF9yEOYJ90tzS+xTtECBJv7OgDcHxmxI
 kA/q1504v6e3PUJdXv+JffHo7DP4YFB4kYg4RdjqddfHFasqAuqAS9ElOQReBLxafM
 5C35ehxd+lLlELMjPGcP4kX3IvQ3vaPhTENvCIX4wH1N963vtucTyFXNQcmy4iLtZj
 73JDGBjHbXkEsZhEw8aoIW+uvZDgutnTkel/ypHh0uv/3dFJ6zkx4KGSCOCRn6QyYt
 bw+a5/lLiGKEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/68] ASoC: Intel: sof_sdw: Add support for SKU
 0B12 product
Date: Tue, 30 Nov 2021 09:46:06 -0500
Message-Id: <20211130144707.944580-10-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
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
index bfbdda323b877..77219c3f8766c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -288,6 +288,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
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

