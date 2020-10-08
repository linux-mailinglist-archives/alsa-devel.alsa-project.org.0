Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E052879BB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 18:13:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFDEE1674;
	Thu,  8 Oct 2020 18:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFDEE1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602173580;
	bh=odcKIcS2rgXtVOQJF+X7d4lRwwnaPshBaElk+qxy4ic=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IcPqTrmBCbnM6ozGZZNijaRSBf3TpBgxVP+xPzxzqMZba3612fQByV75hWxQsNE/p
	 md4mSDjhuIo8fYIoPT/zwLE29sgZfuQd+AUSVy2pt7WfYKoloF2wR+dUz8HLLxRVDG
	 399XLh52BlZgzl7MSA+2INCPs7iyfLstaLXalXFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E6D1F80167;
	Thu,  8 Oct 2020 18:11:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 190FFF80164; Thu,  8 Oct 2020 18:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C131F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 18:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C131F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sG6qsaJ0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BD0F21D7D;
 Thu,  8 Oct 2020 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602173468;
 bh=odcKIcS2rgXtVOQJF+X7d4lRwwnaPshBaElk+qxy4ic=;
 h=From:To:Cc:Subject:Date:From;
 b=sG6qsaJ0AqzsCcOBMmbYk8s1Q4+TikkEN46droiZNmAAjzUch8NzlRPVIGsOtvXKs
 oea4yZSD3pTGgvDuTmDDMD+uioX4MYHNDRlz8mpI2X9GxEkXS3byibw6ZMKb+DX02e
 0yx2yQZm5pQFzuIAiN+vqaDS3WwqJZr8tSsmlACE=
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Date: Thu,  8 Oct 2020 17:11:05 +0100
Message-Id: <20201008161105.21804-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=162830429688f269a2838f01494536323d46febd;
 i=VXVW0rYh+ve73oT0wQBc/womMjipEaviTdprhgXTq3o=;
 m=GbDHjudT1QLZ/QEHMmXmBgQ81c4UJHbv2/wsGpRgmHM=;
 p=vItuo2g+nIOV9Gy+EpdpJsEea8XtAIgbjc/ZmqwQGTM=
X-Patch-Sig: m=pgp; i=broonie@kernel.org; s=0xC3F436CA30F5D8EB;
 b=iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9/OKUACgkQJNaLcl1Uh9CSNAf/W8y
 Oco2Lhfz59RDIikV1KcQU+Wanj0MqAI66crblRuzrb/Y3+IGefCvCAnS4/ucUje4+Cfr63L7JqG/1
 WisyI38EjoohrtM6zpaKb/k8aP7l+t+kT7iJ3RqNxoyA0usKK9X5qOHvMv9tIptyrsYbVcm2DkjGV
 MLmpuu5EXiOU4mXNc6RayKASKt+TtMTYkWyR4Y2IOCTcvNj2GZvcNZSqRApQPJBiezZU8ns7PW87N
 NXdBvjleLdaKKOX8+VjcwTpCEhzvxGRcF/oGZe+epaHZimtTadhZYeOcpQqAYczkY9BTmYhss76gI
 KyqNLtvyJEl3cg0HHGGwIBsjqiWqQYg==
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Michael Wei Hong Sit <michael.wei.hong.sit@intel.com>
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

We intentionally do not return an error if we get a permanent failure
from dma_request_chan() in order to support systems which have TX only
or RX only channels. Add a comment documenting this.

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index fb95c1464e66..9ef80a48707e 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -386,6 +386,11 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			name = config->chan_names[i];
 		chan = dma_request_chan(dev, name);
 		if (IS_ERR(chan)) {
+			/*
+			 * Only report probe deferral errors, channels
+			 * might not be present for devices that
+			 * support only TX or only RX.
+			 */
 			if (PTR_ERR(chan) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
 			pcm->chan[i] = NULL;
-- 
2.20.1

