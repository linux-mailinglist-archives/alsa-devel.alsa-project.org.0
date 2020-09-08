Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE48261267
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52344175E;
	Tue,  8 Sep 2020 16:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52344175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599574283;
	bh=ukUJuFjgUyOo1gDEv9Qkiw/fCabzlJI3AUIJfVzFzRk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MDmC7Ze4psYqeKsR8N2fRBaHQ7qF3ca/eozUFBrTcbsuTuG+oQNmcvlP+IO7LkoJ0
	 qc/h8tSwAehHA4k7Aqh9PuC4S5ROXNavW7TrVLeYBMJ5/sOMSp7VpYFoViEgHtbvKV
	 lTpWL0dTpT4qXTkBJ1fh0JDbz0oCwH3ZyvrCvKNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57C74F8010B;
	Tue,  8 Sep 2020 16:09:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E36FFF80264; Tue,  8 Sep 2020 16:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D73AF8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D73AF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="DgR0IsQj"
Received: by mail-qv1-xf44.google.com with SMTP id j10so7826871qvk.11
 for <alsa-devel@alsa-project.org>; Tue, 08 Sep 2020 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kA7YBuYMq9b3mZzCv9QQfgvbcIlMMupkbIGoGou1wKo=;
 b=DgR0IsQjxrfz3z5ThPdVC/EGBKu1Cil2pH0g/Pfa0AUeKE5hMigysm6ESL863n4gSW
 ZFelUzvaCcKKt+R+vd3kVgnbR87hZPYasZ9DG1QkrhGu9kBZy1QhQWT1dbmJhLRleTl6
 0bqm2gKnliloULfvqnwEcNpa2e8VSxe8qQGwMAz1MDJLWFwu6nLPpEiIFrJJyq7wMvdd
 CMZy7v1PRgsLtziIdbnzOTSWT9OkvrhZsvc03OxKLr7HCwlv1ZNdBnZh8+oQeT8psZ3E
 Ki7Yaz6n+VL+ZMiMJDEhBz7VDZ0OFChwHRZPHUb+QJ3GeH0h7aZb4l/g3U3b0Ub3y2QV
 dq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kA7YBuYMq9b3mZzCv9QQfgvbcIlMMupkbIGoGou1wKo=;
 b=HM/Ed+mNMX9e0os1mlNh0Qr2dvce55b+OqWqeBrGNg3/9aletpOSX2L3UVB2vmNajc
 SHI/WRTg4MO92irvW6qyBiVk0AMmoueFMlvn6i2omEexehK5Q4ckwGUp6jKgP8tYdYXF
 IUPzz9r3hvpD8AXICuJOxU+rb2h95y09/2uqGKgSekDHuSwg+kfKMVWg67z5kOKvJ3Z5
 JfFhY5DUjaxQF6MfIZtUxP2OxIXWa+U5ySFOTNXjTQbFFJqllL9nmOURaHB7lyaiVHZO
 AkLbnbsGoQf7aEmE2Jq2Aljhe2xw46YugzswfNapciFQPw8CIwbzzLSRs3mxuBNjhwGt
 NRsg==
X-Gm-Message-State: AOAM532OOS55q/bsBE/arPRvqWDc3JaokYyqzU7wGwdk5GEYIBSebZr7
 IuEHNjjUibbYdY1VvQ1r5oRRlQ==
X-Google-Smtp-Source: ABdhPJwDTbXK3AYjXreftxuSFRet1m2rtpDGlXYZDBJkXYObWLBHJ8LTS7P+wSPf/tV6q4xpuTYdsA==
X-Received: by 2002:ad4:534c:: with SMTP id v12mr270078qvs.14.1599574170698;
 Tue, 08 Sep 2020 07:09:30 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id r24sm14447276qtm.70.2020.09.08.07.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:09:30 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] soundwire: qcom: fix SLIBMUS/SLIMBUS typo
Date: Tue,  8 Sep 2020 10:08:17 -0400
Message-Id: <20200908140818.28373-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Fix slimbus case being broken thanks to a typo.

Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
This should be squashed into the problematic patch if possible,
but I'm not sure if that's possible since its already in linux-next?

 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 100af93a5eab..c406a079d237 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -780,7 +780,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
-#if IS_ENABLED(CONFIG_SLIBMUS)
+#if IS_ENABLED(CONFIG_SLIMBUS)
 	if (dev->parent->bus == &slimbus_bus) {
 #else
 	if (false) {
-- 
2.26.1

