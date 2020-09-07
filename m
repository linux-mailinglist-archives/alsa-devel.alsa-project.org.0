Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4379B25FFD7
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 18:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCFA917E6;
	Mon,  7 Sep 2020 18:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCFA917E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599496813;
	bh=gQ/r9nT52mFFpeLsACX5otx/KZQnQjH7GkASuar6/dQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FAABeRaC9ULWv2k50m0I+/E64Zk2Z7xd3icBtMqKc7jXKZ4/uF3KOK6m07VC3kLZM
	 R+osawv/mBbMymB4N+V6Nm1lPlJOyVlHIfjPuELZV74cpCtGyX1sznV3UVjU6huxdG
	 2lccqTl+d0VoVN584T8vdADrD3bYDwIIx9x8pqMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A494CF80317;
	Mon,  7 Sep 2020 18:35:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E63BF80316; Mon,  7 Sep 2020 18:35:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16756F80308
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 18:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16756F80308
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZoEWehBs"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E7DD21D92;
 Mon,  7 Sep 2020 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496496;
 bh=gQ/r9nT52mFFpeLsACX5otx/KZQnQjH7GkASuar6/dQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZoEWehBsjKnF2knRl3naZGQNeZFlgv0U8uQ0GWOaxtoFsb4PSXN0m4o5RHyhgYF3L
 OSVcoKheNJ+CKjBO5rvm2aBn2xYJrDitjq68eccCT4aYlbExDBDfCgH/JKYE3ZZbXP
 1Cp/KnlZkPl6F4skKJPc03rwmf/S7e6H8/FguSCk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 23/26] ALSA: hda: fix a runtime pm issue in SOF
 when integrated GPU is disabled
Date: Mon,  7 Sep 2020 12:34:23 -0400
Message-Id: <20200907163426.1281284-23-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163426.1281284-1-sashal@kernel.org>
References: <20200907163426.1281284-1-sashal@kernel.org>
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
index dbf02a3a8d2f2..58b53a4bc4d01 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -124,6 +124,8 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_init);
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

