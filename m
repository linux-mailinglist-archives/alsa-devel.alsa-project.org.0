Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58653714A
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 16:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84CBA1939;
	Sun, 29 May 2022 16:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84CBA1939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653833656;
	bh=0euctsbq1FgjeZWXv41Qz9QWQtfbJovU40w6C1Xujko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9l6jrxb/SZkbswiUtZBvdcnyxql32WS1fhzMmVPLUflevyS2wvJJIERNuPpSko+x
	 bjZOv9Q1JzKodnjJon9z+bdVmsVtKiiZ9HUdK7qlOTf6QMhBIo2v5wEYCjtPGTG+8A
	 ji7pfy8agugcdAGK/3wOtgkNELHnUOXoLBEMTImk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8AEAF8026A;
	Sun, 29 May 2022 16:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FEEAF8024C; Sun, 29 May 2022 16:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D6F3F800DE
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 16:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D6F3F800DE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvJfE-0006ys-3T; Sun, 29 May 2022 16:13:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvJf8-005HA9-IZ; Sun, 29 May 2022 16:12:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nvJf6-00Ct8f-Cy; Sun, 29 May 2022 16:12:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] ASoC: Intel: avs: Fix build error on arc, m68k and sparc
Date: Sun, 29 May 2022 16:12:50 +0200
Message-Id: <20220529141250.1979827-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <70daa951-4f77-3336-0567-e72e9e5e36c6@intel.com>
References: <70daa951-4f77-3336-0567-e72e9e5e36c6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; h=from:subject;
 bh=0euctsbq1FgjeZWXv41Qz9QWQtfbJovU40w6C1Xujko=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBik39efoUMWp0Edfm4Jed+GnPGf6/5OIeMZAX1J15S
 xBCVhjuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpN/XgAKCRDB/BR4rcrsCZpmB/
 9WThyj0KWpH/XHDTM9W2UNDWeX2VWeGNZO1x+upowelt0AXn4XmEnCwxtzCmAa7H6+0fpk3riu/LGT
 oaCW0a0Ebdx3l4d2t1e1Fv04fU2zDskQKAslGhKKJYUts/aF3AAz9bk+2OxLBbdt2a0j81dpZwN6M9
 tjpXyB1q+i+Yk2xDp0Scs4Ddhn1UgKwo4tEAoNgloRB2o2lmMM10qkHrrFkV6z2EY4jco7H1sQmeya
 RZ7jjmmhC6tgEIikk46UlQHb/N17hSKtgz7BCSRLiw6VAt5Gt8Tu3b1nH2tKKftIKI4EdBbtI6NTNW
 jWsgU242vXguNC9baBFiCke0GTbahn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On some platforms (i.e. arc, m68k and sparc) __fls returns an int (while
on most platforms it returns an unsigned long). This triggers a format
warning on these few platforms as the driver uses %ld to print a warning.

So explicitly cast the return value to unsigned long to make the warning
go away (and so fix allmodconfig build on the affected architectures).

Fixes: beed983621fb ("ASoC: Intel: avs: Machine board registration")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/intel/avs/board_selection.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 80cb0164678a..87f9c18be238 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -326,7 +326,8 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
 	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
 		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
-			num_ssps, mach->drv_name, __fls(mach->mach_params.i2s_link_mask));
+			num_ssps, mach->drv_name,
+			(unsigned long)__fls(mach->mach_params.i2s_link_mask));
 		return -ENODEV;
 	}
 

base-commit: beed983621fbdfd291e6e3a0cdc4d10517e60af8
-- 
2.36.1

