Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E479F37B
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 23:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BFC93A;
	Wed, 13 Sep 2023 23:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BFC93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694639422;
	bh=L8N0HqldEtg+TknyLAjAl8KOiPrMzht7YVn02VivLw8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UUGZJ2p+aRcb8zn9KpEvkJQs/4Z3NLEjBSWOpJsTHmeWSXcnmGxpu/s88+UHBk20R
	 3k8Q290akVYEvAZU9YdkbK1v++u81r8T/VoS8oBUvHIADatc7cStlFLChHYsVIG1og
	 SLbTcYj9C+hyc61HD9s+Jd6jjdUzq9O9uD4jesYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54048F80537; Wed, 13 Sep 2023 23:09:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE007F80246;
	Wed, 13 Sep 2023 23:09:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FBE5F80425; Wed, 13 Sep 2023 23:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E13DBF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 23:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13DBF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=mRbRv5Rk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id E356316C0049;
	Thu, 14 Sep 2023 00:09:22 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9D-cYVpJG9L; Thu, 14 Sep 2023 00:09:20 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1694639360; bh=L8N0HqldEtg+TknyLAjAl8KOiPrMzht7YVn02VivLw8=;
	h=From:To:Cc:Subject:Date:From;
	b=mRbRv5RkV9QRrbUNKr4mfV52PzbLhsNjaMMNqZUseAx7GpeyTfoTaFWjk5ShDCJ9H
	 fofDkLZhsgBPZDMxPrx3lu1RrM0XkzEkX9BIxhXn5OpNdogLoQMrixL8IiqdN0Ypny
	 rZfIef5vIWXSgTHNDUaZ4+kTIwbSkLshH/wp2V+A=
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Marian Postevca <posteuca@mutex.one>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: amd: acp: Fix -Wmissing-prototypes warning
Date: Thu, 14 Sep 2023 00:09:16 +0300
Message-ID: <20230913210916.2523-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PMOIAKHPGIJHWT7VNTY5CZUTEQ5LBF23
X-Message-ID-Hash: PMOIAKHPGIJHWT7VNTY5CZUTEQ5LBF23
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMOIAKHPGIJHWT7VNTY5CZUTEQ5LBF23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix prototype missing warning for acp3x_es83xx_init_ops() by
including the header acp3x-es83xx.h

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309111220.g63yHDfH-lkp@intel.com/
Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 47ce2f6c74bb..7ce15216c3f0 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -20,6 +20,7 @@
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 #include "../acp-mach.h"
+#include "acp3x-es83xx.h"
 
 #define get_mach_priv(card) ((struct acp3x_es83xx_private *)((acp_get_drvdata(card))->mach_priv))
 
-- 
2.41.0

