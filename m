Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF7257622
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB72183C;
	Mon, 31 Aug 2020 11:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB72183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865054;
	bh=24LdW+IB1nVFbVhemfZXwgf2Vvy1wMbX+EGyuzaVDZo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V4Qn/+BP+E6TNdmtCZPocbTBsFIV79xSMNSNtDJW/rcrKw669F+rE975oy5tbfB33
	 8FbcTBK42HNlI5Fu0tk3lH0Es09Rlw1LsBUArZ98JlaAh9nRBvOY15Y5CYeaFTQKe4
	 WHmUlSkrs2C0EMCLs409IyDo0qCMRo8K9xOwh8zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22DCFF802DF;
	Mon, 31 Aug 2020 11:08:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D56A1F802D2; Mon, 31 Aug 2020 11:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51535F80212
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51535F80212
IronPort-SDR: Rzp1D7/xsQTDIgbjHKS8a/lj0ldrT7O22SJK/C4m8o3deyQcSicB7+mB0IRVbVBAOYnjfAMRZR
 5O6E8YTUPoeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466743"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466743"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:05 -0700
IronPort-SDR: qnT7Ccc3qE09Y/3QAQJYgCtF9M1wBcevhejJm6nStYaRvyRs4oyC+DSJ7ZEM/zMEFGiOLuOf3u
 mhEZANScjhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286869"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:04 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 02/10] topology: decode: Fix infinite loop in decoding enum
 control
Date: Mon, 31 Aug 2020 11:08:55 +0200
Message-Id: <1598864943-22883-3-git-send-email-piotrx.maziarz@linux.intel.com>
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

Accessing memory outside of allocated boundaries caused segmentation fault.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 src/topology/ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/topology/ctl.c b/src/topology/ctl.c
index 6e6c1d1..0aa49ab 100644
--- a/src/topology/ctl.c
+++ b/src/topology/ctl.c
@@ -1367,7 +1367,7 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
 		et->texts = tplg_calloc(heap, sizeof(char *) * ec->items);
 		if (!et->texts)
 			return -ENOMEM;
-		for (i = 0; ec->items; i++) {
+		for (i = 0; i < ec->items; i++) {
 			unsigned int j = i * sizeof(int) * ENUM_VAL_SIZE;
 			et->texts[i] = ec->texts[i];
 			et->values[i] = (int *)&ec->values[j];
-- 
2.7.4

