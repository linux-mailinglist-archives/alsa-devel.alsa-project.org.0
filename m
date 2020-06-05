Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA31EFEAE
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 19:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49FE71666;
	Fri,  5 Jun 2020 19:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49FE71666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591377648;
	bh=KL6NZchdhHCsC6aeKtwE9tXwR48hj45OeNo+R++QU1Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ko4Lou+IYsw9UJt5un3ypXEZTVN5jhrFc26fO/7b3rv9Ay3NGtGBk5Z4Bb+8gKidN
	 FTfsFuEzT3s1sIXRYnVhoFu6q2mzizgl3VS6OdURpJsMR9vHyxXdXPf0zkSs7AT9+E
	 aB1T3zpR3CWIrvV3dREiOJSWTQmIFK0AsyQpu97w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7117EF801ED;
	Fri,  5 Jun 2020 19:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 190C6F801ED; Fri,  5 Jun 2020 19:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6BB7F80132
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 19:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6BB7F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Q/hodN43"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eda7e730000>; Fri, 05 Jun 2020 10:18:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 05 Jun 2020 10:18:54 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 05 Jun 2020 10:18:54 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jun
 2020 17:18:54 +0000
Received: from krypton.plattnerplace.us.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server id
 15.0.1473.3 via Frontend Transport; Fri, 5 Jun 2020 17:18:54 +0000
From: Aaron Plattner <aplattner@nvidia.com>
To: Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>, "Jaroslav
 Kysela" <perex@perex.cz>
Subject: [PATCH] ALSA: hda: Add NVIDIA codec IDs 9a & 9d through a0 to patch
 table
Date: Fri, 5 Jun 2020 10:17:07 -0700
Message-ID: <20200605171707.8587-1-aplattner@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591377523; bh=4vKiQC0k5/Y1e+l/fdi2Rbr4+Z932FCpGYPw+w3DM5A=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=Q/hodN43vB/JJ3Z1HVP78W2LrW5ptEfI+AadaKDc98LaW/DiCjP/X48fLbvxNQf6E
 lOnUqFXJMV0BlEToT4paVoVM8Zg6Y5HvBw1e14Ij1qW59tpzaed6KTbqCBIpCjunnn
 5uBt5oYjSpphbY4BuomJA8jA6G5EZaPse5Oz0B14z8o/VM4dZdW7lz1FnHgXkNsgtV
 nzfZJYjcpuIw+39Z/8HQt//wqMvbVlhGONGc4a8BocC1/zTXnjHDZIvO8KzLwntH4v
 mmBBkwq+T3GUsMyNq+95h9hTfKyp48+2e4UOtmoGcv7ZSohl1aRHP4/RiMFMqyz8XG
 9axOYzYUtpHtA==
Cc: Nikhil Mahale <nmahale@nvidia.com>, linux-kernel@vger.kernel.org, Aaron
 Plattner <aplattner@nvidia.com>
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

Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index fbd7cc6026d8..e2b21ef5d7d1 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4145,6 +4145,11 @@ HDA_CODEC_ENTRY(0x10de0095, "GPU 95 HDMI/DP",	patch_=
nvhdmi),
 HDA_CODEC_ENTRY(0x10de0097, "GPU 97 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0098, "GPU 98 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0099, "GPU 99 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de009a, "GPU 9a HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de009d, "GPU 9d HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de009e, "GPU 9e HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de009f, "GPU 9f HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a0, "GPU a0 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de8001, "MCP73 HDMI",	patch_nvhdmi_2ch),
 HDA_CODEC_ENTRY(0x10de8067, "MCP67/68 HDMI",	patch_nvhdmi_2ch),
 HDA_CODEC_ENTRY(0x11069f80, "VX900 HDMI/DP",	patch_via_hdmi),
--=20
2.27.0

