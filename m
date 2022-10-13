Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3435FCFE7
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 02:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04E453E7;
	Thu, 13 Oct 2022 02:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04E453E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665620633;
	bh=hLGgv80zqb0eH/0rrXCcqjAM83ghk/Zxp3QBbxDGP7c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4d1Xivr4o5NLkW0b630LsTOjNZgvwcWS8qJYOqRBST9VgLb9n1sD//8llxUmj+/v
	 DLWBCy+zZc3B5CGxukP6bLx4Ar71aH+w55UqwSAzeQbHfEJFs5rJSk6gME+xF0w9i0
	 4rFQ6p4gQ7qXYwRatiKoMSUMrFz4ccd5YhulM+Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B57F804F2;
	Thu, 13 Oct 2022 02:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD439F804F2; Thu, 13 Oct 2022 02:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5D01F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 02:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5D01F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="urRz0cQ1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5812F6166F;
 Thu, 13 Oct 2022 00:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AB8C433C1;
 Thu, 13 Oct 2022 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665620545;
 bh=hLGgv80zqb0eH/0rrXCcqjAM83ghk/Zxp3QBbxDGP7c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=urRz0cQ12btGspoANQ7XpHxO7nYP1tltT92pWkNiuiAuTAAi7T5ua7n/8akt+Xp2w
 dcmA2qsBbHRY4Qwqh28J++RJhsDGStKqvwCM72NgXZVAOt4K4DcoGBZLaEWkRpVXSl
 e53aZrGvy4SOFfaMTFTt7FduZp89qsTopmvD2zEkF3b+5mHmGVdb1Nthe7lFQdajlJ
 6Vkk+uXb7wiRBooDvyIf+9dOhg2qMMPMWu3QIIneHlX79O5MFm8VuK70AqBmS5GX5W
 wJ5Su2r9kMRQwJDoH79HjCS/bb7TWvxB3k/NXWbm2mxO8BJFB05/9nYidSwFichvVI
 e25aXiyGC0EwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 22/47] soundwire: intel: fix error handling on
 dai registration issues
Date: Wed, 12 Oct 2022 20:20:57 -0400
Message-Id: <20221013002124.1894077-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002124.1894077-1-sashal@kernel.org>
References: <20221013002124.1894077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit c6867cda906aadbce5e71efde9c78a26108b2bad ]

The call to intel_register_dai() may fail because of memory allocation
issues or problems reported by the ASoC core. In all cases, when a
error is thrown the component is not registered, it's invalid to
unregister it.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220919175721.354679-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/intel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 38e7f1a2bb97..89ee033f0c35 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1407,7 +1407,6 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	ret = intel_register_dai(sdw);
 	if (ret) {
 		dev_err(dev, "DAI registration failed: %d\n", ret);
-		snd_soc_unregister_component(dev);
 		goto err_interrupt;
 	}
 
-- 
2.35.1

