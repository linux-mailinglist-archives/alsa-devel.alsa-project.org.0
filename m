Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE22165B6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 07:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2C781674;
	Tue,  7 Jul 2020 07:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2C781674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594098059;
	bh=zBAVOOxoNZnFHxWDjotrxyPb1iXjek0VoVYLkHfl22M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iN7Z1VhhvrHWyufWYkyU9EY2FcwAFxqHEZYv2BwwYx8348uwsFa/L+GizxAYmkZFu
	 S67V9h/vPGM9N8sJYt1LNjHQpzxYNvDaTnR1fdwvgkVWSI/U6N8jzP/PuSQbjMj3Vk
	 3stG20Ko4jP0MPeZH1EL4/ICmp4iQwW9b5hHFswU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A79F80257;
	Tue,  7 Jul 2020 06:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25516F80216; Tue,  7 Jul 2020 06:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B68EF800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 06:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B68EF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uftFUaF0"
Received: by mail-pg1-x544.google.com with SMTP id l63so19412287pge.12
 for <alsa-devel@alsa-project.org>; Mon, 06 Jul 2020 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fnf5BOlLTguFdAJt0eKBqSFaZTROPVc2dJ5RoFXNCYA=;
 b=uftFUaF0PjHg0naEaC4J+NSl69Db+2w3bJ6URTUu0NQ0/8Syog8GFyJos/mOW2tD3B
 jgroHtO7cic5K99ZvRpTyH3vKylb+A0A4Z0kAt/s3H68nivRpBkODHGFo0SSHvHlypwh
 39U/wnLwe7ElfgFYL2M2narCr959zv9/REkd3bVvgAHOKfWH7bzVQO/xuHkcaI+QvRSB
 gY0D5JyQgoohO2h9EN1s4UsZ/KR50Mpd3MUHjvAuX7FkSxFL4Bc+vX5F5Sfp+0a4wgOH
 /hOfzJ5VbGOy6fluH/BL0dg/w7IxdNeK6Y4yJ5pAwXEVI9VWsrihdxwX7DdXV7ywcCzw
 H5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fnf5BOlLTguFdAJt0eKBqSFaZTROPVc2dJ5RoFXNCYA=;
 b=NpJL2w6ddeN8+luCSbgs1pZXz4UAF70oc/9k/H3WBkn17vvqpulbsSy9tWpOnesJTw
 TUp0SaWLIwvL17TRKdnXOhLxYX4CWnVw6XUTW8unqn3vXQTmDv8F/u0iP6uAuYewtX1S
 bVKnK1y31jzIrT2uh98k1k7pyh1u0T4PjWBoOP7PLT9nYARbFiw1QTLfj+MvoHzgXSIC
 jSzNXp+S1OYPhCuTZETQPqmnXz2eFsA3On5+du40/aM3o4jeK7rwSd3CEkUMXDy4Yd7h
 L4GJ0rBbyr+Tnle+M0bhXlIuyG6Nh5GOYcS9sDnwxUtPW/qbD0w7XNkAiLUaii/1sJoo
 SJJg==
X-Gm-Message-State: AOAM532rg0O2CaDfjSj161j8w+TZ5FY7+k3rfmcL5cq2apwBQEYRusRs
 lVZgoCAVSvMEHUz82ow/CVE=
X-Google-Smtp-Source: ABdhPJwwBjwRcBhX5cznZ+2DvGqB7QhUlH1A9wSx7ThIxOU26AbLCZvRJz73gSNVuaTqZ6nuI1r/Kw==
X-Received: by 2002:a05:6a00:1589:: with SMTP id
 u9mr49055656pfk.201.1594097943614; 
 Mon, 06 Jul 2020 21:59:03 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (searspoint.nvidia.com.
 [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id d18sm1017930pjz.11.2020.07.06.21.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 21:59:03 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v2] MAINTAINERS: Add Shengjiu to reviewer list of sound/soc/fsl
Date: Mon,  6 Jul 2020 21:58:29 -0700
Message-Id: <20200707045829.10002-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, shengjiu.wang@nxp.com, timur@tabi.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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

Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
Changelog
v1->v2:
 * Replaced Shengjiu's emaill address with his gmail one
 * Added Acked-by from Shengjiu and Reviewed-by from Fabio

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 496fd4eafb68..ff97b8cefaea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6956,6 +6956,7 @@ M:	Timur Tabi <timur@kernel.org>
 M:	Nicolin Chen <nicoleotsuka@gmail.com>
 M:	Xiubo Li <Xiubo.Lee@gmail.com>
 R:	Fabio Estevam <festevam@gmail.com>
+R:	Shengjiu Wang <shengjiu.wang@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
-- 
2.17.1

