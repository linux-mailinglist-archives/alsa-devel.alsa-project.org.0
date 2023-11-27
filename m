Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295E7FA4FD
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8504846;
	Mon, 27 Nov 2023 16:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8504846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099782;
	bh=XN9Bit659jWYf1A4adc2T7hIVcb934urLyq20ChKjNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AmpiMEpjmknofjua6A25pue+esg4tpWGez5gQtIaM4svAh8oguFlJdY+DEbw/ioAP
	 BK1y4GI9llvgPYztBktGmfJp39mUsWkO4zvK5jzTe3NQdatx3rKA/xCKkueQi7vOZg
	 dxvUCKDjHp64s4Lgkz571NN7Xwly5B9y9z0BvD6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B689CF80603; Mon, 27 Nov 2023 16:36:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C9FCF80615;
	Mon, 27 Nov 2023 16:36:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74B65F805F6; Mon, 27 Nov 2023 16:36:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4EABF80246
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4EABF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Nz+XuKIb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099325; x=1732635325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XN9Bit659jWYf1A4adc2T7hIVcb934urLyq20ChKjNQ=;
  b=Nz+XuKIbZw37YK7Nz8EkXWzl/KcpEjkGyTEotQvfy3DTb1UVRQRxMECF
   OB34g3Fwv9Z4HGgt/M0tG512DLenEOHEPRgy6vsB90YqZhywbFdmnL7u4
   FuXOVnShc0il2yKPbyKtpRIXoTYl9HDU1rJNDoLMdrgMumjdNW7wCj3L8
   hXVKZiv5mPM+iNXeffzylb6JUdiv1e6Qug8RCaXWWzOT8h0WCPhyXKCKJ
   F1EIEOe+ci1c8k/qcWdJJvKo5HOwQndkecNqfiLrew7R7J3SqkkxJTTWu
   6XvZh+aKUfnpzPFdnNmSS0Wvhg2DnE3WpgyFpMEW1FuOvwkvMn25u/mI1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894401"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956326"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956326"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 04/27] ASoC: Intel: cht_bsw_rt5672: check return value
Date: Mon, 27 Nov 2023 17:26:31 +0200
Message-ID: <20231127152654.28204-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VEQ546G4I63LZC6HD2TI6LGXWADO5EVB
X-Message-ID-Hash: VEQ546G4I63LZC6HD2TI6LGXWADO5EVB
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VEQ546G4I63LZC6HD2TI6LGXWADO5EVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

Set codec sysclk could fail and return error, add
error check for it.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index f6da24f3c466..8cf0b33cc02e 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -93,8 +93,12 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		 * when codec is runtime suspended. Codec needs clock for jack
 		 * detection and button press.
 		 */
-		snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_RCCLK,
-				       48000 * 512, SND_SOC_CLOCK_IN);
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_RCCLK,
+					     48000 * 512, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set codec sysclk: %d\n", ret);
+			return ret;
+		}
 
 		if (ctx->mclk)
 			clk_disable_unprepare(ctx->mclk);
-- 
2.43.0

