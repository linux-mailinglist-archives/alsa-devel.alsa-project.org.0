Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 592EF88ECE0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:45:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26662C3F;
	Wed, 27 Mar 2024 18:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26662C3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561549;
	bh=1CwmmlxmKVLscRdfmcfA4/+KluARtfajri1QKyfGJWo=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TlSt+OjU6bBaCRhh1UF/p6o2gwIs31NnKM3nXzM/4KoBUzDmT/QpeClNI1JMjWYC5
	 hLg4LL08ubkLe8431MT3lDOEoq6s+tRCE6yhCjjwkPxAeqrH37HSbkdzH/ml1Zxu+3
	 ViTj8KypQ713p8eQQJID8Zmoox7JMa5VR2mWg5Gc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99D47F8057D; Wed, 27 Mar 2024 18:45:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18214F8059F;
	Wed, 27 Mar 2024 18:45:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13072F802DB; Wed, 27 Mar 2024 18:45:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D36BF80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D36BF80074
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29B8461180;
	Wed, 27 Mar 2024 17:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3759DC43390;
	Wed, 27 Mar 2024 17:45:01 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/18] ASoC: drop driver owner assignment
Date: Wed, 27 Mar 2024 18:44:35 +0100
Message-Id: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAANbBGYC/x3MTQqAIBBA4avErBswE4SuEi0ixxoojZF+QLx70
 vJbvJchkTAlGJoMQjcnjqGiaxtYtjmshOyqQSttVK8tHtFdO2F8Agnes6C2xrjOKL84DzU7hTy
 //3KcSvkApyabnGIAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1CwmmlxmKVLscRdfmcfA4/+KluARtfajri1QKyfGJWo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsJlGaQcNPUZgt7MK4j6bYQifF9US18lvokx
 ApAlXs0TUGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbCQAKCRDBN2bmhouD
 15VlD/9UzH+3nbglyOWWstuJFqB3SUJSfDjJ26GUTOCV8G63AxSPq3ZM/HMtUtEZ/K79Y8a2NQu
 YW9LDFpxo/ANM6BXldJKYLI8vzjHcDedLKdsKLpMLGoBTaXYv4TVu6gI340BgG6cUUchggrbWJX
 ea5r8i/wc0WBk/lBtkHcph/cct59eLWo6U1lsH/ne6yvxVQCZFSvr2A9fpsUxAUt4UhAQNHXbG9
 ZIdFPJeRFBBVn6GBP2pXbx5Sy7/gR/sd9gTwmzEEDfadICLRJh6MmxQ8b5/pICCTNbkZ2gnak0g
 f1pTDOWgYrLx6i9aA/XOP8+6If5n00tLIeyliMaX3kbmpediVVYKOIgAGxmNfNg9fYMZrveedU5
 mgLOzcDueM1aJQG9LCBFAjFR1d5Vg/UFRnBsQCMSDF4o07UZdsP+/SG/ahsilNcizEa1/SFCPRQ
 dq6oXFL7voLW9/X6OFCFqvXDW9yYjhuY+gpIr62oVGnIRyYDlddZYh+F/CUhZKQVmxKOKzF3tbx
 XOiGAEg2KDcSiIY8pC91ZhDXDHXyRnkggHcJ3Azzno5y4hFUFZn4jajaDSxdg7hJHPzCZd3+5K/
 jo5w+QznMmhyUhmn99j36LcsubCbsEHacozDhUnLSo7OV1Gb8Giz1rsXnX5mQ0J5TLSzvTHXERO
 YgJK63R7sBgb+/A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: DY27CDWJ3IE4CIA52XY45YQ37DM3DXUB
X-Message-ID-Hash: DY27CDWJ3IE4CIA52XY45YQ37DM3DXUB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DY27CDWJ3IE4CIA52XY45YQ37DM3DXUB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core for several drivers already sets the driver.owner, so driver does
not need to.  Simplify the drivers.

Patches are independent, no dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (18):
      ASoC: loongson: i2s/pci: drop driver owner assignment
      ASoC: tlv320aic32x4-spi: drop driver owner assignment
      ASoC: tlv320aic3x-spi: drop driver owner assignment
      ASoC: max98373-sdw: drop driver owner assignment
      ASoC: rt1017-sdca-sdw: drop driver owner assignment
      ASoC: rt1308-sdw: drop driver owner assignment
      ASoC: rt1316-sdw: drop driver owner assignment
      ASoC: rt1318-sdw: drop driver owner assignment
      ASoC: rt5682-sdw: drop driver owner assignment
      ASoC: rt700-sdw: drop driver owner assignment
      ASoC: rt711-sdca-sdw: drop driver owner assignment
      ASoC: rt711-sdw: drop driver owner assignment
      ASoC: rt712-sdca-dmic: drop driver owner assignment
      ASoC: rt712-sdca-sdw: drop driver owner assignment
      ASoC: rt715-sdca-sdw: drop driver owner assignment
      ASoC: rt715-sdw: drop driver owner assignment
      ASoC: rt722-sdca-sdw: drop driver owner assignment
      ASoC: sdw-mockup: drop driver owner assignment

 sound/soc/codecs/max98373-sdw.c       | 1 -
 sound/soc/codecs/rt1017-sdca-sdw.c    | 1 -
 sound/soc/codecs/rt1308-sdw.c         | 1 -
 sound/soc/codecs/rt1316-sdw.c         | 1 -
 sound/soc/codecs/rt1318-sdw.c         | 1 -
 sound/soc/codecs/rt5682-sdw.c         | 1 -
 sound/soc/codecs/rt700-sdw.c          | 1 -
 sound/soc/codecs/rt711-sdca-sdw.c     | 1 -
 sound/soc/codecs/rt711-sdw.c          | 1 -
 sound/soc/codecs/rt712-sdca-dmic.c    | 1 -
 sound/soc/codecs/rt712-sdca-sdw.c     | 1 -
 sound/soc/codecs/rt715-sdca-sdw.c     | 1 -
 sound/soc/codecs/rt715-sdw.c          | 1 -
 sound/soc/codecs/rt722-sdca-sdw.c     | 1 -
 sound/soc/codecs/sdw-mockup.c         | 1 -
 sound/soc/codecs/tlv320aic32x4-spi.c  | 1 -
 sound/soc/codecs/tlv320aic3x-spi.c    | 1 -
 sound/soc/loongson/loongson_i2s_pci.c | 1 -
 18 files changed, 18 deletions(-)
---
base-commit: 1cadb9c1269d4e90ec23f3dc3e5373ee405462d1
change-id: 20240327-module-owner-var-2744d140fcdf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

