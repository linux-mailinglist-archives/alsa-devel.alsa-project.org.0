Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD553B6EE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 12:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 806B8171F;
	Thu,  2 Jun 2022 12:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 806B8171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654165297;
	bh=25dY6dIPPsLBbC/xd5nLYIYa2hLQHsQM2iX88QOHxBg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vl8u0Z0S4IjZZXfpxX/UiHhc3hlQQ5zQSNwDpZkTBZxbIYFNZZWLgHCjFxb47ZORk
	 9KEip98bp+ecTfZ4rdcmto4WPomNGJzvm+ziKzjeaABhjSBQl0gjOxEBhR1RtpEUXg
	 FnXGqBBRuYDccr+c4B5DbDfnmOjJm6k5y31D1zBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF486F8025E;
	Thu,  2 Jun 2022 12:20:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D740FF80236; Thu,  2 Jun 2022 12:20:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB65F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 12:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB65F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pm6vLr4D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D0F78CE1FBF;
 Thu,  2 Jun 2022 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E97C385A5;
 Thu,  2 Jun 2022 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654165230;
 bh=25dY6dIPPsLBbC/xd5nLYIYa2hLQHsQM2iX88QOHxBg=;
 h=From:To:Cc:Subject:Date:From;
 b=pm6vLr4D8PHXGkAVdipIjpek+q7kkHsdQbS68XFD8HG3KYM8paxhOi9bvAlZ9GTki
 6xT0jCM+fVRrSY2GVzMBDz/SUfMXi6WwW9s78cUqEC3KRn9aV6zBo6ZOSuBJCyEyEe
 IZbp/dG3f8VFyZ4legG+1CMppvO+tSnVoSNBBkzGEVT7Rkc397NNt9NJY3nuXJNKsE
 ZLfEiaxPQmADCKn53tAhsV/frlKnxFmDNWWICCHLjITojOF42Vb/IfltG5u2EADAt8
 4hXCicxI0Ki3/OkUqWN2+2ZM7u0tVPQp4K2JYIbtUukBEe/OG1/Gs5qvbxNNgQD1Oe
 zXRjHLvXitvwg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ops: Remove unneeded delay.h inclusion
Date: Thu,  2 Jun 2022 12:18:33 +0200
Message-Id: <20220602101833.3481641-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=566; h=from:subject;
 bh=25dY6dIPPsLBbC/xd5nLYIYa2hLQHsQM2iX88QOHxBg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimIyHZbVjCfAu1NFM/xvRxitpxVNMGD5dAzKg6Gpv
 4e9Q78aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpiMhwAKCRAk1otyXVSH0BxnB/
 93gciJNobH7/zycLLyyD+1sgvb017SwJmPbEtC9UAb+cUoUtnejIIKeU1+uqqQ5bglA5MMBn3kPP30
 wTC5fyGRVzCvXkm2RU7exchXWcA6+8irKuvS/s/TGJn4v/g56H3xpxC64tGA7+VjTGwEIa4k2I3XXm
 5Hw/iPFtbXSjLchlkTzMVviW4IAZ4cyD443VUcP2f/7iIzBGV/xmTUgkPteS6JBUMR557piqBLLsk2
 j2TB+izNMhB/eS7chyM9UEp4TqUwMFKPk2gQsmZMWxwIXWZBsKrDvb4AlofpjXWyqAmOBAdQjnkIuo
 QbEYi5sMJ6vpavHF8SJ//v4u9fTV6h
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The ops code does not do any sleeps or delays so does not need delay.h.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 0d373435ceb8..2d39370ddeca 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
-#include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/bitops.h>
 #include <linux/ctype.h>
-- 
2.30.2

