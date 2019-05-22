Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B537826850
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 488BB15E0;
	Wed, 22 May 2019 18:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 488BB15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542747;
	bh=QE8IoMJnMrQcbJls1dhl05z59v5eNU3nOhHTfNBHmHM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gF4ChAx2uHpAQ+rhByGizQc6/0TbA6O66nrUVsufSiMklhLVoCRRYqjxXxrqNPjtf
	 lKejxYhl4MqWnsznhlDh/ZGVP8jTfdoAPiLUWLOYJJNlcslXuAmmaawAqGfzmVVm4w
	 +KbnZQaz2EU3zpC43mhJ277TZJJjioICIJWWWGuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0CF7F89636;
	Wed, 22 May 2019 18:25:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4A22F89630; Wed, 22 May 2019 18:25:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45AABF89625
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45AABF89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vmezZTYs"
Received: by mail-wm1-x342.google.com with SMTP id j187so2874436wmj.1
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWGOVdMecY70uPThuN9Z8RHD52HpQ5FIVR/nn5jAdfI=;
 b=vmezZTYs//lLcUcn9Z2DSFVgsemU319BFV8a/+s4QFULfj+oV1MkrsVnARJSVUcyn7
 2I+wVuPvs2tzsECElLxCGkqQzkEqht1LnNWCseU2XQt1puHVkJnfN0pagtJLjeV+JiZS
 w7/AoGnhzoewNRIHjyHsiSGerFiIqHMxJUr9O53Yhn5RrZSBVe+rJhktHXli/9xmjrE4
 nAve702w/sZnEWEb7+6h6AZX5/2M136TSuszdl9VG9aHweEnp1ii2wsJ3PHq3iLN5ZpZ
 MCYZYvdJB2SLROSmcFAqJfskNvtQzLsRVIx62tE73OuP+POEIfb6yfrK30MFGOyNliXl
 zj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWGOVdMecY70uPThuN9Z8RHD52HpQ5FIVR/nn5jAdfI=;
 b=pdPYxj+zg2eq++WUgLuR3vjcdBpGs04LV9p0HF0KMw4aovVenIpF9iS+NjCkAi/FRq
 Wn1e4xH1aN/PXwQMviKMMHtK6vrI3qPMy4cqBXqprNo/qs/5MqzwFRz1KsxIKwFx8oac
 idjAJ55dKVoltebAD5uT+qAYfvXdiE7Bx/+Zaxsmgfe2Vo6vBY1YwE8xrbVfxIlT6PV5
 t0O423K/HanyzcajeXiX48+One4OmyBp1aFgdUBFpnQlGtTBp7t57KrXShgZiP9M7Z8W
 N2yvpcqVH24ktFwmEOrYw4ws3JOQIs2P22C6CMRa6Olhr//OfNlWckdOVQT4mDwj3Yk9
 w3Zw==
X-Gm-Message-State: APjAAAXm/syjVF+bKfgCRhUKIuU9lobvGq+P+cMObd50tVmivRg4m55Z
 jlZhPHy3E97FDcyl23cAbtoVwCnkiBo/Uw==
X-Google-Smtp-Source: APXvYqx3cV+KcaZgMn/uTRwxQMjy04ngPuH6R/wzSryVgaFWXel2dzT3vOZoSzw8BdI52xi8p/n+gQ==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr8032679wmc.81.1558542318259;
 Wed, 22 May 2019 09:25:18 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c14sm20390656wrt.45.2019.05.22.09.25.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:25:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Date: Wed, 22 May 2019 17:24:43 +0100
Message-Id: <20190522162443.5780-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] soundwire: stream: fix out of boundary access
	on port properties
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Assigning local iterator to array element and using it again for
indexing would cross the array boundary.
Fix this by directly referring array element without using the local
variable.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/stream.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index d01060dbee96..544925ff0b40 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1406,9 +1406,7 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
 	}
 
 	for (i = 0; i < num_ports; i++) {
-		dpn_prop = &dpn_prop[i];
-
-		if (dpn_prop->num == port_num)
+		if (dpn_prop[i].num == port_num)
 			return &dpn_prop[i];
 	}
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
