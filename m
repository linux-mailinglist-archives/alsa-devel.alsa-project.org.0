Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5A81B4D12
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 21:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4535B16A4;
	Wed, 22 Apr 2020 21:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4535B16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587582607;
	bh=k95E3PF5/wpb9CdGZcaR8eT2Xnh3c/SMQCEl3xb01O8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EfsvlaUqRGVGHZGFZY9eY7EWm9Eg3Un8FcWInVQ5Rzwj6KpYK1uu3f+eAxvR3Wnh7
	 uO1tA7mvV3xOEWLLO5ZKMceCYJVDvYG7NEJWRHhT1ylx7+dw4RY/dWuMmK51AtRSpz
	 8HA3i/anQdQZp8qLCam105IBzmTKnz9KRvtYDihM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D93F80108;
	Wed, 22 Apr 2020 21:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C2A2F80108; Wed, 22 Apr 2020 21:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65ECDF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 21:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65ECDF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sopfsph4"
Received: by mail-wm1-x342.google.com with SMTP id y24so3769425wma.4
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 12:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+zDLeLkxWO2+hMNosAqgOgGEHIDnT4PWh0YVuszpFwo=;
 b=sopfsph4Ox9cam1LRYncWs+ATliTvE3+yCH1/n3zC+PX+46tWteEs5pbbO09FpD9Ld
 r/T8sQSTxn6hVmtEs5YuDM251mPwNVnwDPNvrrEdFtU/Ia5ZpYHG2mWVZp/WgoY7RzSf
 2zcKZDO5Skbh8RJr81lsXpB7rciNEqJdeFtu7FyXpJj6pEdA+xmnQUJj4L/F1enZxBep
 GJs7gobSR07T3i7GHMWgpHZec4chFv030zhxoWPVGqwYz9wZKBdv6ufhXypKqK87WOVS
 A4sCOjXPpfzDVmpHQit1mR5bJuE1U0tQNOUWNYqhNDefBIPReC8am1RubNFKiXDTpUIW
 w+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+zDLeLkxWO2+hMNosAqgOgGEHIDnT4PWh0YVuszpFwo=;
 b=lhYjXIN/mFm07J8UZvIXmc+9uwuEytD2VwARSsPuWxx4n5Evg3QCacPf/wd6Ul8GMY
 3u6LcaYTWMYCDQqlST2MLRg1IBcSBZh7SFPd9/V5/z9ci3/240ZKvxinwOZ/f2Gm0XKT
 RP2NcoeLJLNQUkFrYDFRqJ9oDTTJZMJDFUPQhM+Nk6SfGQKEBjP8o2z959Bq6mo+1X5s
 TnnVCqvteFT/saxBINwshnl/tzVBIgXIT4rWw3U6+Ab/y+bWiypMBqohSnzrK1XdSYvR
 5eqPUJULyvTNgxKxeWwy6XPC27EpIBy5Fa4W0WVrqF8T7NuDaoggEMoIhnOuyTrwI2Xv
 VLPw==
X-Gm-Message-State: AGi0PubUofoy7eYNm6Y8Sf7lQ5+PzcSWgr17oB+JJHhl/V0JLyVtyVSQ
 xHbuSlyeIz9XLLb88Jl5MrM=
X-Google-Smtp-Source: APiQypKKOtJHSktS3ZUja/AxftlJ/XBl/AguO72IhuFkq9dh8eOQNeBgIAM46126fomV+VYhlr96FA==
X-Received: by 2002:a1c:5403:: with SMTP id i3mr12817772wmb.10.1587582497902; 
 Wed, 22 Apr 2020 12:08:17 -0700 (PDT)
Received: from debian.lan (host-84-13-17-86.opaltelecom.net. [84.13.17.86])
 by smtp.gmail.com with ESMTPSA id f8sm201837wrm.14.2020.04.22.12.08.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Apr 2020 12:08:17 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] soundwire: intel: Remove unused function
Date: Wed, 22 Apr 2020 20:08:15 +0100
Message-Id: <20200422190815.5975-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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

The function sdw_intel_init() is not used anywhere, remove it for now.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/soundwire/intel_init.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad7053463889..2f37dad06321 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -183,29 +183,6 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 }
 
 /**
- * sdw_intel_init() - SoundWire Intel init routine
- * @parent_handle: ACPI parent handle
- * @res: resource data
- *
- * This scans the namespace and creates SoundWire link controller devices
- * based on the info queried.
- */
-static void *sdw_intel_init(acpi_handle *parent_handle,
-			    struct sdw_intel_res *res)
-{
-	acpi_status status;
-
-	status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
-				     parent_handle, 1,
-				     sdw_intel_acpi_cb,
-				     NULL, res, NULL);
-	if (ACPI_FAILURE(status))
-		return NULL;
-
-	return sdw_intel_add_controller(res);
-}
-
-/**
  * sdw_intel_exit() - SoundWire Intel exit
  * @arg: callback context
  *
-- 
2.11.0

