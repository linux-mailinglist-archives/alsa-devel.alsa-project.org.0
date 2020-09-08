Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6B260E4B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 11:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86E21760;
	Tue,  8 Sep 2020 11:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86E21760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599555972;
	bh=+2tjDzeXd1espI6O0COPnfvNxYwFwu+EH+j4kHEWHa8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fdYQhqMACC4iCQZSo3N+9O8dbgx9CAwvCrGst3GlqoBrYg8BxsOIbfTZUugJ4S9Pq
	 aQJtSnqXF42jfbjJoyNt08dQF2bUDdPHwpeI+UDYILGsuBRxRFECucYTIHYoJcxKq0
	 k2bP0SoojL9odEd/1XaHT3QmJs2VuIgYilK+aVD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05488F800FD;
	Tue,  8 Sep 2020 11:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C17B0F80264; Tue,  8 Sep 2020 11:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D8C3F8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 11:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D8C3F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="cYQEPZhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1123; q=dns/txt; s=axis-central1;
 t=1599555864; x=1631091864;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DrCanfQPxJQAbiFoOiHCF5OHW6LGa9wQUs0Iobf1d1o=;
 b=cYQEPZhgxwred1jpgw9TBuZzfdTspOzWgHb5dDJSR0rS1CYJ+6GiKmDV
 jjQrGnKaTKzmw1wAyUVpSg9psifp1dhnzEf79K8WEWSkc4VaDJhUVrp88
 +CIbC+nLjY1TqeJPLkBfDxF2azhED9tO3GaePKAURWq1g5vgqFVTqkBPr
 sHztOwQal2FngLeWVK2ojh80WsLrUZ+D24ta0UWasjnMsFqax+DfMnOQi
 fBfEl6ccUUTQDtvqEt1/q+hvQRqywJRw6hQaDnQaj6BIMzBFgCAeBW0ew
 WkZVXj+CUvSqHbKJDkDYg7KoqdGEfDo9yUMI0stgWRmYgQa4IobA3heLd Q==;
IronPort-SDR: LZ6//p3kpV8zVpoMoHC+ooWQYFsULnU4r8sZttsxzkSV6gW1/Of08FhKWZSd7Mci3IxatP7TzT
 xou/zzbVQHyKGgq895AEmf1OL64oxcNw8iA2Xw67wV3x6KWN1EvuHwlYe0MCjgxbNxLfCzqDok
 4Hetrh3251T37zUBG0cnwfetDGeXUZkecvpJBpdhF1ynda/xeVr7AfG60Qu4etZu814Dz0DMHE
 ooHdL12oOAyJGhWaGAWsdjjAesLsM0pZskJ/xX6Thb5a7F4CWgJnd/bqb1/cDxZLveD+Jrd3w1
 W5A=
X-IronPort-AV: E=Sophos;i="5.76,405,1592863200"; d="scan'208";a="12653857"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <dmurphy@ti.com>
Subject: [PATCH] ASoC: tlv320adcx140: Fix digital gain range
Date: Tue, 8 Sep 2020 11:04:17 +0200
Message-ID: <20200908090417.16695-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

According to its datasheet, the digital gain should be -100 dB when
CHx_DVOL is 1 and 27 dB when CHx_DVOL is 255. But with the current
dig_vol_tlv, "Digital CHx Out Volume" shows 27.5 dB if CHx_DVOL is 255
and -95.5 dB if CHx_DVOL is 1. This commit fixes this bug.

Fixes: 689c7655b50c ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family")
Signed-off-by: Camel Guo <camelg@axis.com>
---
 sound/soc/codecs/tlv320adcx140.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 6d456aa269ad..13ece039e9fe 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -161,7 +161,7 @@ static const struct regmap_config adcx140_i2c_regmap = {
 };
 
 /* Digital Volume control. From -100 to 27 dB in 0.5 dB steps */
-static DECLARE_TLV_DB_SCALE(dig_vol_tlv, -10000, 50, 0);
+static DECLARE_TLV_DB_SCALE(dig_vol_tlv, -10050, 50, 0);
 
 /* ADC gain. From 0 to 42 dB in 1 dB steps */
 static DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
-- 
2.20.1

