Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE6415C4E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Sep 2021 12:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA531612;
	Thu, 23 Sep 2021 12:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA531612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632394346;
	bh=BZKnuJfXEDDbwEwLGooGskdT4wJHWThvQYDV3BgcA70=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k4hH/U7N3uOwfj1rokexhGpoI1et8vFeRr/SheQX+a2ZJHKK4VO8jGgjlLXF9lqEc
	 cjXQhegcJwde7U/UeQ2EyZ1+zqfXoNNvr4/7tgEQ8MbLwOM2RCE4eQ/gx9U28Qoi+6
	 w0/DtWHX8ZexbHCqDgUBxXMRIFwqF6vx0RDkEvGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB7E8F8011F;
	Thu, 23 Sep 2021 12:51:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FECFF80268; Thu, 23 Sep 2021 12:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DFF2F8013F
 for <alsa-devel@alsa-project.org>; Thu, 23 Sep 2021 12:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DFF2F8013F
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id D2885D8002;
 Thu, 23 Sep 2021 18:50:53 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P30982T140487228909312S1632394252895090_; 
 Thu, 23 Sep 2021 18:50:54 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 12
X-LOCAL-RCPT-COUNT: 1
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <0073ee5634e02cce322910e426978038>
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH] ASoC: dmaengine: Introduce module option
 prealloc_buffer_size_kbytes
Date: Thu, 23 Sep 2021 18:50:46 +0800
Message-Id: <1632394246-59341-1-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Corbet <corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org,
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

Currently, The fixed 512KB prealloc buffer size is too larger for
tiny memory kernel (such as 16MB memory). This patch adds the module
option "prealloc_buffer_size_kbytes" to specify prealloc buffer size.

It's suitable for cards which use the generic dmaengine pcm driver
with no config.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

 Documentation/sound/alsa-configuration.rst | 9 +++++++++
 sound/soc/soc-generic-dmaengine-pcm.c      | 6 +++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 65f6169..34888d4 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -100,6 +100,15 @@ amidi_map
     MIDI device number maps assigned to the 2st OSS device;
     Default: 1
 
+Module snd-soc-core
+-------------------
+
+The soc core module. It is used by all ALSA card drivers.
+It takes the following options which have global effects.
+
+prealloc_buffer_size_kbytes
+    Specify prealloc buffer size in kbytes (default: 512).
+
 Common parameters for top sound card modules
 --------------------------------------------
 
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 4aa48c7..c54c8ca 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -15,6 +15,10 @@
 
 #include <sound/dmaengine_pcm.h>
 
+static unsigned int prealloc_buffer_size_kbytes = 512;
+module_param(prealloc_buffer_size_kbytes, uint, 0444);
+MODULE_PARM_DESC(prealloc_buffer_size_kbytes, "Preallocate DMA buffer size (KB).");
+
 /*
  * The platforms dmaengine driver does not support reporting the amount of
  * bytes that are still left to transfer.
@@ -237,7 +241,7 @@ static int dmaengine_pcm_new(struct snd_soc_component *component,
 		prealloc_buffer_size = config->prealloc_buffer_size;
 		max_buffer_size = config->pcm_hardware->buffer_bytes_max;
 	} else {
-		prealloc_buffer_size = 512 * 1024;
+		prealloc_buffer_size = prealloc_buffer_size_kbytes * 1024;
 		max_buffer_size = SIZE_MAX;
 	}
 
-- 
2.7.4



