Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C04A7899
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:18:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2D6B1754;
	Wed,  2 Feb 2022 20:17:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2D6B1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829501;
	bh=W0Nt2TiwEI7O3HfdYrcD293uIwCLubB3AZACSbAHlbI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HgLeK19bsp2Hvsu1HuLrabXv8XlKwRsSZHkJfzq85D8YfrfIsDi4K+jHFyEnJkJzm
	 1N/0O32rFw3+I6ugPkYVMCXO/hvxKks9xuigBhNgZkLAnJyVcQMHKvaaoX3uewEwea
	 fgFkvctJACRJIEZYwCAXmaeDFVFLDJ4r6PZ8ILH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59393F804B1;
	Wed,  2 Feb 2022 20:17:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96913F804B0; Wed,  2 Feb 2022 20:17:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 259B1F80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259B1F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JRczMqyE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 269AF61948;
 Wed,  2 Feb 2022 19:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD00C004E1;
 Wed,  2 Feb 2022 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829425;
 bh=W0Nt2TiwEI7O3HfdYrcD293uIwCLubB3AZACSbAHlbI=;
 h=From:To:Cc:Subject:Date:From;
 b=JRczMqyEVKpksmKT+a6SRK7uzfO59aAv+r7tDezpam9Oci7ltleD25TSCclu7ucPb
 aIxev1OZDtKRxyu9aYLKcJgb4EKQo5ydZu3DZ9lqeDui40y5kJ7reIGmQSvrvIL1Xc
 65ogEHJjpfiNUMBOCPHEx0hvjpPqqWMlCdNqT+8zww7GqjW3vQcdleiq5JgutbUMm4
 XjbysQpZYEeoUcXlzdtsCNJZiowk5twWPlapOGRShik+V9qL49RpBPEfDRqSkj2OIX
 L5G12HgeqqQ6qylVZV8jmrDijzzpKpXVwBySOzY2stfe1pQdDuFLQuZyHDzsy6ox7v
 ujqHNv48nOpQQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs47l15: Ensure regmap_irq is built
Date: Wed,  2 Feb 2022 19:17:00 +0000
Message-Id: <20220202191700.3654382-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=628; h=from:subject;
 bh=W0Nt2TiwEI7O3HfdYrcD293uIwCLubB3AZACSbAHlbI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+thC3FYBzteRgi4nCEy5ZyH7DDTVJhGPAWNQtZ5d
 vCwh1rWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfrYQgAKCRAk1otyXVSH0KGqB/
 wIxAUnctqNIriTbiHkTJqC2CqSGrM7Eb3w4H/d+F2wQlyMaHX5I/Xw7z9gAhPyaxpSHk9k7bQgTVw5
 snfszK45CGaYi6+DzpzZKg69lgZpytX0CRGq6Q3enFFoobueyiZ64xvNq9NEcNlUqPdadelCcQlFkb
 XJprnqEX+d+3QYDXUKt9dfQ7SxlRMN0MtCfMa6km+xYeKcF5ohPIY9O+pum5eMwVWzq/5stzsHAoTg
 JH9O4BKPNZKCnc9ribGPs7eMLOFDy4yBuYl0Znfk7EIcNr42+8SMCu2+f042XfE22JT6zhdXJt5qfW
 2HizPPqei8xg9mKj8KyZfad0Ib3j8d
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

The cs47l15 driver uses regmap_irq but does not ensure that it is built,
causing build failures if nothing else being build requires the helpers.
Add the appropriate select.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2fd21004688c..69fd11b2b046 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -733,6 +733,7 @@ config SND_SOC_CS4349
 
 config SND_SOC_CS47L15
 	tristate
+	select REGMAP_IRQ
 
 config SND_SOC_CS47L24
 	tristate
-- 
2.30.2

