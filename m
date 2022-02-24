Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 567214C2814
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 10:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C709417A9;
	Thu, 24 Feb 2022 10:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C709417A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645695030;
	bh=oMJcM/JYkvOqc6PgFgWWjEQHWpxXGNB+eFwNJV8y16g=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hm+h2Yx0a+iYyAAAI4FdB+1u2HvuyYkW2I4W6l8vsghybSg9SEKGdXB2pIj67uCx0
	 5aqXmrdZ/mWk9M9Lt2WtfrYbFOglCyiZsXcOQWzlGnrwCoOa696/gLJT7rcv4bohY8
	 /rSqB8SD5v2Mqy1vIzMu0d1alBcd+xUXtBIfgbfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3863AF800B6;
	Thu, 24 Feb 2022 10:29:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2601F8030F; Thu, 24 Feb 2022 10:29:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37700F800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 10:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37700F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="Zq/5teaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1645694956;
 x=1677230956;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mjQm/9cll3gFEr0HPZeBimyzwKIKXGeoxXulHv7y7gs=;
 b=Zq/5teaGMjeQ+QnpqsukE6hkagWhfHAGIOPDFvSPv51vJ7vWgSOjle86
 xv7BhmXbYvpKYBg/3NnTGJTIvbvmnH3ykXy8Lob3WC2O9F59mnfBzwW7a
 N1GXuFMk/2vrp4W1CZHDs/7q8emsQz+cxBlkUjfGCJcAd2Bq/wXQj3EuH
 I5sVQGaXNJx1oFCIj4cpQ1VFqYwGTAymQuf4owSWMpj7YtmMn+1ptURVb
 xpXgnFDCy2F/c7Cxy20g0ui8XMoNNITN3+I8oDZRwSn1jBqUqf843iruB
 kn89/MBpvVRNdAL4EcoYeaJ6S7DJvAsoDJC1/kVFXAeg5QpoSNAwAlXMN Q==;
Date: Thu, 24 Feb 2022 10:29:05 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: tlv320adc3xxx: Fix buggy return value
Message-ID: <alpine.DEB.2.21.2202241021420.20760@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail03w.axis.com (10.20.40.9) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel@axis.com
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


snd_soc_component_update_bits returns 1 if the operation was
successful and some bits were changed, so we cannot
return this value directly as it can be interpreted
as an error. Instead, do some minor mangling to avoid
inadvertently returning an error.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 4baf3d881633..f15e3ea8685c 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1111,6 +1111,7 @@ static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct adc3xxx *adc3xxx = snd_soc_component_get_drvdata(component);
 	u8 clkdir = 0, format = 0;
 	int master = 0;
+	int ret;
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
@@ -1161,10 +1162,13 @@ static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	adc3xxx->master = master;
 
 	/* set clock direction and format */
-	return snd_soc_component_update_bits(component,
-					     ADC3XXX_INTERFACE_CTRL_1,
-					     ADC3XXX_CLKDIR_MASK | ADC3XXX_FORMAT_MASK,
-					     clkdir | format);
+	ret = snd_soc_component_update_bits(component,
+					    ADC3XXX_INTERFACE_CTRL_1,
+					    ADC3XXX_CLKDIR_MASK | ADC3XXX_FORMAT_MASK,
+					    clkdir | format);
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static const struct snd_soc_dai_ops adc3xxx_dai_ops = {
-- 
2.20.1


-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
