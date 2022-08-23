Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBCE59E633
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9865F1699;
	Tue, 23 Aug 2022 17:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9865F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661269318;
	bh=tqw/1FuEaMsbDG2LaRA4qhPbyUkRfV51pkZPRsSjnp4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jR5hVR4maYkCxlxIFXlOM0y5p3fV/Ty0JM/DlFrAF4pLG9Mv+DutMtlZbSt5m2NZt
	 eElwpbHOWa7Q1Ey3KJS9djKrveN8pYNh89Md6UBT6Jvzg3PYkBiAPwGX9trrKeJ1P1
	 RLFYTv8JSb1DU0ywpEXjmgClNmCdLN+94rxMGuok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B748F8027B;
	Tue, 23 Aug 2022 17:40:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18E20F8020D; Tue, 23 Aug 2022 17:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67E04F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 17:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E04F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="idn5Ql9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661269252; x=1692805252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tqw/1FuEaMsbDG2LaRA4qhPbyUkRfV51pkZPRsSjnp4=;
 b=idn5Ql9RRO7NrSD5eu92QDE/qTpZ2F5o/l8f26hXpSytKzNQ6kc+2Zew
 t54XPVhafQr8XJ+bpmEOkQ2neYQ/iR3Zejicq2zCjPTkh8qWPdViMijbB
 cZ3oQsLzkVwV1/1Ob51sRfUBlvaCM1tjRyd+XhL/nS97uVSKIEtJuzUab
 ZQRgKlbuGHDNCdng4e+F6AZXhgL0z/mVF/S8uQoVGOBwSR/MH3/uieT6T
 Q/TO6nD/sCs3gUfc7RKjMaaI0Y42IpMHLJ7F1yGUWi+k5s8QnDZYWsysi
 psVprwMdpFBBKzOZevWD73mxk/H02TBpiLPPai+pfnCbW5FT0pSVgQjJb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="295004712"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="295004712"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 08:40:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="670081351"
Received: from pnystrom-mobl1.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.50.219])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 08:40:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: imx: imx8ulp: declare ops structure as static
Date: Tue, 23 Aug 2022 17:40:27 +0200
Message-Id: <20220823154027.762889-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Sparse warning:

sound/soc/sof/imx/imx8ulp.c:416:24: error: symbol 'sof_imx8ulp_ops'
was not declared. Should it be static?

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8ulp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 02b496165acc3..afab7feab5fb3 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -413,7 +413,7 @@ static int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
 }
 
 /* i.MX8 ops */
-struct snd_sof_dsp_ops sof_imx8ulp_ops = {
+static struct snd_sof_dsp_ops sof_imx8ulp_ops = {
 	/* probe and remove */
 	.probe		= imx8ulp_probe,
 	.remove		= imx8ulp_remove,
-- 
2.34.1

