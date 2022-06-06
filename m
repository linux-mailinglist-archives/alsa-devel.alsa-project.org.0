Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF853F158
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 23:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 524E81B5D;
	Mon,  6 Jun 2022 23:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 524E81B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654549460;
	bh=E7e62aJfPwFZN66Dgtk6BcZB5jkoBgSjO34u8zJ1Pik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXsP5UyPHRcDIHe3+Jmj4DSt/kwOTz+/3QOo0UjakJS+yrh/i7EyZHOgZiTSlIHuY
	 iXBmQAX1ml0UXzNXUO8EQ07DYx0mTmAMAg7YwBnwYEKXnV1BywfUasWaUM/4pLFWos
	 DKl5T84NJlXgQbQnxvUQIsuse5sesUAaoTXReLHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0831F80529;
	Mon,  6 Jun 2022 23:02:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62291F80520; Mon,  6 Jun 2022 23:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3E4AF8012A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 23:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E4AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hX06z3pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654549356; x=1686085356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7e62aJfPwFZN66Dgtk6BcZB5jkoBgSjO34u8zJ1Pik=;
 b=hX06z3pfhdyHS+xbcVNWsbx5vqXg0+W9TmfHByDBJRVhZAfAmOrZSzzH
 HXUk4lSfRpsUlgDkDolcS06KTKUQQi3XHz63XjuqqUW21ufpZ4EoomANS
 r034E/k1HsPep9JXsjlszs32VOhQb+/ax3RDQgwldz8fkRdYnparT9LJF
 /6D4CDpq0QuuiEti7BdSK3dQ1YIIuPqmrJN86XXLbkiGsP524yJpCkKCK
 SePZoTKpvMYwXFdktL7GLO2ODw+sOLRJ36aJDGdMB0dwF3+r5k5M7cXuz
 Id6inxwNRL36tspHuEPvSjF5OWDatN49bpdfDowSuzoisyt5aWawKuSgP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275467622"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="275467622"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="608914450"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: SOF: mediatek: revise mt8195 clock sequence
Date: Mon,  6 Jun 2022 16:02:09 -0500
Message-Id: <20220606210212.146626-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
References: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, YC Hung <yc.hung@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: YC Hung <yc.hung@mediatek.com>

clock enable : enable and set audio_h selection as 26M.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
index 6bcb4b9b00fb9..9ef08e43aa38b 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
@@ -132,6 +132,13 @@ static int adsp_default_clk_init(struct snd_sof_dev *sdev, bool enable)
 			return ret;
 		}
 
+		ret = clk_set_parent(priv->clk[CLK_TOP_AUDIO_H],
+				     priv->clk[CLK_TOP_CLK26M]);
+		if (ret) {
+			dev_err(dev, "set audio_h_sel failed %d\n", ret);
+			return ret;
+		}
+
 		ret = adsp_enable_all_clock(sdev);
 		if (ret) {
 			dev_err(dev, "failed to adsp_enable_clock: %d\n", ret);
-- 
2.34.1

