Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC5E2585
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA031685;
	Wed, 23 Oct 2019 23:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA031685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571866836;
	bh=NombdgpMHZGDTuJ2ysVY+pj+2+BDtposm61XtvzCOoA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l0KlGRDJGxajDw1q3L7Zq1A0FRh+gOYSg4T2WDNxOy1ZdYRpEot1m+TtSm1fDwdoP
	 pyby7pR1+yL1XwfSe66N3NfzWK7/qKRsAXeauxpJTKCYGNbThEM2GWQhDoEF4xsvaf
	 P4aqGsTdWxFYJC1rN48vVHoJwhfwTzGNmYUED94E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F99F80393;
	Wed, 23 Oct 2019 23:30:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE4D1F803A6; Wed, 23 Oct 2019 23:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6BE1F80368
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BE1F80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TrdgBRSY"
Received: by mail-pl1-x642.google.com with SMTP id q15so10725537pll.11
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 14:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SvdCEhBTnMqbAdzSmXZvMVWIywKS8zvB7wVmDuKZ9sI=;
 b=TrdgBRSYsJOn/jogZ8vx8wCNDC7049BJsp2mJQo56VEi2ZoDeiOJhxcUwf84Lxqd5/
 byK26MK2Giahyc3NAQSCXy9Qg0NrvNFYUlMLpwkMtcdWVMSXKZm87epyUllhacMh3COc
 FmhFbp7r6Qd8B5CZspJVAQjynhKDD0dACbueA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SvdCEhBTnMqbAdzSmXZvMVWIywKS8zvB7wVmDuKZ9sI=;
 b=kW1wba4mwVWPeAKI05ucg6nwTuptDyUvfWgRt8AfPOfXE5St+B73x6F4CgV8mrZ5be
 jRhOcikFUGUkVcYqX7N/7U1qOr5GYI9dMqPKC3bQqnb8w7q5/kt/OhrtjcOW1gTXt9b5
 U6C65Dmp1PmZoJ90YgjnPfdA0/xdAF/45t5HjvMkVtLqvkvHId/431iCosylNLm5d4Cv
 lKCMxgcUae3lRZC8YUsdrFbH4k1E47JXuXIDouhceNIDourrvqpLGAaUTCmL0cfOvhY+
 DB/tPrvYD6yJmsyFlZxuOWG44X3vYHXePIRNERJutiA2OFiyCRkPiDMEGC2cOnlBwxhs
 EmLw==
X-Gm-Message-State: APjAAAVTTDbuUxRbmjG67lT7ahZzbKFvbmR6F9LUFI1TmEi3uBltQs/M
 wC5Z6nSXF5iehjRIgxWvvZu7nzcfnpYn
X-Google-Smtp-Source: APXvYqyF/9gMFd4I6wxIG4uC3beSMtyf4mOE6VuSutF0tZjHyALB+lto3eVVrCPmzMdNEQCEnaVkiQ==
X-Received: by 2002:a17:902:9b92:: with SMTP id
 y18mr12107798plp.19.1571866223608; 
 Wed, 23 Oct 2019 14:30:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id w65sm28296752pfb.106.2019.10.23.14.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 14:30:23 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 14:29:47 -0700
Message-Id: <20191023212948.92246-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Shirish S <shirish.s@amd.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Akshu Agrawal <akshu.agrawal@amd.com>
Subject: [alsa-devel] [PATCH] ASoC: rt5650: Add Kahlee platform specfic
	changes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Akshu Agrawal <akshu.agrawal@amd.com>

Add platform specific data for Kahlee project.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
Signed-off-by: Shirish S <shirish.s@amd.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5645.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 1c06b3b9218c5..a15e4ecd2a241 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3636,6 +3636,12 @@ static const struct rt5645_platform_data lattepanda_board_platform_data = {
 	.inv_jd1_1 = true
 };
 
+static const struct rt5645_platform_data kahlee_platform_data = {
+	.dmic1_data_pin = RT5645_DMIC_DATA_GPIO5,
+	.dmic2_data_pin = RT5645_DMIC_DATA_IN2P,
+	.jd_mode = 3,
+};
+
 static const struct dmi_system_id dmi_platform_data[] = {
 	{
 		.ident = "Chrome Buddy",
@@ -3742,6 +3748,13 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&lattepanda_board_platform_data,
 	},
+	{
+		.ident = "Chrome Kahlee",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Kahlee"),
+		},
+		.driver_data = (void *)&kahlee_platform_data,
+	},
 	{ }
 };
 
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
