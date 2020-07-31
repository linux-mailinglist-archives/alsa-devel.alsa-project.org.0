Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE9234BFE
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 22:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD187169A;
	Fri, 31 Jul 2020 22:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD187169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596226295;
	bh=nC6xMvTllYGINtXeruW5daqm5+XrwWArcbyonihL3B4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=um8nZL9ohGqo4RToGpvUmU44jPXNOQi9tuUnSKIzVDwn5Db1B6C/LcwumAirkvMjy
	 g2T2wg4DxGJnfrU6MrRWgti2zrHa3K1KWBEic5vU2u9+0G/qpxGljAX907ovt5H23Q
	 u+bKq3TQqOXD/eGcPZJLpxblMx3jd7L0/8DQbz8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F720F80171;
	Fri, 31 Jul 2020 22:09:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD07EF80171; Fri, 31 Jul 2020 22:09:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15F00F8011C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 22:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F00F8011C
X-IronPort-AV: E=Sophos;i="5.75,419,1589234400"; d="scan'208";a="462075190"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 31 Jul 2020 22:09:43 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: doc: use correct config variable name
Date: Fri, 31 Jul 2020 21:28:21 +0200
Message-Id: <1596223701-7558-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

CONFIG_PCM_XRUN_DEBUG should be CONFIG_SND_PCM_XRUN_DEBUG

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 Documentation/sound/designs/procfile.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/procfile.rst b/Documentation/sound/designs/procfile.rst
index 29a4668..e9f7e0c 100644
--- a/Documentation/sound/designs/procfile.rst
+++ b/Documentation/sound/designs/procfile.rst
@@ -91,7 +91,7 @@ PCM Proc Files
 
 ``card*/pcm*/xrun_debug``
 	This file appears when ``CONFIG_SND_DEBUG=y`` and
-	``CONFIG_PCM_XRUN_DEBUG=y``.
+	``CONFIG_SND_PCM_XRUN_DEBUG=y``.
 	This shows the status of xrun (= buffer overrun/xrun) and
 	invalid PCM position debug/check of ALSA PCM middle layer.
 	It takes an integer value, can be changed by writing to this

