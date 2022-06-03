Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE953CA25
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 14:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6383917F8;
	Fri,  3 Jun 2022 14:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6383917F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654260437;
	bh=Krn2sjbI5bqklseNWeZASz0U7FU9p9GtWANdmbOD6rY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GL4U0UujQjscMzAQzVfu9Pk5g2JYvVTo/PVXBjS5yF/5CnP4T9bZa12P+RSjuZOeq
	 kwjEozCTaihzDeyfEOOlibcIwTUTEj03SiuEo051Cvxk6TKoJ7WnlT5YUOHytSLiKY
	 pyFZ7ncb2tqJVwDs+1po+Ku7zie6K1qY0VbSKy9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0ED0F804D1;
	Fri,  3 Jun 2022 14:46:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1DBFF804CC; Fri,  3 Jun 2022 14:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A456CF80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 14:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A456CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VH1IU2Wz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 078F2B81EDA;
 Fri,  3 Jun 2022 12:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF69C385B8;
 Fri,  3 Jun 2022 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654260373;
 bh=Krn2sjbI5bqklseNWeZASz0U7FU9p9GtWANdmbOD6rY=;
 h=From:To:Cc:Subject:Date:From;
 b=VH1IU2WznUNIKa/WjGGPnPH6q77SKt8yAokI97OLi3fea2/zqpSfzn7qAPLx2kcxv
 bYXMXIm8EYRg+UfwFjYysSVPlHELR+kQZ7LuVt0I6bB9mjH4L1sdFtWikZ0seNukrN
 qA95C/FosNBOJRpFfCNcZsGyeKEP6TGIMDLcjIjyTgN0LIIGYlMf76dTur8SmAvCNJ
 BcwggRpHKzmuUlQriJX3Hv6qQsa5LlHLWx8TZqK+2nY0d2Lt/PxhqQ9WhmNiQUhP2C
 bjIRBbAsQ+7EFMP0kOIlX+KX5hX3rb/5AbbcJeX7RTjjDq1Y1FVgh2RiWsR2mxxfFC
 CaruvQOSKIzzw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: wcd9335: Fix spurious event generation
Date: Fri,  3 Jun 2022 14:46:09 +0200
Message-Id: <20220603124609.4024666-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=839; h=from:subject;
 bh=Krn2sjbI5bqklseNWeZASz0U7FU9p9GtWANdmbOD6rY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimgJcPO5GuLnGxRWxZmdw8OAHY2SHk5t8QNtVLZUS
 nZbyBgyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpoCXAAKCRAk1otyXVSH0KkHB/
 9bSvgzBWwagrybZXAOVYvgaKN3ZgKAy5zv6spFAWMkYHjA4rndN+ul685UCB8oBcOXOwkdYE3IwrX4
 OKf7iflXuf/G9LuRty40kV7Bt1RRsPoP3pj9zH22rFYSUCouobxH+f3nsMb9rkycrdDL3U6E8/4Mqe
 QbTwMMf5meMR7cu1L9BqEv/V0KfKjxoMKM//6wKTgBMfNAD9+p6rfkZK+5WLeiX/Ff/feAbJVPj/I7
 xdqz85+lQJW2h2MX/uCmhJF4yTU9cK+EJlrWQ3A9f1pvQuo+OpJB8s8e03nyaXFzIT+z+mqzUw8SK/
 JfOC3srlscwfKyLn9CV2a5JJE88Mmf
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

The slimbus mux put operation unconditionally reports a change in value
which means that spurious events are generated. Fix this by exiting early
in that case.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 617a36a89dfe..d25594a708e0 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1287,6 +1287,9 @@ static int slim_rx_mux_put(struct snd_kcontrol *kc,
 	struct snd_soc_dapm_update *update = NULL;
 	u32 port_id = w->shift;
 
+	if (wcd->rx_port_value[port_id] == ucontrol->value.enumerated.item[0])
+		return 0;
+
 	wcd->rx_port_value[port_id] = ucontrol->value.enumerated.item[0];
 
 	switch (wcd->rx_port_value[port_id]) {
-- 
2.30.2

