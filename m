Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C44537D0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:40:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D6E17E8;
	Tue, 16 Nov 2021 17:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D6E17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637080829;
	bh=eyvU1La7rU7h064EKucefMzgBNXdEOy+VDfwD9s0ze8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DaCXQIqrzGvypEsrNReOUu3TyEy9wxPccaW9gPzip3yqkX/Vk4s+Z6o89TXwUvGLK
	 zapNsYVShhAJoLfXAOQe2P6GlDGVmU+caJmoQuE7D+HP2e/INMDggN2qsfpM2mXqIi
	 04CvcLfs7DzTtaDn0nooeYPZaBg867ifAdH3OEr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D466DF80423;
	Tue, 16 Nov 2021 17:39:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49732F80272; Tue, 16 Nov 2021 17:39:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84DF8F80134
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84DF8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="D9tMtazs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7FClY005416;
 Tue, 16 Nov 2021 10:39:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ODxpdqxltOMoYVFmvaxZez5QOWprLDG9j92jnhb+qXc=;
 b=D9tMtazs3USlI5Z+VkvpPmwy4u6n82jUDKMxQCgMDADWtMwyDlndGPTRrj7NkMucdRvQ
 PiFOSIzi4P4/nMjAr2f8X4UUU4gRayUJ6dnxJi02Li7KjkmUPQ8MrvYnHMfEI3CDY5Gf
 smPYSqPf9wrJKGz7V0KReTmck23nZURj9UBv3XlLp6v3nBkiu9YBRn+LCxlNvtCC6Kxc
 gldqf+cLZ7xjW4UEK5s59jlCNZl0sTRNIbaj3AlmUnmAM7nwYM+wQ1iBvGpvtzsF1nww
 OthxyOwNztBC9nLABlEGvcJJgooncdzuLjBVOIHa+8E9gm3EnhJh2/xq5Au0jowLJcjt 7Q== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgt3vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:39:05 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:39:04 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:39:04 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.41])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6789111DC;
 Tue, 16 Nov 2021 16:39:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 0/4] ASoC: cs42l42: Remove redundant code
Date: Tue, 16 Nov 2021 16:38:57 +0000
Message-ID: <20211116163901.45390-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2VLeUxBwq61BfiO-W2j5z9eEZzE9-mJD
X-Proofpoint-GUID: 2VLeUxBwq61BfiO-W2j5z9eEZzE9-mJD
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

- Remove field writes in regmap_update_bits() calls where the code
  intends that the field value is not changed.

- Remove unnecessary complexity from reporting jack unplug event

- Remove a PLL config value member that was introduced in a bugfix
  but made redundant by a later bugfix.

Richard Fitzgerald (4):
  ASoC: cs42l42: Remove redundant writes to DETECT_MODE
  ASoC: cs42l42: Remove redundant writes to RS_PLUG/RS_UNPLUG masks
  ASoC: cs42l42: Simplify reporting of jack unplug
  ASoC: cs42l42: Remove redundant pll_divout member

 sound/soc/codecs/cs42l42.c | 42 +++++++-----------------------------------
 sound/soc/codecs/cs42l42.h |  1 -
 2 files changed, 7 insertions(+), 36 deletions(-)

-- 
2.11.0

