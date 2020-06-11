Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C91F6D37
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 20:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D000F1683;
	Thu, 11 Jun 2020 20:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D000F1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591899050;
	bh=+NcKMlwbAgAG7wuNdyrwogMDWL2KMjMAjfkRWXaC994=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JWx80fmhrhKm8ZarTX/Q+iez/KrhrJ8prsRoTi2xmPC7RWnqg33IMmvYy+BN72LLc
	 SkDXl6NuulDMfRgMLQCXxJpxD/6sNs5VCtUTkw7GlxvhZ0LlxXjYUj0Cbi8oocG/tM
	 MTK/nqWfaXd+tvK2DQMJXHtHjnVG1xPKkeCb4ewI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E16ACF80278;
	Thu, 11 Jun 2020 20:09:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF0AF8028C; Thu, 11 Jun 2020 20:09:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD32F800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 20:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD32F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qo9rJTEz"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ee272db0000>; Thu, 11 Jun 2020 11:07:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 11 Jun 2020 11:08:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 11 Jun 2020 11:08:56 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Jun
 2020 18:08:56 +0000
Received: from krypton.plattnerplace.us.com (10.124.1.5) by
 HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server id
 15.0.1473.3 via Frontend Transport; Thu, 11 Jun 2020 18:08:56 +0000
From: Aaron Plattner <aplattner@nvidia.com>
To: Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>, "Jaroslav
 Kysela" <perex@perex.cz>
Subject: [PATCH v2] ALSA: hda: Add NVIDIA codec IDs 9a & 9d through a0 to
 patch table
Date: Thu, 11 Jun 2020 11:08:45 -0700
Message-ID: <20200611180845.39942-1-aplattner@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <s5hftb1eqgv.wl-tiwai@suse.de>
References: <s5hftb1eqgv.wl-tiwai@suse.de>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591898843; bh=rm+GjnPU8lOpFbupdg69GElGbE3u5xiSIV8BSqvs+GI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=qo9rJTEz3DVg2f8fWh+nGcpFveWbP/jse78tRkKCkntNCxlo5tgU7UoNeDPQBAC8R
 eHXXrZcFd+721D8AVW+XS0XMZOOC9/lGwC6tL9/BfNVROTu/Gba/tghJV2H1E3vrfX
 ntRvieMq0ButdQIZouEBXdGDBCPm8n2afooHJZ9yjZQtdqChb4dDIrm2d8dl9/1Q//
 NK7F434ZmuU31zPcuZ6CxNxBo4tZth5GFi3+OnhyY646UtqP9XoS5FDh9w9TEz94iQ
 7SufgR+qoiqgAPJzOrI6zEiKF/qoqz81/myx2Ym2PEMzMJ0o9itz+5U94B6ToZS9/f
 qKnEvdbjoLiLA==
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

These IDs are for upcoming NVIDIA chips with audio functions that are large=
ly
similar to the existing ones.

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

