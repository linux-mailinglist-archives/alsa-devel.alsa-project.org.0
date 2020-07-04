Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5142143EF
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 06:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F6F716BA;
	Sat,  4 Jul 2020 06:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F6F716BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593836039;
	bh=Dyz6CU/dKeHqnPvTnBhhNbleUmXeJ4po/09hFslwLTk=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKZvvenxPaesAn/L9Xl1aVPz2iLx7miWjdWlkbBTlH5dQzD+gqSx8DqAGkMrbnzoW
	 psfGWBjTx+GDxaJQ9br51cWHQ8gq6Jpkk9ZXNrlpIDB2TNpQFGox3yFy9CsNSZmmFV
	 45ZXPCHFmCKonePRwYVQrds0oF9WJBsjZ9eVcQZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5381F80245;
	Sat,  4 Jul 2020 06:12:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 803E7F8022D; Sat,  4 Jul 2020 06:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 032F1F8011B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 06:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 032F1F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="GSMgcojL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Y2ZgUgKaIXgGhPIp8kLg05ubcJzNrmK0t36CFq8N0BA=; b=GSMgcojLUdsO4sVyLhSzZjDQr1
 3bRZkHE35qeOTP9c96j3WluBPvd/wwy8iikpS/X4tNB9K5mziDMqQ/lY3Bdri5CYuQ0dMghC80RuN
 cne/mUTV+V1y7QGJe625af1ZP6wHo0y7kK0xHTxfQWsE3dHoz3+ZTBvpQhlN3F96+ybkSAajV5gLC
 9237aDkk2zfixVqiLTn+5mueTG6L6jPl1BQtBEHJerZaGRQFGFt5JIf1LVzz0G314btKYfMCXFq/q
 JtbM8YgD/gZBPLiaZsUbg6ufARN0YipPjub8dhkjvSKyuFDxLN+HpUvEHUGsVzRs3yfWvjB4OJSjx
 xonEQOFw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrZWy-0001P6-0M; Sat, 04 Jul 2020 04:12:00 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] ASoC: amd: fix Kconfig warning for Renoir
Message-ID: <7849ce3b-e0f0-d28d-cf9d-d0560a5b4bc8@infradead.org>
Date: Fri, 3 Jul 2020 21:11:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Randy Dunlap <rdunlap@infradead.org>

SND_SOC_DMIC depends on GPIOLIB so this driver should also depend on
GPIOLIB to make kconfig happy.

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_AMD_RENOIR_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_RENOIR [=y]

Fixes: 1d3776669323 ("ASoC: amd: enable build for RN machine driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Mark Brown <broonie@kernel.org>
---
Found in mmotm.

There are no object file build errors. I suppose that gpiolib stubs
take care of that. Maybe some other patch would be more appropriate.

 sound/soc/amd/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- mmotm-2020-0703-1503.orig/sound/soc/amd/Kconfig
+++ mmotm-2020-0703-1503/sound/soc/amd/Kconfig
@@ -47,5 +47,6 @@ config SND_SOC_AMD_RENOIR_MACH
 	tristate "AMD Renoir support for DMIC"
 	select SND_SOC_DMIC
 	depends on SND_SOC_AMD_RENOIR
+	depends on GPIOLIB
 	help
 	 This option enables machine driver for DMIC

