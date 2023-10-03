Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE67B6DC0
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 18:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D77684A;
	Tue,  3 Oct 2023 17:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D77684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696348828;
	bh=jSnludvJeJTD+6HRSvHeKr3Owfs9qfyq4PwHRjnN+QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ew/nWcVZeKQPXb1byDhqDLaEL4DCbH9ra/7PYDK0s6KUAzp5HBVmu9zEXpYW+hqZf
	 gEFVC8XVmmcmld8VOKb1SIF+D3PZX9HiHyRUkR6Ck+Dbg5TTx1bXLOkmrZROxsv2gA
	 e2nUKdLURxKYj5328cHw7/uxHhktUW05pPfrxNIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0CD5F80578; Tue,  3 Oct 2023 17:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21541F80578;
	Tue,  3 Oct 2023 17:58:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFCEDF8057B; Tue,  3 Oct 2023 17:58:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD150F80551
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD150F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fv5IC0Ni
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A9E26129A;
	Tue,  3 Oct 2023 15:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A0AC433C7;
	Tue,  3 Oct 2023 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696348710;
	bh=jSnludvJeJTD+6HRSvHeKr3Owfs9qfyq4PwHRjnN+QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fv5IC0Ni/LXK242jhOeSXIVdmLaP1PNHa2ff5rEY557ruQsQ2XrOtYJY+lXFTZvYQ
	 BeqeLL+nDvoW2Hqzqjw42JDaFgiW8Mn9C5LAr502TcMuI65HwLdqwvc4S9qr38L14R
	 /2dz98wEOYOrRLMwMNRKePniaI1SVUxLkE6cMMrv7/mt4QEITny1+u8lfLuHHc5JAH
	 9xAZC+oI2Z5k3pDnFNsL2B3kVawS+d0QkAKb1DdNlnhHrLNo+e5JE0bG+V5MNUIf20
	 vPl0Ir9AgYatkGTkfqLCmz4k3uFXd264wMgwb48y/RSwdIYXXu25yfa3PbSqKXVYQt
	 +OX/hK+7QQbBQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qnhnG-00074p-0B;
	Tue, 03 Oct 2023 17:58:42 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/7] ASoC: codecs: wcd938x: fix unbind tear down order
Date: Tue,  3 Oct 2023 17:55:53 +0200
Message-ID: <20231003155558.27079-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003155558.27079-1-johan+linaro@kernel.org>
References: <20231003155558.27079-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4X7AZV3TUU3L6IWS2H7VHFOZX7GXCR3S
X-Message-ID-Hash: 4X7AZV3TUU3L6IWS2H7VHFOZX7GXCR3S
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4X7AZV3TUU3L6IWS2H7VHFOZX7GXCR3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make sure to deregister the component before tearing down the resources
it depends on during unbind().

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Cc: stable@vger.kernel.org      # 5.14
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index cf1eaf678fc2..c617fc3ce489 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3504,10 +3504,10 @@ static void wcd938x_unbind(struct device *dev)
 {
 	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
 
+	snd_soc_unregister_component(dev);
 	device_link_remove(dev, wcd938x->txdev);
 	device_link_remove(dev, wcd938x->rxdev);
 	device_link_remove(wcd938x->rxdev, wcd938x->txdev);
-	snd_soc_unregister_component(dev);
 	component_unbind_all(dev, wcd938x);
 }
 
-- 
2.41.0

