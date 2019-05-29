Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130F2D577
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 08:24:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A595A1685;
	Wed, 29 May 2019 08:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A595A1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559111074;
	bh=sYqJi6fWwFZDwrKS/RJFvtqAJ8dG9rCJmgmho8CO2+c=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TT+vpxKxGcUxkl3y0RBYGsuMxEn2w6BYJxHG29DBzKW5QAnazEF+KVvxT1LZ/xEcK
	 hcZJV3vASJtg2oSKzundSPVN9FFn2DWzR0aXCmP9A438mK4PQpjeulb/zhFHw+dPJM
	 EmhgsK+DsUUux72yRryD7QYFeTTxs5r6ht84OG2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14CADF896E4;
	Wed, 29 May 2019 08:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB2B5F896E4; Wed, 29 May 2019 08:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E323F8072E
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 08:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E323F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CfEVihCB"
Received: by mail-yb1-xb49.google.com with SMTP id h83so1159249ybh.15
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=JwBx2vunQtX6lqgCjOmlTdaj2y97xN03Mr7VsNFDB4k=;
 b=CfEVihCBWuc4w00tTo7X4IbMIxHaC7WvbD90x1puqyV6+xm1VQcUeN0UeqLaCuN4/S
 gaex6ZKbplZE+3osDCp5ftp2QIqyzMuPiNqQeDlemENeFtEv2k4W9++DWyBglBKRXHI5
 L/iICKqm/jMZUDgtYIfrr0xM921e8KsCX22s59gNqK2by/a67O5SsiBBmFW0V7d/xdNc
 zSmMqQpCSrqy5fSx/fzK9gFmvOgWYrNo8BOJwHmTFr/q/5nE+G1nm/GX5RmTA4ceFXTD
 Ernnor574Mvs/9TzhE0JH//pl1Ev8KjYZPpxmVEMIhbnicbzhRmSZ0tuopOhFJszyPAO
 eMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=JwBx2vunQtX6lqgCjOmlTdaj2y97xN03Mr7VsNFDB4k=;
 b=hcMImUGQGvkkggc0dFNSpzacpsRH3OU7xP+H7kwSQ3lfndXV/838rUsBKKOOpOIHC3
 Kt1vJGWDxOP61rOptTopPcN9IzHIBju4PPGQwPaCCPbmA0X518lOo7biXBUu1qpSHh2D
 csnQcwDi920qW22solALeoaTG8lNOE28NEmfhjBA+hGe9E72Oi8d8lK/J3TPotcmQh02
 u+j0AGxYQijf1ql3AdDguE81hV7TrcvE9RxYwUy0WjAAKynbKVxtImGC4GdOr4ZXHQhO
 dKuwUaF6PcfMGaB9Z005/YCgz0hi/M7y3FCgtcfTHi6ZlqSQf2rSnxqT4//NqZ4/9+/0
 IvFQ==
X-Gm-Message-State: APjAAAVMcFzgh7d4EHr9xmppAGdYmwL2Xn7jiSd5c0Wiw992iTC/ShIO
 mJH9brnfT4E5jDNL1ALK75czHaVvbJZx
X-Google-Smtp-Source: APXvYqxA4rHtOvM573aTvEMfHHoeDYFk11YJeJsMuPA8DkHOIucDM/Ptuz2HkRO5pCI3OnCklc5yGqBSBoao
X-Received: by 2002:a81:a48c:: with SMTP id
 b134mr61097477ywh.130.1559110963217; 
 Tue, 28 May 2019 23:22:43 -0700 (PDT)
Date: Wed, 29 May 2019 14:22:14 +0800
Message-Id: <20190529062214.225874-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH] ASoC: core: use component driver name as
	component name
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

fmt_single_name() uses device name to determine component name.  If
multiple components bind to the same device, the debugfs creation in
soc_init_component_debugfs() would fail due to duplicated entity
names.

Name provided by component driver is unique enough to represent each
component.  Use component driver name as the component name to avoid
name duplication.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Hi,

We got "Failed to create component debugfs directory" in our environment.
But the patch does not resolve the issue.
(https://mailman.alsa-project.org/pipermail/alsa-devel/2018-February/132391.html)

The entity name duplicated when creating the debugfs directory, because
there is a device registered 2 components in mt8183_afe_pcm_dev_probe()
in sound/soc/mediatek/mt8183/mt8183-afe-pcm.c.

 sound/soc/soc-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7abb017a83f3..2d3520fca613 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3113,7 +3113,10 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
 {
 	struct snd_soc_dapm_context *dapm;
 
-	component->name = fmt_single_name(dev, &component->id);
+	if (driver->name)
+		component->name = kstrdup(driver->name, GFP_KERNEL);
+	else
+		component->name = fmt_single_name(dev, &component->id);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.22.0.rc1.257.g3120a18244-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
