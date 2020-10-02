Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D442816A4
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 17:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B0AF1F16;
	Fri,  2 Oct 2020 17:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B0AF1F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601652670;
	bh=n9czzZF7q6QV4Gp5JZeBJYRNQ7Yj2qgbCJIV2N1P2dE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YsarzHQ5ew7vfLJd05HmbidpvRvOLaymgDPQSwqkXf8mGS4MQt4P5y3H2lsDflWGw
	 w080apSG1sXpGoHAt9Ci2rSeQ7Rhua9jFw3ru1yYMoJ4zR1bZuqGilBS+aKfRS0zZZ
	 435oNWBjI/gu2jCb9pyDokaU19xOH0EleZG9lPHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB937F80228;
	Fri,  2 Oct 2020 17:29:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67FE8F801ED; Fri,  2 Oct 2020 17:29:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B642DF800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 17:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B642DF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="ZzjSrmru"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092FGmtG025137; Fri, 2 Oct 2020 17:29:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rH5DRDsh0Q+Pmb7n88LdQ/t1cLnzwZVBzxVpYfSXUEM=;
 b=ZzjSrmrul4W3cETzEbXmFH9DTGZprBTe7Axt5fLkFo93oKDdTeg5xhjLsV+ZtffYPcrC
 rSAmqdhpV9yfTTHZQ9f6vpCeifvD1Nd04mK7Z863fS4YWDrp/60rx7e8zJ3duZTCuOpb
 +nw8xZM3+YqizZGMs1/Te8qLDu/69Ix8VPWQnamtV6D1DWVml7HaCfCJ/2wyxtPEwuIy
 h7K8VQVR6bRHE7ntHgxpRDp60H/iRAGuCc2V7OfddUenYkmsnhTXW9sVIU0DEPk72W8Y
 YUIDsPHUBBnnWQ4QDGHnVRLy9D6LT/sFIspU/Kf1oeYlJd9tnl4fgMMvFlzAUrfC/3zZ ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts8chy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 17:29:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E371010002A;
 Fri,  2 Oct 2020 17:29:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B69812A562F;
 Fri,  2 Oct 2020 17:29:07 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 2 Oct 2020 17:29:07 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.patard@rtp-net.org>
Subject: [PATCH 1/1] ASoC: cs42l51: add soft dependency declaration
Date: Fri, 2 Oct 2020 17:29:04 +0200
Message-ID: <20201002152904.16448-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_10:2020-10-02,
 2020-10-02 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

When configured as module, CS42L51 codec driver uses two modules
snd-soc-cs42l51 and snd-soc-cs42l51-i2c.
Add soft dependency on snd-soc-cs42l51-i2c in snd-soc-cs42l51,
to allow smart module dependency solving.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/codecs/cs42l51.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 097c4e8d9950..1630baad42e2 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -814,4 +814,5 @@ EXPORT_SYMBOL_GPL(cs42l51_of_match);
 
 MODULE_AUTHOR("Arnaud Patard <arnaud.patard@rtp-net.org>");
 MODULE_DESCRIPTION("Cirrus Logic CS42L51 ALSA SoC Codec Driver");
+MODULE_SOFTDEP("pre: snd-soc-cs42l51-i2c");
 MODULE_LICENSE("GPL");
-- 
2.17.1

