Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDAC7B6DAC
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 17:59:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E580EE74;
	Tue,  3 Oct 2023 17:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E580EE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696348776;
	bh=d3VaEwaFlyeMPWg3YHua4F4aRB7Tfwof5FHIy9UNucg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GZPy0b/cqa6JWrLTs1RgEOIm5wvd3jWXgCLiajTanw8Y+RLETfqGDdKn2TzN2ggT4
	 fJeAxsM1m62Vr+w0gSuO1RLca9CCud1fiZREfkc3lgXTivnx81mHuur8YBJerqcdYi
	 4WxkDJeDbyc9SxnvmpILNfz5i1GxoRYodKoP2H6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA347F80558; Tue,  3 Oct 2023 17:58:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FA97F8055C;
	Tue,  3 Oct 2023 17:58:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D889AF8055C; Tue,  3 Oct 2023 17:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1710F801EB
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1710F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NSXp24s3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A9CD61194;
	Tue,  3 Oct 2023 15:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADCEC433C8;
	Tue,  3 Oct 2023 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696348710;
	bh=d3VaEwaFlyeMPWg3YHua4F4aRB7Tfwof5FHIy9UNucg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NSXp24s3e8mvkSzjU7j3jfbsRkiRrdsCcyLfcSU7362Ak3Pd1N7fODvRQ4m+VKKlW
	 Ai8Q9kjjgXWiyuSP/UM391TIW0Bb83+rnOv39UL8WfvkKMRRldnqm7Qfez/ONMhCi6
	 0apiliYSifzA+dQq+cQXY60acuMFANuvzSEgJNsTLlztN80W43GeWCiFkH32Zxlk05
	 Mh5r91tfqDbY9cDihmDPBpsSWJUJ9J4dXWsv23MS2ejPJ2b8+ODoMlGKXscZnE3nsC
	 EPMYYoX4pvJj+SvCzca2F2OHaufKQE70zf9O73lQJ1kf8RKYR3fmBoX0hs8UTxRTA4
	 5S2mdKljgQBSg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qnhnF-00074n-3C;
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
Subject: [PATCH 1/7] ASoC: codecs: wcd938x: drop bogus bind error handling
Date: Tue,  3 Oct 2023 17:55:52 +0200
Message-ID: <20231003155558.27079-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003155558.27079-1-johan+linaro@kernel.org>
References: <20231003155558.27079-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T5IFSN52S4MCZGSK2TWKIIFXLNXAT5MI
X-Message-ID-Hash: T5IFSN52S4MCZGSK2TWKIIFXLNXAT5MI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5IFSN52S4MCZGSK2TWKIIFXLNXAT5MI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the bogus error handling for a soundwire device backcast during
bind() that cannot fail.

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Cc: stable@vger.kernel.org      # 5.14
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index a3c680661377..cf1eaf678fc2 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3448,10 +3448,6 @@ static int wcd938x_bind(struct device *dev)
 	wcd938x->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd938x->txdev);
 	wcd938x->sdw_priv[AIF1_CAP]->wcd938x = wcd938x;
 	wcd938x->tx_sdw_dev = dev_to_sdw_dev(wcd938x->txdev);
-	if (!wcd938x->tx_sdw_dev) {
-		dev_err(dev, "could not get txslave with matching of dev\n");
-		return -EINVAL;
-	}
 
 	/* As TX is main CSR reg interface, which should not be suspended first.
 	 * expicilty add the dependency link */
-- 
2.41.0

