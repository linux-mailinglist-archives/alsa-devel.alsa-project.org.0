Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 151E73F6F5E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 08:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83B89168C;
	Wed, 25 Aug 2021 08:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83B89168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629872475;
	bh=pFb9wENg9crFAXEjzqJNlTkIT9F+exSLii2IIn2dIss=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ls/lDI/G3kxvPB3JAK+YTgd0rFZPORWz5eT1ii3qx7XOcvGZJN5G8GqclhYl8Eqs7
	 wBoQVGkkmGw+deLv8O8oUM71XSGQpepfhh2lHgAaTyKdGWPgByhGLjZdN/8P0tLslc
	 HkNXtmKW5M2V9iyxi5fvOG6MitddC1cObDxauF04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8881F804E6;
	Wed, 25 Aug 2021 08:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C696F8032D; Tue, 24 Aug 2021 05:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF1B5F801D5;
 Tue, 24 Aug 2021 05:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF1B5F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c5X594Q+"
Received: by mail-qk1-x731.google.com with SMTP id t190so21619214qke.7;
 Mon, 23 Aug 2021 20:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HgCyH+gJ9RXo5Eggw+y253SR+mBguM7vqFNUFDvY1Pw=;
 b=c5X594Q+Cc494R/qbqWEZ2pGSYL/SCeR0j795SIsoU/2fePpPAy4rzYYLXwLU32hf5
 l6Cf7ZMCl1WOu/falJjHaewc8k48gGxiMJT9eIpk26pxs4l0lJTob80uNA0FycEvuETr
 GZbK1/jGWqLJteqlSDjCNz+rw88A41i3ZLwOAWU1TQE1jkuSblnLkS4jXqujowUjBLpA
 u6zrcZMT8dE2ajJ2YZeHaT/WZRvGHMHUETdbNtATV7Y4J5cEq/b8PeQwGH1L5irGjXH6
 otAv5AClBVpLqoY1oFYYNw+V3Hh8NLJOPOrNzEboN3Zb/qYJ40eeh3/zZuJuaQznlSV+
 VAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HgCyH+gJ9RXo5Eggw+y253SR+mBguM7vqFNUFDvY1Pw=;
 b=GwnsoDqbghg7exRUvQkfDg5n75D4eEu99Xwc/ibCeTqiy8OWDdOQx3xhp0ZwD+NOaX
 mHciwKCJQxHPmtXmcl0GXCiNhgiPxrdN8w7QWAsDV23W32ilqO1IpbkbcpPeIWNbB2Qu
 DUglmI6E8KxblA3dogdJqG5iBfU42LJAXNiDTwzkMSoHDoJqyiJKIkU0N6hZ1c84X4Uv
 aTPg9JvZsMaKeCautW8NCQg85Rk8XIXoHXUq8R5dV/eC1YyuMV4eLT0PmRj3Wx+j48eJ
 Ek83lxNPhvwhqyG0NjbwI6W8pilXvpyXxmZwRWaLQpfPu9yhEgLhy2wlkjtkjb2uQEPU
 M4GQ==
X-Gm-Message-State: AOAM531MdVA3w4OSEyv4KFoYBsAsVKYr0Mm9RsAuUoa0OVvmFu/UhgQ+
 XHQGBrxbgQhqlhF6plSNXZE=
X-Google-Smtp-Source: ABdhPJxDkRdqMNWpFkyuC+eJOdt2zLovNXHNNe/fb4Kn7yt8NpMZ+7H++qiW7zqlRauVQ+0edHLexw==
X-Received: by 2002:a05:620a:648:: with SMTP id
 a8mr2324414qka.272.1629774030591; 
 Mon, 23 Aug 2021 20:00:30 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id d20sm7459876qtw.53.2021.08.23.20.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 20:00:30 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH linux-next] ASoC: SOF: intel: remove duplicate include
Date: Mon, 23 Aug 2021 20:00:15 -0700
Message-Id: <20210824030015.57267-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Aug 2021 08:18:36 +0200
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Clean up the following includecheck warning:

./sound/soc/sof/intel/pci-tng.c: shim.h is included more than once.

No functional change.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 sound/soc/sof/intel/pci-tng.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 4ee1da3..4bded66 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -15,7 +15,6 @@
 #include <sound/sof.h>
 #include "../ops.h"
 #include "atom.h"
-#include "shim.h"
 #include "../sof-pci-dev.h"
 #include "../sof-audio.h"
 
-- 
1.8.3.1


