Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82D65E6107
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 13:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87910846;
	Thu, 22 Sep 2022 13:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87910846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663846197;
	bh=zen+9bs1IygPam6jy+1xbWvri6jC/dhE+h3xqkKlXKg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ko7FPy3D2tKZsT/h9VuUitGoxSuPGQlfkeFRfQ+kl2Pn+DCpMFdYQgdsgwkzXuPwG
	 P58USPgdAxE7IujSds91yQy8QUh1YYoLM3+35hgdfTzPfduZkus3yvG6VmNTneo2Rk
	 jirTTzeLPhEbZMaA2gUBog158pJayORxNEeeEyTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B07CF804AA;
	Thu, 22 Sep 2022 13:29:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA15F8027B; Thu, 22 Sep 2022 13:28:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC0B6F8020D
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 13:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC0B6F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EmE6k4If"
Received: by mail-pl1-x629.google.com with SMTP id c24so8522155plo.3
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 04:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=nCK5BNpGpE1s8cljBVp+LVXtq7b3ijRTCH/bNupgy+o=;
 b=EmE6k4IfbUWPUsYrJSnoxltDDw54Atjw4180/xLkc/JO3v+vivH/O1mwwzkAANF1+k
 CI5I2HrBpG95LF9DNTRHYEOsdxfGSM+/d+LEUo8j23SHX3jb/i863/DoS46BXjrnMRGP
 asHDZ8452xDrAhI7nShmhDEPKQB2vyHgX4p4jHnCHN8xY0/cdimLYq1JQoaDFyM/8WGS
 wP4KXp55v+kLPbLPlNSoRxx/9ziUvojHvmHIBIp2mKNn9Jsymc+Sd/awLIojjzGahIJF
 d539NWXVDWc5XySf17J/aSjl4qiY7dsB0mnCsysj+Bru32MCjKT9Jr+p1JmGC69/o506
 q8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=nCK5BNpGpE1s8cljBVp+LVXtq7b3ijRTCH/bNupgy+o=;
 b=Egi9KQlAnRP4UHa8XuuLJ/4TT+Xdwley7K/bYpT80B67Tq565QJdLFj0B/Z53s92Ci
 4sgjG99il7t5iLC4JYSB9twuzn5lrVC0Zi8nU91et2TpzBR8BPQCjm14hTCV38NAdmnc
 QLnVgNy7Q/AqPNV+e+sUgAdB0+r+KAadJ4uD+LaIvFQ94kbr5x4ZX6JiRWL0k0HOvcWD
 B0AGYy+Cq9OSmoYdLmPy4BhtxkGgrJ468whlhKqvykdLz15BGVuX1LsTOkB3O0FlmgwH
 cWYEWz093Y5VSffeVOm/32TmO0BKDl56+D7AGyDydVks1jgG7qnQHggz32+o+DT+h+st
 LTPw==
X-Gm-Message-State: ACrzQf0HqkpRf6o3gGSn1TilEtHE+qPw0gAw2KgYVybGT6cC2iwOYR1I
 bc82xD2NHrXTkY4CBZnCWd9h4KKgvco=
X-Google-Smtp-Source: AMsMyM4rI1ofld4QpP7RpzQzr2xzg5T3jWtDQIvS9nqUXQ0jCyA7dPOL0oD7qIkfIZ1akG3AQ7OtKA==
X-Received: by 2002:a17:90a:46c2:b0:203:a2c7:2362 with SMTP id
 x2-20020a17090a46c200b00203a2c72362mr3142196pjg.142.1663846130159; 
 Thu, 22 Sep 2022 04:28:50 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 w22-20020aa79556000000b0053e0d6f353esm4210176pfq.27.2022.09.22.04.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:28:49 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: tiwai@suse.com
Subject: [PATCH linux-next] ALSA: hda/ca0132 - remove the unneeded result
 variable
Date: Thu, 22 Sep 2022 11:28:46 +0000
Message-Id: <20220922112846.236987-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value dsp_allocate_ports() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/pci/hda/patch_ca0132.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 208933792787..9580fe00cbd9 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -2962,7 +2962,6 @@ static int dsp_allocate_ports_format(struct hda_codec *codec,
 			const unsigned short fmt,
 			unsigned int *port_map)
 {
-	int status;
 	unsigned int num_chans;
 
 	unsigned int sample_rate_div = ((get_hdafmt_rate(fmt) >> 0) & 3) + 1;
@@ -2976,9 +2975,7 @@ static int dsp_allocate_ports_format(struct hda_codec *codec,
 
 	num_chans = get_hdafmt_chs(fmt) + 1;
 
-	status = dsp_allocate_ports(codec, num_chans, rate_multi, port_map);
-
-	return status;
+	return dsp_allocate_ports(codec, num_chans, rate_multi, port_map);
 }
 
 /*
-- 
2.25.1
