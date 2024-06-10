Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D229077F9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62FD81931;
	Thu, 13 Jun 2024 18:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62FD81931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295219;
	bh=s6GltpUWy6i/0v2hpQmwa2Za56mJUx4Sw1vw90FRxsc=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eMR0xfEc8Dst4xL+fhk0TOokwySW2QknsqJa2TVpSCUELRzWOyGQFX+om+OFcTDlR
	 /Ed3u6QwVTcrEgvSu4HfhS+K9e6MilPBGDtGwkiX7hvjP7J5Gum9RyZO9rK1LjmXRE
	 y5s5abIoBTl2xe76+bjxQIuU/35KbbRHuXOG0nlE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FC0AF898E3; Thu, 13 Jun 2024 18:04:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0C44F8990B;
	Thu, 13 Jun 2024 18:04:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD04FF8028D; Mon, 10 Jun 2024 12:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9BB4F8025D
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 12:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9BB4F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=FB5j4Qg8
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AAuQoC008994;
	Mon, 10 Jun 2024 05:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718016986;
	bh=g6yCyP89ivmnfNuA3W23jGw7U6hrCiJLP5l+3RBmLiI=;
	h=From:Subject:Date:To:CC;
	b=FB5j4Qg8ERY5p4dB/XGDJKY8qTvYpvVTnYWFIMn+r7eT1J26TGvyXofFqSMadSjMM
	 RQUEqzMDhgWOgyILYKNNZDcd7NUQiYRfyjysvppnS5k9rwCoCUb+It2SwYFi8ahfQn
	 djYhQmAnSAMlHQ3EjcTw576sV9FzRzWKyPYm6kxc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AAuQ5v061839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 05:56:26 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 05:56:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 05:56:26 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AAuPIo110493;
	Mon, 10 Jun 2024 05:56:25 -0500
From: Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v2 0/2] Fixes for McASP and dmaengine_pcm
Date: Mon, 10 Jun 2024 16:25:59 +0530
Message-ID: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/bZmYC/23MQQ7CIBCF4as0sxYDiEhdeQ/TmGY6tbMQDBBS0
 3B3sWuX/8vLt0GiyJTg2m0QqXDi4FvoQwe4jP5JgqfWoKU20kojxhTw4WnNAqU9zYiql2ih/d+
 RZl536z60XjjlED87XdRv/acUJaQg15/ROboYM90yHzG8YKi1fgFtMHDUnwAAAA==
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Devarsh Thakkar <devarsht@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Jayesh Choudhary <j-choudhary@ti.com>, Jai
 Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=s6GltpUWy6i/0v2hpQmwa2Za56mJUx4Sw1vw90FRxsc=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmZtvTMkoQNhjarX3voFd3wuydzNZIKcYAZec8Q
 3Xfdxo89GyJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZmbb0wAKCRBD3pH5JJpx
 RRRLEACwMKbkHMnr/l28xs4MwsrmS/JfWAXg1egEdofJpKWde2WnnaWxfMcmrWZR1iBzMDIhUwJ
 UclBkCd3/uMqkQsaP/WqS847oFSDvup00D5HQHWFxNTrd4XcZ+rwVeLNhmfzwfhktrvLa9EUZBR
 4UudvsEunz1Nb278e3TEuo5NucWYuNFt6oLejzVlvb4GFIkoAMoRCdDCFbf3Jj8oxs4sCEayEow
 YD50QdDtAeJBWdZDNBI2Nvc/j3S3fBc8JganwPycOza7ddhQT9V7Z30qM/AGs9kxil/2T/KaZVd
 ZfkiXT3ywHCtUzqzfuCjxKyJ8w9l8oAV+vxEREc+ZKlJtvAkUrBMsfdP+R+xsYjt+1F/1rWRhaQ
 ZLFaS/yBljhR2klcQZaknnI1AqDyi0/MhmFUST9qk/6sMqN9c7yXBPjqB7+mPziiZsQK49wm9Hn
 uPFtJkYCYonrf+/2ioBSYqEPG/Ht3UaVRJYoshrtr4Iqqit2O52ZNo3w1T/Lr71NRAOb4K9V6Eq
 5jqs84Ig5y2JTGzl9P7Fe6V12jMJxlqZ2vX4b4rAnzvwx2iOyajrNbmS0DT6e/2c/dKFlueo69j
 RDVXwUc71PpVRJ66bxyIvLlPticEathrj5VY+e3whFdCz61zXhynrd5wIlrZ0okI5+MwKgTvXnO
 OPdKgoEeVEGbFKQ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GPLM3BCVBGDP7GTF66G6DJ3DBODLBYAH
X-Message-ID-Hash: GPLM3BCVBGDP7GTF66G6DJ3DBODLBYAH
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:04:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPLM3BCVBGDP7GTF66G6DJ3DBODLBYAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series fixes two patches:

1. Fix the dmaengine API usage by calling dmaengine_synchronize() after
   dmaengine_terminate_async() when xrun events occur in application
2. Use the McASP AFIFO property from DT to refine the period size,
   instead of hardcoding minimum to 64 samples

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Changes in v2:
- Fix compiler warning for prepare callback by marking it static
- Pass numevt directly to hw_rule_min_periodsize()
- Link to v1: https://lore.kernel.org/r/20240604-asoc_next-v1-0-e895c88e744d@ti.com

---
Jai Luthra (2):
      ALSA: dmaengine: Synchronize dma channel in prepare()
      ASoC: ti: davinci-mcasp: Set min period size using FIFO config

 include/sound/dmaengine_pcm.h         |  1 +
 sound/core/pcm_dmaengine.c            | 10 ++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c |  8 ++++++++
 sound/soc/ti/davinci-mcasp.c          |  9 +++++++--
 4 files changed, 26 insertions(+), 2 deletions(-)
---
base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
change-id: 20240604-asoc_next-c063fcc190c6

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>

