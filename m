Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5863772F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:08:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A60C616E2;
	Thu, 24 Nov 2022 12:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A60C616E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669288111;
	bh=63+SlLP93G2zJ2WK5kqIQXiRE9iea/sIdcs5SGBZaB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPr8RsxEC5J9kRoyOEejtmoMSgW7hm/3LMRE7H0VJvaCG6VLeZc9ti8Q8jT0R0A+o
	 as9MjMEsenamUyVTPrTIZDFMM4XQZuI0BZAkXblYpplwrj6KmbYPOCJU6Ox22UtTNN
	 vcJR34Ap4akY0tPg0JJcX68kvUWVqekGpJydsITQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AEBFF8014E;
	Thu, 24 Nov 2022 12:07:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90977F80448; Thu, 24 Nov 2022 12:07:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DDACF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDACF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MeHXoUqI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO7LNJS015819; Thu, 24 Nov 2022 05:07:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MUgtFemw9mzys2LF+P1154GAYh2HscnFbiU7ai50jsM=;
 b=MeHXoUqIMuOg3cycTuD4gsB053mgOXXamO21I+tA0MZNyBU3obed1qZE/NHgy1vk0Qh7
 ZlAU12ynGS1uEl1APXMElucwMK2jggKYZ2ftDzGsh6N5M4ovZ+ZcOxqQGDtFBfGHFIWb
 EmcrJwMsmlX5rbA9HvCz/3x8mq3U0AloaQeQ/kXjPtbnXzM7eWg7CZC3ndFAu2rE8LXp
 btOTZv1RJj303n+qdZZG8JqLFuV6eoJe07wk7aREN5Yw1AzZjY94xBVkJpUIx75AhUol
 z8PZCLfrrHJ3yDa+s/vo7vz9K7oRHSxiSwep8T5P0QVU2ZIXfc7dRuROm/PyT0o7g26S iA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6x2du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:07:24 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 24 Nov
 2022 05:07:22 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 24 Nov 2022 05:07:22 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 85BD7B10;
 Thu, 24 Nov 2022 11:07:22 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Hans
 de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/2] platform/x86: serial-multi-instantiate: Set fwnode for
 i2c
Date: Thu, 24 Nov 2022 11:07:17 +0000
Message-ID: <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oibzOdWpY9mctqOdzlYetaHUXXSPowin
X-Proofpoint-GUID: oibzOdWpY9mctqOdzlYetaHUXXSPowin
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
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

This allows the i2c driver to obtain the ACPI_COMPANION.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 5362f1a7b77c..15ef2f3c442e 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -194,6 +194,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
 		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
 		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
 		board_info.dev_name = name;
+		board_info.fwnode = acpi_fwnode_handle(adev);
 
 		ret = smi_get_irq(pdev, adev, &inst_array[i]);
 		if (ret < 0)
-- 
2.34.1

