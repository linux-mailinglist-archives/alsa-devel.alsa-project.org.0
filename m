Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CBF4B8EEA
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 18:15:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B54C1943;
	Wed, 16 Feb 2022 18:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B54C1943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645031728;
	bh=QqVvmlcoQFLSTQq2Lp6JlLwQZJHdBakGOKH9noge4Yg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bW6tXagJCwFo2aow9G6vXforDF9Rcz6a3/H9d2IKtiz0nPCYFJAy9ctF6Ux/eO/CJ
	 g15J87JDaPMwjNcBtL24mLHE86mw9obwIPSqKHxt8MzynHTTpUjjK26aypBsUzKJ7j
	 KKmSWN8Q6WqtSS0vctn0ILZpG9U3nh7/be2bHitM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 924EFF8011C;
	Wed, 16 Feb 2022 18:14:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3679F8012E; Wed, 16 Feb 2022 18:14:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34B29F800D8
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 18:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34B29F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pJi4VBgK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21G6UxbD014900;
 Wed, 16 Feb 2022 11:14:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=jjPTk4ZNM3VL9GWOU4evMkLIxhVFu38hF4Z1QTq/6ak=;
 b=pJi4VBgKHeAI5hEQhnq+3j/gKTQqDCb30Kk1LVLe3Wkv+ivuWWh5b31pkI5Vac9jYxvN
 /yw1worN2Iau4LuN6Do8iSRb0jh+IGh3SBRS2e2qXo6PbK/dNvHN1xuM1RA2eX6iWxcv
 mw5nXxHZGFPjK7l/bpc4yQnDTuXXQfHWjY97IcnIEAvtxX7mfkXS60j9yDAgUWEL80mm
 iSuJusqDBUL1SOBG3i6qnkbt6pgTBUg7peRkfBjskrhrgDCzrnUdrei09BcUfbdNe1i5
 SN8Q374IRVUQ4ZB/SXDQ5Yjr/seGUpOcGOhktByAMSmxNPdym0IT0iEex3SJQ1Ffady2 Gw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e8nyd93rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Feb 2022 11:14:14 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 17:14:13 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 16 Feb 2022 17:14:13 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.199])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2E81F459;
 Wed, 16 Feb 2022 17:14:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: audio_graph_card2: Support variable slot widths
Date: Wed, 16 Feb 2022 17:14:06 +0000
Message-ID: <20220216171408.265605-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8FYjxAhC1QBZfSXiwNknMgw_G92jTlow
X-Proofpoint-ORIG-GUID: 8FYjxAhC1QBZfSXiwNknMgw_G92jTlow
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
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

This adds support for I2S/TDM links where the slot width varies
depending on the sample width, in a way that cannot be guessed by
component hw_params().

A typical example is:

- 16-bit samples use 16-bit slots
- 24-bit samples use 32-bit slots

There is no way for a component hw_params() to deduce from the information
it is passed that 24-bit samples will be in 32-bit slots.

Some audio hardware cannot support a fixed slot width or a slot width
equal to the sample width in all cases. This is usually due either to
limitations of the audio serial port or system clocking restrictions.

These two patches add support for defining a mapping between sample widths
and sample slots. This allows audio_graph_card2 to be used in these
situations instead of having to write a custom machine driver.

Richard Fitzgerald (2):
  ASoC: dt-bindings: audio-graph-port: Add dai-tdm-slot-width-map
  ASoC: audio_graph_card2: Add support for variable slot widths

 .../bindings/sound/audio-graph-port.yaml      |  7 ++
 include/sound/simple_card_utils.h             | 11 +++
 sound/soc/generic/audio-graph-card2.c         |  4 +
 sound/soc/generic/simple-card-utils.c         | 95 +++++++++++++++++++
 4 files changed, 117 insertions(+)

-- 
2.30.2

