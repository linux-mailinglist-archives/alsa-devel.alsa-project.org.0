Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC6102AFF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 18:51:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9071696;
	Tue, 19 Nov 2019 18:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9071696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574185911;
	bh=IpV3ybyl3cFfMs3u0kAEZtnMpjBzQKhAVnYjNxfiFRs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AnV5D3rqWodNOW4JRqck1XCU/H21PoCODG3dKxck83LLA2gBnhWJsZK5nJg4Ma3R1
	 t6RTgzOxuGORDEVlWpr1c74gpYiW9DdQ3KFwJz0PMuiIGqB7v3+WSbAUtTh9B8MaG/
	 FAqup2XJ9Hp1Jg6Is0yPAU8XUomPOa9n87DwksX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 372D9F80139;
	Tue, 19 Nov 2019 18:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B63AF80138; Tue, 19 Nov 2019 18:50:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BBA9F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 18:50:01 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3C55DA0040;
 Tue, 19 Nov 2019 18:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3C55DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574185801; bh=wpIPs1NoqWyZIwRX8JDgsEEaZW1XUu23zxZ0lGiCCDM=;
 h=From:To:Cc:Subject:Date:From;
 b=A/TCTgk6gjVnbdpzHJzYtqnUiA6Jz9r1wbt+qEpZaPXNMLVQLtivhl6oVkmBr+qxQ
 p1Q76cpaXM2J0Vh7ZhiRI7Z0gbQoYEgGH/Yv5s7AOm2YV9xUaK3VkXdhzRVKcVq4yU
 yeQp8LFIFMDZ5UI1/ljx8DJtncQRGAEtbvh4V/i8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 Nov 2019 18:49:57 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Tue, 19 Nov 2019 18:49:32 +0100
Message-Id: <20191119174933.25526-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH 1/2] ASoC: add control components management
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This ASCII string can carry additional information about
soundcard components or configuration. Add the possibility
to set this string via the ASoC card.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e0855dc08d30..bd943b5d7d45 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -982,6 +982,7 @@ struct snd_soc_card {
 	const char *name;
 	const char *long_name;
 	const char *driver_name;
+	const char *components;
 	char dmi_longname[80];
 	char topology_shortname[32];
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 55014e7ae0d8..b4683d4588ee 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2121,6 +2121,19 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	soc_setup_card_name(card->snd_card->driver,
 			    card->driver_name, card->name, 1);
 
+	if (card->components) {
+		/* the current implementation of snd_component_add() accepts */
+		/* multiple components in the string separated by space, */
+		/* but the string collision (identical string) check might */
+		/* not work correctly */
+		ret = snd_component_add(card->snd_card, card->components);
+		if (ret < 0) {
+			dev_err(card->dev, "ASoC: %s snd_component_add() failed: %d\n",
+				card->name, ret);
+			goto probe_end;
+		}
+	}
+
 	if (card->late_probe) {
 		ret = card->late_probe(card);
 		if (ret < 0) {
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
