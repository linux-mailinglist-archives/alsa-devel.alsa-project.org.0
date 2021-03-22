Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D20343A07
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 07:54:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D32B1612;
	Mon, 22 Mar 2021 07:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D32B1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616396064;
	bh=FW+/4Ir8Ab8AO+S5Sp3Suy0ebogph0yGcYRcj39Zhp0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iXcB8YcrU4XHSuikKIMBobrITppGUS9aglI+RmYreXeWoQTXSdcX9bheyjs6xxXoH
	 vdmQLGBoggVQSWTg1LxtgesxInuIwXHyS6vV9opc48vK08lZ6JjBY8k/VyEehlk+e9
	 9EKg6iQg+uGya0iKldEmDYgMv1BuDVLbKKa8cJ/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E13AFF801D5;
	Mon, 22 Mar 2021 07:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26E5AF8016B; Mon, 22 Mar 2021 07:52:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F583F8012F
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 07:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F583F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QKYfiNvQ"
Received: by mail-qt1-x829.google.com with SMTP id g24so11567361qts.6
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 23:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MfLI22hOdGeLXd7irJ3H+09OKZv1yFGIXM4YPOW914=;
 b=QKYfiNvQEl4mlvz3ABlho8BSp575p8EYzJ1RcLIWZUy1iftQOIJ45s5GdHRUCPZnXq
 EZ2XtNvRt3HSaY5g3erfFNHop9An5EXfQZzCUOzGxBuGCxieD1A4izSImk0hI05PAAH9
 shusNvW+rfZUFZSQ1lkmF1oV5YFyH+M+pwslgaq5tFLHLcZ65qJoMsSsG35lQMY6d6kW
 a7+4xBxJdwagRLESTQeMFp4vbokqxjXEg08cSojhzbEYQKINjBFqv+6jUn/YWK6FV/Ri
 VyKrcGXwGHioytry29qOpQxzfG5/rL955XhxBopFBnpHxGh3Z8yKPr1nlH611Rnpc/kf
 GurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MfLI22hOdGeLXd7irJ3H+09OKZv1yFGIXM4YPOW914=;
 b=M4W5l0Te4/gKpbvwVQnqm7zOn+uvWm1Ki0ZIlym9GM51a/Hi0Sw61y8E2Wpfqm3hSX
 xeSBAmSF3BuqKd5w/I0iADBFfAckZ8ipV5BREY+bFHXb9OjihfPeip7eE8AlvwyuTAY2
 ANNFLWa/TG6SmEycD1U+Zwe0uQhe3rmIaQ9iJ6i2zva9LVRzYeOxF9X6xXjd4o0b+pjK
 CY0DWtz5Hp1rCMHWevCCwDbds/dezXJA34xS0WDNERBzryldz+3pozbvLNlGyJah2p9r
 8P0HwuGDs2DsdidIm32VgBoPCOHfznOFg64+ITLfO4Xd0FUl886Go8hy4GcWfsoKmJB1
 vPEA==
X-Gm-Message-State: AOAM530wXWpWk4M/pL7nku/aGHRGTiln83Vb/OvV0o4o2Uw5roPmszR7
 eJ9Sezvqn+p4Sh86f+h+qz4=
X-Google-Smtp-Source: ABdhPJz8KIcTr1yNdJJQxPortLSfqnfzcoUFqHDL72IsmuUsSgfiDMpHaV/NV9Ze1e+gbQ69JXaS5w==
X-Received: by 2002:ac8:7153:: with SMTP id h19mr8704538qtp.176.1616395971724; 
 Sun, 21 Mar 2021 23:52:51 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.40])
 by smtp.gmail.com with ESMTPSA id e3sm10482682qkn.39.2021.03.21.23.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 23:52:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, unixbhaskar@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Fix a typo
Date: Mon, 22 Mar 2021 12:22:38 +0530
Message-Id: <20210322065238.151920-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org
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


s/struture/structure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-dsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-dsp.h b/sound/soc/intel/atom/sst-mfld-dsp.h
index 102b0e7eafb0..8d9e29b16e57 100644
--- a/sound/soc/intel/atom/sst-mfld-dsp.h
+++ b/sound/soc/intel/atom/sst-mfld-dsp.h
@@ -256,7 +256,7 @@ struct snd_sst_tstamp {
 	u32 channel_peak[8];
 } __packed;

-/* Stream type params struture for Alloc stream */
+/* Stream type params structure for Alloc stream */
 struct snd_sst_str_type {
 	u8 codec_type;		/* Codec type */
 	u8 str_type;		/* 1 = voice 2 = music */
--
2.31.0

