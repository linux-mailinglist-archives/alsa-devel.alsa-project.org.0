Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA8630C27
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 11:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85967820;
	Fri, 31 May 2019 11:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85967820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559296600;
	bh=J7Thf59tuYT+D0EZRiOOzzfqy6SwKvF808Rw0JQnrno=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SsY2W8ZP2vmIPrBVMsZEirLPG4plJ8TTG2LcC0laFEv3pzQO/asvZW5s7Jteccm8c
	 F6ncL0JcFb04OkFMbGXYNQHaH5xdktQWypSni1mzoQ8Vo621vlsAJ1vUwTlgE4ozt6
	 GJXAVfENHJsuIV5EcFyBR7l1YOt//qKav8yt+Vjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D8CF89730;
	Fri, 31 May 2019 11:53:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA111F89719; Fri, 31 May 2019 11:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E2F5F896E5
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 11:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E2F5F896E5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5A5F4B026
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 09:53:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 31 May 2019 11:53:20 +0200
Message-Id: <20190531095321.16002-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190531095321.16002-1-tiwai@suse.de>
References: <20190531095321.16002-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/3] ALSA: hda: Use struct_size()
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
calculating the hda_conn_list object size with the variable array.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index b20eb7fc83eb..d0f1dbcfbda4 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -122,7 +122,7 @@ static int add_conn_list(struct hda_codec *codec, hda_nid_t nid, int len,
 {
 	struct hda_conn_list *p;
 
-	p = kmalloc(sizeof(*p) + len * sizeof(hda_nid_t), GFP_KERNEL);
+	p = kmalloc(struct_size(p, conns, len), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 	p->len = len;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
