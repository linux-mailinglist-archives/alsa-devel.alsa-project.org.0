Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E188ED19
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF8C2C6C;
	Wed, 27 Mar 2024 18:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF8C2C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561815;
	bh=Yakrd5S2lf1o46TVsfQLkasDh3pHYzGB68JUzvrqnvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oVi6UrPS6NuEGDYmnS2THEIrvGuxpdCTdnDUQFYgW7n487+Py7ZB8hPtfZ+vF1JbR
	 Ia5fQnNICeJhNU53axl+bKHi9Vp4HV9a/DPUdcUnp6QclQ3/3wHTQVsIFjPaCiEEVV
	 EZFQFu0/lWmnHMoCi9vZcZp1wdfQF9NL8ajN3EiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78EF5F80C20; Wed, 27 Mar 2024 18:46:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22716F80C52;
	Wed, 27 Mar 2024 18:46:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5799EF805E4; Wed, 27 Mar 2024 18:46:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84BA9F80878
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84BA9F80878
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69B75615C5;
	Wed, 27 Mar 2024 17:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF349C43390;
	Wed, 27 Mar 2024 17:46:04 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:51 +0100
Subject: [PATCH 16/18] ASoC: rt715-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-16-86d5002ba6dc@linaro.org>
References: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
In-Reply-To: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=678;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Yakrd5S2lf1o46TVsfQLkasDh3pHYzGB68JUzvrqnvo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsZ3YEEosti2IhBTR+tDpePklZR0FQLu6qwb
 xAvKias0pyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbGQAKCRDBN2bmhouD
 1/nXD/9w1o7uhMK1d2Ow4R8jLgPvGgfRNRsRy8Tvw5ruP81rc3FHUFsvp/NRmDjq9nr05FWLL0M
 M5+Qw7drzTIvux35+sls1XWBiNgQLXPlhoS+C7IGNh6a3QN4okfJP1gK/jeQEQakw5tVpiuFg4d
 qdCpbiR3sqEMHfFisaAmKJkLoKm+6chCqLNfsNIGq2h53Ms0X7fWdVYZY5As0SqTMb2yq75+g6w
 FiYlFAu2E93eXpnrSocmm0DKt1qshoO0GuPuKi5VuRbSiK1tKYkVMlyRRMeKU31ds6MHlJ+pi7C
 HBXGRElx+XJZMzgphRYd5bdrXQZEsljDjFq51zNr4hu6n648aURWAUh3J3Kre5aoTRCSE6p0oQn
 P6ISvHdVFsQSic9vE/6DuvgReP0HHhpXoHgzrbydr3uFiGwJsSCrtHWHak2/Q537pHDLt9hmIcg
 ju4Vy5MF73QGQr6LlNv25C2jYuPrVqkUh/DJUrXoiQ7NGdpITQ19xEd0uQFqI+FESZ6Y2jlyTZe
 yGfamsRC8yt5+3SGnVmQerlyRtG9le0n/BGC3LpqdhduCIVgubwDLde27ZCo5OI+afDzu6g3iIx
 TAcVE6vAiQOPimMU+0ddi+Y/IOOcoTgji2uS0yHbNXU08NPySxt89S/Qm1MYi5fTpc3vn1d2oTJ
 yVNL3fSNhheQt2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: CRSGXOPGXGJBCNCBOMV7X7ORIMBYXWAT
X-Message-ID-Hash: CRSGXOPGXGJBCNCBOMV7X7ORIMBYXWAT
X-MailFrom: SRS0=G+Mr=LB=linaro.org=krzysztof.kozlowski@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRSGXOPGXGJBCNCBOMV7X7ORIMBYXWAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core in sdw_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt715-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 21f37babd148..823b9cacc3e2 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -577,7 +577,6 @@ static const struct dev_pm_ops rt715_pm = {
 static struct sdw_driver rt715_sdw_driver = {
 	.driver = {
 		   .name = "rt715",
-		   .owner = THIS_MODULE,
 		   .pm = &rt715_pm,
 		   },
 	.probe = rt715_sdw_probe,

-- 
2.34.1

