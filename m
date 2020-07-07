Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9D2179A2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8738316A8;
	Tue,  7 Jul 2020 22:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8738316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594154558;
	bh=PCqvaGszVrkk5VUXnkoeR7yyny1UA7jXOqOtZwTP/e0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ehoYeYDtS+hkpgmnF+jinEtfiHXvPXvmL00AuugFsjjeTrZfAfI1SA71RSeh4khc8
	 ZDqXs9C5HLSJxj1SGSr7GpWoPCM4K3fvsz0EnAuaI/N7bmKZm0sDNOJFydHujXol9c
	 WmbNWa4bK/CpD4R4wtzgtB99L7sDe6MAzyUoeViA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B2CF802E7;
	Tue,  7 Jul 2020 22:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF64F8025A; Tue,  7 Jul 2020 22:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D01BEF8025A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D01BEF8025A
IronPort-SDR: /FhY8zc9ePQ1P9cgoj3nuheef/W+SgwMfz9ffRnPfj5tD2bADautOOkvcoSHwTTkr+zWmUNyzm
 pjMjVrNb86rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147700573"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="147700573"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:24 -0700
IronPort-SDR: VMX1H1IlD0R8dTrnwi06I4+8mrCdxOa65BDq/7j53fPdbAL48kj5i3Ihc4/64fsYakBKqpzXRg
 OqW3snHvlO4Q==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483640824"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: topology: factor kfree(se) in error handling
Date: Tue,  7 Jul 2020 15:37:48 -0500
Message-Id: <20200707203749.113883-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
References: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

No need to repeat the same thing multiple times when it can be done in
one location.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-topology.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d42f73f7038f..4004fc882912 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1055,7 +1055,6 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 				dev_err(tplg->dev,
 					"ASoC: could not create values for %s\n",
 					ec->hdr.name);
-				kfree(se);
 				goto err_denum;
 			}
 			/* fall through */
@@ -1067,7 +1066,6 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 				dev_err(tplg->dev,
 					"ASoC: could not create texts for %s\n",
 					ec->hdr.name);
-				kfree(se);
 				goto err_denum;
 			}
 			break;
@@ -1076,7 +1074,6 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 			dev_err(tplg->dev,
 				"ASoC: invalid enum control type %d for %s\n",
 				ec->hdr.ops.info, ec->hdr.name);
-			kfree(se);
 			goto err_denum;
 		}
 
@@ -1084,7 +1081,6 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 		err = soc_tplg_kcontrol_bind_io(&ec->hdr, &kc, tplg);
 		if (err) {
 			soc_control_err(tplg, &ec->hdr, ec->hdr.name);
-			kfree(se);
 			goto err_denum;
 		}
 
@@ -1094,7 +1090,6 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to init %s\n",
 				ec->hdr.name);
-			kfree(se);
 			goto err_denum;
 		}
 
@@ -1104,13 +1099,15 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: could not add kcontrol %s\n",
 				ec->hdr.name);
-			kfree(se);
 			goto err_denum;
 		}
 
 		list_add(&se->dobj.list, &tplg->comp->dobj_list);
 	}
+	return 0;
+
 err_denum:
+	kfree(se);
 	return err;
 }
 
-- 
2.25.1

