Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195C15A03A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 05:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6615E1616;
	Wed, 12 Feb 2020 05:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6615E1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581482251;
	bh=NFG29hccc8jmYHQTaVdMB+yA5IAdArVyHX4nOtnTIvo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oBju4kO4MA3/SZ+/kclvNUt5qJUNNsNxAVw69uTyA6TPd1L7wmigt4SYWs4mvRUOn
	 cTebs47qM0pRElT7U7qwZb2wazETCHeBUGdAUFgfGbBX3Qv0turvq7EY+DHpInuPoK
	 6Yjx75LPTm/hbL3cumE/hDOYH7LPAUBhuZjwdSiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 378DFF80158;
	Wed, 12 Feb 2020 05:35:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39BA5F8019B; Wed, 12 Feb 2020 05:35:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E15F80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 05:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E15F80125
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B3C71C71D7;
 Wed, 12 Feb 2020 05:35:42 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E37BF1B3959;
 Wed, 12 Feb 2020 05:35:34 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3C20D402A9;
 Wed, 12 Feb 2020 12:35:26 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Date: Wed, 12 Feb 2020 12:30:00 +0800
Message-Id: <cover.1581475981.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 0/3] Add new module driver for new ASRC
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add new module driver for new ASRC in i.MX815/865

Shengjiu Wang (3):
  ASoC: fsl_asrc: Move common definition to fsl_asrc_common
  ASoC: dt-bindings: fsl_easrc: Add document for EASRC
  ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and platform drivers

 .../devicetree/bindings/sound/fsl,easrc.txt   |   57 +
 sound/soc/fsl/fsl_asrc.h                      |   11 +-
 sound/soc/fsl/fsl_asrc_common.h               |   22 +
 sound/soc/fsl/fsl_easrc.c                     | 2265 +++++++++++++++++
 sound/soc/fsl/fsl_easrc.h                     |  668 +++++
 sound/soc/fsl/fsl_easrc_dma.c                 |  440 ++++
 6 files changed, 3453 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt
 create mode 100644 sound/soc/fsl/fsl_asrc_common.h
 create mode 100644 sound/soc/fsl/fsl_easrc.c
 create mode 100644 sound/soc/fsl/fsl_easrc.h
 create mode 100644 sound/soc/fsl/fsl_easrc_dma.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
