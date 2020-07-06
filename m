Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E525221695C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 11:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91FC31679;
	Tue,  7 Jul 2020 11:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91FC31679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594115046;
	bh=NZv2eb8kA4Ls+TpmzEPlP1chi47i3c75TS699LovaLU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TegkEuLfKJlZeX/jfHWTs/J1zQq6erpSOtOv59pwkcIHOWzBdrXHQo2IKrjIDSoSd
	 42UwEZOnuBqweQ+ZJkHYxVW6KFydw96HNuWIm4k4tJ06QCUqk4XbbvGg9ApAzjBMQJ
	 Qq2OHW5w1PxTtYzX9LK8h1lA5B2BwoiPBFUeVHXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABFA7F802BE;
	Tue,  7 Jul 2020 11:41:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70934F8015A; Mon,  6 Jul 2020 05:27:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91E3FF8010A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 05:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E3FF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="XdrQDrDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5yazT
 dyA3YxMPgoBpYzzCyqT8fJEoy7VrCOXLHWeXI8=; b=XdrQDrDDQoHy04HdxYZxj
 h3KjGArTII3jkEehfkOKhLmlREGMWNGvTeO5+jV64xvkcLfmvFxWAzwZeH4qkpeZ
 PrxA6H4qj7dMX1PKcoeWBfjUrQzCwWiZLQAPWqCJk8D6+pB6B5zCWaSF55gNp7Zp
 D+xs/Yq1p/8GgVurTtRZqU=
Received: from ubuntu.localdomain (unknown [182.113.175.219])
 by smtp2 (Coremail) with SMTP id GtxpCgC3GA8rmgJfecIjDg--.165S3;
 Mon, 06 Jul 2020 11:27:44 +0800 (CST)
From: Xidong Wang <wangxidong_97@163.com>
To: Xidong Wang <wangxidong_97@163.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ALSA: opl3: fix infoleak in opl3
Date: Sun,  5 Jul 2020 20:27:38 -0700
Message-Id: <1594006058-30362-1-git-send-email-wangxidong_97@163.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GtxpCgC3GA8rmgJfecIjDg--.165S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy7ZFy8tF4UtF4kAr45Awb_yoW3Krg_C3
 4Fqrn7Zryrurn2yr4ayFW3ZrZrKasrZw1vqF42vry3J3sa9ryavr1kZryxWF1UJFs7WF43
 Z3savr48AF98JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRic_-PUUUUU==
X-Originating-IP: [182.113.175.219]
X-CM-SenderInfo: pzdqw5xlgr0wrbzxqiywtou0bp/1tbiyBBZ81p7AiB0FQAAsQ
X-Mailman-Approved-At: Tue, 07 Jul 2020 11:41:50 +0200
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

From: xidongwang <wangxidong_97@163.com>

The stack object “info” in snd_opl3_ioctl() has a leaking problem.
It has 2 padding bytes which are not initialized and leaked via
“copy_to_user”.

Signed-off-by: xidongwang <wangxidong_97@163.com>
---
 sound/drivers/opl3/opl3_synth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/drivers/opl3/opl3_synth.c b/sound/drivers/opl3/opl3_synth.c
index e69a4ef..08c10ac 100644
--- a/sound/drivers/opl3/opl3_synth.c
+++ b/sound/drivers/opl3/opl3_synth.c
@@ -91,6 +91,8 @@ int snd_opl3_ioctl(struct snd_hwdep * hw, struct file *file,
 		{
 			struct snd_dm_fm_info info;
 
+			memset(&info, 0, sizeof(info));
+
 			info.fm_mode = opl3->fm_mode;
 			info.rhythm = opl3->rhythm;
 			if (copy_to_user(argp, &info, sizeof(struct snd_dm_fm_info)))
-- 
2.7.4

