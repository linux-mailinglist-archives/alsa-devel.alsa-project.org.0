Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB94750E0C0
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF3C4173D;
	Mon, 25 Apr 2022 14:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF3C4173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650891076;
	bh=6NMU0iwZnF8ze6EhvpfCMZ3646X1xZOW6bOyvLYVnQE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u2uzbEBbAV8Y4DmSngfkmNvQZyXLntgNztlF4Zv41g8O/o2LtxYnix1iuQ65C2Rlc
	 J/JbnUSey5263x5oOCUUVnaKNhA+4KNyWkbGvk0FoTdexycNYEp4pL5w+THa+x3x0W
	 6WibZI6MwQRRVI6SCuHy3ASP+KU9U9LJjPJdWAVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8B1CF80506;
	Mon, 25 Apr 2022 14:50:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85D47F804FE; Mon, 25 Apr 2022 14:50:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A042BF804AA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A042BF804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lDATLjY3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PAhaRY024908;
 Mon, 25 Apr 2022 07:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=PakuK8f+Wwv8TTfBFpPZFanR/Et+/Kdxag47wx0HDo8=;
 b=lDATLjY3Vgccja/yE7UiS/O1SG4eTapBRmSnuSdBcxAzSNBfsAl/gjSOasWDTtmGgRk6
 ltZe6GwLlgedjWCKhfE0LfrZL40AflJU13TVJ2rGHG+NZRrLVAv3134bgxWSVJw123Mz
 SRkcaC3R1oWrCiaQNaptbWqs+RLutRhON+sRo9xLtS3jOn1bs9aulCAbnKdF3tsMhW4q
 qB5t2dGHAaTeykJ3iiig857QLgPqbivAGJlrxHE7sI3azo76aRJXJw7+4LymaG41KiGQ
 HaeR/NO8Vth3sQntQVEj8T86Wtk5WQ9KSTc3QlaEckccPjaa7Ik4IJ0RNei3XWypqs4X Eg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fmev31x5p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Apr 2022 07:50:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Apr
 2022 13:50:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 25 Apr 2022 13:50:14 +0100
Received: from debianA11184.ad.cirrus.com (debianA11184.ad.cirrus.com
 [198.90.251.83])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5FA4A478;
 Mon, 25 Apr 2022 12:50:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC: Add macros for signed TLV controls with callbacks
Date: Mon, 25 Apr 2022 13:50:10 +0100
Message-ID: <20220425125012.3044919-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4KxRupvBjUJMkAQN790EjsexUeGdPK_z
X-Proofpoint-GUID: 4KxRupvBjUJMkAQN790EjsexUeGdPK_z
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

This adds SOC_DOUBLE_R_S_EXT_TLV and SOC_SINGLE_S_EXT_TLV macros for
signed TLV controls that need custom get/put callbacks. These will be
needed by future Cirrus codec drivers, but are not particularly exotic
so could be useful for others.

Only change from V1 is sign-off on patch #1.

Richard Fitzgerald (1):
  ASoC: soc.h: Add SOC_SINGLE_S_EXT_TLV macro

Simon Trimmer (1):
  ASoC: soc.h: Introduce SOC_DOUBLE_R_S_EXT_TLV() macro

 include/sound/soc.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.30.2

