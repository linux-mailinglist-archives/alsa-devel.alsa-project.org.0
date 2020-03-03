Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B369176B27
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 03:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB59D16A8;
	Tue,  3 Mar 2020 03:48:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB59D16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583203731;
	bh=8zSyvj3eyDdfA65LUCwZBtK20UW9f3gErYuT4Yv70vQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nQQQWDH9DVrng7LgRrTmB1ZOnbz8BkRMVNqjWit8q981SApPNBa0n8G+qJx/6OVuS
	 qIXMzyBJwei++jghsK0kkqTJSk4quGVwUJ3RPVwucZjilC1N6lvCf+1Wk1++iAFdIZ
	 1YcsVTgnRaPoVy5Y8Ca0kWqlSuqEr8gtwe3Mu+ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2308F8012D;
	Tue,  3 Mar 2020 03:47:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C1CF8026A; Tue,  3 Mar 2020 03:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01260F8012D
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 03:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01260F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TY/q7Y8S"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64E1924673;
 Tue,  3 Mar 2020 02:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583203662;
 bh=8zSyvj3eyDdfA65LUCwZBtK20UW9f3gErYuT4Yv70vQ=;
 h=From:To:Cc:Subject:Date:From;
 b=TY/q7Y8SsMpOKpBH20xHbYMqnq9bm241pFikQuv9LIB3Rp4/n3ICTr4BS8j4JcsgJ
 3Nfz5uNavgvxhEkEhWfo3J3UaHgJvruPHFxeiOVTVziW9MOYcfPtXfi3vBB40YMoED
 bqu+zR6a7SmIE24SA2egIyiV1QTQrVjhQDy6quu4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/58] ALSA: hda: do not override bus codec_mask
 in link_get()
Date: Mon,  2 Mar 2020 21:46:43 -0500
Message-Id: <20200303024740.9511-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 43bcb1c0507858cdc95e425017dcc33f8105df39 ]

snd_hdac_ext_bus_link_get() does not work correctly in case
there are multiple codecs on the bus. It unconditionally
resets the bus->codec_mask value. As per documentation in
hdaudio.h and existing use in client code, this field should
be used to store bit flag of detected codecs on the bus.

By overwriting value of the codec_mask, information on all
detected codecs is lost. No current user of hdac is impacted,
but use of bus->codec_mask is planned in future patches
for SOF.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200206200223.7715-1-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/ext/hdac_ext_controller.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index cfab60d88c921..09ff209df4a30 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -254,6 +254,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_down_all);
 int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 				struct hdac_ext_link *link)
 {
+	unsigned long codec_mask;
 	int ret = 0;
 
 	mutex_lock(&bus->lock);
@@ -280,9 +281,11 @@ int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 		 *  HDA spec section 4.3 - Codec Discovery
 		 */
 		udelay(521);
-		bus->codec_mask = snd_hdac_chip_readw(bus, STATESTS);
-		dev_dbg(bus->dev, "codec_mask = 0x%lx\n", bus->codec_mask);
-		snd_hdac_chip_writew(bus, STATESTS, bus->codec_mask);
+		codec_mask = snd_hdac_chip_readw(bus, STATESTS);
+		dev_dbg(bus->dev, "codec_mask = 0x%lx\n", codec_mask);
+		snd_hdac_chip_writew(bus, STATESTS, codec_mask);
+		if (!bus->codec_mask)
+			bus->codec_mask = codec_mask;
 	}
 
 	mutex_unlock(&bus->lock);
-- 
2.20.1

