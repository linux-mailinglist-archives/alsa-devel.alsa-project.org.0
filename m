Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25A399FF5
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 13:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F061707;
	Thu,  3 Jun 2021 13:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F061707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622720322;
	bh=GR3eLCBM2Ve+gfZs57re358bvLpwYvHWjc2gr8A3928=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d/hZY6tpdERz8WQeGtM+RMujjDs/dV8aLb4Bkx71CLPZ8N8appzmVK9/wDHqsoTyU
	 vk5NPAmuewitZhl8U7Vb7pi4XQpmNdYEGAyts97pYV8IIhQfO6YmLYbzDJcUI7Fco0
	 lBGPWhzCVV54Dk/d+i7vkkNOf1+xXAzsFujrCc+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAF91F8025B;
	Thu,  3 Jun 2021 13:37:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7629EF80254; Thu,  3 Jun 2021 13:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28188F800E5
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 13:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28188F800E5
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lolel-0004sI-6m; Thu, 03 Jun 2021 11:36:59 +0000
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee.jones@linaro.org>,
 alsa-devel@alsa-project.org
Subject: [PATCH][V2][next] ASoC: rk817: remove redundant assignment to pointer
 node, add missing of_node_put
Date: Thu,  3 Jun 2021 12:36:59 +0100
Message-Id: <20210603113659.82031-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The pointer node is being initialized with a value that is never read and
it is being updated later with a new value.  The initialization is
redundant and can be removed.

The function is missing a of_node_put on node, fix this by adding the call
before returning.

Addresses-Coverity: ("Unused value")
Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: Add missing of_node_put call, kudos to Dan Carpenter for spotting this 
    issue.
---
 sound/soc/codecs/rk817_codec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index fd3a5ba034a9..a44d3cad1119 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -456,7 +456,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
 static void rk817_codec_parse_dt_property(struct device *dev,
 					 struct rk817_codec_priv *rk817)
 {
-	struct device_node *node = dev->parent->of_node;
+	struct device_node *node;
 
 	node = of_get_child_by_name(dev->parent->of_node, "codec");
 	if (!node) {
@@ -466,6 +466,8 @@ static void rk817_codec_parse_dt_property(struct device *dev,
 
 	rk817->mic_in_differential =
 			of_property_read_bool(node, "rockchip,mic-in-differential");
+
+	of_node_put(node);
 }
 
 static int rk817_platform_probe(struct platform_device *pdev)
-- 
2.31.1

