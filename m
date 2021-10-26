Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2343B53D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 17:13:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E17D1734;
	Tue, 26 Oct 2021 17:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E17D1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635261217;
	bh=gpJI8SCayFFp1qAeYTNn5DYee5NyWSRiZE8Fejajlp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6j2mGNaf4qmisZhpDX21dt2gzkjNjJ9p294CzOY8qnmtIFiikKAkmeUfrQXQySTO
	 jx9OZOGSfJBlyZCGHZx6CzO4xJchQ1TXoPzt/WlhXd71MUQ2qPtcVARJq/s9EufPeL
	 TI5ePCUINsRH7ziid/ffU/bTc6yhVsstzAyPI2Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36CA1F804C2;
	Tue, 26 Oct 2021 17:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CFD9F804AF; Tue, 26 Oct 2021 17:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66789F8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 17:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66789F8010A
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
 by xavier.telenet-ops.be with bizsmtp
 id AfBR260072hfXWm01fBRem; Tue, 26 Oct 2021 17:11:25 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfO6m-0084pD-Sj; Tue, 26 Oct 2021 17:11:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfO6m-00DLmn-E0; Tue, 26 Oct 2021 17:11:24 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: amd: acp: Wrap AMD Audio ACP components in
 SND_SOC_AMD_ACP_COMMON
Date: Tue, 26 Oct 2021 17:11:21 +0200
Message-Id: <53d1d63bed1865293e6f5085ead21cdbb068fb15.1635260849.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635260849.git.geert+renesas@glider.be>
References: <cover.1635260849.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
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

The build only descends into sound/soc/amd/acp/ if
CONFIG_SND_SOC_AMD_ACP_COMMON=y.  Hence all later config symbols should
depend on SND_SOC_AMD_ACP_COMMON, to prevent asking the user about
config symbols for driver code that won't be build anyway.

Fixes: 623621a9f9e1a2f4 ("ASoC: amd: Add common framework to support I2S on ACP SOC")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/amd/acp/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 98ec18791d35ff3a..ea186cd31ba220ab 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -12,6 +12,8 @@ config SND_SOC_AMD_ACP_COMMON
 	  This option enables common modules for Audio-Coprocessor i.e. ACP
 	  IP block on AMD platforms.
 
+if SND_SOC_AMD_ACP_COMMON
+
 config SND_SOC_AMD_ACP_I2S
 	tristate
 
@@ -49,3 +51,5 @@ config SND_SOC_AMD_SOF_MACH
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables SOF sound card support for ACP audio.
+
+endif # SND_SOC_AMD_ACP_COMMON
-- 
2.25.1

