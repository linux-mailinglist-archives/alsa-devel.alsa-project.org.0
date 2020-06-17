Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31391FC329
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 03:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F9731678;
	Wed, 17 Jun 2020 03:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F9731678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592355875;
	bh=Lz5y8+MW6hX3BjZcvjTZQ0qGuSOgmyYq045OqvY14Ak=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EVi71O1TMj1Advepn+kyS8X/i/ygKslxW5rrF27dFFPRgYO0dC3TqtbuELP3SC3S6
	 Djt2EKj7IDpp8+Q26e0/n9lEyPm6NCOMwa933VvhV+o1aA1PqOrwe7a4SUytAyAuNC
	 t2/kzCiQDPDnIz9idmrKXzxJSJgto7kpXXD28zKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D3BF80101;
	Wed, 17 Jun 2020 03:02:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07E3FF8022B; Wed, 17 Jun 2020 03:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05EC7F80114
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 03:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05EC7F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z++8msct"
Received: by mail-pl1-x641.google.com with SMTP id k1so163050pls.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 18:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2a002H3vcNUYJWpyRwovtWUn/ajmAxDHx0MWs9PMJ4=;
 b=Z++8msctdPpkpmbBjfmvMohChPXDgzSD9AtwZnDQEe3e0Kt9EMr3qi9KIGZNslsyXr
 xLp79imR3/YKoOqFdVgGw7josD+eVR+1USuL/E7J/kUnmDwQEs9qVUwl8McnXnhPhSu1
 eOpyIkmmOGW+GZ/SHwOmMCJdiTYyoAexK9/VkcLFKnV/if1DUlM1UlCVsU0rQau8XguM
 xZeinGWLaDbq1+nxElAmljy04KGeOjSbHh4GZWX0EqeWCaJKlndXBWEsjkorOAEi8czE
 RlzdUDPo84mfw9lgQ26Bq+WM1MW8+N+N2PlQjhcOyktUhvV39w8y4dFNL6bcFDzbpF0V
 JvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2a002H3vcNUYJWpyRwovtWUn/ajmAxDHx0MWs9PMJ4=;
 b=kjxlF93AGi7nRGk5zVAAUu3pALGelBZVcmrCpDRkOv5wpOkzjFmndxlYQ3x88REf0M
 rKBHiW6jg/53m1ltYX9NdXVd3jFb2iy8svWF0NiEmpCBB6rwbyWU8Ho0c3m+RDRvkWbV
 ZcyJ/+PcRHZIFy9nYYKie8PLjAuIYiwNROYDiSbnBzYxJpDMqf4kZUN6TIyvbCAkuxY5
 UgEF8VC3DlGA5on18EdRRYI1QGB3qamES/aguulHjrU5wiqN2etJDeq0Hoq9rvFh3GM4
 6sS230uILdNaqA8PB7qe510lU2KwOGcomzn8CRfroM9gpyDUgIJIZ3THJHuLI8HQfr8+
 P04g==
X-Gm-Message-State: AOAM531r+m6NQpUeh5o6a2ga+nTH/vfboTuTvmdeZnlEw5I6H7egogJp
 3A334opwSwPNt4jkKFjXEIo=
X-Google-Smtp-Source: ABdhPJywNMJ6KgTrIYao5oHl5pmyoYTV3NqSGTdY+bxKIgOQHt/ofYCsUFqaFWq+tUtpmk15FKde5Q==
X-Received: by 2002:a17:90a:8089:: with SMTP id
 c9mr5862338pjn.126.1592355765913; 
 Tue, 16 Jun 2020 18:02:45 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain ([89.46.114.134])
 by smtp.gmail.com with ESMTPSA id fv7sm3563299pjb.41.2020.06.16.18.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 18:02:45 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: KeemBay: Fix header guard
Date: Tue, 16 Jun 2020 18:02:32 -0700
Message-Id: <20200617010232.23222-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Sia Jee Heng <jee.heng.sia@intel.com>
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

Clang warns:

 In file included from sound/soc/intel/keembay/kmb_platform.c:14:
 sound/soc/intel/keembay/kmb_platform.h:9:9: warning: 'KMB_PLATFORM_H_'
 is used as a header guard here, followed by #define of a different
 macro [-Wheader-guard]
 #ifndef KMB_PLATFORM_H_
         ^~~~~~~~~~~~~~~
 sound/soc/intel/keembay/kmb_platform.h:10:9: note: 'KMB_PLATFORMP_H_'
 is defined here; did you mean 'KMB_PLATFORM_H_'?
 #define KMB_PLATFORMP_H_
         ^~~~~~~~~~~~~~~~
         KMB_PLATFORM_H_
 1 warning generated.

Fix the typo so that the header guard works as intended.

Fixes: c5477e966728 ("ASoC: Intel: Add KeemBay platform driver")
Link: https://github.com/ClangBuiltLinux/linux/issues/1053
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 sound/soc/intel/keembay/kmb_platform.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.h b/sound/soc/intel/keembay/kmb_platform.h
index 29600652d8f4..6bf221aa8fff 100644
--- a/sound/soc/intel/keembay/kmb_platform.h
+++ b/sound/soc/intel/keembay/kmb_platform.h
@@ -7,7 +7,7 @@
  */
 
 #ifndef KMB_PLATFORM_H_
-#define KMB_PLATFORMP_H_
+#define KMB_PLATFORM_H_
 
 #include <linux/bits.h>
 #include <linux/bitfield.h>

base-commit: 27f70ec4fa0e0f419031f1b8d61b1a788244e313
-- 
2.27.0

