Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B41312B11
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 08:25:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750B41688;
	Mon,  8 Feb 2021 08:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750B41688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612769146;
	bh=cOgsOBBCgJvrK3ozt4RGGiwveiLuJ5d4r2aLU/Xw/eI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qT6l4wO98v0Ps6hB5NmL+o09pIhZIiNgkd09Y9VCxPtxBjKMHqWvu2DRE7ifB1Mqc
	 oN/nj9C9UWfJ+dMWkqe/7Ih+6zPT+T22eqVk04ERDVdXhIkr3OOvIuMZpb3WEj2MLF
	 wyaT7h7pGH33LGV7j8ko1kDS3KMvc6nAlU6lwqNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C974F80114;
	Mon,  8 Feb 2021 08:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A3F8F8022B; Mon,  8 Feb 2021 08:24:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_29,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 608B9F80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 08:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 608B9F80165
Received: from 1.general.hwang4.uk.vpn ([10.172.195.16]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l90to-0003Vx-2E; Mon, 08 Feb 2021 07:23:56 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org
Subject: [PATCH] ASoC: SOF: debug: Fix a potential issue on string buffer
 termination
Date: Mon,  8 Feb 2021 15:22:57 +0800
Message-Id: <20210208072257.73900-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The function simple_write_to_buffer() doesn't add string termination
at the end of buf, we need to add it on our own if calling that
function to write the size of count chars to buf. This change refers
to the function tokenize_input() in debug.c and the function
sof_dfsentry_trace_filter_write() in trace.c.

We didn't find this potential issue in the past because sometimes we
are very lucky, we kzalloc the size of count buf, the kernel not only
returns a buf with buf[0 ... (count - 1)] = 0 but buf[count] = 0, with
this luck, this issue will not be exposed.

Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for IPC flood test")
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/sof/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 30213a1beaaa..edd4893119dd 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -352,9 +352,10 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	char *string;
 	int ret;
 
-	string = kzalloc(count, GFP_KERNEL);
+	string = kzalloc(count+1, GFP_KERNEL);
 	if (!string)
 		return -ENOMEM;
+	string[count] = '\0';
 
 	size = simple_write_to_buffer(string, count, ppos, buffer, count);
 	ret = size;
-- 
2.25.1

