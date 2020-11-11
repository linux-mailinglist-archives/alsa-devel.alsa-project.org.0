Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E62AFAAD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:44:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2674E17B9;
	Wed, 11 Nov 2020 22:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2674E17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605131088;
	bh=JVE9W23Iex3PjPYG3kj3OjrHa9qE6XxBygs/SBYG578=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSoifskxDeiQ24hHlmA0NQpw/AZC9rCkVaN9zl7mrZotXBGlA2Do6VA69Z3Zss17f
	 DWEiHyBSdcItJFps4lkCzW4yZ2t4+Oc/tmNlkjksYqD5pejHtusb5FT+9ORryVGhmw
	 MgZW+RT5gVEkc5xdU0hJjid+6DmLF5wHn/v7vso0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA28F801F5;
	Wed, 11 Nov 2020 22:43:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40B1BF802C4; Wed, 11 Nov 2020 22:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14235F8025E
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14235F8025E
IronPort-SDR: /J041NIClu7mqErUbT1cddy/jr4Bc7YhceFuYd6uQMkd7EBq8IT/h7OoXR3lYmmNBImDYwV62Q
 y1PO7mEtc0nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149495731"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="149495731"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:34 -0800
IronPort-SDR: m74Aa6Vo0GjJghJONWbEuYZjFEM5ELiKmpuJ3zMUZ05Li822ovT/N78dxnK/eUvSJcZNosQKcU
 mt1M0s8fJvdw==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="356808080"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:33 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: rt711: remove warnings
Date: Wed, 11 Nov 2020 15:43:17 -0600
Message-Id: <20201111214318.150529-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
References: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

cppcheck complains, use separate loop variable for sink and source ports

sound/soc/codecs/rt711-sdw.c:382:4: style: Variable 'i' is reassigned
a value before the old one has been used. [redundantAssignment]
 i = 0;
   ^
sound/soc/codecs/rt711-sdw.c:371:4: note: i is assigned
  i++;
   ^
sound/soc/codecs/rt711-sdw.c:382:4: note: i is overwritten
 i = 0;
   ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/codecs/rt711-sdw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index f0a0691bd31c..fc7df79c3b91 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -338,7 +338,8 @@ static int rt711_update_status(struct sdw_slave *slave,
 static int rt711_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
-	int nval, i;
+	int nval;
+	int i, j;
 	u32 bit;
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
@@ -379,15 +380,15 @@ static int rt711_read_prop(struct sdw_slave *slave)
 	if (!prop->sink_dpn_prop)
 		return -ENOMEM;
 
-	i = 0;
+	j = 0;
 	dpn = prop->sink_dpn_prop;
 	addr = prop->sink_ports;
 	for_each_set_bit(bit, &addr, 32) {
-		dpn[i].num = bit;
-		dpn[i].type = SDW_DPN_FULL;
-		dpn[i].simple_ch_prep_sm = true;
-		dpn[i].ch_prep_timeout = 10;
-		i++;
+		dpn[j].num = bit;
+		dpn[j].type = SDW_DPN_FULL;
+		dpn[j].simple_ch_prep_sm = true;
+		dpn[j].ch_prep_timeout = 10;
+		j++;
 	}
 
 	/* set the timeout values */
-- 
2.25.1

