Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EDA257649
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 699981865;
	Mon, 31 Aug 2020 11:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 699981865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865303;
	bh=E2GJWqiJza5q4wgO2Xrylcyn2Z8PEhuLPkKoGHcP9MU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUxPTcPR7kjBgOnckO+8TuxLVHIjPmtAGk3D8qTLsjKN/VocnJ6cfM6jTrMAYe4Es
	 EHwub5K9VbTMyjIT7kMIDwKhmaJiD0ONYkJGEGsSsYLHbjD1hMDataY5x4nLcvCbQ3
	 GkPRaL2SxC125p1YRPz+8H3+FgygSXf7+JtiNbnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94925F8031A;
	Mon, 31 Aug 2020 11:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40463F80303; Mon, 31 Aug 2020 11:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02C45F8024A
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C45F8024A
IronPort-SDR: 1gvCLb1S6I2HKXS3zw0kl3GKY4nxHo5zTS+Ru47fCWS+JspWmqhHjAEEVHAKsGY3qr87R4boy7
 QFhhfIQFZuYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466752"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466752"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:09 -0700
IronPort-SDR: uhKatnGQQJxbzwEtSiDt7BzelCucmBv+l6jyvLi3KRczeBbdQ96pTPd8NMn8bjjkXmUUKfnBp0
 uY5wMOIFYoYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286884"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:07 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 04/10] topology: decode: Add enum control texts as separate
 element
Date: Mon, 31 Aug 2020 11:08:57 +0200
Message-Id: <1598864943-22883-5-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

Texts are separate sections that should referenced by enum control.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 src/topology/ctl.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/src/topology/ctl.c b/src/topology/ctl.c
index 02e482e..1f39846 100644
--- a/src/topology/ctl.c
+++ b/src/topology/ctl.c
@@ -1088,11 +1088,19 @@ int tplg_add_enum(snd_tplg_t *tplg, struct snd_tplg_enum_template *enum_ctl,
 	}
 
 	if (enum_ctl->texts != NULL) {
+		struct tplg_elem *texts = tplg_elem_new_common(tplg, NULL,
+						enum_ctl->hdr.name, SND_TPLG_TYPE_TEXT);
+
+		texts->texts->num_items = num_items;
 		for (i = 0; i < num_items; i++) {
-			if (enum_ctl->texts[i] != NULL)
-				snd_strlcpy(ec->texts[i], enum_ctl->texts[i],
-					    SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
+			if (!enum_ctl->texts[i])
+				continue;
+			snd_strlcpy(ec->texts[i], enum_ctl->texts[i],
+				    SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
+			snd_strlcpy(texts->texts->items[i], enum_ctl->texts[i],
+				    SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
 		}
+		tplg_ref_add(elem, SND_TPLG_TYPE_TEXT, enum_ctl->hdr.name);
 	}
 
 	if (enum_ctl->values != NULL) {
-- 
2.7.4

