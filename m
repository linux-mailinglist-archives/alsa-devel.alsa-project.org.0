Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893588AF98
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 20:15:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA9CF55;
	Mon, 25 Mar 2024 20:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA9CF55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711394112;
	bh=S4dR9hMjuyXo+2NLjdCApilcKOOtn4MC+CpSK0tyAkM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fG4nJpv3mK3fYPBEh3S2/vzIMo1P7m7EOL0FNg4V6/8anGqXtvidlg/FJClIMuoKZ
	 2qIfVSUUCJkooQhVAZ55QKGI73ODDKfSNAAHkRAyqWHTexQlfMil0lQaB5gmbIz5/6
	 QeycRzTHBMeuMdbyElTxcJaqph0Gve/OVzEtxrS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61C30F80564; Mon, 25 Mar 2024 20:14:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 930FDF805A0;
	Mon, 25 Mar 2024 20:14:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4569AF8025F; Mon, 25 Mar 2024 20:14:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF0A1F801EB
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 20:14:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF0A1F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cxuS5fe9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711394072; x=1742930072;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S4dR9hMjuyXo+2NLjdCApilcKOOtn4MC+CpSK0tyAkM=;
  b=cxuS5fe9uqztZIfbCT3rdE+Silr8J+y6x1X7/X/aXNIO0d/H/BiDyAdR
   FFWUpwg0CVLf/lMh6SyFWKhacrv09+jK0eRTQblruMvXCRHFgI04RTi0I
   jZ/BjvNjatMLxWdY3IkO/nev54VQhsuFaU/+mzuRGVq8Xxsp0nGY3arQr
   S+JQfmvXo86sSEJVzTXYhIXyFLt8gzmLCeau10bcCDRLwpz2Wz+IZSmxf
   nV2LBOgMItJ+jT85RYezNdja9OEFBDHxIQYvEwEScbgsReXvtxZlbMMju
   cWoQ7lU6JPN3f5q/AkPW5xHd+yEnsh2m+f1ahX/q/SpSDH6ctAjM8YWEc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10213324"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="10213324"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="937070805"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="937070805"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 12:14:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 470F2101; Mon, 25 Mar 2024 21:14:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: fsl: imx-es8328: Remove leftover gpio
 initialisation
Date: Mon, 25 Mar 2024 21:13:41 +0200
Message-ID: <20240325191341.3977321-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6U6OQO3OGOBYDDARPCVZNIJTO5FQL36A
X-Message-ID-Hash: 6U6OQO3OGOBYDDARPCVZNIJTO5FQL36A
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6U6OQO3OGOBYDDARPCVZNIJTO5FQL36A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The gpio field is not used anymore, remove the leftover.
This also fixes the compilation error after the ...

Fixes: 9855f05e5536 ("ASoC: fsl: imx-es8328: Switch to using gpiod API")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/fsl/imx-es8328.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index d67b8a149bff..5b9648f3b087 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -28,7 +28,6 @@ struct imx_es8328_data {
 
 static struct snd_soc_jack_gpio headset_jack_gpios[] = {
 	{
-		.gpio = -1,
 		.name = "headset-gpio",
 		.report = SND_JACK_HEADSET,
 		.invert = 0,
-- 
2.43.0.rc1.1.gbec44491f096

