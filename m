Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6019B745763
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F625886;
	Mon,  3 Jul 2023 10:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F625886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688373277;
	bh=lrVbd0JoMGVuCAGlTtBwHS0krlYpo5gW52m7Wo7fi6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T67AxU6S+1JpRO/AaCLkE4UgxEBb8+6KX+37isQ79ZOUgmhjec1t9ypOjwqp2w2mz
	 wM+eu/CzHBsJ57DMX61gWBNnAtWlgoYi8OhbI+63bqrf+MSKm/G8u1DQGVcsHVGD6C
	 ZJGNJfL/fFU174iXFkb80MHXYyoDcUpxNrGqNaDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD4E4F8059F; Mon,  3 Jul 2023 10:32:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13FC1F8059F;
	Mon,  3 Jul 2023 10:32:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACB4EF80212; Fri, 30 Jun 2023 16:27:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6E4CF80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6E4CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eYqZFelz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45DA76171C;
	Fri, 30 Jun 2023 14:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB87AC433C9;
	Fri, 30 Jun 2023 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688135238;
	bh=lrVbd0JoMGVuCAGlTtBwHS0krlYpo5gW52m7Wo7fi6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eYqZFelz3wt7y/0/q3o7bAsYRDLYrKrsMemIk08HP9xdO/MwqGzw09bWbTrSyYu8c
	 KNNrYRnbad1Z5fuRBL2+xKFmpTirqeRQeexighNf8Whe3vS0ogxc1O86yFCD1VWbbB
	 Ft5KD1t8MCf3RnPvebkrKv3PXpfcc5ntWi158pa6b6T1CfuFviR4KsRLEWbCWPpwgg
	 8whZvA/RiPAuV1j9Vo+85OxGwWa1QrLo4K86BSDV1ZmFXEoQOYuzuoHH8vr46aA2aO
	 Zt91COgZM3Fovf1l0SK8cZzoX/YsQQ6KQnEN2v230F4nPMlXMds6q3A0tdRc4Tkz9i
	 Hwvsy/8BSTC5Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qFF5p-0001OY-Iu; Fri, 30 Jun 2023 16:27:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 5/5] ASoC: codecs: wcd934x: drop inline keywords
Date: Fri, 30 Jun 2023 16:27:17 +0200
Message-Id: <20230630142717.5314-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230630142717.5314-1-johan+linaro@kernel.org>
References: <20230630142717.5314-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RHLAC2NGL75ASFTKOXUHFJ3SHNZKHKWR
X-Message-ID-Hash: RHLAC2NGL75ASFTKOXUHFJ3SHNZKHKWR
X-Mailman-Approved-At: Mon, 03 Jul 2023 08:32:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHLAC2NGL75ASFTKOXUHFJ3SHNZKHKWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The compiler is generally better at deciding what functions should be
inlined than driver authors are.

Drop the bogus inline keyword from two functions that were neither very
small or used in a single place.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 9d724b5710f7..a17cd75b969b 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2642,7 +2642,7 @@ static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 	return rc;
 }
 
-static inline void wcd934x_mbhc_get_result_params(struct wcd934x_codec *wcd934x,
+static void wcd934x_mbhc_get_result_params(struct wcd934x_codec *wcd934x,
 						s16 *d1_a, u16 noff,
 						int32_t *zdet)
 {
@@ -2740,8 +2740,8 @@ static void wcd934x_mbhc_zdet_ramp(struct snd_soc_component *component,
 	*zr = zdet;
 }
 
-static inline void wcd934x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
-					      int32_t *z_val, int flag_l_r)
+static void wcd934x_wcd_mbhc_qfuse_cal(struct snd_soc_component *component,
+					int32_t *z_val, int flag_l_r)
 {
 	s16 q1;
 	int q1_cal;
-- 
2.39.3

