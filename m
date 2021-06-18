Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662153ACE50
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 17:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0771172B;
	Fri, 18 Jun 2021 17:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0771172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624028981;
	bh=IzAFS24DfSTX6qaj3N/BA5FejAJqaXgVPe/qZtDzDi4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZiwVXGACjnB/SUlfI7gib/x0dqN0dwIbw2rOgJc1wfAMDg/bLkeUEinshZa+pBF6l
	 M9P4AaiAtiWnKGeWqTpRm9+32Q9tgqewAEEOaL93sck5t2Th9gG1Bm9GDS5jx75kl7
	 u7RCL11tiGwU2ZVaVMG3WsS0naj5sML+Vm77mu30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A30BF80424;
	Fri, 18 Jun 2021 17:08:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60A4F80423; Fri, 18 Jun 2021 17:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4331DF80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 17:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4331DF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Vr96qhR5"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624028881; x=1655564881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IzAFS24DfSTX6qaj3N/BA5FejAJqaXgVPe/qZtDzDi4=;
 b=Vr96qhR5fcsddvp1AnX9tJvYFR8K+0tLn9zT8E1rKbMkpKAEEI6m6zhQ
 rcd7bhCm1pNehvWmxrXzV9IjZkXyuN0qFTeLwhCpCcdJ8bpbO3CUexuUO
 smRKdQo/b03rGaxRzTDMLnIL92WBFuHaZeKk9pJxI9wfAWZQ+sQcV/V/s
 11acVlrINuWMuETiiHXik3T8sKuVgBo4HrNdWCH5BU6LP3dD1FxUpAXdw
 gY202jcXdxH2HB+5F1xUwj7+EYsiNwCOC1AhYQZlgXlE/vPqp//lkUD8e
 92ArM1wMPdDynzcfrRsVFSHgFExKLCK4w8oyEJvVfrOA5QCE3ffren90P Q==;
IronPort-SDR: f0mrNz8xIX6w1qwdLQ6vPQJ/IZFBjvXtlQkgIJ4IR6Nu/wq6XnA6SKquQtvZAUyAvCfHv/kxaA
 PXFKhBzDXJz1hxZu9awgHmYKkDuilMSofL/t3Tib497N4hL+sALEN4kdm4+4gVL8IEPwqycs7s
 A9h8JCHOj3SZjd08xRx9OhXuoskl/5eHzoHbeYAbcsnEP/Fl54e7vohoB7LPrzldxIYOM2BD/i
 EESX9WRtNTTpvjRfsSyY05+qtsmZTsAnGuN+IdJQ29U1loiNo9blCFJRNlU7itUGTSd/YVo5Co
 v4U=
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; d="scan'208";a="125835064"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jun 2021 08:07:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 08:07:57 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 18 Jun 2021 08:07:54 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: atmel-i2s: Set symmetric sample bits
Date: Fri, 18 Jun 2021 18:07:40 +0300
Message-ID: <20210618150741.401739-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

The I2S needs to have the same sample bits for both capture and playback
streams.

Fixes: b543e467d1a9 ("ASoC: atmel-i2s: add driver for the new Atmel I2S controller")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/atmel-i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index e8fe1a7a4d83..a95002b0cc8e 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -542,6 +542,7 @@ static struct snd_soc_dai_driver atmel_i2s_dai = {
 	},
 	.ops = &atmel_i2s_dai_ops,
 	.symmetric_rate = 1,
+	.symmetric_sample_bits = 1,
 };
 
 static const struct snd_soc_component_driver atmel_i2s_component = {
-- 
2.30.2

