Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC5A2A7F13
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 13:54:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE89B1688;
	Thu,  5 Nov 2020 13:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE89B1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604580839;
	bh=R318Uag5rPPyrpJtRWPBOOUISI44ubhYIz1eOXQWK2c=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QxjdWbuZnxnF1wgj1KuCvomDreF1odb6e8B2Iv9Dx+vvl3xHHMYse5YYwoYH1Q9Jp
	 Ex8Olx7i4RgDNytv1UryqIHIBlLZmB7zC9oyvR8mXdP0PE4krdjah53a6pF1nKAA/5
	 qK7AFWczKmf/7aUVu+F1cSam+/PDCHlOgd6zNkJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE62F800EC;
	Thu,  5 Nov 2020 13:52:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23797F80171; Thu,  5 Nov 2020 13:52:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1DB4F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 13:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DB4F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="z7UuwcOt"
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A5CXfPa114157;
 Thu, 5 Nov 2020 12:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=g3xt2UF1ZPzuXHrMzZZoLtQMegZLsoQCOlA9okPYIXo=;
 b=z7UuwcOtVb9bCTfZQUzfFjh16MAMbWYX7zScJCWaJ/fDpoFEcz4ffbR6WczAhoL+S3X0
 6kKbqGZE9XJZiOoUgDZLJrKED+cPFA/rygl8DLbaiw6cIDs7Ga8vy0JmBzWEsVUS9Oto
 yfa96QL3/5TQMQgm5iklDRQ2XkkNZDcGje+LqR7CwqRlCjxtzEtZ66yVKtRWDD/1Mt81
 19ZPyIVJeZgJOa9XnzkLM9U5s4gG8EhKsdKkW9LzT5QzTCLsKFnl2wf+MIg9rVC0gJA6
 JQVqr3WF/X+CaATHTIhvtc9qbcfU70QhLOr+tSok6D2brEycXRUFWo2Z6UxQiPBceW2o KQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 34hhb2bp7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 05 Nov 2020 12:52:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A5CYZMC158578;
 Thu, 5 Nov 2020 12:52:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 34hw0mn83e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Nov 2020 12:52:17 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A5Cq4S3010848;
 Thu, 5 Nov 2020 12:52:04 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 05 Nov 2020 04:52:03 -0800
Date: Thu, 5 Nov 2020 15:51:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Patrick Lai <plai@codeaurora.org>, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
Message-ID: <20201105125154.GA176426@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9795
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=2 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011050086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9795
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=2
 clxscore=1011 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011050086
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

There are two issues in this function.

1) We can't drop the refrences on "cpu", "codec" and "platform" before
   we take the reference.  This doesn't cause a problem on the first
   iteration because those pointers start as NULL so the of_node_put()
   is a no-op.  But on the subsequent iterations, it will lead to a use
   after free.

2) If the devm_kzalloc() allocation failed then the code returned
   directly instead of cleaning up.

Fixes: c1e6414cdc37 ("ASoC: qcom: common: Fix refcount imbalance on error")
Fixes: 1e36ea360ab9 ("ASoC: qcom: common: use modern dai_link style")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/qcom/common.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 54660f126d09..09af00700700 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -58,7 +58,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
 		if (!dlc) {
 			ret = -ENOMEM;
-			goto err;
+			goto err_put_np;
 		}
 
 		link->cpus	= &dlc[0];
@@ -70,7 +70,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		ret = of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
 			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err;
+			goto err_put_np;
 		}
 
 		cpu = of_get_child_by_name(np, "cpu");
@@ -130,8 +130,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		} else {
 			/* DPCM frontend */
 			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
-			if (!dlc)
-				return -ENOMEM;
+			if (!dlc) {
+				ret = -ENOMEM;
+				goto err;
+			}
 
 			link->codecs	 = dlc;
 			link->num_codecs = 1;
@@ -158,10 +160,11 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 	return 0;
 err:
-	of_node_put(np);
 	of_node_put(cpu);
 	of_node_put(codec);
 	of_node_put(platform);
+err_put_np:
+	of_node_put(np);
 	return ret;
 }
 EXPORT_SYMBOL(qcom_snd_parse_of);
-- 
2.28.0

