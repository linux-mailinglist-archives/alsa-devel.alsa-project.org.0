Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A637486A1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B673A84A;
	Wed,  5 Jul 2023 16:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B673A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688568202;
	bh=dSIi6iSQrZcwHBgwfGJF2PaWQmJdlHaoNoR7kIW6AWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KuUBNv/TKkLCGqA4YySbHFmSNO07a31tJOK9duocMQGRbCOJDroesZW3pryx4WtRC
	 xDOJcqj34HP1q1XJGVAoFc+Aa2LqcSd/+iWEU4nt6wU1LaEg6hLQPY2HIiso4vOoPC
	 Cgt0VBA3NcMjc9jlE22QO/wfz/c1nQja5A7De6B8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B4C5F80570; Wed,  5 Jul 2023 16:41:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF3B4F80563;
	Wed,  5 Jul 2023 16:41:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3A5DF8025F; Wed,  5 Jul 2023 14:33:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B4E5F8053B
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4E5F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LzN+lNYV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7ACB61574;
	Wed,  5 Jul 2023 12:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E10C433BD;
	Wed,  5 Jul 2023 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688560389;
	bh=dSIi6iSQrZcwHBgwfGJF2PaWQmJdlHaoNoR7kIW6AWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LzN+lNYV2vZg4H9gENrrC6S4iEtnSjbuaAMDlT4SwILg4/z7V0Qdovnpeu/pzfK1M
	 Q+ctGGcaD8nzUIpSHwHh1cpUp8W583nWBufO0LIC2VlZ072W/pJrIFrcb57wuRcpIp
	 5hge0sli/lraHNXfY4ziya9+OgNzXr5AQZixhA0IMTrCUF+/kDet7QlBhgz6xPm9fP
	 +K5gaSo9nnbpC1iMMGVniPOvenW1gy7BsF6+0c9S4wnj5t6Jn8lbVguA3fiTygfAZF
	 CQSDcs5a9Rkh98cNY2jFSoQWUClevB4HqouDDW9LrtRHe7Rbtk0dwCKu3omSzAbWcC
	 rMeLgQpNmPD/A==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qH1hK-00084M-25;
	Wed, 05 Jul 2023 14:33:30 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 7/8] ASoC: topology: suppress probe deferral errors
Date: Wed,  5 Jul 2023 14:30:17 +0200
Message-Id: <20230705123018.30903-8-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230705123018.30903-1-johan+linaro@kernel.org>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 37KVCR22JK74QJELHHD5EHPG7ZMMZ7WX
X-Message-ID-Hash: 37KVCR22JK74QJELHHD5EHPG7ZMMZ7WX
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:41:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37KVCR22JK74QJELHHD5EHPG7ZMMZ7WX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Suppress probe deferral error messages when loading topologies and
creating frontend links to avoid spamming the logs when a component has
not yet been registered:

    snd-sc8280xp sound: ASoC: adding FE link failed
    snd-sc8280xp sound: ASoC: topology: could not load header: -517

Note that dev_err_probe() is not used as the topology component can be
probed and removed while the underlying platform device remains bound to
its driver.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/soc-topology.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d0aca6b9058b..696c9647debe 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1751,7 +1751,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 
 	ret = snd_soc_add_pcm_runtimes(tplg->comp->card, link, 1);
 	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: adding FE link failed\n");
+		if (ret != -EPROBE_DEFER)
+			dev_err(tplg->dev, "ASoC: adding FE link failed\n");
 		goto err;
 	}
 
@@ -2514,8 +2515,11 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
 			/* load the header object */
 			ret = soc_tplg_load_header(tplg, hdr);
 			if (ret < 0) {
-				dev_err(tplg->dev,
-					"ASoC: topology: could not load header: %d\n", ret);
+				if (ret != -EPROBE_DEFER) {
+					dev_err(tplg->dev,
+						"ASoC: topology: could not load header: %d\n",
+						ret);
+				}
 				return ret;
 			}
 
-- 
2.39.3

