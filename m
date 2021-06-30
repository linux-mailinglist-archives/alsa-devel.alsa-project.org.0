Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0BC3B8133
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 13:20:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FEC0168A;
	Wed, 30 Jun 2021 13:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FEC0168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625052048;
	bh=jEKbIwoVxJouMvHSddRzbQZky0iX792oDL2zDwdMWZQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Max9IxQPZ1m58GzdZ+94/dzdF6Ata2KE8dInySub+JY1u12OUbSK/iC/cpmJ9mCg7
	 55WbLLmaNTq8pK5wSnjlkNVv7ZR/rGLFzKkeBblkOAgU0ejBlj1liFjIvGx/pz+ZmS
	 9gdO6JIFbbkCFE9HZtWNkab1+I8Nilv10sQ/2x9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3AC2F80240;
	Wed, 30 Jun 2021 13:19:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37F81F80229; Wed, 30 Jun 2021 13:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF81EF8020C
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 13:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF81EF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="KHx6Xbv/"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UBHBuD018175; Wed, 30 Jun 2021 11:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zlyQbwZLIr9uvf89iJ+TADU3Pi0TIGoM5aYb8D/E6GM=;
 b=KHx6Xbv/1Irwgbf045LB2ZmexbQtEE7hkGspSnhCRIshbCw3LJr8rfdDYgFmEmqO2HHk
 ebs98HAT9QSc+iVUysjVr7MWvbKSsANeIf2sMWPZWJDxOk84vfosvoaIKor4B07Cq4PP
 lP8Whs/xLxLNWw/jPlEAWMlVeQzJ2+0k0X/u6OdlcKnwYl1ZYgUqXYKgrRE8KpbxyH/8
 eRgJ+NZSqx+NhGccMrrFEjPyLJb4IAsc0OoP/YCYQYemCyhOna8f36IPS/vFXoDos3xU
 rmGwsGNR1CHS0XyDpsKDzyEPxdSpmGxMOGqjJOqF+df5+v22w8FBCGJJfpCBMcUiXoiS TQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39f6y3nrf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 11:19:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UBG6Bj010757;
 Wed, 30 Jun 2021 11:19:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 39dt9gvxk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 11:19:12 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15UBJBwd019290;
 Wed, 30 Jun 2021 11:19:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 39dt9gvxju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 11:19:11 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15UBJ16a008661;
 Wed, 30 Jun 2021 11:19:01 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 30 Jun 2021 04:19:00 -0700
Date: Wed, 30 Jun 2021 14:18:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [PATCH] ASoC: ti: delete some dead code in omap_abe_probe()
Message-ID: <YNxTHXz58dhgbFtG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: Ud8UWiYh3E8v6PMbzSm1NRxn1X_BDaP7
X-Proofpoint-ORIG-GUID: Ud8UWiYh3E8v6PMbzSm1NRxn1X_BDaP7
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

This code checks "priv->mclk_freq" twice and the second check is not
required.  The code is left over from when removed support for legacy
boot.

Fixes: 8fe120b5a665 ("ASoC: omap-abe-twl6040: Remove support for pdata (legacy boot)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/ti/omap-abe-twl6040.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 91cc9a4f44d7..2e3d1eea77c1 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -292,11 +292,6 @@ static int omap_abe_probe(struct platform_device *pdev)
 
 	card->fully_routed = 1;
 
-	if (!priv->mclk_freq) {
-		dev_err(&pdev->dev, "MCLK frequency missing\n");
-		return -ENODEV;
-	}
-
 	card->dai_link = priv->dai_links;
 	card->num_links = num_links;
 
-- 
2.30.2

