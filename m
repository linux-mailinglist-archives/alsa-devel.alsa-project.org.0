Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C46CEF25
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:20:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9C33839;
	Wed, 29 Mar 2023 18:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9C33839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106804;
	bh=2QDriybfok28zgEIOBPq16NBqwdvGyH821rDD9mIx0M=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=poSxeDMRb4iduru9wrGoP3OMyGTFYYf6AJL0vC5x+X5nmh5NDCT00OVX5RG3fCFhR
	 Du2rbRiJz4YufqVN2uKJgRwyvHWCzM1VXQfIhQjgYUbsJCnwrmT43KUu6wp7SkW/oe
	 EK3SOEqnom5NE5JIsGubW/KeYczMUHFb5H4aB/J8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD93AF80570;
	Wed, 29 Mar 2023 18:15:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EE4EF80272; Mon, 27 Mar 2023 16:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DA1DF80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 16:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA1DF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=brFZTdzb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 43784CE1796;
	Mon, 27 Mar 2023 14:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802D1C433EF;
	Mon, 27 Mar 2023 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679928980;
	bh=2QDriybfok28zgEIOBPq16NBqwdvGyH821rDD9mIx0M=;
	h=From:To:Cc:Subject:Date:From;
	b=brFZTdzbRCEJKhn/gixnOI7R3/N5P9HVm/0P4E4JsRnzL4oyI4qiXPv2EJ2oH6O2k
	 xB4+Dl/nsUWxx/F1iujnEROwvQxsY8sLMrSqjtUtv94z05xfhU7nhJ5d0kQiFuK5py
	 18eGd8iJ8GH4eGv1C3qtCsG9kq0SqWnzaPWiFwzKfEmKpWVsFt5tAkmdDdaWA2hsTo
	 GH6MfXbJakVM86+TGz3xeHrYjW6ckFq8Hz84yMfDP74lPvlJ98VMs1bGhd32Ra692D
	 nXn+kMdPYq1nErt8ITK/GWk4hzrVctwoBOMmyD4r+1831iFEJfumCWj/3W+4bqTpxi
	 Znsy0YiPL4uKA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1pgoGr-000537-AR; Mon, 27 Mar 2023 16:56:30 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>
Subject: [PATCH] ASoC: qcom: audioreach: drop stray 'get' from error message
Date: Mon, 27 Mar 2023 16:55:55 +0200
Message-Id: <20230327145555.19351-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KMG3S7YJ75JBA3A6WEWMICPY7LI4BGVL
X-Message-ID-Hash: KMG3S7YJ75JBA3A6WEWMICPY7LI4BGVL
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:15:08 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMG3S7YJ75JBA3A6WEWMICPY7LI4BGVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the stray 'get', which appears to be a copy-paste error, from the
registration-failure error message.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 994c9e823a88..a7a3f973eb6d 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -676,7 +676,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
-		dev_err(dev, "failed to get register q6apm: %d\n", ret);
+		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
 	}
 
-- 
2.39.2

