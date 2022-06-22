Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE45C554A86
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 15:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E12BB1F67;
	Wed, 22 Jun 2022 15:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E12BB1F67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655903391;
	bh=+4SHZom6L/m61eJQVY1bJiCes0l+AaRUKNvBeE5bzgY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tq2lExDtRj3SFFT6uvWRo+zUBFtd9gRfwSjtW1+7g+L5uzIh/LcMEy2ecHCixYMCG
	 /Pnk60KIjmaktDU/oX9B+cGNEtFvWoFx9WNmj/RPIAXx5Xrl07im9u0mKWPbvpPe/b
	 A/aqKPwrLunNd/kzSctYeOmf5B0Z9M/rjDb4SF5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E64F800CB;
	Wed, 22 Jun 2022 15:08:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C6E4F8032D; Wed, 22 Jun 2022 15:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39F53F802D2
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 15:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39F53F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fXUNsaIY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M7FLQE012089;
 Wed, 22 Jun 2022 08:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=gBYOHgPVp12lYmk5v3IHB2WXYsDvG+/8wdG4s8qgEuQ=;
 b=fXUNsaIY8RSc18mWHMTird7xW4JaSQg4PwgrbLI7JYASOTkfOcLlgTwlpaA1FIGdfc4c
 NHjyXxwU2J3P+BIgYfAvDrDJwLVIe5yf25F45ioXc+ZmUksCoJLa04rps6ybeQb/NLPI
 0n1BqHXAck3Wreoh4D7Ko1XWHBZ2B5UrbbFnpc1aRpyPd7D+lQVQPs5PzvjXkTZ0OQWn
 SWTT7mJ1AFG9Jj+RBs5kdQ+praPhcCQ3jLYnJX7dr+8ZYz1WQE2q/x3XTHxN6OZ3HfTd
 s4JC677o3XMmQjIW8Ncuhqnpoi79lFoYRQdZYdtbfUF7cpCQzWNhr+1CxiVryhcnzohJ XA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p4ybp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Jun 2022 08:07:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 22 Jun
 2022 14:07:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Wed, 22 Jun 2022 14:07:53 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.151])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D69127C;
 Wed, 22 Jun 2022 13:07:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 0/2] Read _SUB from ACPI to be able to identify firmware
Date: Wed, 22 Jun 2022 14:07:28 +0100
Message-ID: <20220622130730.1573747-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pI4CQgaqMYeQBZynIB44jpdYyBigxKCt
X-Proofpoint-ORIG-GUID: pI4CQgaqMYeQBZynIB44jpdYyBigxKCt
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

CS35L41 has a DSP which is able to run firmware, as well as a tuning file.
Different systems may want to use different firmwares and tuning files, and
some firmwares/tunings may not be compatible with other systems.
To allow a system to select the correct fimware/tuning, we can read an _SUB
from the ACPI. This _SUB can then be used to uniquely identify the system
in the firmware/tuning file name.

Add a helper function which reads the _SUB, so this can be used by other
parts in the future.
Add support inside the CS35L41 ASoC driver to read this _SUB, and save it
appropriately.

Stefan Binding (2):
  ACPI: utils: Add api to read _SUB from ACPI
  ASoC: cs35l41: Read System Name from ACPI _SUB to identify firmware

 drivers/acpi/utils.c       | 26 ++++++++++++++++++++++++++
 include/linux/acpi.h       |  8 ++++++++
 sound/soc/codecs/cs35l41.c | 27 +++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

-- 
2.25.1

