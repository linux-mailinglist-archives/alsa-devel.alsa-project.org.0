Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5060A4C6183
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 04:07:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16281697;
	Mon, 28 Feb 2022 04:06:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16281697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646017667;
	bh=rllLhkUa8IrPzA0L702vG1vP/+501gLuASfcVLIezVk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RjM70reEE5Bgh1VVE4iEdFvi9tC8RIagWIJVo9pz7v48VJylsKZZ6ic5FURnQa6Ng
	 7/6LX0qsJWmDPUOMBpvXsyKsUUB3k5nvCv0Izr8p2xix9TvyY4MXkJnWsU5kyCcy/q
	 64TMvh+CNpLG285m8P4N8FZrITpQ83lxowoYmHjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EA7CF80154;
	Mon, 28 Feb 2022 04:06:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F758F80154; Mon, 28 Feb 2022 04:06:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpproxy21.qq.com (smtpbg701.qq.com [203.205.195.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E9BDF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 04:06:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E9BDF800F8
X-QQ-mid: bizesmtp71t1646017582t5w9yqju
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 28 Feb 2022 11:06:16 +0800 (CST)
X-QQ-SSF: 01400000002000C0G000000A0000000
X-QQ-FEAT: sgqrBpdJ5GA6NKedtCLLViTvg/su6Kc9xUp65VOLHbzyY/xiAKX9qDQGVsS90
 vF72AV14Lh8NsfPH5V+MiKzUiUbRTq3kFi8p/94fJY6Bin5z7T5WIfQu8A/7NjaBEK2vwJ9
 fqiXcJ+VAu0snaEBNnUq3WYFWJEFdrX1aJLhKj28OKGCzi5dG9tcI/aJigt53jf6bWkAhJT
 o3MY46nhS05gPRVP+Ks38+cGVImzVmtASkqdZE8F85wqvbxff2HuFzHe+9jTZq+qoQ59S3Q
 uqZ0OKrhkEe7LYVHyZ2hRTHBC1v76Eni6qgjlTmAHus7+5HhornCzMT9Z0rtVQcVPS8woya
 9ZGwTyCToRIGmVproCGytLjk10eLgEJO8Io0xGgBCYkJR/9BTU=
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v2 1/2] ALSA: core: remove initialise static variables to 0
Date: Mon, 28 Feb 2022 11:06:13 +0800
Message-Id: <20220228030614.10606-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
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

Initializing the static variable to 0 causes the following error
when exec checkpatch:

ERROR: do not initialise statics to 0
FILE: sound/sound_core.c:142:
static int preclaim_oss = 0;

In addition, considering the following way of writing
139: #ifdef config_sound_oss_core_preclaim
140: Static int preclaim_oss = 1;
141: #ELSE
142: Static int preclaim_oss = 0;
143: #ENDIF
We can optimize it by IS_ENABLED(CONFIG_SOUND_OSS_CORE_PRECLAIM),
so modified it to
static int preclaim_oss = IS_ENABLED(CONFIG_SOUND_OSS_CORE_PRECLAIM);

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/sound_core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index 90d118cd9164..aa4a57e488e5 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -136,11 +136,7 @@ struct sound_unit
  * All these clutters are scheduled to be removed along with
  * sound-slot/service-* module aliases.
  */
-#ifdef CONFIG_SOUND_OSS_CORE_PRECLAIM
-static int preclaim_oss = 1;
-#else
-static int preclaim_oss = 0;
-#endif
+static int preclaim_oss = IS_ENABLED(CONFIG_SOUND_OSS_CORE_PRECLAIM);
 
 module_param(preclaim_oss, int, 0444);
 
-- 
2.20.1



