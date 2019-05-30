Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B52EC58
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 05:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 004081612;
	Thu, 30 May 2019 05:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 004081612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559186423;
	bh=jZCXgkIFejkw+Z3pDhOwdLlFQ913ije5Z9TuiKjDnCY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWd5rTlc+o2QRz/RWkk6NKwo2y8dxUEWHZUA0k6cdqxxBRD2sxVJkwWlozHCXxNK0
	 D9kkyyJu1f3lMVKeRv9ufkg3HFKY8tcLQxhK2WuumQCGN2ER/JNVwWbYiwLK5dnvp9
	 0ZdRXA00/lOLnh0r3Nn5MK3AMFEg+wC6Md5Rc7lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13824F8972A;
	Thu, 30 May 2019 05:18:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA36F8072E; Thu, 30 May 2019 05:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F23E1F896EB
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 05:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F23E1F896EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UL0u7tSU"
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net
 [67.88.213.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDE3924479;
 Thu, 30 May 2019 03:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559186274;
 bh=MUReWeJro4bxc7yBDsWgZz5yQ6ksbBFwyAHIyxQ+gJ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UL0u7tSUhErc5Y8FNYg/h6FnYl5PI4WurIq+ocV5iLEqHXZcj/TBWu0I/k1InHgaE
 vbPFxXmeFlspGEQ5+Dk/8hOMhCMA6l6G7H9uyrFJj9MOGWDul5vlCOQRexpsW0Wa67
 o86gQIs5hgRqspbI3CvgkjHrJZKVPSWb7kbfhhHs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 May 2019 20:06:13 -0700
Message-Id: <20190530030538.571433062@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530030523.133519668@linuxfoundation.org>
References: <20190530030523.133519668@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH 4.19 215/276] ASoC: fsl_utils: fix a leaked
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

[ Upstream commit c705247136a523488eac806bd357c3e5d79a7acd ]

The call to of_parse_phandle returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./sound/soc/fsl/fsl_utils.c:74:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 38, but without a corresponding     object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index 7f0fa4b522231..cca33ab7020a4 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -71,6 +71,7 @@ int fsl_asoc_get_dma_channel(struct device_node *ssi_np,
 	iprop = of_get_property(dma_np, "cell-index", NULL);
 	if (!iprop) {
 		of_node_put(dma_np);
+		of_node_put(dma_channel_np);
 		return -EINVAL;
 	}
 	*dma_id = be32_to_cpup(iprop);
-- 
2.20.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
