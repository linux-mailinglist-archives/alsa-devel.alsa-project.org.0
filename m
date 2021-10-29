Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4343FB7D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 13:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4876416D7;
	Fri, 29 Oct 2021 13:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4876416D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635507530;
	bh=yTSogPIfy5AE72vKBkjJknnLiy8pwiVnVsgW2jY63+8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TleQT+q4rpYY9t0/Z16KWbkK1ZNuh1QX1n9kebg+SRS50FG3r+A2F/K+eEq7yDqhy
	 rUg3R3gd3MzX0esAksqSQqdP0MmoOgyz1iVyV9A1NR/410Luob5Pl+G3RZeeiPme4x
	 1CmWmc5QMxnfm+Y2pBLKcBCDsNAqTguEkaK4QQjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B52AF8025E;
	Fri, 29 Oct 2021 13:37:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2696F8025A; Fri, 29 Oct 2021 13:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53A1EF8010A
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 13:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A1EF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e3kO/N6r"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D4CD60E90;
 Fri, 29 Oct 2021 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635507439;
 bh=yTSogPIfy5AE72vKBkjJknnLiy8pwiVnVsgW2jY63+8=;
 h=From:To:Cc:Subject:Date:From;
 b=e3kO/N6rU9VLg2hykHHrFW7T2Y6E/yqkcAlb7afeOa/WcnblltUBaiCrhRAPV8HfM
 OVWSgm0iyjUoJQTUiHWDJ3JWA3FtMhP1S+9UTRQZ3/6zAWc25/oovNkyyP58ma/n1l
 TK6Tk1EVr6rJ+Bkk8LOkUZCwJ4C/YN+GPcPxoJCzgIYrIj3xgZC+OAMFYBW7uZZcGj
 lWZFG1pwXmr5NYNlsKL9RUs1xzt/5IaczXP8W+99FyTRUE5W3kZdt4b5tzMg3fmeN2
 03Oy9kLVorbgCreuBphyBe2FHT2c8KqQft1Q3UwqOpa/7OTD087mmg4Odrr0fj/YGP
 HPoGTHMGm6wLw==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: amd: acp: select CONFIG_SND_SOC_ACPI
Date: Fri, 29 Oct 2021 13:36:57 +0200
Message-Id: <20211029113714.966823-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>
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

From: Arnd Bergmann <arnd@arndb.de>

The acp-platform driver now needs the ACPI helpers:

ld.lld: error: undefined symbol: snd_soc_acpi_find_machine
>>> referenced by acp-platform.c
>>>               soc/amd/acp/acp-platform.o:(acp_machine_select) in archive sound/built-in.a

ld.lld: error: undefined symbol: snd_soc_acpi_codec_list
>>> referenced by acp-renoir.c
>>>               soc/amd/acp/acp-renoir.o:(snd_soc_acpi_amd_acp_machines) in archive sound/built-in.a

Other drivers using this interface, select SND_SOC_ACPI, so do the
same thing here.

Fixes: e646b51f5dd5 ("ASoC: amd: acp: Add callback for machine driver on ACP")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/acp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index e3d5cf993f5f..52a1371f9e61 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -20,6 +20,7 @@ config SND_SOC_AMD_ACP_I2S
 
 config SND_SOC_AMD_ACP_PCM
 	tristate
+	select SND_SOC_ACPI if ACPI
 
 config SND_AMD_ASOC_RENOIR
 	tristate "AMD ACP ASOC Renoir Support"
-- 
2.29.2

