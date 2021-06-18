Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B094D3ACC9F
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 15:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E291170C;
	Fri, 18 Jun 2021 15:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E291170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624023977;
	bh=eAyA5KCtAJ9bjFIVMKWcGQDGXGL0f5yGS/YbsnzMJGU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RK7EIhDmW/V2iNbvww4g3RWzndV+Mb1knLBE0+kalrSSg5G+VR+t2GwUPVFTLQYJe
	 OouV3WbMLmUDH+a2iEExrPvut5+7xqS6h7WeqbgTW1odOG6jJFDWGhAw/jWAIOv0EN
	 B3RfIB2kiJEVD5DOBSWWEonZFtsGvcwC16v0hFFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83458F80423;
	Fri, 18 Jun 2021 15:44:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A30CF8032D; Fri, 18 Jun 2021 15:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57528F80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 15:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57528F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="scjwU88S"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IDhrhY010803; Fri, 18 Jun 2021 13:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=FluAY6HgIzMDqkeeKmecM2WfpkpmZL6tgXmZI0hFMgU=;
 b=scjwU88SHNObbORJ+sYovhCb8iDxbzrcREmqBkDWDAStwot+DBW9x17+yz7mFSGp9G8a
 ff+U5xH1jFpcI31wA7VhvtjgjOVERZN5CqdVJFnWBq1loDyqTMxvlEDArj/8b5xjpfap
 hnrHj+SSn3ytRi2ImMAD+TpU5L/hvbiTxCHs72YCjFwBdgxr78+tfvRy9Zkii5TZ4wD1
 Scxn63pc42k8VAfC5STQozCy69xucyyPOvsjNYkd9m0B0sirm6exxfPRvZWWREcypW7J
 n9PGtvS0RLTPv73nwICfhpUaW8hUVHW8ClvxIG8A9jVa3fjtfHWC0VQ4CGofLzuQDxLH GQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 397w1y398h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 13:44:37 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15IDiarG103154;
 Fri, 18 Jun 2021 13:44:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 396waxy563-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 13:44:36 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15IDiahj103133;
 Fri, 18 Jun 2021 13:44:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 396waxy55k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 13:44:36 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15IDiXLW016901;
 Fri, 18 Jun 2021 13:44:33 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Jun 2021 13:44:32 +0000
Date: Fri, 18 Jun 2021 16:44:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] ASoC: tegra: Fix a NULL vs IS_ERR() check
Message-ID: <YMyjOKFsPe9SietU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: RudKXr0sEGZo39jcPkSRPU__TXjDmtST
X-Proofpoint-GUID: RudKXr0sEGZo39jcPkSRPU__TXjDmtST
Cc: alsa-devel@alsa-project.org, Svyatoslav Ryhel <clamor95@gmail.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org
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

The tegra_machine_parse_phandle() function doesn't return NULL, it returns
error pointers.

Fixes: cc8f70f56039 ("ASoC: tegra: Unify ASoC machine drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index a53aec361a77..735909310a26 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -409,7 +409,7 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 		return PTR_ERR(np_codec);
 
 	np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
-	if (!np_i2s)
+	if (IS_ERR(np_i2s))
 		return PTR_ERR(np_i2s);
 
 	card->dai_link->cpus->of_node = np_i2s;
-- 
2.30.2

