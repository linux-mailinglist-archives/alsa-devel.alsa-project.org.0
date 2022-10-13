Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586C5FCF7C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 02:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D827C53D5;
	Thu, 13 Oct 2022 02:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D827C53D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665620315;
	bh=W5Sm+YPQ1xjDU381TURqrY9sM8XImPQc4XQ4uSH9l5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EgHRpsJJDWNB/rfI3GIQEV3jF5BKFeHrmvJs9j8fBur159E5sJ/1wCdl27SewxpvR
	 sUktQQht6LkC46wwndwNwi9GjGy4+HU072qf5dwYWi1VLotl5+ODsqidZghgJrb2Us
	 xYo3/k3I11gvN23QKHUq21jwNw+CjHiHczTigQgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E24F800F4;
	Thu, 13 Oct 2022 02:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC092F800F4; Thu, 13 Oct 2022 02:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD42F80132
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 02:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD42F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aYkj3RG9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F366AB81CC7;
 Thu, 13 Oct 2022 00:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE46C433D7;
 Thu, 13 Oct 2022 00:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665620224;
 bh=W5Sm+YPQ1xjDU381TURqrY9sM8XImPQc4XQ4uSH9l5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aYkj3RG9Ad4ah14AdBRD+0fCP49I8Wj6pUaBI3uwhosvD8OIli6sPu0kIxdy156y5
 hlrLEzb9hpZs6/uFBf1kFYJv1Q0hxoyZWxiweECweVI9w9M0SvhMfB3HYgdv3FUepv
 YWxYNwQMvBWy4A29+rDeRJQqiZ/qnkd2ApUDmDRMDG3S84ur9FXykQuCUyoVZxb5P/
 S5OVbD/sVRPeA+sjTw8j+7KWQIIJG33eEb0vv/WnT6d8GJEQ4FyfQKDV4BmBY4wfAn
 Xm5EEdGhIXh8gbUgueanutZ6tkFY31FAA2MngT/xmE2uMqSOq8ZQQU2EBi6MxL/F/4
 eeTvbTOpiGpGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 29/67] soundwire: intel: fix error handling on dai
 registration issues
Date: Wed, 12 Oct 2022 20:15:10 -0400
Message-Id: <20221013001554.1892206-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001554.1892206-1-sashal@kernel.org>
References: <20221013001554.1892206-1-sashal@kernel.org>
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
index 89d1d0d021fc..af6c1a93372d 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1429,7 +1429,6 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	ret = intel_register_dai(sdw);
 	if (ret) {
 		dev_err(dev, "DAI registration failed: %d\n", ret);
-		snd_soc_unregister_component(dev);
 		goto err_interrupt;
 	}
 
-- 
2.35.1

