Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA880CAEF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:26:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6977F826;
	Mon, 11 Dec 2023 14:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6977F826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702301186;
	bh=/z+1W086U9uqPBNKB8aX+O++X4c1G0rkhD8UdWMNhzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HZGJN6kKZ7FAjeT9qn13itvWB1y7vYdM6c6t1A4OLWsbSITF/XMHhdwrtynRkU0AU
	 36ye9qlueanRqToHCpxSS/7AsrxElrp93WA+kI20vDaVzlcHzMVCktrhH5Pz8TpvSz
	 cj4GlWv7rXQaeJMen2OpPcB1rAaWE3Pln2vW1qQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4F98F80537; Mon, 11 Dec 2023 14:25:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA1CF80578;
	Mon, 11 Dec 2023 14:25:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E0A8F8016E; Mon, 11 Dec 2023 14:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB68AF800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:25:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB68AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cS/iWytV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 025ABB80E4C;
	Mon, 11 Dec 2023 13:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53085C433C7;
	Mon, 11 Dec 2023 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702301145;
	bh=/z+1W086U9uqPBNKB8aX+O++X4c1G0rkhD8UdWMNhzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cS/iWytVlYQM0gozRB+Upq9CcIRrAvHsRFH6RQAkA1LWOcZagdgs3QQjBjKh2pVvG
	 ZFWp+/Z3CseCAgK6+JwoLQpZpkj8yhwlr0hISQFT4+CvkKkYX7VZZuoLBnJTKe5++f
	 Gsty+T7k9GY3hBQYrmPQUkNNCVbun56KPl7tMCQcMoKyIq7eg1aj+o11ffMLX3x7CT
	 Qa3ZO0/Ce82thdg6p9AwPChR7f+GWLnKW1/ImDclts5x8ABjzTr4pICELFPQAH+5hN
	 1w5BBDgSEwzP5ZtaGCJeM8iwGrNBi5Om+KLerFSJYLnfA8TnXkf6+OVc1+L/C3Bx/r
	 h6ARAZJ3U+NZA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rCgIq-0007Fj-10;
	Mon, 11 Dec 2023 14:26:32 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	broonie@kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH stable-6.6 2/2] ASoC: qcom: sc8280xp: Limit speaker digital
 volumes
Date: Mon, 11 Dec 2023 14:26:08 +0100
Message-ID: <20231211132608.27861-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211132608.27861-1-johan+linaro@kernel.org>
References: <20231211132608.27861-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H4RAUD425KY6FYRYCK5SANRSAAVMEV3E
X-Message-ID-Hash: H4RAUD425KY6FYRYCK5SANRSAAVMEV3E
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4RAUD425KY6FYRYCK5SANRSAAVMEV3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

commit 716d4e5373e9d1ae993485ab2e3b893bf7104fb1 upstream.

Limit the speaker digital gains to 0dB so that the users will not damage them.
Currently there is a limit in UCM, but this does not stop the user form
changing the digital gains from command line. So limit this in driver
which makes the speakers more safer without active speaker protection in
place.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/r/20231204124736.132185-3-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
[ johan: backport to 6.6; rename snd_soc_rtd_to_cpu() ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 14d9fea33d16..c61cad0180c8 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -27,6 +27,23 @@ struct sc8280xp_snd_data {
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		/*
+		 * set limit of 0dB on Digital Volume for Speakers,
+		 * this can prevent damage of speakers to some extent without
+		 * active speaker protection
+		 */
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
+		break;
+	default:
+		break;
+	}
 
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
-- 
2.41.0

