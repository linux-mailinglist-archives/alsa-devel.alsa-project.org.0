Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BDD43B537
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 17:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7B261718;
	Tue, 26 Oct 2021 17:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7B261718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635261174;
	bh=cNG2U5n2TfvjZAu1/Lbn+V75ZjtgmKlOycPjMrbFqdY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcTLorJLLEPPWXbava/WzTxwOzBOYSMRRVBIcrYjGlTitPKKXAxpz3ya3OIjVc4lM
	 HrETTc+cofZYio368WGFv5isM71y87a+jMyYFr4lhEZeBVxX/DL+nk0wGnvRU/8aVO
	 ZMmum+4vgalWe8DBhF72Q9WaHoQA6R06pKoeGiIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C38F802E7;
	Tue, 26 Oct 2021 17:11:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A265DF804AE; Tue, 26 Oct 2021 17:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A3A3F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 17:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A3A3F80105
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
 by andre.telenet-ops.be with bizsmtp
 id AfBR2600B2hfXWm01fBR8V; Tue, 26 Oct 2021 17:11:25 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfO6n-0084pF-BM; Tue, 26 Oct 2021 17:11:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfO6m-00DLn1-FQ; Tue, 26 Oct 2021 17:11:24 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] ASoC: amd: acp: SND_SOC_AMD_ACP_COMMON should depend on
 X86 && PCI
Date: Tue, 26 Oct 2021 17:11:23 +0200
Message-Id: <30fcedce513186bf89f1f2655b665298250fdc66.1635260849.git.geert+renesas@glider.be>
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

All configuration symbols for AMD Audio ACP conponents depend on X86 &&
PCI, except for SND_SOC_AMD_ACP_COMMON.  Add a dependency on X86 && PCI
to SND_SOC_AMD_ACP_COMMON, to prevent asking the user about AMD Audio
ACP support when configuring a kernel without X86 or PCI support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/amd/acp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 006bd2dc5f0444ec..ba6ec96f0a64993d 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -8,6 +8,7 @@
 config SND_SOC_AMD_ACP_COMMON
 	tristate "AMD Audio ACP Common support"
 	select SND_AMD_ACP_CONFIG
+	depends on X86 && PCI
 	help
 	  This option enables common modules for Audio-Coprocessor i.e. ACP
 	  IP block on AMD platforms.
-- 
2.25.1

