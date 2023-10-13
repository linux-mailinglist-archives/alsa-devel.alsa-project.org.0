Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 641057C9030
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2BD1828;
	Sat, 14 Oct 2023 00:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2BD1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235721;
	bh=cYxL2O/75ZQ/Qssv/SmxSII6i6fEkRf+6aE5Dq5YLkk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lpSoe35NC5Xi6A6ckA2UXfb5jLanxEHGZ+YKnk9vKEdLXcB2+6J7OSIqgEJEltWe5
	 cRBbnCOaINL/i1AxGhtcj2IDzis5hhmYfX28kgzd+wHTGGaZvVGynL4xPoYLY7UhgG
	 FdkFkJQhUhgjKg5hJRNeSPtEtrxo2PziTGEnoBQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F21AF80310; Sat, 14 Oct 2023 00:21:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2268F802BE;
	Sat, 14 Oct 2023 00:21:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A98FF80557; Sat, 14 Oct 2023 00:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4262F80130
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4262F80130
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVy-0003u1-Se; Sat, 14 Oct 2023 00:20:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVu-001UQy-HS; Sat, 14 Oct 2023 00:20:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVu-00FrGg-6a; Sat, 14 Oct 2023 00:20:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wang Yufen <wangyufen@huawei.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Astrid Rost <astrid.rost@axis.com>,
	Robert Hancock <robert.hancock@calian.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Sameer Pujar <spujar@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 0/7] ASoc: Another series to convert to struct
 platform_driver:remove_new()
Date: Sat, 14 Oct 2023 00:19:46 +0200
Message-ID: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=cYxL2O/75ZQ/Qssv/SmxSII6i6fEkRf+6aE5Dq5YLkk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKBsGGsO1NpDsWYb6jhOZ5bd55SP6d25vKGy
 7YmQnTVdj6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnCgQAKCRCPgPtYfRL+
 Tor2B/9HSydQELpgS1t6snPAaAhDEQtcvtaeVBtpjFaal3r22ICSQDGErHMALZMsZM0DK4SvBus
 xitQy7lPnrHt1F3EHuZqLuqRxDxirQNRbDyFCC7VHAoP+siDOseZ8orQNkqO8dLG5lh4aEywNEZ
 D+klzbNqXCfw/4sFshIT4zJnpUocZNmxeEASSq3aEErlNufS0lk1AdIS351Ksm9BV8tZHM0Gpg7
 vvVXsCgzYxg4KII4s+FYF12ZF3E+OOhxcAMYwSftV5cGdzyPJTPf/P3lyCOXxi7vVDHM34gLSFH
 b1mmX7ZIBzFL7VeooM4IfAlsY2wNy4BB6nHQ6CiSpTuf1el/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: HHTRCZVRM4LARSRDPWGQPZJFRM4K3BZH
X-Message-ID-Hash: HHTRCZVRM4LARSRDPWGQPZJFRM4K3BZH
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHTRCZVRM4LARSRDPWGQPZJFRM4K3BZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

this is another series to convert ASoC drivers to use struct
platform_driver:remove_new(). The rockchip one was already send before
but with a wrong subject prefix, the cs42l43 driver is newer than the
last series. The remaining five patches are for driver combos that my
coccinelle patch failed to detect before.

Best regards
Uwe

Uwe Kleine-König (7):
  ASoC: rockchip: i2s_tdm: Convert to platform remove callback returning
    void
  ASoC: cs42l43: Convert to platform remove callback returning void
  ASoC: starfive/jh7110-pwmdac: Convert to platform remove callback
    returning void
  ASoC: simple-card-utils: Make simple_util_remove() return void
  ASoC: meson: Make meson_card_remove() return void
  ASoC: qcom: lpass: Make asoc_qcom_lpass_cpu_platform_remove() return
    void
  ASoC: uniphier: Make uniphier_aio_remove() return void

 include/sound/simple_card_utils.h                   | 2 +-
 sound/soc/codecs/cs42l43.c                          | 6 ++----
 sound/soc/generic/audio-graph-card.c                | 2 +-
 sound/soc/generic/audio-graph-card2-custom-sample.c | 2 +-
 sound/soc/generic/audio-graph-card2.c               | 2 +-
 sound/soc/generic/simple-card-utils.c               | 4 +---
 sound/soc/generic/simple-card.c                     | 2 +-
 sound/soc/meson/axg-card.c                          | 2 +-
 sound/soc/meson/gx-card.c                           | 2 +-
 sound/soc/meson/meson-card-utils.c                  | 4 +---
 sound/soc/meson/meson-card.h                        | 2 +-
 sound/soc/qcom/lpass-apq8016.c                      | 2 +-
 sound/soc/qcom/lpass-cpu.c                          | 5 +----
 sound/soc/qcom/lpass-ipq806x.c                      | 2 +-
 sound/soc/qcom/lpass-sc7180.c                       | 2 +-
 sound/soc/qcom/lpass-sc7280.c                       | 2 +-
 sound/soc/qcom/lpass.h                              | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c               | 6 ++----
 sound/soc/starfive/jh7110_pwmdac.c                  | 5 ++---
 sound/soc/tegra/tegra_audio_graph_card.c            | 2 +-
 sound/soc/uniphier/aio-cpu.c                        | 4 +---
 sound/soc/uniphier/aio-ld11.c                       | 2 +-
 sound/soc/uniphier/aio-pxs2.c                       | 2 +-
 sound/soc/uniphier/aio.h                            | 2 +-
 24 files changed, 27 insertions(+), 41 deletions(-)


base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
-- 
2.42.0

