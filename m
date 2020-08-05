Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD223C997
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C6E1666;
	Wed,  5 Aug 2020 11:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C6E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596621281;
	bh=hdLyvFNapTsimZZ2kRgpelUmQCu9io7rdnonfNu8eKM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cIynvgeo+fKgz6WIpEJlwH6VwsPaO5F7nEZ5THRw6ttPap/yEeTxMQSQv+ztVVRGB
	 dP8P9OgesW4GavTPxRd53O4ao9T27rZ6vn8pxpUDmAoMq3V58cOYgeE0sWz5oOTi2Q
	 8u3KvgGzlssUmINznsCjIiB7pq5AQIFdps9omrws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD7CDF800B7;
	Wed,  5 Aug 2020 11:52:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE2F8F801F7; Wed,  5 Aug 2020 11:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEA7BF800B7
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 11:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEA7BF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="csCHbZ8G"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a81620000>; Wed, 05 Aug 2020 02:52:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 05 Aug 2020 02:52:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:52:47 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:52:47 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 09:52:47 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a816d0002>; Wed, 05 Aug 2020 02:52:47 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH v2 1/3] ASoC: hda/tegra: Set buffer alignment to 128 bytes
Date: Wed, 5 Aug 2020 15:22:19 +0530
Message-ID: <20200805095221.5476-2-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805095221.5476-1-mkumard@nvidia.com>
References: <20200805095221.5476-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596621154; bh=xr6uX8YmavJUmyTOqAj79akwf/8Wmbfu9U6LVTS7h30=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=csCHbZ8GcUPsUmU0/JI96BctaukWgpSlHHuJu3ZI60pZheaWCgHIVVCOL7Cv+Qu3s
 QjHzSoNl0IkYCmKuU4btbRX3YHxsxh8jt/Q9zdyFO9MH7xmNWk4OWZp5eVZpNyC3fY
 6gA06yXiT720b1Fq/+JuVa+WUkQjO9EEdmkmxCcN8IzJQAH1sd4iwgUo7M6f0MTSeu
 GePLTFdNM3UEjVGhxpqKt8kWzaAHIT1dh17GPK3d9gRG18+zgcDbJXmdbbm2NVg0Fw
 AV0YpYbYewFqSYPkTzCNSGcUgOLWbF0uAgYycDjz9w8r37kcCCWpaoxD2GjLUqW/EL
 n5If7atWjmFQw==
Cc: alsa-devel@alsa-project.org, spujar@nvidia.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, treding@nvidia.com,
 Mohan Kumar <mkumard@nvidia.com>
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

Set  chip->align_buffer_size to 1 for Tegra platforms to make the buffer
alignment to be multiple of 128 bytes. This fix is applied as gstreamer
alsasink gets stuck with the default buffer-time and latency-time
parameters with 4 byte buffer alignment.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 5637f0129932..ecf98eb9df36 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -333,6 +333,8 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	gcap = azx_readw(chip, GCAP);
 	dev_dbg(card->dev, "chipset global capabilities = 0x%x\n", gcap);
 
+	chip->align_buffer_size = 1;
+
 	/* read number of streams from GCAP register instead of using
 	 * hardcoded value
 	 */
-- 
2.17.1

