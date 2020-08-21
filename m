Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B024DABD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8993A1684;
	Fri, 21 Aug 2020 18:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8993A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598027167;
	bh=GWXXzB5dOe5LzjCmmQyVZuCFOLpd7KoXrQkTgZPh64Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qsTq6Wox14X76bnIBVKXW6s2oNYbXJ+9kLQFCof6BpA2TQORav5BcgI31o75RcGB5
	 20o2rQx9ChLWDhvMOYStzE0uGNzhq5gv69g/pNFvbtur5N9nXMvbAXoxS+GjodG8bU
	 JuIfgKOEnLaC1JhzXumlh0s7062TSbl/dZ36stV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB62BF8035E;
	Fri, 21 Aug 2020 18:16:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D3AAF80351; Fri, 21 Aug 2020 18:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4C20F80218
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C20F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ucZlJ+N8"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A90122BEF;
 Fri, 21 Aug 2020 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026601;
 bh=GWXXzB5dOe5LzjCmmQyVZuCFOLpd7KoXrQkTgZPh64Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ucZlJ+N8x0LMUZADAdk6ZCQAVRe4Ak95nnAfMBkY9cG8t8RCF1T+Dhbp+JM4nuonm
 xnED7VJUxGCTf5jUnZ7xerZLJffdgZBh5uIQ49EH42HcbBoE+8f0gx9llSd2dQiI6l
 7c/FvH5R7PhDNWKx//leHe8rEwCJZKhv0br4kv7w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 44/61] ASoC: Intel: sof_sdw_rt711: remove
 properties in card remove
Date: Fri, 21 Aug 2020 12:15:28 -0400
Message-Id: <20200821161545.347622-44-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161545.347622-1-sashal@kernel.org>
References: <20200821161545.347622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit cf0418cd06ce42fcf35beb33e315b5a77e596926 ]

The rt711 jack detection properties are set from the machine drivers
during the card probe, as done in other ASoC examples.

KASAN reports a use-after-free error when unbinding drivers due to a
confusing sequence between the ACPI core, the device core and the
SoundWire device cleanups.

Rather than fixing this sequence, follow the recommendation to have
the same caller add and remove properties, add an explicit
device_remove_properties() in the card .remove() callback.

In future patches the use of device_add/remove_properties will be
replaced by a direct handling of a swnode, but the sequence will
remain the same.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200717211337.31956-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c        |  1 +
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 sound/soc/intel/boards/sof_sdw_rt711.c  | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 61b5bced29b7e..9f01eb224d615 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -184,6 +184,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "rt711-aif1",
 		.init = sof_sdw_rt711_init,
+		.exit = sof_sdw_rt711_exit,
 	},
 	{
 		.id = 0x1308,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index dd593ff3575b5..b9c9c974b6142 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -84,6 +84,7 @@ int sof_sdw_rt711_init(const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
+int sof_sdw_rt711_exit(struct device *dev, struct snd_soc_dai_link *dai_link);
 
 /* RT700 support */
 int sof_sdw_rt700_init(const struct snd_soc_acpi_link_adr *link,
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 2a4917e3d5614..35be804479caf 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -132,6 +132,21 @@ static int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+int sof_sdw_rt711_exit(struct device *dev, struct snd_soc_dai_link *dai_link)
+{
+	struct device *sdw_dev;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL,
+					  dai_link->codecs[0].name);
+	if (!sdw_dev)
+		return -EINVAL;
+
+	device_remove_properties(sdw_dev);
+	put_device(sdw_dev);
+
+	return 0;
+}
+
 int sof_sdw_rt711_init(const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
-- 
2.25.1

