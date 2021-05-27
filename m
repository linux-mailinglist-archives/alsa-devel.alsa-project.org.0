Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75669392539
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 05:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1553316FA;
	Thu, 27 May 2021 05:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1553316FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622084851;
	bh=7DjVwUTWO0iS9v53A6zAzFnCLxpWvB/W65FF3LAEu6Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PZNtib0as+GJFhlxAnLnFH/zgmZXbXw5CZIAhE8P8MR7v5hhEpCNNvFOs+dq2smgw
	 lBhc3kKUQIgf8Ol4wKJsamGxmK7UOiyqcrg4T6KXoTySuYAlDbZXj8G2XlMMeVhuDJ
	 sPMqzCpz0tJZ4MEPxt/MuqTn8OP1v1W7DOsUhv8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 815F7F80147;
	Thu, 27 May 2021 05:06:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB62F8012E; Thu, 27 May 2021 05:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from proxy25215.mail.163.com (proxy25215.mail.163.com
 [103.129.252.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 74CC5F800EA
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 05:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74CC5F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="YPjz89JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=70Oom
 WJ3zwC7Ux4Cyuscx9W74Lf/fdGM/9aFa7xNXOw=; b=YPjz89JDYUNFXKZ8wozMj
 F2/GjaVmqfeGW15EBVVwd2n/4GGUypet5kP1K2An0CE0ojqLChtvx1glTV2u9Gj3
 HFndIWphdfyF103qWXkrZ/lzwMwGiR/Yb7E4zp0p7x9SRYCXaIIS360LJnMWbu9y
 8l9CcNvgXF7ievQZWhYTQE=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
 by smtp14 (Coremail) with SMTP id EsCowACHieFPDK9gAU9Clw--.31488S2;
 Thu, 27 May 2021 11:04:50 +0800 (CST)
From: zuoqilin1@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	joe@perches.com,
	gustavoars@kernel.org
Subject: [PATCH] sound/oss/dmasound: Remove superfluous "break"
Date: Thu, 27 May 2021 11:04:45 +0800
Message-Id: <20210527030445.1201-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowACHieFPDK9gAU9Clw--.31488S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW8ArWfGF18uFWUXryfXrb_yoWDCrc_X3
 yIgr1xWa4kZrn7A347XasrGrZrK3W7Aw1fW34UKa17Wr48GrWftw1DGrsxWrn5X34Fyw4x
 u3y2k3yIk3yFqjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0mXd5UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/1tbiZQ+fiV8ZOwgNGgABsf
Cc: zuoqilin <zuoqilin@yulong.com>, alsa-devel@alsa-project.org,
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

From: zuoqilin <zuoqilin@yulong.com>

Remove superfluous "break", as there is a "return" before them.

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 sound/oss/dmasound/dmasound_core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index 22cef0c..0c95828 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -1229,31 +1229,22 @@ static char *get_afmt_string(int afmt)
         switch(afmt) {
             case AFMT_MU_LAW:
                 return "mu-law";
-                break;
             case AFMT_A_LAW:
                 return "A-law";
-                break;
             case AFMT_U8:
                 return "unsigned 8 bit";
-                break;
             case AFMT_S8:
                 return "signed 8 bit";
-                break;
             case AFMT_S16_BE:
                 return "signed 16 bit BE";
-                break;
             case AFMT_U16_BE:
                 return "unsigned 16 bit BE";
-                break;
             case AFMT_S16_LE:
                 return "signed 16 bit LE";
-                break;
             case AFMT_U16_LE:
                 return "unsigned 16 bit LE";
-                break;
 	    case 0:
 		return "format not set" ;
-		break ;
             default:
                 break ;
         }
-- 
1.9.1


