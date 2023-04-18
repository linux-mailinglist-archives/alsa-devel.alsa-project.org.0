Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B56E66A6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 16:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BDBE7F;
	Tue, 18 Apr 2023 16:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BDBE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681826878;
	bh=SzNNo6WBOukAPzI/wmd9HH8mdiz/mv2eHh5gnQP0vjM=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=YC5t0kMJInI8gpOsM8Io7trH3sWu5HUcyZkPZ9ufbUxo4QbvdRTFqS2iM67SzLr0B
	 l/ccRkEV5nUxhhsEWkV4508f56H8xOGRcC0mwPq7HGE9PFCPMOgmSv8EJ1tV93oWXQ
	 xEVk5VSSA7Aydlh6P7L1D6QkNxsTNow/oKWTO08I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67D1CF80149;
	Tue, 18 Apr 2023 16:07:07 +0200 (CEST)
To: <vkoul@kernel.org>
Subject: [PATCH v2] soundwire: bus: Don't filter slave alerts
Date: Tue, 18 Apr 2023 15:06:50 +0100
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TBC3XHMHTK52EFT3LIGJSUN5B3ZP5P4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168182682641.26.12757632696057430648@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F249F80155; Tue, 18 Apr 2023 16:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 105E1F800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 16:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105E1F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WhJbPa3b
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I7Uxao008791;
	Tue, 18 Apr 2023 09:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=hQHa8wBeeGW9puV7XlcRtvWMmKP2kW7m/WSCDKO6E64=;
 b=WhJbPa3b+Qlgj+pRhq2QppXp8PFTTAvAbRZNsl3VZyUMyIqEhcIxUf6rBQsIXc+0i1vz
 qRLZ5w7vynYkL3bqQJqCMzEH6w9RhELz3+t96D4dv8eWLo2BsPT/CUDsmD67o+JuUT06
 B/SfovDZku5207zCfvk6biPpTEhi8RtQ85r3oSeOHIlsSsK3RKEA3yW7zUMncjmuTXAT
 3CRo6/g+D+qmubJxR1nQxvhEZ+BXiG1loCCqcFyulZz9bVzPY4ipXqp34H+ub9AH3vUc
 6sQuUUoYFjj5fZHALUFqgDiHjPAw9hpVByFM1g797y7PYuVW184mGlZOGr1h8amgef2Q cA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pyrbpxdp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:06:51 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 09:06:50 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 18 Apr 2023 09:06:50 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0A876B06;
	Tue, 18 Apr 2023 14:06:50 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v2] soundwire: bus: Don't filter slave alerts
Date: Tue, 18 Apr 2023 15:06:50 +0100
Message-ID: <20230418140650.297279-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xqcdqW-1U6epGePOSoUGzmzkzUP6iIwe
X-Proofpoint-ORIG-GUID: xqcdqW-1U6epGePOSoUGzmzkzUP6iIwe
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7TBC3XHMHTK52EFT3LIGJSUN5B3ZP5P4
X-Message-ID-Hash: 7TBC3XHMHTK52EFT3LIGJSUN5B3ZP5P4
X-MailFrom: prvs=947255f9bd=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TBC3XHMHTK52EFT3LIGJSUN5B3ZP5P4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It makes sense to have only a single point responsible for ensuring
that all currently pending IRQs are handled. The current code in
sdw_handle_slave_alerts confusingly splits this process in two.  This
code will loop until the asserted IRQs are cleared but it will only
handle IRQs that were already asserted when it was called. This
means the caller must also loop (either manually, or through its IRQ
mechanism) until the IRQs are all handled. It makes sense to either do
all the looping in sdw_handle_slave_alerts or do no looping there and
let the host controller repeatedly call it until things are handled.

There are realistically two sensible host controllers, those that
will generate an IRQ when the alert status changes and those
that will generate an IRQ continuously whilst the alert status
is high. The current code will work fine for the second of those
systems but not the first with out additional looping in the host
controller.  Removing the code that filters out new IRQs whilst
the handler is running enables both types of host controller to be
supported and simplifies the code. The code will still only loop up to
SDW_READ_INTR_CLEAR_RETRY times, so it shouldn't be possible for it to
get completely stuck handling IRQs forever, and if you are generating
IRQs faster than you can handle them you likely have bigger problems
anyway.

This fixes an issue on the Cadence SoundWire IP, which only generates
IRQs on an alert status change, where an alert which arrives whilst
another alert is being handled will never be handled and will block
all future alerts from being handled.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Update commit message

Thanks,
Charles

 drivers/soundwire/bus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 1ea6a64f8c4a5..338f4f0b5d0cc 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1588,7 +1588,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	unsigned long port;
 	bool slave_notify;
 	u8 sdca_cascade = 0;
-	u8 buf, buf2[2], _buf, _buf2[2];
+	u8 buf, buf2[2];
 	bool parity_check;
 	bool parity_quirk;
 
@@ -1745,9 +1745,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 				"SDW_SCP_INT1 recheck read failed:%d\n", ret);
 			goto io_err;
 		}
-		_buf = ret;
+		buf = ret;
 
-		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, _buf2);
+		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, buf2);
 		if (ret < 0) {
 			dev_err(&slave->dev,
 				"SDW_SCP_INT2/3 recheck read failed:%d\n", ret);
@@ -1765,12 +1765,8 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		}
 
 		/*
-		 * Make sure no interrupts are pending, but filter to limit loop
-		 * to interrupts identified in the first status read
+		 * Make sure no interrupts are pending
 		 */
-		buf &= _buf;
-		buf2[0] &= _buf2[0];
-		buf2[1] &= _buf2[1];
 		stat = buf || buf2[0] || buf2[1] || sdca_cascade;
 
 		/*
-- 
2.30.2

