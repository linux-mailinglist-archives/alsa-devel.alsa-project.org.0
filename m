Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478AB389CEB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 07:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B639D1681;
	Thu, 20 May 2021 07:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B639D1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621487354;
	bh=GyYk28kAogw+QlVdFzWZ2mlt1sT51ThC67X74OSAPkw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EgF2z5TZlPF2TsXG+4Pbkf1e2oLgAI7tUUGsc8dYGjUkty3c+ZUj0BO/fJqVjk2yf
	 aXVLfBorivk9WynNL+EP7GLJVu5HpK6yNoTo9s/7rahEhoNccIv2lEgBNzvlqKWWZZ
	 3v2q6llAe1gtpIeDeC7kI18f7UKkSMAdeP9bDHKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5BE8F8027D;
	Thu, 20 May 2021 07:07:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 198FFF80272; Thu, 20 May 2021 07:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1224CF80229
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 07:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1224CF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="eRsNjkTi"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14K57oRq027317; Thu, 20 May 2021 05:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=EZxC9Bb9kO8469btR/OaLge4DcP3Mr1PXtR8r3X7yqs=;
 b=eRsNjkTiPWYNg0WwPWsTvX4nopeXjMsid7gOpIoBoqOfSDp9n69s0VAuwmFcnG+U/sbF
 h9mfNaHyuaVOqzmKfHuPKafW+xXgs8LaI1EWnmM3IPfx259+H0sqbCMgNn+wPu6lWdDl
 mSM4zMuizZEIm8aSK9By/WpIqpVu/A57fP5BH4IHNSxSVwC0r+QGVkMrJ/X8F/ngaKje
 frcosuWWp9/Df0joIk66fQT0gz8VnPQbU3jEUs7l1K9IyjpFeoqT9rIu+1fhVgBiJmhI
 ewVX6iipN0ytd4MvGGIBomoog8WZIdDDloVSz2OkbaQQoX+KHCFC/hiuYyDReEIi9P/r AA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38ktd2h97c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 05:07:50 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14K57n0X155436;
 Thu, 20 May 2021 05:07:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38meegnce0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 05:07:49 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14K57mBG155429;
 Thu, 20 May 2021 05:07:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 38meegncdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 05:07:48 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14K57mon013731;
 Thu, 20 May 2021 05:07:48 GMT
Received: from mwanda (/10.175.161.110)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 20 May 2021 05:07:47 +0000
Date: Thu, 20 May 2021 08:07:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: topology: Fix a small leak in
 soc_tplg_dapm_graph_elems_load()
Message-ID: <YKXunAOB1DJ4dT5p@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKXudu7p8VZ2/zZN@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: 9K4pwKNgVIrANbh4l5J_SN2G1ZuxtneO
X-Proofpoint-ORIG-GUID: 9K4pwKNgVIrANbh4l5J_SN2G1ZuxtneO
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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

We have to kfree(routes) on this error path.

Fixes: ff9226224437 ("ASoC: topology: Change allocations to resource managed")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/soc-topology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 6b7a813bc264..5730fcaa7bc6 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1135,8 +1135,10 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	 */
 	for (i = 0; i < count; i++) {
 		routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), GFP_KERNEL);
-		if (!routes[i])
-			return -ENOMEM;
+		if (!routes[i]) {
+			ret = -ENOMEM;
+			goto free_routes;
+		}
 	}
 
 	for (i = 0; i < count; i++) {
@@ -1198,6 +1200,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	 * The memory allocated for each dapm route will be freed
 	 * when it is removed in remove_route().
 	 */
+free_routes:
 	kfree(routes);
 
 	return ret;
-- 
2.30.2

