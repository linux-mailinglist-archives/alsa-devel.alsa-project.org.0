Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BECDF162566
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 12:20:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC30168D;
	Tue, 18 Feb 2020 12:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC30168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582024815;
	bh=q8447FdXZjM9MefFS5US8BXTRkrs5qgYX5BMsKNsWUI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRu/bNvY1wY2EcoZSAuwndKk5vevlQeIbs0iRmZbjASFgDz/oxv5PCDAoLkSKJo7C
	 OtDUQcP+LwxIploItGbuFVCqCRpuyvyfg3FMsbyOHfP3yNdYJIkLQF55EDV6J2T969
	 ukvKXbL/junlcbfrP+bgmLkTNVsJ1THm7GOsPVi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01449F80247;
	Tue, 18 Feb 2020 12:17:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A6CFF8014C; Tue, 18 Feb 2020 12:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BDEEF80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 12:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BDEEF80135
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C72FAD2B;
 Tue, 18 Feb 2020 11:17:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: intel: skl: Fix pin debug prints
Date: Tue, 18 Feb 2020 12:17:35 +0100
Message-Id: <20200218111737.14193-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200218111737.14193-1-tiwai@suse.de>
References: <20200218111737.14193-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>
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

skl_print_pins() loops over all given pins but it overwrites the text
at the very same position while increasing the returned length.
Fix this to show the all pin contents properly.

Fixes: d14700a01f91 ("ASoC: Intel: Skylake: Debugfs facility to dump module config")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/skylake/skl-debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-debug.c b/sound/soc/intel/skylake/skl-debug.c
index 3466675f2678..4c1703da1a6d 100644
--- a/sound/soc/intel/skylake/skl-debug.c
+++ b/sound/soc/intel/skylake/skl-debug.c
@@ -34,7 +34,7 @@ static ssize_t skl_print_pins(struct skl_module_pin *m_pin, char *buf,
 	int i;
 	ssize_t ret = 0;
 
-	for (i = 0; i < max_pin; i++)
+	for (i = 0; i < max_pin; i++) {
 		ret += snprintf(buf + size, MOD_BUF - size,
 				"%s %d\n\tModule %d\n\tInstance %d\n\t"
 				"In-used %s\n\tType %s\n"
@@ -45,6 +45,8 @@ static ssize_t skl_print_pins(struct skl_module_pin *m_pin, char *buf,
 				m_pin[i].in_use ? "Used" : "Unused",
 				m_pin[i].is_dynamic ? "Dynamic" : "Static",
 				m_pin[i].pin_state, i);
+		size += ret;
+	}
 	return ret;
 }
 
-- 
2.16.4

