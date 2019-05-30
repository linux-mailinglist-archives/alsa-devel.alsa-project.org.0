Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 833012EC62
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 05:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F071915E4;
	Thu, 30 May 2019 05:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F071915E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559186552;
	bh=JjeWahL4JwyeSwh+2oG5fDq8xQ6+pw85Qmfc/V197nQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fs0jxpiSaZfebSJQ3WBK4oUdjelmgmkek9AACo+Bp+NBt8/SO41nUScsQZ9yQO3RO
	 2FM+pzte39MdAwNOZd81O8/xg2ZgD3YaB5J6xnNdWDyHjJcaKauYk1dzDeazjJevcC
	 ct6Tw4VQg2RYHcAx5QY57qUauAG12sI0jkvBU2/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16B1AF89708;
	Thu, 30 May 2019 05:21:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EF49F89706; Thu, 30 May 2019 05:21:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19D3AF8072E
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 05:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19D3AF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cpbNbX1B"
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net
 [67.88.213.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72776249CE;
 Thu, 30 May 2019 03:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559186474;
 bh=acZXoBPoKiXvlqIJzBAzO0pMqsa6VZtkUPUMJfKHWvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cpbNbX1BoDOwBHIrboBVEy+M5Og63KPYnmBR3j9vWxOcdRKRYZb4EIwofWvTCzSPI
 9jU005mOt7vDd3NgcAz076yiluyf1KjOddnv2jmLHKwoVPdpfjCPv1EoMcySX83IUA
 onTIHA2vmz8qPc+zQnHqme0mhwOCkE+s//efmWJo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 May 2019 20:07:18 -0700
Message-Id: <20190530030453.759325192@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530030432.977908967@linuxfoundation.org>
References: <20190530030432.977908967@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH 4.9 106/128] ASoC: eukrea-tlv320: fix a leaked
	reference by adding missing of_node_put
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[ Upstream commit b820d52e7eed7b30b2dfef5f4213a2bc3cbea6f3 ]

The call to of_parse_phandle returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./sound/soc/fsl/eukrea-tlv320.c:121:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 102, but without a correspo    nding object release within this function.
./sound/soc/fsl/eukrea-tlv320.c:127:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 102, but without a correspo    nding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/eukrea-tlv320.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 883087f2b092b..38132143b7d5e 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -119,13 +119,13 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev,
 				"fsl,mux-int-port node missing or invalid.\n");
-			return ret;
+			goto err;
 		}
 		ret = of_property_read_u32(np, "fsl,mux-ext-port", &ext_port);
 		if (ret) {
 			dev_err(&pdev->dev,
 				"fsl,mux-ext-port node missing or invalid.\n");
-			return ret;
+			goto err;
 		}
 
 		/*
-- 
2.20.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
