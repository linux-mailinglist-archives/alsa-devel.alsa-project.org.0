Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6445224E7D
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 02:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57476165E;
	Sun, 19 Jul 2020 02:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57476165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595118906;
	bh=gicrWlJ86xXzQh6MS6e48D6H2FoxtQu5KUjw0JCmoc0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t6+6ZmV8HGeGf/2HzpNdqY9d3mE/oIcI51mKxW97KDFma6nIew7uHo/9ILAWHs07U
	 arZGFTroKecv9KvAV2L1QIZ2hzI0rgn/fHP17Ek2vX6ZtobmuVlRXr9p1/9KYVh3up
	 0HbULTBH7NqA6dqAOdQQBOwaWbTJkgYGCL/Wq/AU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88782F8016F;
	Sun, 19 Jul 2020 02:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B88B2F8016F; Sun, 19 Jul 2020 02:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82FFAF80141
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 02:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82FFAF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="NqkxN9fJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=4xgT1e/c0uMcREKxhGXpwMFM0lJQ7iVJdWBf7wUK0V8=; b=NqkxN9fJa9piz3C0cgOg4s7Crz
 zV91vMRc5OlrJWiZg0THAn2hzB6UNdSdGk/hx7YfQ9RKvbswIbAMt1ysur8CacdDU6v374hnGFs/v
 Dc+uARTwgFWA1sOJXOjdZG6zc3+urHApufEJtvg4SVrC1c6rjjqOSTVWQI2L+InKkgnr/eyNAqARj
 mfygoOIsJNB0FyuQF0mv0he2uByZHHy++VtzW32p0XiUClzfQNsL38ctv6D7MIZ/6imiRnHuZTZou
 dX3tnTcKMRqU9rEjHtDIwFEhUU+sqUqH+9tSbuFDE4+SMPobcI4PQhrhgPeyHkt+6t1ahRuQ1XXIU
 HDAIe75A==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwxGR-0003A7-6q; Sun, 19 Jul 2020 00:33:11 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-dai.h: drop a duplicated word
Date: Sat, 18 Jul 2020 17:33:07 -0700
Message-Id: <20200719003307.21403-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
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

Drop the repeated word "be" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
---
 include/sound/soc-dai.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/include/sound/soc-dai.h
+++ linux-next-20200717/include/sound/soc-dai.h
@@ -39,7 +39,7 @@ struct snd_compr_stream;
 /*
  * DAI Clock gating.
  *
- * DAI bit clocks can be be gated (disabled) when the DAI is not
+ * DAI bit clocks can be gated (disabled) when the DAI is not
  * sending or receiving PCM data in a frame. This can be used to save power.
  */
 #define SND_SOC_DAIFMT_CONT		(1 << 4) /* continuous clock */
