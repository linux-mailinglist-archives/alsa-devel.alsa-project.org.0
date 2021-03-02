Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1232A70D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4106C17A5;
	Tue,  2 Mar 2021 18:05:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4106C17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614704803;
	bh=wxlLdKYjOhsvV4XS7i0dMLsZmmlyQ2tzs/JYcGcck4k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RPuRuan2c/5n0CnYbrBcofdLMxMHDmuQ0FhDMFIsp5HwNF7G/0GwpU6ZqjypHIxg3
	 tcU+iOoJhzNm7U+j039qaH2idEq+/+Sa3M8Lkamn6+ISvo/bupCc9WyT4W9a0mSqJM
	 Me1nJJbM+S9uWguWj184lBjrkklIZcoWAJqOHAJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C46CFF80425;
	Tue,  2 Mar 2021 18:05:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E20ACF80425; Tue,  2 Mar 2021 18:05:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F560F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F560F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oZ/kVa9x"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1q3D022910; Tue, 2 Mar 2021 11:05:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=4QDbny4EwyYieLg3K7WMG2k8R+wMZEJS5Mk1LDGv+3s=;
 b=oZ/kVa9xUC7ISGguGS8gg5k33v0XZLeYPxmXRoDTmDvW9aWH7RmDwlO5rCOV0ZwAGy2m
 JjkulS6i7fIJPKq7q4S/U3ZnkyOxfgs/QcGYB9PvLLwR++Cz0BzLhCpa6FLDmjq3U4t6
 pQAn1d14EZbfZlPtsZxk8fsE3msg3Q5M75HT6lspTG41nhgM372NJvzfEAjueoxJPmBs
 N4mLFLCUx30fa0tHIbt8NmpmSESV6/7yMm12T+XCm4IS/Wr7Gw7Ft1tNdw9ABqPjDnZx
 RzWdutpRCqF6P2dZeBUdMZr0/R7JGJwwxlSHM0qoKz+/CXQt7N8LnOrhK8rUOaM4XXlO dA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6usg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 11:05:01 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 17:04:59 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 17:04:59 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4F51B11CB;
 Tue,  2 Mar 2021 17:04:58 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>
Subject: [PATCH 00/15] Report jack and button detection + Capture Support
Date: Tue, 2 Mar 2021 17:04:39 +0000
Message-ID: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1011 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020131
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Hi All,

Here is a patch series for reporting to user space jack and button events and
add the support for Capture. With some cleanups and fixes along the way.

Regards,

Lucas Tanure

Lucas Tanure (12):
  ASoC: cs42l42: Don't enable/disable regulator at Bias Level
  ASoC: cs42l42: Always wait at least 3ms after reset
  ASoC: cs42l42: Remove power if the driver is being removed
  ASoC: cs42l42: Disable regulators if probe fails
  ASoC: cs42l42: Fix Bitclock polarity inversion
  ASoC: cs42l42: Provide finer control on playback path
  ASoC: cs42l42: Set clock source for both ways of stream
  ASoC: cs42l42: Fix channel width support
  ASoC: cs42l42: Add Capture Support
  ASoC: cs42l42: Report jack and button detection
  ASoC: cs42l42: Use bclk from hw_params if set_sysclk was not called
  ASoC: cs42l42: Fix mixer volume control

Richard Fitzgerald (3):
  ASoC: cs42l42: Wait at least 150us after writing SCLK_PRESENT
  ASoC: cs42l42: Only start PLL if it is needed
  ASoC: cs42l42: Wait for PLL to lock before switching to it

 sound/soc/codecs/cs42l42.c | 497 +++++++++++++++++++++----------------
 sound/soc/codecs/cs42l42.h |  42 +++-
 2 files changed, 317 insertions(+), 222 deletions(-)

--
2.30.1

