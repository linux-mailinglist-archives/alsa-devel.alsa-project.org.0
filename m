Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB6148752
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 15:23:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1FE166B;
	Fri, 24 Jan 2020 15:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1FE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579875783;
	bh=t62mGj5e7D9E5r+bkh9nbCAMKfSjKgyvinHs0YYysnA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0nGBWQCUrHJ9eKdJpHzXVxHwgzFn+NWd0K9P2MhkFIyVMxwbblK/Un3zoMbgYy0o
	 KUMtQYiCBgw4/q9TQD5ozVQTUE15bjNBnqiUZ0h4MEdRYFnSmJwfKjfTm10m16DxmZ
	 G1VpLtwJGYKN2/1PEnEs+tFrJKGBO2iTZlqx/IkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D945F80291;
	Fri, 24 Jan 2020 15:19:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E238FF8028E; Fri, 24 Jan 2020 15:19:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7764F8028A
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 15:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7764F8028A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qf+KVs/j"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E64C22522;
 Fri, 24 Jan 2020 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579875560;
 bh=2dCeTe+htp6bYLj6TEvc7v6Uv3nrYBGHsJ2ytgCOJwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qf+KVs/j+NZdccPeR7K11nfWMilqR/NcCfFKzpcsNUq+kjQ7GbfTakvHykyOen7be
 qiqSj2eU1nbVSU20SVS+XAmOZdMUssfiKvH9ovQt8hJ2O3ibdMX7KucTZ3x1lqwL0C
 dVgxSAcUmTs7wLRdFBvoQbYnVfJx4iT5LhIpLONw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 24 Jan 2020 09:17:24 -0500
Message-Id: <20200124141817.28793-54-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124141817.28793-1-sashal@kernel.org>
References: <20200124141817.28793-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 054/107] ASoC: hdac_hda: Fix error
	in driver removal after failed probe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 552b1a85da9f63856e7e341b81c16e0e078204f1 ]

In case system has multiple HDA codecs, and codec probe fails for
at least one but not all codecs, driver will end up cancelling
a non-initialized timer context upon driver removal.

Call trace of typical case:

[   60.593646] WARNING: CPU: 1 PID: 1147 at kernel/workqueue.c:3032
__flush_work+0x18b/0x1a0
[...]
[   60.593670]  __cancel_work_timer+0x11f/0x1a0
[   60.593673]  hdac_hda_dev_remove+0x25/0x30 [snd_soc_hdac_hda]
[   60.593674]  device_release_driver_internal+0xe0/0x1c0
[   60.593675]  bus_remove_device+0xd6/0x140
[   60.593677]  device_del+0x175/0x3e0
[   60.593679]  ? widget_tree_free.isra.7+0x90/0xb0 [snd_hda_core]
[   60.593680]  snd_hdac_device_unregister+0x34/0x50 [snd_hda_core]
[   60.593682]  snd_hdac_ext_bus_device_remove+0x2a/0x60 [snd_hda_ext_core]
[   60.593684]  hda_dsp_remove+0x26/0x100 [snd_sof_intel_hda_common]
[   60.593686]  snd_sof_device_remove+0x84/0xa0 [snd_sof]
[   60.593687]  sof_pci_remove+0x10/0x30 [snd_sof_pci]
[   60.593689]  pci_device_remove+0x36/0xb0

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200110235751.3404-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/hdac_hda.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 4570f662fb48b..d78f4d856aaff 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -498,7 +498,9 @@ static int hdac_hda_dev_remove(struct hdac_device *hdev)
 	struct hdac_hda_priv *hda_pvt;
 
 	hda_pvt = dev_get_drvdata(&hdev->dev);
-	cancel_delayed_work_sync(&hda_pvt->codec.jackpoll_work);
+	if (hda_pvt && hda_pvt->codec.registered)
+		cancel_delayed_work_sync(&hda_pvt->codec.jackpoll_work);
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
