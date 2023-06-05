Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A117221A3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 10:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855DB74C;
	Mon,  5 Jun 2023 10:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855DB74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685955589;
	bh=bet3Rij8GrGk8PCMTrChExTjViLqa8FMBXDGdTe4cGE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D5axV5h0ogYCMBOsV1rIwNbXWenL7UUUfbiwPgIytO2rVszQAU9IiUCCBIHkr3vcK
	 820Zj/ER8VpnKzVPoVAgMlBqVCRCaOx62VQ/lS9MM/YlnwRJY7fUqgctWviBURZl8z
	 y83oMjDFsnQNRWnazSBtf9LeCUfdaJdLjG+iqE6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EACB9F80527; Mon,  5 Jun 2023 10:58:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED62F80199;
	Mon,  5 Jun 2023 10:58:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F450F80254; Mon,  5 Jun 2023 10:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28B3CF80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 10:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B3CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rk4OFN4e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E23160B37;
	Mon,  5 Jun 2023 08:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A715C433EF;
	Mon,  5 Jun 2023 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685955526;
	bh=bet3Rij8GrGk8PCMTrChExTjViLqa8FMBXDGdTe4cGE=;
	h=From:To:Cc:Subject:Date:From;
	b=Rk4OFN4ecvfEeSlgc06OshwB29bpXB7fJ+DBeGVuEBL5L1jtNCzJL0SF0gl/G3Ccn
	 Mx0bUz5wwZmHPHCnVCo/wJcPRCy4B5m3s7IHm3K/GR7U9/NBnDlqxQlg/TDrW/YWeL
	 /ERoZT3OBaUPjipvw8HbbXD1CWYI5zSJ/CK8v9TJzSsNf7SMG009VcyKm5AgCac/W6
	 t8wI2cFadGynLgaBLlc14KwODdA7MyMfAtond+RoxivabJAyu6oDo0vvTyrtvuDg0X
	 y54vt2TZCATRc8m28++wpJebgxIySopdf1krl5Htv3UN0Q2CBCa+i5194NUC+B+Auo
	 jU8eMrD9RRG0g==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
Date: Mon,  5 Jun 2023 10:58:29 +0200
Message-Id: <20230605085839.2157268-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NJWTW5FIYWQF3QC5HUAYNVMQV24IWQRU
X-Message-ID-Hash: NJWTW5FIYWQF3QC5HUAYNVMQV24IWQRU
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJWTW5FIYWQF3QC5HUAYNVMQV24IWQRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The vangogh driver just gained a link time dependency that now causes
randconfig builds to fail:

x86_64-linux-ld: sound/soc/amd/vangogh/pci-acp5x.o: in function `snd_acp5x_probe':
pci-acp5x.c:(.text+0xbb): undefined reference to `snd_amd_acp_find_config'

Fixes: e89f45edb747e ("ASoC: amd: vangogh: Add check for acp config flags in vangogh platform")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: select CONFIG_SND_AMD_ACP_CONFIG from all ACP5, not just VANGOGH_MACH.
---
 sound/soc/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 08e42082f5e96..713348508001a 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -71,6 +71,7 @@ config SND_SOC_AMD_RENOIR_MACH
 config SND_SOC_AMD_ACP5x
 	tristate "AMD Audio Coprocessor-v5.x I2S support"
 	depends on X86 && PCI
+	select SND_AMD_ACP_CONFIG
 	help
 	 This option enables ACP v5.x support on AMD platform
 
-- 
2.39.2

