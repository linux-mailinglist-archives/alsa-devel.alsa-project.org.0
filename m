Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59438EAEC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B6F16EE;
	Mon, 24 May 2021 16:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B6F16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621868293;
	bh=fZ7ZyR35+gTZDKlGqi1NIYsxIkTtZ7Fl1Oyo9dZ3W8I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vi3rJZQXqukEYsNwGoST79iuyfLAekY60lMBJeCSxLhTNcfDr0XS0QL4N9Y7rcceQ
	 DA4YN4phOS6+c3aCy9xlveBlSuapUV/eiVIraxghKHgpX9jlGqztXJJQyju2lHpzNE
	 TTwkxDZ0gIygqY6aBXBVIHGFx97uJovTrteqHGSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C597EF80549;
	Mon, 24 May 2021 16:50:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5814F804B1; Mon, 24 May 2021 16:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36AD5F804B0
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36AD5F804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mwd602lt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 145D861581;
 Mon, 24 May 2021 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867823;
 bh=fZ7ZyR35+gTZDKlGqi1NIYsxIkTtZ7Fl1Oyo9dZ3W8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mwd602ltLbVBP8Paghleaxx44AzCazMD4gDYsm6eNnaJQQdCFRFq0V2AZ/nSku450
 Zxdfo1YndHMjVL/3to89ZV2uq6AqsBQL6RjGxS7Wjf4drHKG9NI+UfdNQh9Oo7R0AB
 aeBbRg/dYnhEeO/EpVBTZBtVuGBNBIDKPcSJWzzkmr0flgcod8eh5rNV4EIaif+ocG
 tL9+28OegEKq4w04GmEgk6mcvrdxJeN8d7ctSNqcssYFn9OOX19zAaL1DD+v8OH8V3
 2+IwYHgYv9HuU7uTEp4wiBS5x8vyfUVlL0nMYDFE+ZjyujlTZ/WToM2VoVw8//K3AM
 /dPlagytSZhdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/25] ASoC: cs43130: handle errors in
 cs43130_probe() properly
Date: Mon, 24 May 2021 10:49:55 -0400
Message-Id: <20210524145008.2499049-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524145008.2499049-1-sashal@kernel.org>
References: <20210524145008.2499049-1-sashal@kernel.org>
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
index 80dc42197154..cf29dec28b5e 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1738,6 +1738,14 @@ static DEVICE_ATTR(hpload_dc_r, 0444, cs43130_show_dc_r, NULL);
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
@@ -2305,23 +2313,15 @@ static int cs43130_probe(struct snd_soc_component *component)
 
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

