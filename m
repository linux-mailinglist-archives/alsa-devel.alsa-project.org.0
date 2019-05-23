Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4622822D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 18:09:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08F61667;
	Thu, 23 May 2019 18:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08F61667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558627781;
	bh=29Er0ONh6ukQdPd6cOdtj/YHD45juRuiD1jAX1HF6Qg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=coiYH5PKzGpm3w3s1Mlfe1SuVB0Da38KZUXP4CM6YYYv9Aj95bxAjcGL0viqWkdAm
	 0+ruuJlejYMS1cNuRLPVLyUQbVZeq9lgkQNtOkehhUVPndrGNPhl1AnQ8ct4REhVm+
	 CuAAhJgsU9/T2Hz3r6AewWl07mjErt+WwEcMjnZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91914F89674;
	Thu, 23 May 2019 18:07:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B12F89674; Thu, 23 May 2019 18:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=RCVD_IN_BL_SPAMCOP_NET,
 SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.45.250])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CF60F89625
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 18:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CF60F89625
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id AF94F400DDB89
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 11:07:50 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id TqFyhfpgfiQerTqFyhHQVI; Thu, 23 May 2019 11:07:50 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=40558 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hTqFx-002N04-8L; Thu, 23 May 2019 11:07:49 -0500
Date: Thu, 23 May 2019 11:07:48 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Message-ID: <20190523160748.GA4844@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hTqFx-002N04-8L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:40558
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ASoC: qdsp6: q6core: Use struct_size() in
	kmemdup()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, replace code of the following form:

sizeof(*fwk) + fwk->num_services * sizeof(fwk->svc_api_info[0]);

with:

struct_size(fwk, svc_api_info, fwk->num_services)

and so on...

Notice that variables bytes and len are unnecessary, hence they are
removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 sound/soc/qcom/qdsp6/q6core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index cdfc8ab6cfc0..ae314a652efe 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -98,13 +98,13 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 	}
 	case AVCS_CMDRSP_GET_FWK_VERSION: {
 		struct avcs_cmdrsp_get_fwk_version *fwk;
-		int bytes;
 
 		fwk = data->payload;
-		bytes = sizeof(*fwk) + fwk->num_services *
-				sizeof(fwk->svc_api_info[0]);
 
-		core->fwk_version = kmemdup(data->payload, bytes, GFP_ATOMIC);
+		core->fwk_version = kmemdup(data->payload,
+					    struct_size(fwk, svc_api_info,
+							fwk->num_services),
+					    GFP_ATOMIC);
 		if (!core->fwk_version)
 			return -ENOMEM;
 
@@ -115,13 +115,13 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 	}
 	case AVCS_GET_VERSIONS_RSP: {
 		struct avcs_cmdrsp_get_version *v;
-		int len;
 
 		v = data->payload;
 
-		len = sizeof(*v) + v->num_services * sizeof(v->svc_api_info[0]);
-
-		core->svc_version = kmemdup(data->payload, len, GFP_ATOMIC);
+		core->svc_version = kmemdup(data->payload,
+					    struct_size(v, svc_api_info,
+							v->num_services),
+					    GFP_ATOMIC);
 		if (!core->svc_version)
 			return -ENOMEM;
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
