Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A325764C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:15:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 808941820;
	Mon, 31 Aug 2020 11:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 808941820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865340;
	bh=tzp/yXwtZF0kN5xmenOHr54FeWLG2PtjI6ADqYkKvYY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WIwN8uyUFCc3NzL/J7hFUJY8uoemY3CGTwfiy/Bu5Dvp0pMNadBkQZk6ceDXcYBhM
	 iqwUoDBZEbIWOhIQHjDsrJMOi9JAoEwB/lpdvdQeIV4e16WVTnSIBCsMUtFd57CFvl
	 SBEtUHDnbyrildNWOZ9d23ByeYQ2XgZhDAHVAnUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 904FAF80322;
	Mon, 31 Aug 2020 11:08:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49EEFF80268; Mon, 31 Aug 2020 11:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3719BF80268
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3719BF80268
IronPort-SDR: jmKUKdFWLrHgbMJXITJYxDZNQQ4Cs6VTxUaU1+liO2f9+DzVdCYP/G4+fFX4tknBL9tEyodiIT
 r9o0oI9Obing==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466761"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466761"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:11 -0700
IronPort-SDR: 35gDVmuE6YjP3cxtp1yM74AK7vvleT+aAGTI4AxSGYwQQbx4vJY+2M0/Asq2pkb2Kj2Xfv687Y
 Cl6lznWUl6Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286890"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:09 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 05/10] topology: decode: Fix printing texts section
Date: Mon, 31 Aug 2020 11:08:58 +0200
Message-Id: <1598864943-22883-6-git-send-email-piotrx.maziarz@linux.intel.com>
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

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 src/topology/text.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/topology/text.c b/src/topology/text.c
index 507c545..b899b28 100644
--- a/src/topology/text.c
+++ b/src/topology/text.c
@@ -103,7 +103,7 @@ int tplg_save_text(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 		return 0;
 	err = tplg_save_printf(dst, pfx, "'%s'.values [\n", elem->id);
 	for (i = 0; err >= 0 && i < texts->num_items; i++)
-		err = tplg_save_printf(dst, pfx, "\t'%s'\n", texts->items[i][0]);
+		err = tplg_save_printf(dst, pfx, "\t'%s'\n", texts->items[i]);
 	if (err >= 0)
 		err = tplg_save_printf(dst, pfx, "]\n");
 	return err;
-- 
2.7.4

