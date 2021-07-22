Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9C3D225A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 12:59:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5061116DA;
	Thu, 22 Jul 2021 12:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5061116DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626951554;
	bh=nf23O06qE62w9mVjenazulQAhxANbVfA0QEK/ePjKaE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DBzvng8upJ9XLq600Da6IyKyk37gr5ceXnb1mJ26HPHTxClQ1joI3bLmCNaTr6crf
	 Bh8hQNpaBSPKifeUNC/HVyNiph8Dq3EFaGOk0+pMxECEjH5GSamBQ7Z3Z8JL1dNZLC
	 Wc92IVHfLiAgog6E5cA3SwVqnXzv3d6QN5PVDDwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD404F80256;
	Thu, 22 Jul 2021 12:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CAB4F80227; Thu, 22 Jul 2021 12:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C96F7F800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 12:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C96F7F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EMpD0Y5k"
Received: by mail-pj1-x1035.google.com with SMTP id my10so5610495pjb.1
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=keprLEvQ6kzmfss+PY9Ymf8ZxzzEljbUGjNECEDOpCE=;
 b=EMpD0Y5kmc1b4rRLX/oPEJJcSx372ijyD0LH7hIhnogSpvCmIqtbi0rFWAD1ukEmDw
 R6jitOHCrRxwYuWOAHnlefXehjSHG8+8fu/z9JtaRW8qzuLCRUDoiTRkfwv+9n29sZ9J
 3LFYEssjsHnP8YLaiGF4s3nUm4jyQBcfqN7rcrKRfTuwM3JjtRRR2I98sdQh1dVaDM06
 cRf1HjUo9X5pcKMnzzLC1XyX3U15R4+buGhf+hsN/RUzrBsB1GK1oOYEVBzvf8xXvkD1
 62QGzb9LIlv5WtObCiH/IFuKSllQydmO+zgEsI8aN6WCQaIxw51PC9WXS+i/kS28ovz/
 tciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=keprLEvQ6kzmfss+PY9Ymf8ZxzzEljbUGjNECEDOpCE=;
 b=nIvzTtagYb6ocGE2hOcusMZ8sVXcN7sfJZ8Cgh6GcwZc2DJJ/HoUEMPNqkQsVRqnxE
 rFnPyTz9y2mDEkP6TruAVeavmYnsIZGdOyYE4VbNgGvpUH5MbiJj/flxDksWZK0/dzxn
 EOJz6PhxT54i8wAvATzgTYTbCjuydrSFLcrGQ+DVjgPFMG0Wyz6Y5VGynvoodvzlTgpL
 Lluqn2NT2SA845oyWYH4UOsyFVQ7ILEmDz7BuDtFl1hICiI09R7k/wbgG8d83XGF6+Ux
 dDHRHOodPyI2ylKvvlH0iRjScTkq/qmxY+6Z+IbMZDctZDLvqGnW6Q+QRJ1bquPGWw2E
 eg1Q==
X-Gm-Message-State: AOAM533GssAFyQutyI2tAamyRKfS60jAoK0a7q6hDUhIrljIsJxDVPmv
 uZuYRvZQNtq1liB1mVS93+Q=
X-Google-Smtp-Source: ABdhPJzgg/V/keoqHBCfWG++5HUaKDkKHRKaDhk6R9KAYsZunDfLFfd3ecs4BeatdH5xvAQudqpU0w==
X-Received: by 2002:a17:902:dacd:b029:12b:acab:b878 with SMTP id
 q13-20020a170902dacdb029012bacabb878mr3683960plx.4.1626951402411; 
 Thu, 22 Jul 2021 03:56:42 -0700 (PDT)
Received: from localhost.localdomain ([154.16.166.166])
 by smtp.gmail.com with ESMTPSA id c5sm30535481pfn.144.2021.07.22.03.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:56:41 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: stream: add s_rt into slave_rt_list before
 sdw_config_stream
Date: Thu, 22 Jul 2021 18:56:11 +0800
Message-Id: <20210722105611.1582803-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Dongliang Mu <mudongliangabcd@gmail.com>,
 dan.carpenter@oracle.com, linux-kernel@vger.kernel.org
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

The commit 48f17f96a817 ("soundwire: stream: fix memory leak in stream
config error path") fixes the memory leak by implicitly freeing the s_rt
object. However, this fixing style is not very good.

The better fix is to move list_add_tail before sdw_config_stream and
revert the previous commit.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/soundwire/stream.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 1a18308f4ef4..66a4ce4f923f 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1373,19 +1373,11 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		goto stream_error;
 	}
 
+	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
+
 	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
-	if (ret) {
-		/*
-		 * sdw_release_master_stream will release s_rt in slave_rt_list in
-		 * stream_error case, but s_rt is only added to slave_rt_list
-		 * when sdw_config_stream is successful, so free s_rt explicitly
-		 * when sdw_config_stream is failed.
-		 */
-		kfree(s_rt);
+	if (ret)
 		goto stream_error;
-	}
-
-	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
 
 	ret = sdw_slave_port_config(slave, s_rt, port_config, num_ports);
 	if (ret)
-- 
2.25.1

