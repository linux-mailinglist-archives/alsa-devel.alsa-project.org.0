Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DB452C9AF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 04:15:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8591315E5;
	Thu, 19 May 2022 04:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8591315E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652926530;
	bh=9jOLkACMpzUaRW5lm2N2mzfzmwCAQiS6MSiy3qPkOak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNAJQEEL8hfQ2eA42TcbeqnEO2l2Wk4I2Gr+7W63RB8KAPhOHdRcUPRUkYTYkybxF
	 1KtxYRPYJZ5EpiJo00iJ+hanq8WdumYaf+bCIQaaTSWhLLVDJQLt000WFWPDl6n6HR
	 tFnnfzdjNl9dykE1hqyhZKxlQlH/yDNMS5ODBdKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ED44F804A9;
	Thu, 19 May 2022 04:14:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F5AF80109; Thu, 19 May 2022 04:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05089F80109
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 04:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05089F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JD/qYhP8"
Received: by mail-pg1-x534.google.com with SMTP id c22so3786755pgu.2
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 19:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rr/Z8lIuwod83sK9/THugMPkDoGeWIkKPvWwosbdeJg=;
 b=JD/qYhP8UezTRIl7mKJGofTp75y3YtKRngrnVQszhFCd4lZCs9pmDCenW24A5jCJ7+
 h4Gk3rVAQVegkmW6Hr9YaC7lprEelCqi9IulyVW8sRGFRmFPqom3LyxAv2/+j/tlEvch
 vK1ACsyddt/yHqV/1U9npLlm7rxM96WbDWGJSCIRpPvd8jgjubMSZt223UTAGCLCLLoF
 0FuLQTB3qOGgnPtineoSO5YNto7RaUE6SIVGzAIeAuS5TNkbBxaScLaUrdlCvY2lLmGk
 +FL3cyjwwY8lDmqRN1S9ktnen8h8hMx/qefPPzebN3SlyORa41CeAaf7E9LXceotYgz/
 HqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rr/Z8lIuwod83sK9/THugMPkDoGeWIkKPvWwosbdeJg=;
 b=yUnxeEPL7fheM2sA2Fz//0ESxwv4cOBfdD2GCp31Cs1zjfYwI1q2jhwE99XM1yRK2+
 PrHl42sV2GoBA8gIVUYLHbaz1agjzzzbgIYDvnFk2FBfLItslYPmCy6X2JyfrsbequOg
 mjywi5RhXUj8KZvyRwhlRc5NjjZyhahQ19NJCOL1MTlDbK6hB9dzFuYPTIkuPouIq43G
 0W666b54dWVHUyNTnXAPpxG+lD6gd1xDhew1V+yh6AJHaR0s3pyU5o7bH2yhvJ7wPJVQ
 64QBDokxUY9TaoG3cEq6TJMp7I8p8wtLXx8rJ/G74zL5n3w9lSoKXAWoeeAoxsZzwnH/
 NQwA==
X-Gm-Message-State: AOAM532gakyLl6dmmn7dH6pAjEGjgILnX00C3YgyNFBU111/j6cYRvhj
 6oGM5bEGB6sQI8TDTnRoh2g=
X-Google-Smtp-Source: ABdhPJyBc/0cVz+8VsM/S5tpnBd7rbXw47kTwP5NVdBeln1UfPz2L1MVm8nKVr7/+pA0z90fFBweuA==
X-Received: by 2002:a63:6a45:0:b0:3c1:47b7:edce with SMTP id
 f66-20020a636a45000000b003c147b7edcemr1957623pgc.207.1652926431111; 
 Wed, 18 May 2022 19:13:51 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:8697:c74:ab15:730:f5f3])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a170903264400b0015ebb3bf277sm2366603plb.238.2022.05.18.19.13.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 May 2022 19:13:50 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 1/2] ASoC: rt9120: Fix 3byte read, valule offset typo
Date: Thu, 19 May 2022 10:13:37 +0800
Message-Id: <1652926418-8519-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652926418-8519-1-git-send-email-u0084500@gmail.com>
References: <1652926418-8519-1-git-send-email-u0084500@gmail.com>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ritchie_hsieh@richtek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

For RG 3byte read, the value order is  offset [0], [1], and [2].

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rt9120.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index cdf8ad2..94d42be 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -372,7 +372,7 @@ static int rt9120_reg_read(void *context, unsigned int reg, unsigned int *val)
 		*val = be32_to_cpup((__be32 *)raw);
 		break;
 	case 3:
-		*val = raw[0] << 16 | raw[1] << 8 | raw[0];
+		*val = raw[0] << 16 | raw[1] << 8 | raw[2];
 		break;
 	case 2:
 		*val = be16_to_cpup((__be16 *)raw);
-- 
2.7.4

