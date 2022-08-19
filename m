Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9C599C3D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2251616;
	Fri, 19 Aug 2022 14:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2251616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913620;
	bh=OEOolqllBFDGEwDJDhJ2GSRJ+CX3URgiBpHOKvVObBU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jm9lg3oi/RAo3sBpoDPAKpqT7i3BzLdyXk+ZqAkb/cNQOLKzaAfaIGpZNwCa7/ChY
	 vIb+0QN6VgU0RdVuJtY1Hroh7xt48M5W81PmPwtgoTTzCVbDwX96UnYvR+tL7Yo+Gp
	 OXiLqsEfem7bvl7evyIWzo0F+FQbHAz3T8RIsOzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB29BF8051B;
	Fri, 19 Aug 2022 14:52:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE30CF800EE; Fri, 19 Aug 2022 14:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B7FF800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B7FF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IVC4b3HI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J5QffN021184;
 Fri, 19 Aug 2022 07:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=DEfJ9i42eqkoVYAgl9Ca7Dg0mjK9CUm+t95OA12w4tg=;
 b=IVC4b3HIaQPYpyssKEzkaeGiahh07vid5V7vc6MFSxKJkx3xqLkV3U4gsR+RDySRJhZj
 czm6wQNgE25yGQj4ETx5C8PY1vdQZ8tPu1JcBbruzwL0KA+Rbs9Fp6r+krOP4+RhC8c+
 IGscNVt3v8pWB5iq7bjYbzLsHD88F4G3URZ9IiLqdWcdqAtNVYyQ9JBlB2jA+1DOftJD
 03g1lLDbPk8wUHf4D1gdy8zFIDM+Xi8+k64rSIlaR/DD/cZiRfXCzVbnURsesaRwcsUX
 dIM0HU2FgLyo9nUEaevhSgQnAR2D55cIUD+TvtClllEgkKRV78QESi8f8yIYzdNxpcCH Qg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hx8cpfuvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:33 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:32 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:32 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 19EFD7C;
 Fri, 19 Aug 2022 12:52:30 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 00/12] ASoC: cs42l42: Add Soundwire support
Date: Fri, 19 Aug 2022 13:52:18 +0100
Message-ID: <20220819125230.42731-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iq25F7LQ021Oc1jlEJEc4xq159PP-sYN
X-Proofpoint-GUID: iq25F7LQ021Oc1jlEJEc4xq159PP-sYN
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The CS42L42 has a Soundwire interface for control and audio. This
chain of patches adds support for this.

Patches #1 .. #10 split out various changes to the existing code that
are needed for adding Soundwire. These are mostly around clocking and
supporting the separate probe and enumeration stages in Soundwire.

Patches #11 and #12 actually add the Soundwire handling.

Richard Fitzgerald (12):
  ASoC: cs42l42: Add SOFT_RESET_REBOOT register
  ASoC: cs42l42: Add bitclock frequency argument to cs42l42_pll_config()
  ASoC: cs42l42: Ensure MCLKint is a multiple of the sample rate
  ASoC: cs42l42: Separate ASP config from PLL config
  ASoC: cs42l42: Use cs42l42->dev instead of &i2c_client->dev
  ASoC: cs42l42: Split probe() and remove() into stages
  ASoC: cs42l42: Split cs42l42_resume into two functions
  ASoC: cs42l42: Pass component and dai defs into common probe
  ASoC: cs42l42: Split I2C identity into separate module
  ASoC: cs42l42: Export some functions for Soundwire
  ASoC: cs42l42: Add Soundwire support
  ASoC: cs42l42: Add support for Soundwire interrupts

 include/sound/cs42l42.h        |   5 +
 sound/soc/codecs/Kconfig       |  14 +-
 sound/soc/codecs/Makefile      |   6 +-
 sound/soc/codecs/cs42l42-i2c.c | 107 +++++
 sound/soc/codecs/cs42l42-sdw.c | 689 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs42l42.c     | 359 +++++++++--------
 sound/soc/codecs/cs42l42.h     |  30 +-
 7 files changed, 1049 insertions(+), 161 deletions(-)
 create mode 100644 sound/soc/codecs/cs42l42-i2c.c
 create mode 100644 sound/soc/codecs/cs42l42-sdw.c

-- 
2.30.2

