Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621B1554FA8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068F31FB6;
	Wed, 22 Jun 2022 17:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068F31FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912598;
	bh=c0/1Nx2+SJOqTxjeNE/IgDqCaF5b6QxFOepQbDtHEBI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aB57+jA3yePkXiYVXovK72APBR+rzUjYZcf1TQZnCUst26L++ROX4j3plyO5nJ/CK
	 WhhhxL52myyex4ZUdP1HyoY0AMbKUhWRwbrjW3TBQFo2Ltw25I9wjxZQlVLOszygiC
	 2yNDmBPO6RG5xMRgtlQPnNlaLQHV6cA5mszcyvfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73492F8076F;
	Wed, 22 Jun 2022 17:24:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 522A4F80589; Tue, 21 Jun 2022 23:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BFDFF80538
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BFDFF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Ve1YiwYi"
Received: from localhost (unknown [188.24.177.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 277BB66016B6;
 Tue, 21 Jun 2022 22:38:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655847506;
 bh=c0/1Nx2+SJOqTxjeNE/IgDqCaF5b6QxFOepQbDtHEBI=;
 h=From:To:Cc:Subject:Date:From;
 b=Ve1YiwYiqWVd5Wun/9g53AmO4CIFM6hUAHcuaNSCEJjGmXn8o2uYT8K3gZuFXCoE5
 reNmP4IiKGX9LSZGB/WOM+pTL1Y4586GGczllQ2T8yMoxyGNa4dkE34N8ac/sEPHi5
 RXcAFd3q3ShQGBrzhXXmM0VXrCWv5t+pxt2fzUsD9Lezofw/OawLN5VVdHkSy7yEvt
 ZPcurHBcRnmKgZSI/Ue9pFgZ/hGLBnmTQFUcMBWpfzyWYycnmtAhtBTQws2CPwDLD0
 E1kqMQWmyV6+F8c0qm4ResWDS/u6yquaXaLf0hwhi66qnfSA9inWEpYHUY5LovRjHA
 GxuB+Pvph1tmg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: cs35l41: Add support for CLSA3541 ACPI device ID
Date: Wed, 22 Jun 2022 00:38:19 +0300
Message-Id: <20220621213819.262537-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:19 +0200
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
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

Add support for the CLSA3541 ACPI device ID used on Valve's Steam Deck.
The driver is fully compatible with the indicated hardware, hence no
additional changes are required.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/cs35l41-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index 9e19c946a66b..5c8bb24909eb 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -74,6 +74,7 @@ MODULE_DEVICE_TABLE(of, cs35l41_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cs35l41_acpi_match[] = {
 	{ "CSC3541", 0 }, /* Cirrus Logic PnP ID + part ID */
+	{ "CLSA3541", 0 }, /* Cirrus Logic PnP ID + part ID */
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
--
2.36.1
