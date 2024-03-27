Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197488ED17
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96661530;
	Wed, 27 Mar 2024 18:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96661530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561798;
	bh=ETLhuYz5m4xr/+VXdfDxxoQupSFR0FsUoJ0Ir6SnQ7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kOEGFBfoTamNIICTKh379rjS5oJSq7Br0SdtZk5Slt1gfN8TutJ1dyMg/K7cWs7aP
	 XOO50NJQ14cF7rQE4VVdtFAJbDJq7aX6rrHnwbBG2PTPjuW6UrKTtnTvOsHgnsKIB3
	 1i4Fl5NQHhWprS9H67iR25200bXfeqIQGWF4U0lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BABBF808E7; Wed, 27 Mar 2024 18:46:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 680D4F805F9;
	Wed, 27 Mar 2024 18:46:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E488F80844; Wed, 27 Mar 2024 18:46:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B5C2F807DE
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B5C2F807DE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0141CE2534;
	Wed, 27 Mar 2024 17:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1719C433B1;
	Wed, 27 Mar 2024 17:46:00 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:50 +0100
Subject: [PATCH 15/18] ASoC: rt715-sdca-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-15-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=700;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ETLhuYz5m4xr/+VXdfDxxoQupSFR0FsUoJ0Ir6SnQ7g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsY9979sPiwsmR/TV4spfSFI9EiZyBQ6YBXo
 0TPY0CGbCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbGAAKCRDBN2bmhouD
 1/g/D/4y45Jb7bmhvso5WWL8uHeD2EU72tYoCZKa16sNueBPDy+tyUygkXwLpF+GKvEG5NjLqn8
 RC5mPY5AEiBxsmBQ6n8h9P2B/Cy2Ads/W21EungdawKfozfofByAWn3ham+qqlipqdFnpHL4QY5
 /NQ8w2Z1V4fHuWzJxycd5Au/zbGdBrsxtLtFGUzkphOBouRR9Bq51ljpAvxLQPGlYCPhzHbnjTp
 03jPjBZwdnUMKBiKKRLlEbYX1W3ItNYfFfrOgHvzrZQRxVbZwn1fRVdxyZhzkS19YOskKSJeHoO
 4Es2I8WMnT3cqXh/mXJrZiU8nJNmGAD70oSHVoSWU3t9y1swUOGaJ6MdzfEceQj7dnyVn1+9Wf5
 jdERwTCIf4Fs177th0Bl0CjOclIY+SaWZ3eLMS2A4KxJF/9VYN1NA4ix+/qqOVgRQf+IaCj9IIR
 dmLrqfZMFPgM+3BzKEzChUYHKlf0NcG8eow14/tpbGGbneJScFrBUlz7ypeM7mWL/D0qAIbZFVB
 +3cIq/yE8/JHzhIEmcFHNMp72nSsy/0kRv4QoJSyLxvPmcWkZeyF9hjz3veRbMLycsKGTj7SQyN
 0d9towFns/JgzNjUrejDJSZhRXsctfwwdqZ38h1CYWJPJddncnHq2YhwkCV6gOVrfygSOI6hKN9
 acCizvvJdbiWs5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: PEPW4LXOCNK3SEBYDHY4CYAUZ4RGEUE2
X-Message-ID-Hash: PEPW4LXOCNK3SEBYDHY4CYAUZ4RGEUE2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEPW4LXOCNK3SEBYDHY4CYAUZ4RGEUE2/>
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
 sound/soc/codecs/rt715-sdca-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index ab54a67a27eb..08db815d3c8e 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -270,7 +270,6 @@ static const struct dev_pm_ops rt715_pm = {
 static struct sdw_driver rt715_sdw_driver = {
 	.driver = {
 		.name = "rt715-sdca",
-		.owner = THIS_MODULE,
 		.pm = &rt715_pm,
 	},
 	.probe = rt715_sdca_sdw_probe,

-- 
2.34.1

