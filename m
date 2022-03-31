Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6B4EE37F
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 23:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1442918FD;
	Thu, 31 Mar 2022 23:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1442918FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648763683;
	bh=ifpWWypXortg/rGDlOym9wXGA7cugLMS1PqYp1hkuN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4w8B3ccUbBHPUq3B/PQQW/yheXaRTGPZdMZ2U+T6K+71a/g0D+HJgyRth9vcpodD
	 mXt3RFrO4v7Yjvtoa1ArGriQ8rjuFvepI8Ki+yO/nrPuilH2kUmqjaAqDrruqqyToG
	 a3olz2IZc59zswY2YNoi9jg/0aJXOnDI7AT1T72E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 815CDF80517;
	Thu, 31 Mar 2022 23:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC6CF804AE; Thu, 31 Mar 2022 23:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D374F800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 23:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D374F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VQSaHJzJ"
Received: by mail-ej1-x630.google.com with SMTP id j15so2003719eje.9
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 14:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOImAANTWLBikn8WE3acPmaj6Gy0UFu59bmhhFGIeCA=;
 b=VQSaHJzJLRFaxfS/H8mgdqxOLx5qp1cgKAzL60yVLDlMeAt8VGhJ9dkvSo8sse5peb
 boPtfzWnd11zFz27+iSxjTF4FB3YXcvxCT+y5FxIQXjsDIGZGlrAhjAUt9Gojhs/ydoV
 iRq25wsDAnQkMPcHv0/3gqrPQJqkQqnelapWUf1mTwoNfW/NUCQK1omIjnmbWosXVlbC
 h5SpKhE16NeouY/7uihnCR6OXqqIZ6MiXayAqcOpsHk8L7jbpyZ/itHHQNd+sB4jvelb
 5E3hF9MNJIokJCh19DtkusmD9+MQFxQTeDbp1vVfR/7mDfIN14lven09Sut3cK8Ri4Xm
 00IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOImAANTWLBikn8WE3acPmaj6Gy0UFu59bmhhFGIeCA=;
 b=B4cZBEDh+gtv9jOVB3sAgivQsLNGmh7Xm1gfYsNpWTW5eOrVdj2MoWmyGT6CCfCSu/
 VuPEG/evQcGuIudYeR0/3iEJ/6y2HAMNLYR8EXWa7HAv0jtgmlFa9ljs43HOVd/GPG/J
 +CDIRpt3hmaZRrqoPitN3KVAE9OsGWrnWSc+LvuC/qfSzvrliZu57c+64kJbMozAbVMr
 qckRU9fd/X1/no4xTTOPMF2lA6y6i9YK7r4UV9FRdmIoOculKQ6QhZPTH9XQVl/vbuzi
 U3PJ4K7HxhkgoSZeGZqh1QR4HLNO0YXuZoLpvOsspXy2PxbgsnjOqhcmkOPKnZat/VNl
 fjyA==
X-Gm-Message-State: AOAM531wNb9lwlO7IrPJeI8hW/Nduj166e69oovh+0iDouoSWe1ehU/z
 BUnrE1SbMhswKPA9TaLD0Xs=
X-Google-Smtp-Source: ABdhPJwhW6AYtGNMAVFbxpGjx9UHVrI4ApY9BLlL1tGNDzt2uyxR6JIV8D6VbtshApQXftpkkWYqOQ==
X-Received: by 2002:a17:906:32cf:b0:6d5:83bc:e962 with SMTP id
 k15-20020a17090632cf00b006d583bce962mr6882166ejk.108.1648763577157; 
 Thu, 31 Mar 2022 14:52:57 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 g20-20020aa7c594000000b004194b07bbfasm299980edq.10.2022.03.31.14.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 14:52:56 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH 3/3] ASoC: atmel-ssc: replace usage of found with dedicated
 list iterator variable
Date: Thu, 31 Mar 2022 23:50:03 +0200
Message-Id: <20220331215003.882143-3-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331215003.882143-1-jakobkoschel@gmail.com>
References: <20220331215003.882143-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Bos,
 H.J." <h.j.bos@vu.nl>, Yang Yingliang <yangyingliang@huawei.com>,
 Orson Zhai <orsonzhai@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Mike Rapoport <rppt@kernel.org>
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

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/misc/atmel-ssc.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index d6cd5537126c..343e25555fbb 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -25,25 +25,24 @@ static LIST_HEAD(ssc_list);
 
 struct ssc_device *ssc_request(unsigned int ssc_num)
 {
-	int ssc_valid = 0;
-	struct ssc_device *ssc;
+	struct ssc_device *ssc = NULL, *iter;
 
 	mutex_lock(&user_lock);
-	list_for_each_entry(ssc, &ssc_list, list) {
-		if (ssc->pdev->dev.of_node) {
-			if (of_alias_get_id(ssc->pdev->dev.of_node, "ssc")
+	list_for_each_entry(iter, &ssc_list, list) {
+		if (iter->pdev->dev.of_node) {
+			if (of_alias_get_id(iter->pdev->dev.of_node, "ssc")
 				== ssc_num) {
-				ssc->pdev->id = ssc_num;
-				ssc_valid = 1;
+				iter->pdev->id = ssc_num;
+				ssc = iter;
 				break;
 			}
-		} else if (ssc->pdev->id == ssc_num) {
-			ssc_valid = 1;
+		} else if (iter->pdev->id == ssc_num) {
+			ssc = iter;
 			break;
 		}
 	}
 
-	if (!ssc_valid) {
+	if (!ssc) {
 		mutex_unlock(&user_lock);
 		pr_err("ssc: ssc%d platform device is missing\n", ssc_num);
 		return ERR_PTR(-ENODEV);
-- 
2.25.1

