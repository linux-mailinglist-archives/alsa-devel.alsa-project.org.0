Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB381AF05B
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB48F15F2;
	Sat, 18 Apr 2020 16:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB48F15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221531;
	bh=QwpUR4Sev4OdidVpEE7Tp/e3xbHcp8sMGy/D/v65XMw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpsIkm+L6xJK7SG33WcexwMzJBLeM65XmA47ezanvc9OtAKoh8lg7J/H2wiFa7iDN
	 Z7mdH84J9GjFHTS0x5TNrmP34WZhPB1F3mQNmKIeNEn+Oa1HC9th2f4U/gJLfZ2hSI
	 qVuECqkaoW0iDgN4wbuokrzr0h2gBBN4j8iu9Ags=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 643CCF80335;
	Sat, 18 Apr 2020 16:42:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84879F8033D; Sat, 18 Apr 2020 16:42:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B830F80335
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B830F80335
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WKSu0B74"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7621A21D7E;
 Sat, 18 Apr 2020 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220962;
 bh=QwpUR4Sev4OdidVpEE7Tp/e3xbHcp8sMGy/D/v65XMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WKSu0B74TQzMLFD9WEXxEt46ahrOJH3zdEDSimvL7nPUTeyvB5j1H2gP4PftcaZfc
 MLFXnrdd0NkerAZp4mGPFbN+nzEfZrMVF2J2oqcd3NEPLSoaCFHLLl8m20twxxOGDq
 PHfK3BlWJrAeyauKB4irjTx4Storke629u2me9yQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/47] ASoC: Intel: atom: Take the drv->lock
 mutex before calling sst_send_slot_map()
Date: Sat, 18 Apr 2020 10:41:52 -0400
Message-Id: <20200418144227.9802-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144227.9802-1-sashal@kernel.org>
References: <20200418144227.9802-1-sashal@kernel.org>
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
index 3672d36b4b66f..d32d48e82a2af 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -974,7 +974,9 @@ static int sst_set_be_modules(struct snd_soc_dapm_widget *w,
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

