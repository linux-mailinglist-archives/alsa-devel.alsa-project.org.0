Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62D3ADF45
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E5316C5;
	Sun, 20 Jun 2021 18:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E5316C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624205011;
	bh=Pqr+jmuRcmaWaZh0/3gvw0BhZYhBYMYbicoIosILS0k=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rNCKY+ARPBdrPSRnXjoWS8iCObe+zF6+NhhFvdqiqxd/7IrP/8SlFfSADKmQpYaSz
	 nUuEjUG/fQ8/TaDQRB1nhe5VAakQsGjtX0PGKwrEXGviSkFmw1LVugRwnf3TOH4p4W
	 0HIrNYTt6mfoSdNycxmMjodRMtiJ1e676Zl6CEQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16989F80166;
	Sun, 20 Jun 2021 18:02:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C33F80268; Sun, 20 Jun 2021 18:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42AFDF80166
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42AFDF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YP+xRjY8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03D836113E;
 Sun, 20 Jun 2021 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624204910;
 bh=Pqr+jmuRcmaWaZh0/3gvw0BhZYhBYMYbicoIosILS0k=;
 h=From:To:Subject:Date:From;
 b=YP+xRjY8eTmQWGOtWY2o21jgq5YDsvjA7y2H0D8IC+A+BW+c3eJ5XH8IG8ZG+xo8o
 WhoThPt+uHSCtXV3RzJ0kA4YplQQ3X6KR3w3Xz1FiOZEE9CKwun9N+S4IHvUnvg5S/
 4+sia7VQdGu+6G6bmsVbqIDL1mJrE9fr1Ics5cAyovUW+oQ6Cn+8trXh6VLAOcp8Z1
 mIqxP/mkMPoBNsh5zD+3cdrNzrYqdqRe3umRqkwoRf7byAPgLGkhoKBCyITQhDb4fF
 K0Vo66ANTl4Ia3MsWia3nrQA1OdkVLWFxZXMQei3i+9xRMOpl7hNelqV4M+wswYxIg
 MADJQNRjVLu1A==
From: Timur Tabi <timur@kernel.org>
To: Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo.Lee@gmail.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] MAINTAINERS: remove Timur Tabi from Freescale SOC sound
 drivers
Date: Sun, 20 Jun 2021 11:01:35 -0500
Message-Id: <20210620160135.28651-1-timur@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I haven't touched these drivers in seven years, and none of the
patches sent to me these days affect code that I wrote.  The
other maintainers are doing a very good job without me.

Signed-off-by: Timur Tabi <timur@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c5ee008301a..b3b9a253316f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7354,7 +7354,6 @@ F:	drivers/net/ethernet/freescale/fs_enet/
 F:	include/linux/fs_enet_pd.h
 
 FREESCALE SOC SOUND DRIVERS
-M:	Timur Tabi <timur@kernel.org>
 M:	Nicolin Chen <nicoleotsuka@gmail.com>
 M:	Xiubo Li <Xiubo.Lee@gmail.com>
 R:	Fabio Estevam <festevam@gmail.com>
-- 
2.25.1

