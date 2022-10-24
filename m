Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4A460A5AA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 14:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9AC7958;
	Mon, 24 Oct 2022 14:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9AC7958
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666614520;
	bh=6ncgUhF1Orl99ZiKqqGZ9GrPrDS14DBegR50yYuhdHU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JVGhA+r2hjKMawYyKCRUQN7pnrO17DILZWSarb8uzMkK588t9DjmdTDRilwOHn2t9
	 54iIGvRZN2Ob9QvtzqumHgz3Pg9seS6zE0HuNTnlkNiiP9nzkJNEP6Cki7TgUa1tg8
	 jh1i7jbac7+0x+bHW0Pw9KjmGvKYkwOnM61xrm5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B2FF8053D;
	Mon, 24 Oct 2022 14:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56554F80533; Mon, 24 Oct 2022 14:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA4BF80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 14:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA4BF80506
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MwvNP67Fhz15M0m;
 Mon, 24 Oct 2022 20:22:45 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 20:27:36 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 20:27:35 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda: fix possible memory leak in azx_codec_configure()
Date: Mon, 24 Oct 2022 20:26:46 +0800
Message-ID: <20221024122646.1175390-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: tiwai@suse.de, yangyingliang@huawei.com, tiwai@suse.com
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

If the codec device is registered, after calling snd_hdac_device_unregister(),
codec has already been removed from chip bus, it should call put_device() to
give up reference to free codec and device name.

Fixes: c0f1886de7e1 ("ALSA: hda: intel: Allow repeatedly probing on codec configuration errors")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/pci/hda/hda_controller.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 0ff286b7b66b..f6a73ce300a4 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -1257,8 +1257,11 @@ int azx_codec_configure(struct azx *chip)
 		/* unregister failed codecs if any codec has been probed */
 		list_for_each_codec_safe(codec, next, &chip->bus) {
 			if (!codec->configured) {
+				bool is_registered = device_is_registered(&codec->core.dev);
 				codec_err(codec, "Unable to configure, disabling\n");
 				snd_hdac_device_unregister(&codec->core);
+				if (is_registered)
+					put_device(&codec->core.dev);
 			}
 		}
 	}
-- 
2.25.1

