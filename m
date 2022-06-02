Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC553BC64
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 18:23:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D6A17CF;
	Thu,  2 Jun 2022 18:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D6A17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654186996;
	bh=szAktUbHrk5hDQDYHbpLkpBa09x2JUflMnDOukVHJWM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nIciuDt+MQ7u+aTfpHIlRWFnQLL3aj6gBZ0q30Pc6FNQPfPrmYyTzL7NZsepe6wqV
	 qvOLgGewRhdNu0FmRYVhzFOt6AInSWSB76IVMpAa5jEeVKyy/DqNAGzpsmxuZAsk2/
	 Wt7oT7t5DZ+BgNPqsH8B8o+St/+LhwfHp8GZhkSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D48C9F80538;
	Thu,  2 Jun 2022 18:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0888F80525; Thu,  2 Jun 2022 18:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F575F80425
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 18:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F575F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NpvpFZ3M"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252Ao5gC026091;
 Thu, 2 Jun 2022 11:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=9g6wF6XXOcEFnnrKMq7H5eD/0w2VbCNXrRcuyQ7orXY=;
 b=NpvpFZ3MtzZ6GK+80lTyOSf8x//XPPTImFKidxYG+M/B8keFIE6HY//NKRTRkJQ9NgYZ
 hHwBd/1QQFZYm4QhYeRhQ3ijrduv291Xfgv/U9EDWDJhlPAHB6+8H/hZsL8h3mz2cfXV
 DlL9mkGcIgTn7L2n47iteDwdkW1WONKbgq1U5UfgicQaiac6uok3qjVlJxpJbgXOUS1y
 sDVYN0ktwdbZ2p8rgz7zm+UNrYPVBW0s5PSgdlNdB2Ax1/caEHESywXfA8zd5TEk7hXv
 zrovMC3hzl5eS6CPPe1pqrWAB8+zaWLKM0jND8XavdTswhpwMxu1XLzmoRqQIYRy30jn YA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gbh51nq0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Jun 2022 11:21:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 2 Jun
 2022 17:21:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 2 Jun 2022 17:21:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1A4ED459;
 Thu,  2 Jun 2022 16:21:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/6] Fixup Cirrus SX control usage
Date: Thu, 2 Jun 2022 17:21:13 +0100
Message-ID: <20220602162119.3393857-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EcFLfLUIrSXk9lr5iPMpLZKeQx19pyIU
X-Proofpoint-ORIG-GUID: EcFLfLUIrSXk9lr5iPMpLZKeQx19pyIU
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
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

Mostly the usage of the SX controls seems to match the lowest gain
value + number of gain levels expected. The one notable exception
there being cs53l30 as David noted. However, there are a couple of
other places where the minimum value/TLVs are slightly incorrectly
specified.

There are two I couldn't quite work out yet, any input on these
greatly appreciated:

SOC_DOUBLE_R_SX_TLV("Speaker Volume", CS42L52_SPKA_VOL, CS42L52_SPKB_VOL,
                    0, 0x40, 0xC0, hl_tlv),

0.5dB step
0x40 - -96dB
0x00 - 0dB

This one is weird, the datasheet says 0x40 is the minimum, which
matches, but the datasheet also says 0.5dB steps to 0x00 being 0dB
which doesn't match with 0x40 being the minimum, or 0xC0 being
the number of levels. Some clarification will needed from the
hardware guys.

SOC_SINGLE_SX_TLV("Beep Volume", CS42L56_BEEP_FREQ_OFFTIME,
                  0, 0x07, 0x23, beep_tlv),

2dB step
0x07 - -50dB
0x00 - 0dB
0x06 - +6dB

The minimum checks out at 0x07, but rest of this is weird. The values
in the datasheet don't make sense, based on starting at -50dB with
a 2dB step, 0x06 should equate to 12dB, over 31 volume levels, not
6dB over 35 volume levels as stated. The control specifies 0x23(35)
levels, which takes us up to a final value of 0x0A at 20dB. Again
some clarification from the hardware guys might be needed here.

Finally it is worth noting I don't actually have hardware for most of
these devices, so mostly this is just build tested.

Thanks,
Charles

Charles Keepax (6):
  ASoC: cs42l52: Fix TLV scales for mixer controls
  ASoC: cs35l36: Update digital volume TLV
  ASoC: cs53l30: Correct number of volume levels on SX controls
  ASoC: cs42l52: Correct TLV for Bypass Volume
  ASoC: cs42l56: Correct typo in minimum level for SX volume controls
  ASoC: cs42l51: Correct minimum value for SX volume control

 sound/soc/codecs/cs35l36.c |  3 ++-
 sound/soc/codecs/cs42l51.c |  2 +-
 sound/soc/codecs/cs42l52.c |  8 +++++---
 sound/soc/codecs/cs42l56.c |  4 ++--
 sound/soc/codecs/cs53l30.c | 16 ++++++++--------
 5 files changed, 18 insertions(+), 15 deletions(-)

-- 
2.30.2

