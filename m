Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25704155E78
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 19:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF10316BD;
	Fri,  7 Feb 2020 19:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF10316BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581101794;
	bh=rQ6MOJBY+KH/oDfc7JuM97CsEj/ajN7FO9k9OM36qZo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TW8tgBmeZKywxZmU7IXve/+CLMjd/fKq1n1Qck4wUfkyy5JZcgQDmPsx1u4RaZklJ
	 i1Ck5nSAqu3qSttOrxdMWbClLluCZRN4Dv6mTT8bsFcpSNwb9gMA1uNtNFRTvhp0qp
	 UjFrK89Ec+5f4aAGwWvY6vC6UNn2MPJBGOQIvrBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B80F80279;
	Fri,  7 Feb 2020 19:54:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3AAFF80279; Fri,  7 Feb 2020 19:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B4C6F800B2
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 19:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B4C6F800B2
IronPort-SDR: sQw6DRcn13MV4oNDNucyAI0IeEmIh/0Gzj4k88I73Q4YI0oWeCXtm1V0Ycrmee9BKxsHQSRBsE
 c8BIkn6MObES8FcXOOPahM4lXpiLt2kggpNc496gH5F+5Rdz3TZTyM1LZxACibPsv3UTq6JlWx
 r5t3ogrdtZT/2V9XHgn1XkGWrzOosdqCYZPZz0w3FQCMVmYN8U3XTF/OVFo6FsjF23zx4g9d9z
 w1MFci0UeDPIVR9f5ltlAorUPEKhBRmv+KOgzKgy49nNTgcABAISBbsMZGlh27kitIBcgy1aBm
 dEk=
X-IronPort-AV: E=Sophos;i="5.70,414,1574150400"; d="scan'208";a="45570444"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 07 Feb 2020 10:54:07 -0800
IronPort-SDR: TM+SJCQYLKejof88kUV6smGWRTAkIGSExsv2ZBMUGdEa4Mh/PqrtvJkL9AYDnBnNYOQzmU0FL3
 KR1U/OKoEi4PsQzfFT+lMy9cifF5C9BK/cNOm1Cj0i1rE8WLPhgVo5gcBWHGt9rACkwEvuovme
 Rr/Cgu9WwMUMw9f+3cPfNA+M62R7NWHRMTQGBIxjDZ09YgCF+pkYdN8KMo29nTP7fSVVVRFLAC
 CCGc5ago9L73qhhoiEERngAdmQ7GW8RHp3sDvwTLS1fkondktjRIEnwW5OsV7LPEhkzEg2GEXi
 KrY=
From: Dragos Tarcatu <dragos_tarcatu@mentor.com>
To: <alsa-devel@alsa-project.org>
Date: Fri, 7 Feb 2020 20:53:25 +0200
Message-ID: <20200207185325.22320-3-dragos_tarcatu@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207185325.22320-1-dragos_tarcatu@mentor.com>
References: <20200207185325.22320-1-dragos_tarcatu@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>, mengdong.lin@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org
Subject: [alsa-devel] [PATCH 2/2] ASoC: topology: Fix memleak in
	soc_tplg_manifest_load()
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

In case of ABI version mismatch, _manifest needs to be freed as
it is just a copy of the original topology manifest. However, if
a driver manifest handler is defined, that would get executed and
the cleanup is never reached. Fix that by getting the return status
of manifest() instead of returning directly.

Fixes: 583958fa2e52 ("ASoC: topology: Make manifest backward compatible from ABI v4")
Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
---
 sound/soc/soc-topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 69069f70e745..575da6aba807 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2545,7 +2545,7 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 {
 	struct snd_soc_tplg_manifest *manifest, *_manifest;
 	bool abi_match;
-	int err;
+	int ret = 0;
 
 	if (tplg->pass != SOC_TPLG_PASS_MANIFEST)
 		return 0;
@@ -2558,19 +2558,19 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 		_manifest = manifest;
 	} else {
 		abi_match = false;
-		err = manifest_new_ver(tplg, manifest, &_manifest);
-		if (err < 0)
-			return err;
+		ret = manifest_new_ver(tplg, manifest, &_manifest);
+		if (ret < 0)
+			return ret;
 	}
 
 	/* pass control to component driver for optional further init */
 	if (tplg->comp && tplg->ops && tplg->ops->manifest)
-		return tplg->ops->manifest(tplg->comp, tplg->index, _manifest);
+		ret = tplg->ops->manifest(tplg->comp, tplg->index, _manifest);
 
 	if (!abi_match)	/* free the duplicated one */
 		kfree(_manifest);
 
-	return 0;
+	return ret;
 }
 
 /* validate header magic, size and type */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
