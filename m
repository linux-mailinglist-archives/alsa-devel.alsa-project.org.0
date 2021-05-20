Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39583389CEE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 07:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F44168D;
	Thu, 20 May 2021 07:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F44168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621487391;
	bh=i441hm9kzvpTyhYaZ9stbt7UxxTq8/ORKmP4OzjEyvk=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MdhA+4wr0DsUvDUzkXAXxsmJkywisgIooCfTAvYV0uHCV5eIxFYunop7YY0ZczRDV
	 nOr1kKm6nB0dbeOTtd5cn2nf/SZPD9CVrfadxaj0+KWy0rp1pL4YRVVWd8WToZU4L/
	 TYOlrF5gA/nPf4E1w439juXjwSQD6zPsR4d64vug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60AD7F802E2;
	Thu, 20 May 2021 07:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00DA5F802C8; Thu, 20 May 2021 07:08:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26460F8020B
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 07:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26460F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="zTP0SEml"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14K58HhZ029793; Thu, 20 May 2021 05:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=3LKNlWa84mNtlc0IzsZuszOG3F3MflC9kl6rzzQfwaw=;
 b=zTP0SEmlB1Kz/rWlk+Gu03/Az2jePnS5icE7VOxbbmii0lK2AqbxPe4riIeU4GEPqGWA
 yPH3Mcn2z7ArpQ2/vMuyQN+SFn2MZi83amGLZcLB//ckl7zQP3dYOK8fn2whU7/WHj3z
 5d7HbO41+KFpLNqjNIoly1WZnUtp2JxRp36ZfhuEVL2QeaOEB9MGn50NNuGbd9b8We2H
 Q53UcjPzxVlDUhEPldqxvNjPPDXS6opFFRx/zYhMuzpD1PtMaetg1wU7V80uSq0XaHWz
 tDFcUhCkfzMRiKBw86314L4SdFgXQzVPxIcyyC0Nm+o2ydeptd3hbBuk9v5MQ5rY0MKP 6w== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38n4utr9wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 05:08:35 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14K58Y1x031103;
 Thu, 20 May 2021 05:08:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 38megm3kha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 05:08:34 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14K57KqD029097;
 Thu, 20 May 2021 05:08:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 38megm3kh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 05:08:33 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14K58WCi014142;
 Thu, 20 May 2021 05:08:32 GMT
Received: from mwanda (/10.175.161.110)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 May 2021 22:08:31 -0700
Date: Thu, 20 May 2021 08:08:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: James Schulman <james.schulman@cirrus.com>
Subject: [PATCH] ASoC: cs35l33: fix an error code in probe()
Message-ID: <YKXuyGEzhPT35R3G@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: yKP14-Zssevux8KcCheFgEk2dAdWjhbC
X-Proofpoint-ORIG-GUID: yKP14-Zssevux8KcCheFgEk2dAdWjhbC
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Mark Brown <broonie@kernel.org>, David Rhodes <david.rhodes@cirrus.com>
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

This error path returns zero (success) but it should return -EINVAL.

Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/cs35l33.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 6f6b3c0c88b7..2a6f5e46d031 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -1202,6 +1202,7 @@ static int cs35l33_i2c_probe(struct i2c_client *i2c_client,
 		dev_err(&i2c_client->dev,
 			"CS35L33 Device ID (%X). Expected ID %X\n",
 			devid, CS35L33_CHIP_ID);
+		ret = -EINVAL;
 		goto err_enable;
 	}
 
-- 
2.30.2

