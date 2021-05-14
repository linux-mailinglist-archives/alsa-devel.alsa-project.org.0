Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E3380402
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 09:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D8251791;
	Fri, 14 May 2021 09:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D8251791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620976083;
	bh=2IKucrwfIGBwLHppgVMg/P4iZ3pXzxm6fvi1Scps01M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r+GI++z0V5qljonCE234yhMaMBbYpwOwE5IeHlwyyHRXuaQcQa7f8IGympEHSDSkM
	 HQEgRIK0gca458aoHijzGLqczqDWNNIEdgqLKkY65gV0mLcorjZZXtnlY6XKhlHbEi
	 Af+74jPA8FSzjbSujyatzEbiuEmouYQXC+WVilnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748ACF8013A;
	Fri, 14 May 2021 09:06:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2272DF80240; Fri, 14 May 2021 09:06:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A26C9F8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 09:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A26C9F8013A
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FhKHs16hRzBvNb;
 Fri, 14 May 2021 15:03:37 +0800 (CST)
Received: from localhost (10.174.179.215) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Fri, 14 May 2021
 15:06:09 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next] ALSA: gus: Replace unsafe strcpy() with strscpy()
Date: Fri, 14 May 2021 15:05:07 +0800
Message-ID: <20210514070507.16600-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
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

Fix smatch warning:
sound/isa/gus/gus_main.c:396 snd_gus_check_version() error:
 strcpy() 'card->longname' too large for 'card->shortname' (80 vs 32)

Even if this is not a real bug since the longest length of card->longname
now is 31, replace strcpy() with strscpy() in order to avoid possible
future mistake.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/isa/gus/gus_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index b7518122a10d..7524ce5785de 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -384,7 +384,7 @@ static int snd_gus_check_version(struct snd_gus_card * gus)
 			}
 		}
 	}
-	strcpy(card->shortname, card->longname);
+	strscpy(card->shortname, card->longname, sizeof(card->shortname));
 	gus->uart_enable = 1;	/* standard GUSes doesn't have midi uart trouble */
 	snd_gus_init_control(gus);
 	return 0;
-- 
2.17.1

