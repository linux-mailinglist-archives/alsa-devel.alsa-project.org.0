Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C41AEFA0
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8961616;
	Sat, 18 Apr 2020 16:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8961616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221188;
	bh=1RYs4Lz/2BnS7f8Vf4aqmZgljBRSOk3rbVPrrg1Tko4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qyQi1EB3kQkPk4dWXeMLW0aH9UrdBcAbkKPJw7oTPy349dlhdUgN7BPdJC5oBYlh6
	 2Z4js+6uJyhzq4AkDFk59N93i2B6Oyn00ZnzbZjzZXs+zGqBu8mEn3ylO8dSOY8MCl
	 ryDrTbKJYd2uRGq4RlE2Go92KsTwbuoDcIlPwrm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB821F802EB;
	Sat, 18 Apr 2020 16:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 969C9F8028A; Sat, 18 Apr 2020 16:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ECB9F802DF
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ECB9F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v+JTI84T"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34B442220A;
 Sat, 18 Apr 2020 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220871;
 bh=1RYs4Lz/2BnS7f8Vf4aqmZgljBRSOk3rbVPrrg1Tko4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v+JTI84TmsJ8Cq1KveSfFt9FcY9roYXoCxTJ2WfQPd0TpdXb/kkpJCsIA+OYkxD7t
 bsUWdnumwxLR5GUP01X+45QQb75l/2nBVrIASm1hn8yWOtW4hZ36fJjSVIYoMVRKc+
 f7tigYuq8uBJhHoxXFdTPpFoizmWkicXMtJBU9/o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 19/78] ASoC: Intel: atom: Take the drv->lock mutex
 before calling sst_send_slot_map()
Date: Sat, 18 Apr 2020 10:39:48 -0400
Message-Id: <20200418144047.9013-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144047.9013-1-sashal@kernel.org>
References: <20200418144047.9013-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 81630dc042af998b9f58cd8e2c29dab9777ea176 ]

sst_send_slot_map() uses sst_fill_and_send_cmd_unlocked() because in some
places it is called with the drv->lock mutex already held.

So it must always be called with the mutex locked. This commit adds missing
locking in the sst_set_be_modules() code-path.

Fixes: 24c8d14192cc ("ASoC: Intel: mrfld: add DSP core controls")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200402185359.3424-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/atom/sst-atom-controls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index baef461a99f19..2c3798034b1de 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -966,7 +966,9 @@ static int sst_set_be_modules(struct snd_soc_dapm_widget *w,
 	dev_dbg(c->dev, "Enter: widget=%s\n", w->name);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		mutex_lock(&drv->lock);
 		ret = sst_send_slot_map(drv);
+		mutex_unlock(&drv->lock);
 		if (ret)
 			return ret;
 		ret = sst_send_pipe_module_params(w, k);
-- 
2.20.1

