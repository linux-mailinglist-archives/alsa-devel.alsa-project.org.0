Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4F56A6B9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 17:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D862D1620;
	Thu,  7 Jul 2022 17:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D862D1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657206716;
	bh=9abPVIndiZPHCiF770UwSESMYusRoC6N2T5j84YtP0M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JOlP1ftxUzpQS3EC8Ol2XSBzGVrZ3zx2PkOnYhpe4f5ofGwrzS6z4p+0hQivQ27Ut
	 wmCGh2RUakHIpEaHhLhf31ONX6oohbawKacMtazZApBTk9RxNcQleKJytEvG46HMik
	 crpp5+cKhNpJb/99M0XE6L82gPzxxZEs6VnvfDRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C89FF804FA;
	Thu,  7 Jul 2022 17:10:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9996F8028D; Thu,  7 Jul 2022 17:10:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7D61F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 17:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D61F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Q0zLmSEU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267BU6Jh020187;
 Thu, 7 Jul 2022 10:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=kbe+Cs9YYhGN2CUMNc8/yCRLFrEnli9igyLJqvC0TCg=;
 b=Q0zLmSEUeLSqSW32Tagj909zKr/+dMCz5lTxPrlhLhoKtH1UyEkwK6xTT90rcMFRkA2O
 piG3/neQ/B4RLeL8Cookhey97u6yI6koT1Gdz1iQK7jKYTnKK/hkjabkPHmVQ0zm3lVK
 a9K0nBbcOm5H0iOADQYbbv8L2WmjTxLmVuTQ6wxXXTcQeN4q3TG9iK/tvbvhcuOIgl9n
 fcc5RXjRVEG+7CcQzy9UocoL3W9EwWBL9Uy0MhVAiqBWyBzmSKQual92V8IJnB1eUjU6
 dFMzmORPFQeEWGxycyJdHsQvn3LM0P1nqYBeYIJtcHbPFfumkFyRlNTG9H9UTMqNhWyi 7Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3h4ucmjr6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Jul 2022 10:10:46 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 16:10:44 +0100
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1118.9; Thu, 7 Jul 2022
 10:10:43 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 7 Jul 2022 16:10:43 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com
 (NEWBNB750653-PC.ad.cirrus.com [198.90.238.195])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2076B2A9;
 Thu,  7 Jul 2022 15:10:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 0/2] Read _SUB from ACPI to be able to identify firmware
Date: Thu, 7 Jul 2022 16:10:35 +0100
Message-ID: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OZC9w9_PtZjU2C4sUcXR2oFOOsf6bZ3W
X-Proofpoint-ORIG-GUID: OZC9w9_PtZjU2C4sUcXR2oFOOsf6bZ3W
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org, Stefan
 Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
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

Changes since v5:
- Clean up return codes
- Refactor length calculation
- Allow fallback to existing behaviour when bad ACPI is detected

Changes since v4:
- Rename function

Changes since v3:
- Fix 32 bit format string warning

Changes since v2:
- Fix error in function prototype

Changes since v1:
- Add length validation for SSID String
- Rename API
- Allocate memory inside API
- Use ACPI_HANDLE macro instead of ACPI_COMPANION
- Improve error handling

Stefan Binding (2):
  ACPI: utils: Add api to read _SUB from ACPI
  ASoC: cs35l41: Read System Name from ACPI _SUB to identify firmware

 drivers/acpi/utils.c       | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h       |  6 ++++++
 sound/soc/codecs/cs35l41.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

-- 
2.25.1

