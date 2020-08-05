Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B68A23C8E2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE4271661;
	Wed,  5 Aug 2020 11:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE4271661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596618876;
	bh=hdLyvFNapTsimZZ2kRgpelUmQCu9io7rdnonfNu8eKM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t4m7fqdID+ETu0DzirNTayGawr5tfI/JkYuFfeTIlZUd76ovzMRB8hwWRGf0VpOD1
	 vb8t3TwScpk/2u7ODC6eqHb6iykUsrD7jSspnjnGShjfY/0Sr6QdwB/k4lzCbGhex3
	 BM2rt+HE8TV08WFA/6s4mNcTgsr4yhXq5TbJNu7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A806CF80234;
	Wed,  5 Aug 2020 11:11:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5ADAF802C2; Wed,  5 Aug 2020 11:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE5E1F80234
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 11:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE5E1F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Cal4YxOw"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a77660000>; Wed, 05 Aug 2020 02:09:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 05 Aug 2020 02:11:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:11:37 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:11:37 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 5 Aug 2020 09:11:37 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a77c60001>; Wed, 05 Aug 2020 02:11:36 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH 1/3] ASoC: hda/tegra: Set buffer alignment to 128 bytes
Date: Wed, 5 Aug 2020 14:41:14 +0530
Message-ID: <20200805091116.2314-2-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805091116.2314-1-mkumard@nvidia.com>
References: <20200805091116.2314-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596618598; bh=xr6uX8YmavJUmyTOqAj79akwf/8Wmbfu9U6LVTS7h30=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=Cal4YxOwEbhS7LEPXB4zqIvTQzwc+1bRn4iRQZ/QIDnZ4jg3GsC0Xwb2FUlY9wLgD
 wYeO1icn8IPzSYDgDaiSTXCncyy8ldYGx/La02fRG8enZhTyAqFypgzA3p759KH20o
 4X8khA/jEWQAhuwv62+S+VP356jpQvFfHD7C71U50ULer+M16/M8lFBhMiLFbbE59M
 5rTf3y+OoKIJxNZ25A30bvwde9wHi2jNBIxdMifxzh5Ve2/Rph9J3kuyakqodrPwv6
 HG/hn2gq5utF5DAOL6CPGrCc0JUAxClL4KTfC4/0v5CSX0eYgxRsNvl1lER5ehHzRD
 tLNYfHiDmeoXQ==
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

