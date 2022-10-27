Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377FC60F68B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 13:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA0D2964;
	Thu, 27 Oct 2022 13:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA0D2964
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666871561;
	bh=bSDF2qtZ8AtZtWyQjs10cklMHLBZyUTQhWSTJJbrmvo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NhKCITi3jorH93je64SgBezv5Zb9btVpRWjklq7Pd+/aeDlADUXafAaZzLpCxFbck
	 ROwdYPDgMspgYXQgPOs4tdiwG7/TgzaArxq0Q6U8DD7R1MEJthIGHgZNSp/Z2CeLvi
	 sMtLUot8wtv0dq59axhAUlyWMKgDHFN+NQaA9aIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F791F80496;
	Thu, 27 Oct 2022 13:51:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54DA9F8025E; Thu, 27 Oct 2022 13:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E06F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 13:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E06F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=berginkonsult.se header.i=@berginkonsult.se
 header.b="FL7ERPP2"; 
 dkim=permerror (0-bit key) header.d=berginkonsult.se
 header.i=@berginkonsult.se header.b="3VKMLIL+"
Received: from mailrelay2.pub.mailoutpod2-cph3.one.com
 (mailrelay2.pub.mailoutpod2-cph3.one.com [104.37.34.7])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
 id b7a5db00-55ed-11ed-be8b-d0431ea8bb03;
 Thu, 27 Oct 2022 11:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=JC/HHWF4gaghp1JRdLxc59f6ipPtlD2CyXsBq4Sp1Sk=;
 b=FL7ERPP2jG+w/KDqVlq8iIsOMXYp5+kwuyX/Hy4PTBFQFqsMPBLjdz/JjcAJhAlIB9a2xo3CwJUxN
 +rZ6rKRUDIZrf1o6mS7OHL8pcGn/23WFSJqKYaN/gp4ppfXo51QuvBEgtmIepDtBbD54TFoBRa8dRp
 HtERZnucLABLL/BpO8igalzhBQ44nntPsY5Ss3hVAJBbVjggwbuTGUd2xSmEgOevimZfqBVbKq63Eb
 Gg06emRF9cgjsw9o2FnWxUWgCqGM0DE5FQ+qiWpaN1xgZQaXauzgQ/sN4FiLww0ONFTHxkLmDoKqKj
 l2xr0alXxA2OA2ldcEUxfvQQfKAd4Cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=JC/HHWF4gaghp1JRdLxc59f6ipPtlD2CyXsBq4Sp1Sk=;
 b=3VKMLIL+XpEr8iGvmz0W5KovJn1ZtaEUXk0s0Gz0lL4KcY9W57xEqlCrOOtV6uNk/C+ynDwQ3NLSh
 j1pe7nFBQ==
X-HalOne-ID: b46a7e99-55ed-11ed-9b66-335755252108
Received: from pbergin-7420.. (ua-213-113-159-147.bbcust.telenor.se
 [213.113.159.147]) by mailrelay2 (Halon) with ESMTPSA
 id b46a7e99-55ed-11ed-9b66-335755252108;
 Thu, 27 Oct 2022 11:51:38 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com
Subject: [PATCH] ASoc: cs42xx8-i2c.c: add module device table for of
Date: Thu, 27 Oct 2022 13:50:56 +0200
Message-Id: <20221027115057.442925-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Peter Bergin <peter@berginkonsult.se>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
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

When trying to connect the device with the driver through of
it is not working. The of_device_id is defined in cs42xx8.c
but is not correctly included in cs42xx8-i2c.c. Also add the
matching table for of in the i2c file.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 sound/soc/codecs/cs42xx8-i2c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index cb06a06d48b0..6e8ee28d01f8 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -37,6 +37,13 @@ static int cs42xx8_i2c_remove(struct i2c_client *i2c)
 	return 0;
 }
 
+const struct of_device_id cs42xx8_of_match[] = {
+	{ .compatible = "cirrus,cs42448", .data = &cs42448_data, },
+	{ .compatible = "cirrus,cs42888", .data = &cs42888_data, },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
+
 static struct i2c_device_id cs42xx8_i2c_id[] = {
 	{"cs42448", (kernel_ulong_t)&cs42448_data},
 	{"cs42888", (kernel_ulong_t)&cs42888_data},
-- 
2.34.1

