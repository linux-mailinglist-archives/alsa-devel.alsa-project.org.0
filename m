Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF738EACA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:56:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3B916DB;
	Mon, 24 May 2021 16:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3B916DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621868204;
	bh=ZqLak8BtxpSBoSac6F+jFOun1e3iSVOTf+B9UAhpitk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eSRCnt01IKCkY1wvzCGxHk8t14HNlihQnaJWKzdHgFE7qtFQRPS5viJCu3XMAD+Qv
	 iMUEngBpgE+5SA8Kf3yHTpMN0TOFhpRFR57VqNSbAGX13YmsPi572J4NobL7fIcIVc
	 UDR5bfyZ1seh0kivjFz/K823Gkzgn7mqfWz3JPao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1297AF8053A;
	Mon, 24 May 2021 16:49:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE4CF80539; Mon, 24 May 2021 16:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F32F8052D
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F32F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g0Y8dHBB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61E7F61460;
 Mon, 24 May 2021 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867779;
 bh=ZqLak8BtxpSBoSac6F+jFOun1e3iSVOTf+B9UAhpitk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g0Y8dHBB9Q/9/13NDSJHfQNZwEaW+OvLZB23QG2ZJUFrBiQMb+nItxGsfwfTVdUBx
 7LnrpJZgzKAtfifTI4L4c2RSMdM0RdQ3bJcEtNRihVbI9dgIWXGslKfN7pG3Tf1mAL
 e+uoq3to3YE0yTLoCIPcjMZI77qwzRBZbkMDtqJNku3eMvDc0WTXue/uyIRO7QlKfJ
 9TX6zdalp2ZtfDSeAjsmGi7JnlWSf75h3Ra/TVQICgdPfXT3ryBnOc6SEkDxAcA9aJ
 eGUmM1DKemVmHlQtNWbVGsgciqWrzjB1uZjuTbJSu3kJPnjnwuNg3S3+ZH/xlzP9oF
 6BhZ9KW972e4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 29/52] ASoC: cs43130: handle errors in
 cs43130_probe() properly
Date: Mon, 24 May 2021 10:48:39 -0400
Message-Id: <20210524144903.2498518-29-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144903.2498518-1-sashal@kernel.org>
References: <20210524144903.2498518-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit 2da441a6491d93eff8ffff523837fd621dc80389 ]

cs43130_probe() does not do any valid error checking of things it
initializes, OR what it does, it does not unwind properly if there are
errors.

Fix this up by moving the sysfs files to an attribute group so the
driver core will correctly add/remove them all at once and handle errors
with them, and correctly check for creating a new workqueue and
unwinding if that fails.

Cc: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20210503115736.2104747-58-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs43130.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index bb46e993c353..8f70dee95878 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1735,6 +1735,14 @@ static DEVICE_ATTR(hpload_dc_r, 0444, cs43130_show_dc_r, NULL);
 static DEVICE_ATTR(hpload_ac_l, 0444, cs43130_show_ac_l, NULL);
 static DEVICE_ATTR(hpload_ac_r, 0444, cs43130_show_ac_r, NULL);
 
+static struct attribute *hpload_attrs[] = {
+	&dev_attr_hpload_dc_l.attr,
+	&dev_attr_hpload_dc_r.attr,
+	&dev_attr_hpload_ac_l.attr,
+	&dev_attr_hpload_ac_r.attr,
+};
+ATTRIBUTE_GROUPS(hpload);
+
 static struct reg_sequence hp_en_cal_seq[] = {
 	{CS43130_INT_MASK_4, CS43130_INT_MASK_ALL},
 	{CS43130_HP_MEAS_LOAD_1, 0},
@@ -2302,23 +2310,15 @@ static int cs43130_probe(struct snd_soc_component *component)
 
 	cs43130->hpload_done = false;
 	if (cs43130->dc_meas) {
-		ret = device_create_file(component->dev, &dev_attr_hpload_dc_l);
-		if (ret < 0)
-			return ret;
-
-		ret = device_create_file(component->dev, &dev_attr_hpload_dc_r);
-		if (ret < 0)
-			return ret;
-
-		ret = device_create_file(component->dev, &dev_attr_hpload_ac_l);
-		if (ret < 0)
-			return ret;
-
-		ret = device_create_file(component->dev, &dev_attr_hpload_ac_r);
-		if (ret < 0)
+		ret = sysfs_create_groups(&component->dev->kobj, hpload_groups);
+		if (ret)
 			return ret;
 
 		cs43130->wq = create_singlethread_workqueue("cs43130_hp");
+		if (!cs43130->wq) {
+			sysfs_remove_groups(&component->dev->kobj, hpload_groups);
+			return -ENOMEM;
+		}
 		INIT_WORK(&cs43130->work, cs43130_imp_meas);
 	}
 
-- 
2.30.2

