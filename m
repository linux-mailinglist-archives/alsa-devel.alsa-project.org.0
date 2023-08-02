Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30776C4BD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 07:18:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272ED1E7;
	Wed,  2 Aug 2023 07:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272ED1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690953484;
	bh=0CEdaSyJFAA2xpjh5Nn+H0+SZFhR9FtwxsrPPHypAnQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bkob1AR81G8JtHzAIB5UovR0OglKCFjazyA6alhG9kjV+13vqhXA775WsQGDSDkoz
	 baIUAEwzyvlZ0+y7luT2bQLRgLTHkLD7z63y+UjrF/lJkRScrI/3dTns8nq90Z/lqI
	 bMBO8ieH2Msqc5cjCsMUeGf6YUrZaaPa1wC+5fco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35615F80544; Wed,  2 Aug 2023 07:17:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A365DF80149;
	Wed,  2 Aug 2023 07:17:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FD99F801D5; Wed,  2 Aug 2023 07:16:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D9AAF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 07:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9AAF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sToXqHdw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Ws463DCdGOOUnDgf5xIij/KjEF+4fkspmM98in3YnIU=; b=sToXqHdwHcm7a53ZnJ8VZVQsEL
	JjWuv099M/waB6PAJfQ8lRJtDpvT8yxhA4wuigAGDty+RkgngpSmNxZ6YnbjV6lI0yoPqMpRDVAFo
	lGBeJMBRTog0Wn1NrkFlvX6met0legbG4TwZ7dCTCPmUCpWK8hlSDyTB2jtfnjTDeXiWZGCyupifA
	aCmpywLceqMID9NkmNKf5i/YmWUo6w5VbcqiLjbO8IROz8il0QbAZiGS+1nVpaNvkabFTwxEyu71A
	daPzLqx13PEh2RxcnOMDyayeK2iapvLzZC4t4Y3osA3Ape1Kw/ttFfHzXAoo7+QhmX37ik/RHIM+4
	Hxmb9Cfg==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qR4CL-0042D7-2i;
	Wed, 02 Aug 2023 05:15:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org,
	Tejun Heo <tj@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v5] um/drivers: fix hostaudio build errors
Date: Tue,  1 Aug 2023 22:15:00 -0700
Message-ID: <20230802051500.13271-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X5VZZLE74JGZOTR3SBN6FHB53OLY6DVU
X-Message-ID-Hash: X5VZZLE74JGZOTR3SBN6FHB53OLY6DVU
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5VZZLE74JGZOTR3SBN6FHB53OLY6DVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use "select" to ensure that the required kconfig symbols are set
as expected.
Drop HOSTAUDIO since it is now equivalent to UML_SOUND.

Set CONFIG_SOUND=m in ARCH=um defconfig files to maintain the
status quo of the default configs.

Allow SOUND with UML regardless of HAS_IOMEM. Otherwise there is a
kconfig warning for unmet dependencies. (This was not an issue when
SOUND was defined in arch/um/drivers/Kconfig. I have done 50 randconfig
builds and didn't find any issues.)

This fixes build errors when CONFIG_SOUND is not set:

ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_cleanup_module':
hostaudio_kern.c:(.exit.text+0xa): undefined reference to `unregister_sound_mixer'
ld: hostaudio_kern.c:(.exit.text+0x15): undefined reference to `unregister_sound_dsp'
ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_init_module':
hostaudio_kern.c:(.init.text+0x19): undefined reference to `register_sound_dsp'
ld: hostaudio_kern.c:(.init.text+0x31): undefined reference to `register_sound_mixer'
ld: hostaudio_kern.c:(.init.text+0x49): undefined reference to `unregister_sound_dsp'

and this kconfig warning:
WARNING: unmet direct dependencies detected for SOUND

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: d886e87cb82b ("sound: make OSS sound core optional")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: lore.kernel.org/r/202307141416.vxuRVpFv-lkp@intel.com
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org
Cc: alsa-devel@alsa-project.org
---
v2: don't delete the HOSTAUDIO Kconfig entry (Masahiro)
v3: drop HOSTAUDIO and use CONFIG_UML_SOUND for it in Makefile (Takashi);
    add SOUND depends on "|| UML" to HAS_IOMEM
v4: use depends on instead of select for SOUND (Masahiro);
    use Closes: instead of Link:
v5: update ARCH=um defconfig files (Masahiro)

 arch/um/configs/i386_defconfig   |    1 +
 arch/um/configs/x86_64_defconfig |    1 +
 arch/um/drivers/Kconfig          |   16 +++-------------
 arch/um/drivers/Makefile         |    2 +-
 sound/Kconfig                    |    2 +-
 5 files changed, 7 insertions(+), 15 deletions(-)

diff -- a/arch/um/drivers/Kconfig b/arch/um/drivers/Kconfig
--- a/arch/um/drivers/Kconfig
+++ b/arch/um/drivers/Kconfig
@@ -111,24 +111,14 @@ config SSL_CHAN
 
 config UML_SOUND
 	tristate "Sound support"
+	depends on SOUND
+	select SOUND_OSS_CORE
 	help
 	  This option enables UML sound support.  If enabled, it will pull in
-	  soundcore and the UML hostaudio relay, which acts as a intermediary
+	  the UML hostaudio relay, which acts as a intermediary
 	  between the host's dsp and mixer devices and the UML sound system.
 	  It is safe to say 'Y' here.
 
-config SOUND
-	tristate
-	default UML_SOUND
-
-config SOUND_OSS_CORE
-	bool
-	default UML_SOUND
-
-config HOSTAUDIO
-	tristate
-	default UML_SOUND
-
 endmenu
 
 menu "UML Network Devices"
diff -- a/sound/Kconfig b/sound/Kconfig
--- a/sound/Kconfig
+++ b/sound/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SOUND
 	tristate "Sound card support"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM || UML
 	help
 	  If you have a sound card in your computer, i.e. if it can say more
 	  than an occasional beep, say Y.
diff -- a/arch/um/drivers/Makefile b/arch/um/drivers/Makefile
--- a/arch/um/drivers/Makefile
+++ b/arch/um/drivers/Makefile
@@ -54,7 +54,7 @@ obj-$(CONFIG_UML_NET) += net.o
 obj-$(CONFIG_MCONSOLE) += mconsole.o
 obj-$(CONFIG_MMAPPER) += mmapper_kern.o 
 obj-$(CONFIG_BLK_DEV_UBD) += ubd.o 
-obj-$(CONFIG_HOSTAUDIO) += hostaudio.o
+obj-$(CONFIG_UML_SOUND) += hostaudio.o
 obj-$(CONFIG_NULL_CHAN) += null.o 
 obj-$(CONFIG_PORT_CHAN) += port.o
 obj-$(CONFIG_PTY_CHAN) += pty.o
diff -- a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
--- a/arch/um/configs/i386_defconfig
+++ b/arch/um/configs/i386_defconfig
@@ -34,6 +34,7 @@ CONFIG_TTY_CHAN=y
 CONFIG_XTERM_CHAN=y
 CONFIG_CON_CHAN="pts"
 CONFIG_SSL_CHAN="pts"
+CONFIG_SOUND=m
 CONFIG_UML_SOUND=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
diff -- a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
--- a/arch/um/configs/x86_64_defconfig
+++ b/arch/um/configs/x86_64_defconfig
@@ -32,6 +32,7 @@ CONFIG_TTY_CHAN=y
 CONFIG_XTERM_CHAN=y
 CONFIG_CON_CHAN="pts"
 CONFIG_SSL_CHAN="pts"
+CONFIG_SOUND=m
 CONFIG_UML_SOUND=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
