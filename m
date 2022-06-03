Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F219A53CB53
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 16:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FA917F9;
	Fri,  3 Jun 2022 16:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FA917F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654265233;
	bh=jqZsuX3aODMVExkVmQu6nQBS8rjrUFR91lkrEC2cfvg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwgfe/MgyYLlkZiQiHjRtvGHbk7ZRj5eQhpqJsdZ4XP61pTDlzIxQepRxuveTamQe
	 ddlbcziaIycGhUVQSloI9nBztZRUXI4LlUsswXarwghRRU8jxoT4rsjt4uz1V5pC9Y
	 3sVT8SLP2392C8dojnrP1jIQ+IuGQtwRpueMIEw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC7FF80529;
	Fri,  3 Jun 2022 16:05:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF27F80526; Fri,  3 Jun 2022 16:05:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51886F804CC
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 16:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51886F804CC
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-0006WZ-0z; Fri, 03 Jun 2022 16:05:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-006EWK-Dh; Fri, 03 Jun 2022 16:05:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vT-00DxJX-Bk; Fri, 03 Jun 2022 16:05:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
Subject: [PATCH 2/4] ASoC: da7219: Drop no-op remove function
Date: Fri,  3 Jun 2022 16:05:11 +0200
Message-Id: <20220603140513.131142-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
References: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; h=from:subject;
 bh=jqZsuX3aODMVExkVmQu6nQBS8rjrUFR91lkrEC2cfvg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimhUNZOv8tANKdivB/kaOyq/Vw9HK6t3gEunND6Uk
 NDdkqDqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpoVDQAKCRDB/BR4rcrsCRVjB/
 48j966uK5tD6kGOsB4eDRlo15JUK4VkMgz4MzR5SiJ5ZHBQ6TSSHEgDCjoNXYPPcfH+noazDueSYWX
 9QSgv8r1ODfWXta3yufQnmwh9gGLRKK1SF+YA3daNbiSW48YnDgvs2FqyleeRXnDTiz2JJjJUM5C2L
 qQNCJdYYLsSMQ8+uE1Ch8omyaXrqbCMgVDiKnzS+qBkoAyG/tlfd8uzzOVaH2jPb/oEzw7Vg4kfQyk
 ZYwFH8Her3EOVC3+MnN8C2KpQsup5mvLHYDmU2aNGrlUsz1nEZaDmQx+ZLGS7dh4bB0mV8lhBnWPTc
 zt0CeTDaEW4MaJyn5LFDh8d+QuSONb
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
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

A remove callback that just returns 0 is equivalent to no callback at all
as can be seen in i2c_device_remove(). So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Previous submission:

https://lore.kernel.org/alsa-devel/20220526204145.1725323-1-u.kleine-koenig@pengutronix.de

 sound/soc/codecs/da7219.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 7fdef38ed8cd..c18f76f370fc 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2693,11 +2693,6 @@ static int da7219_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static int da7219_i2c_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static const struct i2c_device_id da7219_i2c_id[] = {
 	{ "da7219", },
 	{ }
@@ -2711,7 +2706,6 @@ static struct i2c_driver da7219_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(da7219_acpi_match),
 	},
 	.probe_new	= da7219_i2c_probe,
-	.remove		= da7219_i2c_remove,
 	.id_table	= da7219_i2c_id,
 };
 
-- 
2.36.1

