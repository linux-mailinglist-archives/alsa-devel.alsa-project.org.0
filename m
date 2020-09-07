Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DDF260003
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 18:42:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8833E182C;
	Mon,  7 Sep 2020 18:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8833E182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599496972;
	bh=M0PtdWcYxeBelsDbpwDJEsRn7qwzPiUFqHU6byxnTwI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWt7JHBxCzJVR8Rop7ep9qycI9TGvUTCtRtAeOYZraMXYDsobPXyj3v4miBUnYgj/
	 FsaPHcIlffGX0AY1wPfQS/cBdE24PUpO4cWvKoL0pUZ527wnmpJre5lLwwN0llEvBX
	 nyFQWd8ZYc4D/hXTuJgIGAEt+MFzogttp4J+FUqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34884F8033F;
	Mon,  7 Sep 2020 18:36:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FA3EF8033E; Mon,  7 Sep 2020 18:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 228E1F802DC
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 18:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 228E1F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="y5OXdxQG"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51F2321D95;
 Mon,  7 Sep 2020 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496556;
 bh=M0PtdWcYxeBelsDbpwDJEsRn7qwzPiUFqHU6byxnTwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y5OXdxQGo8nZbgr7qiMk2cNjYo+7/Zj4I8JMlo+KVRS97fPt6ZfBdSoAHj+4Pb99/
 kbOpsaKg1ohN9v8+gi/DWAloX75SVCZdttUKH+3StGvi2JTZMlHfnt++41LCzlNjae
 TrFAJ1fyd+rNMCX+A2/KJAQGPAt8v9ZL9zqJ1hnI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 09/10] ALSA: hda: fix a runtime pm issue in SOF
 when integrated GPU is disabled
Date: Mon,  7 Sep 2020 12:35:42 -0400
Message-Id: <20200907163543.1281889-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163543.1281889-1-sashal@kernel.org>
References: <20200907163543.1281889-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

[ Upstream commit 13774d81f38538c5fa2924bdcdfa509155480fa6 ]

In snd_hdac_device_init pm_runtime_set_active is called to
increase child_count in parent device. But when it is failed
to build connection with GPU for one case that integrated
graphic gpu is disabled, snd_hdac_ext_bus_device_exit will be
invoked to clean up a HD-audio extended codec base device. At
this time the child_count of parent is not decreased, which
makes parent device can't get suspended.

This patch calls pm_runtime_set_suspended to decrease child_count
in parent device in snd_hdac_device_exit to match with
snd_hdac_device_init. pm_runtime_set_suspended can make sure that
it will not decrease child_count if the device is already suspended.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200902154218.1440441-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/hdac_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index e361024eabb63..020ec48f39048 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -123,6 +123,8 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_init);
 void snd_hdac_device_exit(struct hdac_device *codec)
 {
 	pm_runtime_put_noidle(&codec->dev);
+	/* keep balance of runtime PM child_count in parent device */
+	pm_runtime_set_suspended(&codec->dev);
 	snd_hdac_bus_remove_device(codec->bus, codec);
 	kfree(codec->vendor_name);
 	kfree(codec->chip_name);
-- 
2.25.1

