Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955C40D767
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45B67182D;
	Thu, 16 Sep 2021 12:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45B67182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788203;
	bh=FQ7qMpxiitgZeouvTkF6LaGrZbK+yA922a4HdSgCspQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZeRCJwN7BSx9wCJ0vmYmm0rmx8ZBBIPEjiplHIgyksDxSxf5o2JklucHvNGwYKBIY
	 sxudHQEiSgRtLhlhErnQ2K6M6/dnGKuiQ0dc72CbVBOMLRusfNWVglGsZacljoSnXG
	 GQAoke1ERmySyXHyHNKM5AdC9003Rlbve9Pr/lwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5266DF800D3;
	Thu, 16 Sep 2021 12:28:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255F6F80271; Thu, 16 Sep 2021 12:28:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8A2F800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8A2F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lcA7VzGV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G8MpJn022854; 
 Thu, 16 Sep 2021 05:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=C9A0iT3x1O9FcRBYE0k54iM+JulnJCyWxdI2m6U4loQ=;
 b=lcA7VzGV5JMrDRn4qYA6PHVCJDJpcC1E7uF1aBAy0ti1zbH0O28Wg9xnUXkTect+Kujy
 aNq9ZNKgXqi6d9jN6AV44rnjvdsg8lSZLEXn52k1svqUOuh3xIqYnkPoHAo6d7dFslPV
 Nxo9Ffn/MEBOd/xfXKVJemRdafLwL7dMe9U/vTLps8aR5m5AA3vUYG1nzVlgi/KIeKIp
 7dw/i3Mvm7rFkFyoDPvxYtcVsQLJJI3/b8rUAJy7KZQY1iykes5Tgqw0Gvhxm0M049FQ
 D/I2GpKmBT9jlh3qQOSiGuFL2eW02g8wwmk8Zzj6JU5vGqQdrRSiSEU7NipS6nbabeGM 1g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b42c3g3vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Sep 2021 05:28:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 16 Sep
 2021 11:28:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 16 Sep 2021 11:28:04 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.230])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4BB3EB15;
 Thu, 16 Sep 2021 10:28:04 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v1 0/1] ASoC: cs42l42: Implement Manual Type detection as
 fallback
Date: Thu, 16 Sep 2021 11:27:49 +0100
Message-ID: <20210916102750.9212-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9dcbysC11U7uOwQSL2L90KysPekjKq3m
X-Proofpoint-ORIG-GUID: 9dcbysC11U7uOwQSL2L90KysPekjKq3m
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

For some headsets CS42L42 autodetect mode is not working correctly. 
They will be detected as unknown types or as headphones. According 
to the CS42L42 datasheet, if the headset autodetect failed,
then the driver should switch to manual mode and perform a manual steps sequence.
These steps were missing in the current driver code. This patch will add manual
mode fallback steps in case autodetect failed. The default behavior is not affected,
manual mode runs only when autodetect failed.

Tested for regression with autodetect with all known headsets - no regression.
Tested with all headsets customers reported as false detected:
Gumdrop DropTech B1 - detected as headset OK
HUAWEI AM115 - detected as headset OK
UGREEN EP103 - detected as headset OK
HONOR AM116 - detected as headset OK


Stefan Binding (1):
  ASoC: cs42l42: Implement Manual Type detection as fallback

 sound/soc/codecs/cs42l42.c | 104 ++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/cs42l42.h |  54 +++++++++++++++++++
 2 files changed, 146 insertions(+), 12 deletions(-)

-- 
2.25.1

