Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09D55EA67
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 18:59:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901DE950;
	Tue, 28 Jun 2022 18:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901DE950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656435560;
	bh=e2cA02gK7PqwOzv3YHx6N7DJAibcjk6vOLFm572qvf4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AYE5u/23+YY9u2ZH45GwyeF1GCHjh8jv5s3KHPuoPhkLkZnYX616KmG+NP/Tx/oOp
	 zgj1eAZOBQ0pSb5anTY8bJTSWkF0kxfDUfj7LJwg8+p3yV4lIiu+BxcGdNl9Et8BTA
	 f9ITKlSaxHyCNK9JPIgvAQJJVcddcC1DLIQ3gRUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4624F8025B;
	Tue, 28 Jun 2022 18:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2D09F80167; Tue, 28 Jun 2022 18:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEB40F80163
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 18:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEB40F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="IvzCxh1a"
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B546F83A31;
 Tue, 28 Jun 2022 18:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656435492;
 bh=pemWDkXYJYJHkIG427oBju+wORRrZ34sfzIWKrIjjq8=;
 h=From:To:Cc:Subject:Date:From;
 b=IvzCxh1aReSffScbyU7MPcoT71j/kqAsBwNudSXLIxDXxgV8fXjkKrQQK2GsZIqRV
 9jNEtx2DBahdLghW0yWnQbxgBdr+shycnXKVjDbMpZ0HOt3T0qGYxWMkGSzHwvmT60
 G3Xg0zt/SlOFP700Ow9+tUX8Ql4soSSs2ZTpDRQ0CwGssI+1mWPcOOv9JTyootYoVm
 fQGuQi/DmVTHzaMNieXdkBMoLBGUZ4LB9xDUG26v0/BE1thRcFTCFI2GLtUVXOHuj+
 E3A8nqpnSQsysF/M6U+sP2dlEjr2jQZqGhHJmH+UaQu0lM0LpCEkRXGsRlBik1EM2N
 RZTn9Ww3LSubA==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: doc: Update dead links
Date: Tue, 28 Jun 2022 18:58:07 +0200
Message-Id: <20220628165807.152191-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>, linux-doc@vger.kernel.org
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

The alsa-project documentation is now part of the kernel docs,
the original links are long dead, update links.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>
---
 Documentation/process/kernel-docs.rst | 2 +-
 Documentation/sound/soc/codec.rst     | 2 +-
 Documentation/sound/soc/platform.rst  | 2 +-
 sound/pci/ens1370.c                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
index da9527502ef0e..644f9200fd919 100644
--- a/Documentation/process/kernel-docs.rst
+++ b/Documentation/process/kernel-docs.rst
@@ -108,7 +108,7 @@ On-line docs
     * Title: **Writing an ALSA Driver**
 
       :Author: Takashi Iwai <tiwai@suse.de>
-      :URL: http://www.alsa-project.org/~iwai/writing-an-alsa-driver/index.html
+      :URL: https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
       :Date: 2005
       :Keywords: ALSA, sound, soundcard, driver, lowlevel, hardware.
       :Description: Advanced Linux Sound Architecture for developers,
diff --git a/Documentation/sound/soc/codec.rst b/Documentation/sound/soc/codec.rst
index 57df149acafc5..af973c4cac930 100644
--- a/Documentation/sound/soc/codec.rst
+++ b/Documentation/sound/soc/codec.rst
@@ -132,7 +132,7 @@ The codec driver also supports the following ALSA PCM operations:-
   };
 
 Please refer to the ALSA driver PCM documentation for details.
-http://www.alsa-project.org/~iwai/writing-an-alsa-driver/
+https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
 
 
 DAPM description
diff --git a/Documentation/sound/soc/platform.rst b/Documentation/sound/soc/platform.rst
index c1badea53d3d3..7036630eaf016 100644
--- a/Documentation/sound/soc/platform.rst
+++ b/Documentation/sound/soc/platform.rst
@@ -46,7 +46,7 @@ snd_soc_component_driver:-
   };
 
 Please refer to the ALSA driver documentation for details of audio DMA.
-http://www.alsa-project.org/~iwai/writing-an-alsa-driver/
+https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
 
 An example DMA driver is soc/pxa/pxa2xx-pcm.c
 
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 94efe347a97a9..89210b2c73424 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -8,7 +8,7 @@
 /* Power-Management-Code ( CONFIG_PM )
  * for ens1371 only ( FIXME )
  * derived from cs4281.c, atiixp.c and via82xx.c
- * using http://www.alsa-project.org/~tiwai/writing-an-alsa-driver/ 
+ * using https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-driver.html
  * by Kurt J. Bosch
  */
 
-- 
2.35.1

