Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E415AD15
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 17:18:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995CC1678;
	Wed, 12 Feb 2020 17:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995CC1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581524320;
	bh=7jhwAaVDyjThd/YQowilNpwF+0IQXA46wuMsZGPq7uo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PgYSMPb/vN7IiSxb5fmGht/5MmDewyH6NR+i6jV1VnhmbOtiqtSiGanxpNQM4IfBw
	 /4Nt6aSihqXnclcrXg0TqdZ6h/Sae8UAJYE/2ZpsFD8hNh9xnC+wl8ksIrvfPqpQkN
	 MgFk0BNstp9zWsp01lbBnlGZsQwRIDj8eRltET5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BD0F800E7;
	Wed, 12 Feb 2020 17:16:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833DCF800E7; Wed, 12 Feb 2020 17:16:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from relay2.uni-heidelberg.de (relay2.uni-heidelberg.de
 [129.206.119.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF97AF800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 17:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF97AF800E7
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2A6DwBMJERe/1BozoFlHQI4BQUOCYF?=
 =?us-ascii?q?LgidZgRoqhBSPGptkgXABAQEBAQEBAQEILAECBAEBhwskOBMCAwEBCwEBBgE?=
 =?us-ascii?q?BAQEBBQRthUOGEDBiIQIRBSg0gyeCe6t6gTKJGYEbExCBOAGFHwyGeA+BTD+?=
 =?us-ascii?q?EYoQWARIBboJDMoIsBJdSmCQHgUl0fIJxgjuQHQwcjniMHao9gWkiZ3EzGiS?=
 =?us-ascii?q?DO1AYDZxkQzACgQQBAY4ngjIBAQ?=
Received: from lemon.iwr.uni-heidelberg.de ([129.206.104.80])
 by relay2.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Feb 2020 17:16:46 +0100
Received: from hlauer by lemon.iwr.uni-heidelberg.de with local (Exim 4.92)
 (envelope-from <hlauer@lemon.iwr.uni-heidelberg.de>)
 id 1j1ugu-00071a-KT
 for alsa-devel@alsa-project.org; Wed, 12 Feb 2020 17:16:44 +0100
Date: Wed, 12 Feb 2020 17:16:44 +0100
From: Hermann Lauer <Hermann.Lauer@iwr.uni-heidelberg.de>
To: alsa-devel@alsa-project.org
Message-ID: <20200212161644.GF25353@lemon.iwr.uni-heidelberg.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [alsa-devel] [patch] tas571x: use symbolic register offsets
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


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,
the appended patch converts the numeric register offsets in tas5711_reg_defaults to the defined constants TAS571X_*

Tested with a tas5713 chip for which the driver works, too.

Thanks,
 greetings
   Hermann

-- 
Administration/Zentrale Dienste, Interdiziplinaeres 
Zentrum fuer wissenschaftliches Rechnen der Universitaet Heidelberg
IWR; INF 205; 69120 Heidelberg; Tel: (06221)54-14405 Fax: -14427
Email: Hermann.Lauer@iwr.uni-heidelberg.de

--Kj7319i9nmIyA2yE
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="tas571x-fix-regnames.patch"

# HG changeset patch
# Parent  73b0fe67928fff171bb722fc90e3df2f758b14fc

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -424,13 +424,13 @@
 };
 
 static const struct reg_default tas5711_reg_defaults[] = {
-	{ 0x04, 0x05 },
-	{ 0x05, 0x40 },
-	{ 0x06, 0x00 },
-	{ 0x07, 0xff },
-	{ 0x08, 0x30 },
-	{ 0x09, 0x30 },
-	{ 0x1b, 0x82 },
+	{ TAS571X_SDI_REG,		0x05 },
+	{ TAS571X_SYS_CTRL_2_REG,	0x40 },
+	{ TAS571X_SOFT_MUTE_REG,	0x00 },
+	{ TAS571X_MVOL_REG,		0xff },
+	{ TAS571X_CH1_VOL_REG,		0x30 },
+	{ TAS571X_CH2_VOL_REG,		0x30 },
+	{ TAS571X_OSC_TRIM_REG,		0x82 },
 };
 
 static const struct regmap_config tas5711_regmap_config = {

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--Kj7319i9nmIyA2yE--
