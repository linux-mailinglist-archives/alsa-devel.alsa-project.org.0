Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426030C2C
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 11:57:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315BF83E;
	Fri, 31 May 2019 11:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315BF83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559296641;
	bh=wTUYAUqKII+xHZiTOExLHHhFo9SRqexV1tBp7BP3EYU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIYzguFAy3qsIZQL6pIbDAaS6ErzCjhb4VO8oAfGFQp0jiiednsOQ3JL6JeG+5Rtr
	 dJcGql3l2zpefV6N/DME7iEYg06mYoFU4jSZmBrTzD+rPvBU17MTQdjZLT7Bfkd8ft
	 CUEAoeEEfbQ6ARkMRnzeiPhDs3Y/GXoXaLBIgAKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DDBBF89737;
	Fri, 31 May 2019 11:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA90F89700; Fri, 31 May 2019 11:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52358F896E4
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 11:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52358F896E4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4CDDCB020
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 09:53:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 31 May 2019 11:53:19 +0200
Message-Id: <20190531095321.16002-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190531095321.16002-1-tiwai@suse.de>
References: <20190531095321.16002-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/3] ALSA: control: Use struct_size()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For code simplification and safety, use struct_size() macro for
calculating the snd_kcontrol object size with the variable array.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index a5cc9a874062..04eb1a15ffb4 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -211,16 +211,12 @@ EXPORT_SYMBOL(snd_ctl_notify);
 static int snd_ctl_new(struct snd_kcontrol **kctl, unsigned int count,
 		       unsigned int access, struct snd_ctl_file *file)
 {
-	unsigned int size;
 	unsigned int idx;
 
 	if (count == 0 || count > MAX_CONTROL_COUNT)
 		return -EINVAL;
 
-	size  = sizeof(struct snd_kcontrol);
-	size += sizeof(struct snd_kcontrol_volatile) * count;
-
-	*kctl = kzalloc(size, GFP_KERNEL);
+	*kctl = kzalloc(struct_size(*kctl, vd, count), GFP_KERNEL);
 	if (!*kctl)
 		return -ENOMEM;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
