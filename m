Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B525C091
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 13:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B81F1924;
	Thu,  3 Sep 2020 13:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B81F1924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599133771;
	bh=K+qFth2pKLnlWnbldq+mrSwf1SKpwwoieT1RHMshyCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufWR5x1ny6zmFdjz9zrWHThS0KjCZsfVVx8Y3bBfRFeoKRszfEfxjErlZjnELop0I
	 2cvlvehPKgactpfGKcLyCmG+tjjJhxYVq5TPsgIDlvMqQZDge9yf5I/DdVGPpSFpjz
	 F9iD5ymIzMKxBiS5v32l8jmkmlXYt6hiETb41Xoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6748DF802EC;
	Thu,  3 Sep 2020 13:45:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A62F802C4; Thu,  3 Sep 2020 13:45:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44AFBF802C4
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 13:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44AFBF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gHT4G23U"
Received: from localhost.localdomain (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6517D206EB;
 Thu,  3 Sep 2020 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599133530;
 bh=K+qFth2pKLnlWnbldq+mrSwf1SKpwwoieT1RHMshyCQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gHT4G23Ulwecu9CVgglNtHCovBRJXqH9PfOn1Ze55izROdPZrlnVDzLae3u+qnR+A
 N395AB8csPFWn0kaESUlsFStxPr2R9mKdBAgk7nj6UsaDOYcBpEdhqZwKdvIqvH2LG
 EDCWv5d2/TZG3GDTSp8Kie18ph+/K+PpGeWBrujw=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/9] soundwire: stream: use FIELD_{GET|PREP}
Date: Thu,  3 Sep 2020 17:14:59 +0530
Message-Id: <20200903114504.1202143-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903114504.1202143-1-vkoul@kernel.org>
References: <20200903114504.1202143-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

use FIELD_{GET|PREP} in stream code to get/set field values instead of
open coding masks and shift operations.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/stream.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e4cf484f5905..afb95febb0d3 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -100,9 +100,7 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 		return ret;
 
 	/* Program DPN_SampleCtrl2 register */
-	wbuf = (t_params->sample_interval - 1);
-	wbuf &= SDW_DPN_SAMPLECTRL_HIGH;
-	wbuf >>= SDW_REG_SHIFT(SDW_DPN_SAMPLECTRL_HIGH);
+	wbuf = FIELD_GET(SDW_DPN_SAMPLECTRL_HIGH, t_params->sample_interval - 1);
 
 	ret = sdw_write(slave, addr3, wbuf);
 	if (ret < 0) {
@@ -111,9 +109,8 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 	}
 
 	/* Program DPN_HCtrl register */
-	wbuf = t_params->hstart;
-	wbuf <<= SDW_REG_SHIFT(SDW_DPN_HCTRL_HSTART);
-	wbuf |= t_params->hstop;
+	wbuf = FIELD_PREP(SDW_DPN_HCTRL_HSTART, t_params->hstart);
+	wbuf |= FIELD_PREP(SDW_DPN_HCTRL_HSTOP, t_params->hstop);
 
 	ret = sdw_write(slave, addr4, wbuf);
 	if (ret < 0)
@@ -157,8 +154,8 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 	}
 
 	/* Program DPN_PortCtrl register */
-	wbuf = p_params->data_mode << SDW_REG_SHIFT(SDW_DPN_PORTCTRL_DATAMODE);
-	wbuf |= p_params->flow_mode;
+	wbuf = FIELD_PREP(SDW_DPN_PORTCTRL_DATAMODE, p_params->data_mode);
+	wbuf |= FIELD_PREP(SDW_DPN_PORTCTRL_FLOWMODE, p_params->flow_mode);
 
 	ret = sdw_update(s_rt->slave, addr1, 0xF, wbuf);
 	if (ret < 0) {
-- 
2.26.2

