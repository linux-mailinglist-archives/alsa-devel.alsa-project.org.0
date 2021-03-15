Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162F33C28E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA4617AC;
	Mon, 15 Mar 2021 17:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA4617AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827295;
	bh=wYkSIzVbHlQKixSIYGMzhraJWMf3s/2flKlw6qSkTQI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BG4BNtN5ylfMHWSSGEbWGLhlqsedihOLmGED6soAarHqH1cmsOOF/+rnM+FPysKbq
	 6TGwyCArahCb1m/GGGoHlthE/GyOL4sOdtBv5eaSAZHaONbzNEZVfS/sj3KU2HZHGW
	 fwuPlgoXKjlJujUP3VUCfGOQ90QPc2UOjlTu8v2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E93DF80431;
	Mon, 15 Mar 2021 17:51:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C5ABF80171; Mon, 15 Mar 2021 12:16:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E65C8F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 12:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E65C8F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="VBOOCk9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DxgWZ
 5TyeoXdEjzSg/Xfs2MZwVlVdPURu8brbac+52w=; b=VBOOCk9HNMXRzjYbOp3eJ
 Ln/+OyLyOwY8rvqusBhkslSC/o/fQammUKXWK8ToaS+fZ+k+QLYLPihH2QKSbX8p
 RQsuuXTGGsouIEmDlogpQJKT7Fqgp9ptEFUSKcyWycKVTm8RRqbNwj7y+1J6xa7l
 CEQyoxSLq2cTf5kyPqDwYI=
Received: from COOL-20201218BF.ccdomain.com (unknown [218.94.48.178])
 by smtp8 (Coremail) with SMTP id DMCowADX3nLzQU9gyUK4Uw--.8598S2;
 Mon, 15 Mar 2021 19:16:10 +0800 (CST)
From: mateng <ayowoe@163.com>
To: oder_chiou@realtek.com,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound:fix typo in rt5663.c
Date: Mon, 15 Mar 2021 19:16:13 +0800
Message-Id: <20210315111613.2032-1-ayowoe@163.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowADX3nLzQU9gyUK4Uw--.8598S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15WrWxWF4kWr4xJw15XFb_yoWxAwc_Ga
 4xuwsFgF4UKw1Ik34Du3s0yr4Iq3yfCFW0yr4UKrnrJrWUAr4ftr1kZrnI9ryDXr4xAFy3
 WFZIgr45try7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn1SoJUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5d1r40rh6rljoofrz/1tbiPhpWKlxBl+XXagAAsK
X-Mailman-Approved-At: Mon, 15 Mar 2021 17:51:49 +0100
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 mateng <mateng@yulong.com>, linux-kernel@vger.kernel.org
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

From: mateng <mateng@yulong.com>

interrput -> interrupt

Signed-off-by: mateng <mateng@yulong.com>
---
 sound/soc/codecs/rt5663.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 619fb9a..411ff30 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -1967,7 +1967,7 @@ static void rt5663_jack_detect_work(struct work_struct *work)
 					btn_type);
 				break;
 			}
-			/* button release or spurious interrput*/
+			/* button release or spurious interrupt*/
 			if (btn_type == 0) {
 				report =  rt5663->jack_type;
 				cancel_delayed_work_sync(
-- 
1.9.1


