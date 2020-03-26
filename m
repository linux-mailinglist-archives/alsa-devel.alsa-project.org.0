Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC5B19456E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 18:26:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255401670;
	Thu, 26 Mar 2020 18:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255401670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585243612;
	bh=QL0qxUXRw+YhB7WGSfSv8aDkbWewWo73uusg4++o6ZA=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QVcC+VAbTFM1GKubqzkpycRg3yNTUUd+obowNo9mRhGwuVUOddgvg+mA5MMCZeNo/
	 FyncDRgVb6smPt7yO5gdipKNVe/QUrbT83Z92sCGorMy9yjUe0AnDZC2Pvgvp18t8A
	 CDr0Tzj9dNGo5bFK01rA91dzWUEIzmPaI1/fQbRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362DAF80095;
	Thu, 26 Mar 2020 18:25:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C92A4F80227; Thu, 26 Mar 2020 18:25:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 370E0F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 18:25:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 370E0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="KWyLYlFq"
Received: by mail-pf1-x449.google.com with SMTP id s8so5651665pfd.23
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 10:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ORmUSUtMfRthZSgIgNleni10jnUu0xs0YPL13mNZ/NE=;
 b=KWyLYlFq8o7jxlgnH34j8OJCRRgm9gRtqNBxsed6Sny4C9RwfW3BeeY9a6m4u6EprZ
 51jFmyCOmO6jdJbz9Gojk0W0yqxaGHiKuvfw+PMMx9Dn94DfxOJOqANHt1sRzrgPOcKS
 onFTQsuLpVi0OMF5J+uMwUOevghKQ/8nossTFzpxr6Rd6j3r/Rxzl3AQl7LCVckSdOea
 XNzOSeHEasDpxzI/PNifOa1bD8eBbuRyR8F5B8soLWsGmZIvWFX1OSjiWRZbr9fYRkhI
 zNn3CDOHn7Nd/ylM0m6dVLoOCxlfUgvUu0nhrkxxXt/MICG2+GHIdtNmoeBL/DG/k0Fq
 jaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ORmUSUtMfRthZSgIgNleni10jnUu0xs0YPL13mNZ/NE=;
 b=L8mgK2yufoEt3CBgquHpnANGuhQg0cqWyflm2faVbumlxJBhqtaXTy822hv9ub6u/x
 dXXc5Am4SJ9qXmFtrt1PLRQDTjAsKc3O1HLmCbtsgjKYyy5sYT9Mcqj9XuuyKF9yUsFX
 prol1MjAlgm9t+n557LBV6fOaRyhQwAMbTICbTAa8dQB6az6ftsd2iSNtE0gUd99JHGi
 pxq7jgdaeMZ9l3as5WIAZ024aK1eY5/630e/jfah4KX4YsmA7Qy2/PoMr1t0sa+No6Dn
 z4JhaggUSkptJjlKvYDXldm1hd6J6w/4m9NNzqovSuxciXCNpiMYLZiETb6H47czAQQ2
 gbLA==
X-Gm-Message-State: ANhLgQ1NKpgI1kAUc/AsHmsPR3AijkBa2925sZSCDpgDiOuVbwRQXBk9
 rbOBg57YccwFUfwxmibxLP0ciiK7UOgfghI=
X-Google-Smtp-Source: ADFU+vvCdNOQiMzb+fr/gId1WBu7XP5LxEcHieyQODvhu5d5p5y0gwZ285rhR8riYbkBhrsbX5Li/GnKFW5lkPs=
X-Received: by 2002:a63:844a:: with SMTP id k71mr9541565pgd.79.1585243503414; 
 Thu, 26 Mar 2020 10:25:03 -0700 (PDT)
Date: Thu, 26 Mar 2020 10:24:57 -0700
Message-Id: <20200326172457.205493-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v2] slimbus: core: Set fwnode for a device when setting of_node
From: Saravana Kannan <saravanak@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 John Stultz <john.stultz@linaro.org>, kernel-team@android.com
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

When setting the of_node for a newly created device, also set the
fwnode. This allows fw_devlink feature to work for slimbus devices.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/slimbus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 526e3215d8fe..44228a5b246d 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -163,8 +163,10 @@ static int slim_add_device(struct slim_controller *ctrl,
 	INIT_LIST_HEAD(&sbdev->stream_list);
 	spin_lock_init(&sbdev->stream_list_lock);
 
-	if (node)
+	if (node) {
 		sbdev->dev.of_node = of_node_get(node);
+		sbdev->dev.fwnode = of_fwnode_handle(node);
+	}
 
 	dev_set_name(&sbdev->dev, "%x:%x:%x:%x",
 				  sbdev->e_addr.manf_id,
-- 
2.25.1.696.g5e7596f4ac-goog

