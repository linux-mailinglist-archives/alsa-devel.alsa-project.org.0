Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5587703A
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:13:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DED0844;
	Sat,  9 Mar 2024 11:13:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DED0844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979210;
	bh=lPMlhZe6Zu/FURCZR//Lp7oBo0dSFp8zW5k/9lO6GAk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aKWvcJgaRyRM7SOWzcHQkN/FCVdUdlR8w+IgGXTUslCpadTmAXwbQbXiJzvvzVgVq
	 W5qk2Yveu+s9vBCyS+tSvVeyGLyhhSZUqDsZqK3Z7yk5sFsPbtON4NpVfHqIGq0nqC
	 zJ81OJKYZEgR9Z0kTlCr+bwq5Gmkc1ea5s6CoRWM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D66EF8057D; Sat,  9 Mar 2024 11:12:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1F14F805A0;
	Sat,  9 Mar 2024 11:12:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76A55F802E8; Mon,  4 Mar 2024 10:57:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A35EF80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 10:57:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A35EF80093
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Vinod Koul <vkoul@kernel.org>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Sanyog Kale
	<sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 5.10/5.15/6.1 1/1] soundwire: stream: use consistent pattern
 for freeing buffers
Date: Mon, 4 Mar 2024 12:55:42 +0300
Message-ID: <20240304095542.4799-2-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304095542.4799-1-d.dulov@aladdin.ru>
References: <20240304095542.4799-1-d.dulov@aladdin.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.20.125]
X-ClientProxiedBy: EXCH-2016-03.aladdin.ru (192.168.1.103) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)
X-MailFrom: D.Dulov@aladdin.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OWOHKWPC5XMBXUNZ4KURAFSMD26UM2IE
X-Message-ID-Hash: OWOHKWPC5XMBXUNZ4KURAFSMD26UM2IE
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:09:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWOHKWPC5XMBXUNZ4KURAFSMD26UM2IE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

commit 5ec0c8721c06fc55d8a0bb32c403228358987eb6 upstream

The code should free the message buffer used for data, the message
structure used for control and assign the latter to NULL. The last
part is missing for multi-link cases, and the order is inconsistent
for single-link cases.

Link: https://github.com/thesofproject/linux/issues/4056
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230119073211.85979-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/soundwire/stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a377c3d02c55..ecde6fcb8be0 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -703,8 +703,8 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 	}
 
 	if (!multi_link) {
-		kfree(wr_msg);
 		kfree(wbuf);
+		kfree(wr_msg);
 		bus->defer_msg.msg = NULL;
 		bus->params.curr_bank = !bus->params.curr_bank;
 		bus->params.next_bank = !bus->params.next_bank;
@@ -750,6 +750,7 @@ static int sdw_ml_sync_bank_switch(struct sdw_bus *bus, bool multi_link)
 	if (bus->defer_msg.msg) {
 		kfree(bus->defer_msg.msg->buf);
 		kfree(bus->defer_msg.msg);
+		bus->defer_msg.msg = NULL;
 	}
 
 	return 0;
@@ -847,6 +848,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 		if (bus->defer_msg.msg) {
 			kfree(bus->defer_msg.msg->buf);
 			kfree(bus->defer_msg.msg);
+			bus->defer_msg.msg = NULL;
 		}
 	}
 
-- 
2.25.1

