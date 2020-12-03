Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C47F2CD950
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 15:38:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E92181B;
	Thu,  3 Dec 2020 15:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E92181B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607006331;
	bh=N+dt8QdfkMUoGL2UwI1HMybuVQwwPME441F8ap8dpCg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QgTdP2YhLus5sFpV37Q9BrYDnDsSq7/hPPn3wi4r0XqToumXlGGb416C6HUVMuw1c
	 BVOpm2qGuatZofML04YjE1YaPGPxhY3TyJK/k2OjpRu+O/cSai5G+NhpWKjg3pG8QN
	 Cs1+/2EyRHiKb3sefs+NtcvvS/JxcY4DqFqA4gYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 127AFF8025F;
	Thu,  3 Dec 2020 15:37:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A802F80254; Thu,  3 Dec 2020 15:37:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AB4EF8012A
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 15:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AB4EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Lbr6OUW0"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fc8f80f0000>; Thu, 03 Dec 2020 06:37:03 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 14:37:03 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 14:37:00 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <broonie@kernel.org>
Subject: [RESEND PATCH 0/2] Convert Tegra HDA doc to json-schema
Date: Thu, 3 Dec 2020 20:06:40 +0530
Message-ID: <1607006202-4078-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607006223; bh=oBVH1GkkdSd+6h69hwkZ2XZAHlPV4pT2Qs/l/nDYx3U=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=Lbr6OUW0wGesY0teHTXCdQB4XLfzLF45rs1G+FsTO3K4/WHVIoDcITzJJNPAnwMf/
 K9RtU+Y4j5kKW2eKChMWYnRQG2Awgav8ftJWOIuLnObj/9rUGjNM21k8gfhATvG2O3
 3Wbd7Vo0E+3qg+2hud5n421+vK18ju1SayNIN20j3wdW7ebqDuKZ7R/SyAtC52ooK2
 ARiKTR+49EQsu/vQJ0c5IpCo/P0ZlGdlO/JmVJq/zhen5IydbO4459zHxojABLOalq
 QHQ4XbBMFMRwGGcjN32y3AJohqKDkUm3c9LpFIxawOX7qsklGulUNFWpyBywEKmL9h
 TXLvAQP7su81w==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, sharadg@nvidia.com
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

Convert Tegra HDA doc to YAML format. Ran binding validation checks to
ensure there are no warnings/errors for HDA.

Patch "arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering" is
already merged and hence not included here.

Sameer Pujar (2):
  dt-bindings: tegra: Convert HDA doc to json-schema
  dt-bindings: tegra: Add missing HDA properties

 .../bindings/sound/nvidia,tegra30-hda.txt          |  35 -------
 .../bindings/sound/nvidia,tegra30-hda.yaml         | 112 +++++++++++++++++++++
 2 files changed, 112 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml

-- 
2.7.4

