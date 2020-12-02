Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A12CB55B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 07:53:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82A6117D1;
	Wed,  2 Dec 2020 07:53:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82A6117D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606892035;
	bh=XuBlgA7ERRdPH5gdcOegpkkdyJDzrNm8vU8MC0YDrVc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lT3lfkRlE3cJ39qPbboEn/lZa55BO/z6QLxJHupN0C0GFTY1M5H34NfaRlf/eoQQh
	 wym7/IrxDWJaj2ZgDp27ksoBFEmxdTtFQtbbNTknrMJTei6KWEGIeq9IEdKl8c81CP
	 awvI2q14AAKvwQnZxvVi0LouZyRkd+hLdI6hZlO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1A13F80158;
	Wed,  2 Dec 2020 07:52:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E36FBF8026B; Wed,  2 Dec 2020 07:52:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B20AF80168
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 07:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B20AF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="bvnw/u/9"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26n49R185241;
 Wed, 2 Dec 2020 06:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=G0iLksHq8EygB3d265wGoCGJ5n184uc0UnsxKVGhK5I=;
 b=bvnw/u/9wO1KTb1lsPBVGKBYMhP481pAGnyB/VK/tQ68+Tbkco2MOKjJF6psHU3UAk15
 868LBKa86/JG9IxNFQnom7GFpgq9Aj2DmB6EqsuX3oPJxaCcM1wEYqz0zLoDUn/bdP1Y
 nhSZnnVidQ2wDiLMH+JzHYQLq51DWYTEogwc5qPcogtml15iRBPvFK56dNgcBQg01bcU
 duozuTyXo5ltfHC0F5O08CBARS/IMUxOqmdiT8BMJ4hxXpK2HwedvYEHwzOv2QSX4zWW
 DKmrumUx5gOim+fogDiyV6opnRvBq9mjG914K5OMAIZc4rgLRtbIzeS1+EMT51Th8Egt 6A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 353egkpg18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 02 Dec 2020 06:52:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B26oK42061949;
 Wed, 2 Dec 2020 06:52:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3540atpndd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Dec 2020 06:52:04 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B26psUD021371;
 Wed, 2 Dec 2020 06:51:54 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 22:51:54 -0800
Date: Wed, 2 Dec 2020 09:51:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-ID: <X8c5gjZO7YN/CFsq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020040
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

The "decimator" variable is in the 0-7 range and it's unsigned so there
is no need to check for negative values.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/lpass-va-macro.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 3e6bbef26dcb..91e6890d6efc 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -844,17 +844,10 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
 
 	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
 			 VA_MACRO_DEC_MAX) {
-		if (decimator >= 0) {
-			tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
-				    VA_MACRO_TX_PATH_OFFSET * decimator;
-			snd_soc_component_update_bits(component, tx_fs_reg,
-						0x0F, tx_fs_rate);
-		} else {
-			dev_err(va_dev,
-				"%s: ERROR: Invalid decimator: %d\n",
-				__func__, decimator);
-			return -EINVAL;
-		}
+		tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
+			    VA_MACRO_TX_PATH_OFFSET * decimator;
+		snd_soc_component_update_bits(component, tx_fs_reg, 0x0F,
+					      tx_fs_rate);
 	}
 	return 0;
 }
-- 
2.29.2

