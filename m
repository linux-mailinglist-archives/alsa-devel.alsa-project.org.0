Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914F85A12
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 07:53:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B368857;
	Thu,  8 Aug 2019 07:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B368857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565243580;
	bh=zc5zcfFBCVQfLhhfbSKURGNEAbuQ2ZtBpVRXrVUYf6M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mqF7jVabLeEpaUw/K4UGfistPoEYlsOLxzTSfzD/Ghbqt/n7ijTajTQskeIs5/Jfz
	 BKn3TDw4R2G75k5S//7oovHwNGzR0nAmtOw3YXyOjgQRcrqg9ib6RpYDeg9oue16Ab
	 h3lydqUeYi+wuMIXZod7Z1+iYRx96YujaqSY8F4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7BFF804FF;
	Thu,  8 Aug 2019 07:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6296F80534; Thu,  8 Aug 2019 07:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD9E9F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 07:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD9E9F800E4
Received: by mail-yw1-f65.google.com with SMTP id g19so32841807ywe.2
 for <alsa-devel@alsa-project.org>; Wed, 07 Aug 2019 22:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AXLTKpmnboGNtrfg+DmdekyXKJkeWsR7+WNv3PWE/bM=;
 b=pblpg2a9MxtWr9Xl0SGk/ML/yOplatHpVFDhyQPpjzX/wieUY5KE5IhPP9JfMfFAjY
 Q8zVCkXqcgHEAV+a2IrISVZnwfX/0H8lLBXEWHwE85yuZysCxaVmQpa275cyE0xhTqBe
 Qeae3Ul4doC+uyTUhN1f8gW9ClxkUxNWDEO505OfPvzhb1iKQ0cnHQF5IhIDpGhYdpFG
 UhX8nnv2rgfP92I2U9mN/ASGFs9Oalu/Hq65RtcOk9Iig0jxYaP1pbTZkOKXbJVm/yBz
 dm7s+R9vIfqxvVoYhu7taklX1lm7gqCZ3OZlmebvXhfahdHmMNoHttGnr3cHErahBKlU
 8ISg==
X-Gm-Message-State: APjAAAVVUxHVBbCbgRgpi0n1OokvjgiXwcl+5789ZgiMajHrQW4oiLiU
 HpNJIUTPwVVn0AK14uGa8BU=
X-Google-Smtp-Source: APXvYqy04G9o5K9YSoY8D/Ys2fE3n/lh1gBpDYtzN1RRi/4fpOtXuOscLdRgaSUPvQnaasDNLm+h8Q==
X-Received: by 2002:a81:6288:: with SMTP id w130mr8042384ywb.343.1565243467745; 
 Wed, 07 Aug 2019 22:51:07 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id q35sm1080020ywa.69.2019.08.07.22.51.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 22:51:06 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Date: Thu,  8 Aug 2019 00:50:58 -0500
Message-Id: <1565243458-2771-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:FIREWIRE AUDIO DRIVERS" <alsa-devel@alsa-project.org>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] ALSA: firewire: fix a memory leak bug
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In iso_packets_buffer_init(), 'b->packets' is allocated through
kmalloc_array(). Then, the aligned packet size is checked. If it is
larger than PAGE_SIZE, -EINVAL will be returned to indicate the error.
However, the allocated 'b->packets' is not deallocated on this path,
leading to a memory leak.

To fix the above issue, free 'b->packets' before returning the error code.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/firewire/packets-buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/packets-buffer.c b/sound/firewire/packets-buffer.c
index 0d35359..0ecafd0 100644
--- a/sound/firewire/packets-buffer.c
+++ b/sound/firewire/packets-buffer.c
@@ -37,7 +37,7 @@ int iso_packets_buffer_init(struct iso_packets_buffer *b, struct fw_unit *unit,
 	packets_per_page = PAGE_SIZE / packet_size;
 	if (WARN_ON(!packets_per_page)) {
 		err = -EINVAL;
-		goto error;
+		goto err_packets;
 	}
 	pages = DIV_ROUND_UP(count, packets_per_page);
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
