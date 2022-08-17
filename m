Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E4596E5F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 14:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ADEF1620;
	Wed, 17 Aug 2022 14:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ADEF1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660739097;
	bh=Xpfh4Ge5tNBLXqkpkUF2npnJy2wIoY6HsUXvdG/G9J4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N9l45ZBPSk5VJtyGDzzL9Pqqokxs23TnYeO7zRv/ztLbZGnn3hgtPt8ObeoX8pWyH
	 P1eFfAQSE7iKDBEZEpdlWO7WdMo8wqQY0VJp/FmSw1LGA8L91Wq7ai50BNEAXQenH5
	 VQJGbb6OudMdrZuhGHWUvUjE9fbbv8V7AYnqeVe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6133DF8025C;
	Wed, 17 Aug 2022 14:23:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50CCAF802D2; Wed, 17 Aug 2022 14:23:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28E54F800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 14:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28E54F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BhnX2kXk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HBro3R026619;
 Wed, 17 Aug 2022 07:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=VA5vWp42DoWBFcE2Kvw+j15+d9nh9dAmeHthWqfIebQ=;
 b=BhnX2kXkirBkHX+pfvQCTZ8YW6M0xcH7JnbycwnYiCuMJWzFTexoxnkhHGHkMB+qF8x+
 MMzx/168z4ZuLbAaiz2xpgKgXJYZ2rOf1JGogVO62t8Kp6dKZ3vUqvQMpGVx9RtNPSv1
 +u7R6CKWaNQ7PQ8ISN00y/2pEzIW/gYi9umn9Npub9y5OYssRGYamfP3Y6b5o6DcIDkz
 6I0rriuP7+oB8GQkRU1/SkomSrssW0H6W16QijNWvoct9ojaNCVLHvi++Vn397ySkFN/
 Y1NxJERkMPToidKb5KEiR5iJ7+SBm2d5id7lhmAAHHy/iKklx/H0dj0ONfULfFUc8qaP mg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hx8cpcueb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 07:23:49 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 17 Aug
 2022 07:23:47 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Wed, 17 Aug 2022 07:23:47 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9AF887C;
 Wed, 17 Aug 2022 12:23:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: cs42l42: Some small code improvements
Date: Wed, 17 Aug 2022 13:23:42 +0100
Message-ID: <20220817122347.1356773-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TwERGpnE9xlKupjCGNCzyGKLaWKW5XbJ
X-Proofpoint-GUID: TwERGpnE9xlKupjCGNCzyGKLaWKW5XbJ
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

This is a collection of minor improvements to the code or comments.

Richard Fitzgerald (5):
  ASoC: cs42l42: Don't include kernel.h
  ASoC: cs42l42: Add include dependencies to cs42l42.h
  ASoC: cs42l42: Move cs42l42_supply_names to .c file
  ASoC: cs42l42: Fix comment typo in cs42l42_slow_start_put()
  ASoC: cs42l42: Use snd_soc_tdm_params_to_bclk()

 sound/soc/codecs/cs42l42.c | 24 ++++++++++++++++--------
 sound/soc/codecs/cs42l42.h | 13 +++++--------
 2 files changed, 21 insertions(+), 16 deletions(-)

-- 
2.30.2

