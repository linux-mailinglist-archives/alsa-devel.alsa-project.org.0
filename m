Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B41C343B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 10:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545B616ED;
	Mon,  4 May 2020 10:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545B616ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588580408;
	bh=7pHITZbuEhABA48aF0BIsNHTpYR5ormee9UikjDDpdk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJVsZs+MdNSm60OkpIm/LHGvkddtR686BGc+B48TFdeawNi16CPbBLSXlbL9kQ6ls
	 Pf1t5C9zEYE+pj4EvMuzna+d7AzXOfRn76czhWb3QsEeoqpbd6Ga9+odFgEqGm3oa1
	 86OFTHqTB0o6n1vdbxHUurZ2zcCole1q/8ovpabU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E1A6F8029A;
	Mon,  4 May 2020 10:17:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4842F80299; Mon,  4 May 2020 10:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13F6F8027B
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 10:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13F6F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="iE1BOjs4"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eafcf060000>; Mon, 04 May 2020 01:15:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 01:17:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 May 2020 01:17:10 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 08:17:09 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 4 May 2020 08:17:09 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eafcf820000>; Mon, 04 May 2020 01:17:09 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH 3/3] ALSA: hda/tegra: workaround playback failure on Tegra194
Date: Mon, 4 May 2020 13:46:16 +0530
Message-ID: <1588580176-2801-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
References: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588580103; bh=WNT88ANDIHC0JWxzH3jGujojpL78mvTrgwyTiOJDzHA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=iE1BOjs4MsfbgnJJXVqSCvBcCWZ7kRUSBO9KUsZugi6pdT1Cnv2kJcQcN+2pwFuki
 VicfiYFOER0/UcBXqbQqHFI3CYdlbFG/7jIEkZMj75zUjZzgkmLwKUcB1KKBtUKcWG
 8h1omVv+9qRoe2LFbOanfUu20/NCn7dNePSByZUAS88NY+wNG7XaGpNxIlE8ywMxVs
 0CwSXJXIg4brwAztFjZGTHJl7pIotCb0sEy5pQ0vXDUCzSJmxa7bvEXOIH8iw3PIYR
 v9VxUQAFYpBq73NYQzSb523Xb1M6vc3MC/cdjxhLEzJns6jsLg0vTTJIJrrupE7UQb
 co604IpzEzDjw==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

Tegra194 has 4 SDO lines and with this configuration playback fails
for 44.1K/48K, 2-channel and 16-bps. It results in below print,
  "aplay: pcm_write:2011: write error: Input/output error"

Below relation is used to derive stripe control and is referenced
from HD Audio Specification: Revision 1.0a.
  { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }

Due to a legacy HW design problem, playback issue is hit while using
a stripe value resulting from above formula when ratio is '8'. Thus
it is recommended that the ratio must be greater than '8'. Since the
number of SDO lines is in powers of 2, next available ratio '16' is
used as a limiting factor on Tegra194 to workaround the problem.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 45dc544..0cc5fad 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -364,6 +364,23 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	/* initialize chip */
 	azx_init_chip(chip, 1);
 
+	/*
+	 * Playback (for 44.1K/48K, 2-channel, 16-bps) fails with
+	 * 4 SDO lines due to legacy design limitation. Following
+	 * is, from HD Audio Specification (Revision 1.0a), used to
+	 * control striping of the stream across multiple SDO lines
+	 * for sample rates <= 48K.
+	 *
+	 * { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }
+	 *
+	 * Due to legacy design issue it is recommended that above
+	 * ratio must be greater than 8. Since number of SDO lines is
+	 * in powers of 2, next available ratio is 16 which can be
+	 * used as a limiting factor here.
+	 */
+	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
+		chip->bus.core.sdo_limit = 16;
+
 	/* codec detection */
 	if (!bus->codec_mask) {
 		dev_err(card->dev, "no codecs found!\n");
-- 
2.7.4

