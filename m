Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636213A7C88
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 12:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A481689;
	Tue, 15 Jun 2021 12:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A481689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623754543;
	bh=UxYkmQjiryFhuJindfnCFYd3N1Dx9DJ//5KGbkIr5x8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QhAu4ZW2ZWQGjarLoIhdrosq0gMHfnf2+o9dUy7ODxPYGqWvS7LhhofqsRtzJowWR
	 vLaDbWPxytCLrgR0NZFY2vEaIdd1mVGc/g/CPVXr1BVLWJZksXPvUIymXDGpLWb9lI
	 ZBfIRuIAfzvtIvPvuE1evWkpCES8P6BvbHEzXrWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44164F8025A;
	Tue, 15 Jun 2021 12:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A092EF80171; Tue, 15 Jun 2021 12:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFCE8F80165
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 12:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFCE8F80165
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0UcW4duE_1623754437; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UcW4duE_1623754437) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 15 Jun 2021 18:54:00 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: oss: Remove redundant assignment to src_access
Date: Tue, 15 Jun 2021 18:53:43 +0800
Message-Id: <1623754423-84072-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Variable src_access is set to 'dst_access', but this value is never read
as it is not used later on, hence it is a redundant assignment and can
be removed.

Clean up the following clang-analyzer warning:

sound/core/oss/pcm_plugin.c:472:4: warning: Value stored to 'src_access'
is never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/core/oss/pcm_plugin.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 061ba06..a7c0e50 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -469,7 +469,6 @@ int snd_pcm_plug_format_plugins(struct snd_pcm_substream *plug,
 				return err;
 			}
 			srcformat = tmpformat;
-			src_access = dst_access;
 		}
 		tmpformat.rate = dstformat.rate;
         	err = snd_pcm_plugin_build_rate(plug,
-- 
1.8.3.1

