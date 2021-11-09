Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4044A6CE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 07:25:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B18C1661;
	Tue,  9 Nov 2021 07:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B18C1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636439099;
	bh=3dWfkK2Zqb+rUHKn4wUi4IwG0t2tlxF6lZ7GVDijGzM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fu/t4pe6Yfcl5VUeyc1SE/QFRVvAxn7E/ihCxOQdmT+ULHYvKN5Dl/vxr2dq4YucZ
	 fIGvNGvy50LC52Uv5k4hktgaRn8JOLvIY2okMxzVdvWjL8GU/ghmoksaYC0hfZKR6U
	 /4nZpcIrGf+ViTQOY6HJXBivC3Fw4zDYy3UjWnFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 153B4F800C1;
	Tue,  9 Nov 2021 07:24:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEA43F804D0; Tue,  9 Nov 2021 07:24:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33B6BF801D8
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 07:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B6BF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pPvXkt6q"
Received: by mail-pg1-x52e.google.com with SMTP id n23so17524660pgh.8
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 22:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=LOtwJehnAZEQdODws1H/4hicAl69cBcZmemszXkR6A8=;
 b=pPvXkt6qpQ2prIqpYuyCE3QK7sJAP52+7Qt4B+uYqhY8z8gC2jOs3SJEicQ4gJkSpX
 XEUjAgt5DwhocDUGEQFNGYxxVIGaX2LJ0QOVUFbXBmGGFDiYvwAm+nVd/o+MrzbNF7X4
 KYdzSatuq4nLqPrVT5J3nKUz8U+dULAlXcOE4rJX4cfMe9yy7TDSwqefVoSxikC39ukt
 523vrqGclwbuj7zEwoOYLxsS4IE4LaJ4maO8l6ElOxkfyWP3yRcliTEVd1KgRNS4xe1G
 oP87jzGSaz6HjVrwweIc0RkwHV2S9YNq6w1stuMEHOxcwiWwcc7jolr+o1WIQlyqS23b
 EOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LOtwJehnAZEQdODws1H/4hicAl69cBcZmemszXkR6A8=;
 b=GheaWUkpzAFigLehmDXmqIyUu9KL2g3u7U0j0iN3rnyhpiyoXx/IPiVCV+1FxAXR2H
 5kEfnkLdwT356tRkgvOESmqs/K4LdhG8uVgfj1bZc8jxWR3hlf2Di3q7tVms9mRF5yao
 FTa4x7g1nZ4t/GtNmQc9/CSucqhd3k36rQt+t1V/70azjRJ1cIDFfkThx1b2JbXlEk6O
 RGmKBdo9PKogfp0YRUQE6xIAGDccHdgZ5zVz6fi1pfQnbYII7dQ0JNKIUCZNgVqDtWMe
 iMftjgJ970VVQ4/1REgGLEgZZYXnspV8TFEf34s4n7vD8HGmRXTbHYxMY2l2ZGMJWzEb
 rxwA==
X-Gm-Message-State: AOAM533lNIbrx0mUUqk/ayKi3dNSGJGmz6Rc0zU93BByJ47OG0+h6d+O
 YWGiCyCtinTwA73zjKq1gUEemafIev4=
X-Google-Smtp-Source: ABdhPJw7TKjsRkUk6UfUap34xA5BAyFh0KRzyJST1/V2eA2xdEz7ekDNYBC2Z28TwglPzwe5bmesKw==
X-Received: by 2002:a63:8c5c:: with SMTP id q28mr4110197pgn.244.1636439033488; 
 Mon, 08 Nov 2021 22:23:53 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:578:468f:d592:ff78:ffa9:3df7])
 by smtp.gmail.com with ESMTPSA id x33sm6856718pfh.133.2021.11.08.22.23.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 22:23:52 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 0/2] ASoC: rt9120: Fix settings and add rt9120s compatibility
Date: Tue,  9 Nov 2021 14:23:42 +0800
Message-Id: <1636439024-15877-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series is to fix settings and add rt9120s compatibility

ChiYuan Huang (2):
  ASoC: rt9120: Update internal setting and fix auto sync problem
  ASoC: rt9120: Add the compatibility with rt9120s

 sound/soc/codecs/rt9120.c | 59 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 10 deletions(-)

-- 
2.7.4

