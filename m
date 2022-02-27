Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C74C9F75
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F4921B3D;
	Wed,  2 Mar 2022 09:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F4921B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210351;
	bh=LGuP1oB6CTCDc3srbAWqoQWnn2nU6aNIsrCi/IZNyBA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AT3FS5v9yJ5nX5rcLcowMADzFZC+9GGDv4fsxxCeuMAyge/50ObNff7phsNFUiw45
	 FmiLhh6P1sxKyoSwJ9u6K6dQpGFoHSHdYCq0yxfBB20VRA3hrxRNcj6/vDL4q+TiGK
	 hAYXk9ciHbQaGqymggLyJvS9sJGEPyo89KFLrUJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F00BCF80570;
	Wed,  2 Mar 2022 09:33:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A218AF80155; Sun, 27 Feb 2022 15:52:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by alsa1.perex.cz (Postfix) with ESMTP id 7EDDFF800F8
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 15:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EDDFF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="kCjiplKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=46bdGwyMmjt7hkhN4U
 tSZ0HMhtQxFV5se7LXeOn/Ed0=; b=kCjiplKPSifKXrA/Vjq7yRDdgDp9SAHip7
 FzFNcyWFxXBNz7aN2+RkT8v8hiRKJvz+dZB+Gh8TjK+ETU0Cd1MePQY+11xMVS4p
 jHEWNdB87+fnFWkjsRDa2kSB7SWGvadlJxmgkiwXMkGvVUJzxDJNJFIz4p/ga3As
 HFFyYRPhg=
Received: from speak-pc.lan (unknown [111.197.234.168])
 by smtp3 (Coremail) with SMTP id G9xpCgDHFjQWkBti59hCEQ--.38437S2;
 Sun, 27 Feb 2022 22:52:06 +0800 (CST)
From: SPeak Shen <speakshen@163.com>
To: linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: sound: fix typo in control-names.rst
Date: Sun, 27 Feb 2022 22:52:04 +0800
Message-Id: <20220227145204.16600-1-speakshen@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: G9xpCgDHFjQWkBti59hCEQ--.38437S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF47WFyfKw4rtr4rur1Dtrb_yoW3twbEqa
 n7XF4fZFWUXryxtr4qyF1rJF15Cw47Cw18GwsYqr17XFy0y39xGryqqw4kZr18WF1xuryr
 Wr4kGFW7Gr9rtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREeHqPUUUUU==
X-Originating-IP: [111.197.234.168]
X-CM-SenderInfo: 5vshtyhvkh0qqrwthudrp/1tbi-Be0PGB0Js6OigAAsb
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: alsa-devel@alsa-project.org, Sunrisepeak <speakshen@163.com>,
 corbet@lwn.net
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

From: Sunrisepeak <speakshen@163.com>

change 'cannel' to 'channel'

Signed-off-by: Sunrisepeak <speakshen@163.com>
---
 Documentation/sound/designs/control-names.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/control-names.rst b/Documentation/sound/designs/control-names.rst
index 7fedd0f33..765ff9b5b 100644
--- a/Documentation/sound/designs/control-names.rst
+++ b/Documentation/sound/designs/control-names.rst
@@ -34,7 +34,7 @@ CHANNEL
 Front		front left/right channels
 Surround	rear left/right in 4.0/5.1 surround
 CLFE		C/LFE channels
-Center		center cannel
+Center		center channel
 LFE		LFE channel
 Side		side left/right for 7.1 surround
 ============	==================================================
-- 
2.17.1

