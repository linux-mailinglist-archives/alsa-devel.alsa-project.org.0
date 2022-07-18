Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC223578534
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 16:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE37B1700;
	Mon, 18 Jul 2022 16:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE37B1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658154028;
	bh=HyChJOPRuk/0qbeKqOLmxqV6Llt7Wlk7uu/scDDWoVM=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Date:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7UkoGXOuuRub8vt7FlSceN6oc36mPoqHQYizlJUBpWClJ8Tg9PuHXXX7dDvk2d0l
	 D2WFyrkdQ+YmA3LJcqj67AA9JEfGNiKqxXLKQXaQAnW086/WSrdiU3tl0+giDLlsF8
	 I5ysrQL3QosjyF3EyAVZxJNWmlYpzu3pEl7qYdT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57138F80430;
	Mon, 18 Jul 2022 16:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FD26F80508; Mon, 18 Jul 2022 16:19:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F01E3F80095
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 16:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F01E3F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="No8bpqTy"; 
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cxx3ggvv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAC6D60906
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 14:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DBFC341C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658153959;
 bh=HyChJOPRuk/0qbeKqOLmxqV6Llt7Wlk7uu/scDDWoVM=;
 h=Resent-From:Resent-Date:Resent-To:From:To:Cc:Date:Subject:From;
 b=No8bpqTybFNCvgNJ1k/GkOKs3qmSBd7J6o8g9WKmjVIVaUFhBLZr9rSA/hnCgBLNZ
 03HIgaBm5Fa/j9x9l5uV7uvkuLeA3BMs+2V56LHc+EcPoaOEAOYIumUobLvdhu18F6
 94TB5TaECugEu0v0ld1X7roKUykMmqaM1FG4zGplDhb01lMvVjgx5kiogZkdoUr/uz
 489FJombOMETAP31abmPq85NRiKK16dbIg3QzjnqQUjl2PJzD8VGMLg4cZIqUNEZu0
 nQwjPfQ76ZYD/yCj/BFc+gG13KYLmpzdkj0DyHQgo2BQO9zsISseV5Q5ZTPZ+zMUxs
 e21NzQb6AKWHg==
Resent-From: Mark Brown <broonie@kernel.org>
Resent-Date: Mon, 18 Jul 2022 15:19:15 +0100
Resent-Message-ID: <YtVr45gYUoHv1pqv@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Mon, 18 Jul 2022 15:10:05 +0100
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by cassiel.sirena.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@kernel.org>) id 1oDRRj-005H9N-Ff
 for broonie@sirena.co.uk; Mon, 18 Jul 2022 15:10:05 +0100
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FBA6B81612
 for <broonie@sirena.co.uk>; Mon, 18 Jul 2022 14:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
 id D9987C341CB; Mon, 18 Jul 2022 14:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826D8C341C0;
 Mon, 18 Jul 2022 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658153401;
 bh=HyChJOPRuk/0qbeKqOLmxqV6Llt7Wlk7uu/scDDWoVM=;
 h=From:To:Cc:Subject:Date:From;
 b=Cxx3ggvvPUygzkDCQEO0HSWBSh+q8YcbLwD/VDb0J2ApXBQCIeyQiLV38TLKgPSwI
 oukDF6U+MCK9FmUhEsStqPoQQ+s+9RYZM5B23V++fghjJw9qR3zSn2zd1nxLWO7i5V
 uWj6a8SNxQHF52LW+G8xiU544VZ0xbVtAFalzMK9RG1gvF6ua+j/Dn1iGsnhipJRNN
 6czSekaUIRhofNSl4l3aE+wcLKXp84qUQFKnzEPjY5DkFbjFiGY2D06Le7PNQ8OOxF
 5EXQCLHRjjtg7hwejZja61mbAjE8PGwTghXFTGV+W2IIYR2J4ZPrA6BQRk8V58llUY
 ZmIQ1b8oxnBag==
From: Mark Brown <broonie@kernel.org>
To: Zheyu Ma <zheyuma97@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 18 Jul 2022 15:04:05 +0100
Message-Id: <20220718140405.57233-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; h=from:subject;
 bh=HyChJOPRuk/0qbeKqOLmxqV6Llt7Wlk7uu/scDDWoVM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBi1WedfrbfTXLWVa7/hNwrZIBjz6/GEhen9j1acW/B
 mX0U1LuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYtVnnQAKCRAk1otyXVSH0KM6B/
 9vtEg4FHNo+m3IDZM33UeDko58WHk4lEY4daRRZ01j5/vCkuzDoePPp20N9ffB++NEPDj0FNYgn+//
 t+GORpD6SSVUAVZOooSI07vzjammxMOXvY1KSCgM000jZY+fhlTTxta3ssuBMZjJDR7oip3d+oKbBz
 gYVvLKpEBmuq6awtcBpqcCYQzwYzL1Kin+jU83A24ZEAvVykJcWxY1lHuu3AFqLxiZEikzlwyLDVeL
 otsEdrX5J1kVYwITw0byFQeC65G1MtArPPGbPLqWIDolMaJ72WNHK1S77hwcmQPPP/wVes6ean4NbC
 nOtkV2HZa2VhJJggwFwmO2NHcCbXDQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2604:1380:4601:e00::1
X-SA-Exim-Mail-From: broonie@kernel.org
Subject: [PATCH] ASoC: nau8821: Don't unconditionally free interrupt
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: MK3gvon7Q+C1
Cc: wtli@nuvoton.com, Mark Brown <broonie@kernel.org>,
 alsa-deve@alsa-project.org
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

The remove() operation unconditionally frees the interrupt for the device
but we may not actually have an interrupt so there might be nothing to
free. Since the interrupt is requested after all other resources we don't
need the explicit free anyway, unwinding is guaranteed to be safe, so just
delete the remove() function and let devm take care of things.

Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/nau8821.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2600be250a3c..3ce23c20eca9 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1699,15 +1699,6 @@ static int nau8821_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static int nau8821_i2c_remove(struct i2c_client *i2c_client)
-{
-	struct nau8821 *nau8821 = i2c_get_clientdata(i2c_client);
-
-	devm_free_irq(nau8821->dev, nau8821->irq, nau8821);
-
-	return 0;
-}
-
 static const struct i2c_device_id nau8821_i2c_ids[] = {
 	{ "nau8821", 0 },
 	{ }
@@ -1737,7 +1728,6 @@ static struct i2c_driver nau8821_driver = {
 		.acpi_match_table = ACPI_PTR(nau8821_acpi_match),
 	},
 	.probe_new = nau8821_i2c_probe,
-	.remove = nau8821_i2c_remove,
 	.id_table = nau8821_i2c_ids,
 };
 module_i2c_driver(nau8821_driver);
-- 
2.30.2

