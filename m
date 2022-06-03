Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B95BE53C9F6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 14:26:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59E5C17C5;
	Fri,  3 Jun 2022 14:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59E5C17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654259202;
	bh=gvHuvvo9Ta9I1MHF7590K0/ssdDv+Ulvg1umCJWPevA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AYHRJMEEHL6nCC7ms7M/fmKjfcBI7GyBzsTFH9/7WOY2ANy3MXnzxFU9QYBsU7Fjc
	 F6EXGw6c7w6kcCC7Jpr9h03nkQmoV1JxmJkknU8x0nf6Nkdn6+OlZMYHWIDB/LmPJI
	 DX50izOUrTkqtx24CajbcFhg8XXclNwpyofE96uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CECAAF804D1;
	Fri,  3 Jun 2022 14:25:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04258F804CC; Fri,  3 Jun 2022 14:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8264F80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 14:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8264F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a8xcpalZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0877AB8229C;
 Fri,  3 Jun 2022 12:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1A5C385A9;
 Fri,  3 Jun 2022 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654259132;
 bh=gvHuvvo9Ta9I1MHF7590K0/ssdDv+Ulvg1umCJWPevA=;
 h=From:To:Cc:Subject:Date:From;
 b=a8xcpalZvCFDrvtsSfXeFhh3OTlxZMcP6wsPV706hOSSjpYM/8iAtJ1DpGR9qTdIP
 qAQrTCCslISXQBQynimmarXncrwxGtUfiYX1uLQtM0NG8Y9h3rjGnzc1GEss8GmQ6s
 4mQhcvhO1LJbPcPyOBYDVsCVXcL9vzJp6HgyfO4ClSSZRYW5Y7gsZz3L3/3Vo6Ji2f
 /5TTJhTTuxo+ZYVjandkP5x58RvRZBGu6m4iKW7bJ3p62jF45vdUGrgXKGhqf0w9rt
 A6ldh5+JsntCTev/H5KR+sbuHTLAR4NyXDlRmFquRAYD+Umh5YM2NzJV9XpTGNs1Zc
 6bLJA9PufjlLw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: wcd938x: Fix event generation for some controls
Date: Fri,  3 Jun 2022 14:25:26 +0200
Message-Id: <20220603122526.3914942-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; h=from:subject;
 bh=gvHuvvo9Ta9I1MHF7590K0/ssdDv+Ulvg1umCJWPevA=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqSZf2P3h4YYicVYRB+QcPnIfeHSdQnZH/9TlK1ZCqQywx/G
 yAd2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQAT0ZjH/j/I7LEGwwvmGfZ7WY1WX0
 yb1Vap3HDZmEnJ8ZOgl9H0SC/17AQGubOWxw3zLM18iuxnlKleW/vddrPHTb2IQIX7iU5rzzXFfNt4
 Vvucw5QQXfbPm0yUlYq4nCS92rKeZlvs3G0j5rLtI0/syYS4w/82//8VnVQtLKASImt7Wp3tZp1Nxe
 lgO6kMp6vsmilO12VaK3zkO2Z2y/oENi8S7q+X7m/v/vTkQ/Xi3X5bs86W/1adfbM9beqDVc9cOqZt
 X1d9TYbz7AXNa9tkK+2MNupsWneO8ZL9kchp0a9Tjy3gDYj5u1rXb43ojap6y3f/QzPO53QJJC9dmX
 CB6eSCtCsTvoqGs/SUtG2rtXgFAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

Currently wcd938x_*_put() unconditionally report that the value of the
control changed, resulting in spurious events being generated. Return 0 in
that case instead as we should. There is still an issue in the compander
control which is a bit more complex.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c1b61b997f69..d956c58298c3 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2519,6 +2519,9 @@ static int wcd938x_tx_mode_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
+	if (wcd938x->tx_mode[path] == ucontrol->value.enumerated.item[0])
+		return 0;
+
 	wcd938x->tx_mode[path] = ucontrol->value.enumerated.item[0];
 
 	return 1;
@@ -2540,6 +2543,10 @@ static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
+	int change;
+
+	if (wcd938x->hph_mode == ucontrol->value.enumerated.item[0])
+		return 0;
 
 	wcd938x->hph_mode = ucontrol->value.enumerated.item[0];
 
@@ -2632,6 +2639,9 @@ static int wcd938x_ldoh_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
+	if (wcd938x->ldoh == ucontrol->value.integer.value[0])
+		return 0;
+
 	wcd938x->ldoh = ucontrol->value.integer.value[0];
 
 	return 1;
@@ -2654,6 +2664,9 @@ static int wcd938x_bcs_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
+	if (wcd938x->bcs_dis == ucontrol->value.integer.value[0])
+		return 0;
+
 	wcd938x->bcs_dis = ucontrol->value.integer.value[0];
 
 	return 1;
-- 
2.30.2

