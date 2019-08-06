Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E656C834D8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63CFB165F;
	Tue,  6 Aug 2019 17:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63CFB165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565104460;
	bh=dYaCpgci2WV2rGeWKGQQP6SULWsV3y2pGkaQtfTwuuo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q6TDgvmWyIgHDwdnNCMsrp5+eYphTaT8RKk2cKuaenI45mWT7xFVkPIVi18mm77AF
	 DW8owYh448NXrQjC9PSukxokRXEt6pVwRgTRLIsDDlv+EwIPeitmvTM5nCIZ1nMSUh
	 FvvHvgMVMMfPtXYIbymxJ0GFLYV78wDN/Ayh2iQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEFEF80534;
	Tue,  6 Aug 2019 17:12:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F823F804CB; Tue,  6 Aug 2019 17:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55220F800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55220F800F4
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 06D7F1A02BD;
 Tue,  6 Aug 2019 17:12:29 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ED6491A062C;
 Tue,  6 Aug 2019 17:12:28 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 18B5C205DD;
 Tue,  6 Aug 2019 17:12:28 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Tue,  6 Aug 2019 18:12:09 +0300
Message-Id: <20190806151214.6783-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, linux-kernel@vger.kernel.org,
 nicoleotsuka@gmail.com, linux-imx@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH v3 0/5] Add support for new SAI IP version
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

So far SAI IPs integrated with imx6 only supported one data line.
Starting with imx7 and imx8 SAI integration support up to 8 data
lines. First patch introduce register definition to support this.

New SAI IP version introduces two new registers (Version and Parmeter
registers) which are placed at the beginning of register address space.
For this reason we need to fix the register's address. Support for
this is introduced in patch 3.

Changes since v2:
	- removed patches regarding data line mask because I need to
	find a better way to describe to model data lines. Perhaps,we
	only need to specify how many datalines a specific SAI instance
	supports and then let SAI driver to activate datalines based on
	the number of channels. Will open the discussion on this on a
	separate thread.
	- fixed devicetree documentation as per Nicolin comments and
	will send a separate patch to convert it to yaml.

Changes since v1:
        - removed patches from Lucas as they were already accepted
        - addressed comments from Lucas and Nicolin regarding
        device tree property naming
        - removed comment saying that "datalines" must be always
        consecutively enabled (this is not true, checked with IP owner)
        - added new patch to document newly introduced compatbile
          strings
        - removed patch introducing combined mode as I will still need
        some time to figure out how to properly allow users to set it.

Daniel Baluta (5):
  ASoC: fsl_sai: Add registers definition for multiple datalines
  ASoC: fsl_sai: Update Tx/Rx channel enable mask
  ASoC: fsl_sai: Add support for SAI new version
  ASoC: fsl_sai: Add support for imx7ulp/imx8mq
  ASoC: dt-bindings: Introduce compatible strings for 7ULP and 8MQ

 .../devicetree/bindings/sound/fsl-sai.txt     |   3 +-
 sound/soc/fsl/fsl_sai.c                       | 320 ++++++++++++------
 sound/soc/fsl/fsl_sai.h                       |  78 +++--
 3 files changed, 273 insertions(+), 128 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
