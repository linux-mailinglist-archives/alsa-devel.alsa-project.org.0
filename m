Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27627A7E89
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 14:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2A7A4A;
	Wed, 20 Sep 2023 14:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2A7A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695212314;
	bh=uQfT1CrEBKgPRGDrz2daN9OzvE6cgnuzScJXZmkZwQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k6aRtKhXgLS/x56vf1GsALVLnE2g3SB9wN1cFfxLCcDDooPoggmnoSftEclnE3ii9
	 ZYCPzaKADkirgnHZTKG0BH5HJDKnUsHS3e+PzHheponHANGBDXtqTzvudCwtb1Ng+h
	 33G5b9xLDJkc7DC16aB97eQjWglMkNP/0e94kS14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DE07F800AA; Wed, 20 Sep 2023 14:17:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7C04F801F5;
	Wed, 20 Sep 2023 14:17:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7977BF8025A; Wed, 20 Sep 2023 14:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1093F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 14:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1093F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=FZFFK0Xs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45DF7B81D36;
	Wed, 20 Sep 2023 12:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545BAC433B7;
	Wed, 20 Sep 2023 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695212244;
	bh=uQfT1CrEBKgPRGDrz2daN9OzvE6cgnuzScJXZmkZwQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FZFFK0XszUwRdEDI8JsbdUCeBUwIS3srfStQeU8L7GgMeK+1KM/aspStcwtWfhv4/
	 pekamhVin8ZYu7Df7GcDHcgF1OVgpJw0W3rlS4op7khCYYt5a9OhWkFJlm/EMxk04h
	 PXQ5nzwezYzPt+lKXhGijEVCok73Gjo5CWq8WJwA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
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
	alsa-devel@alsa-project.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 163/273] um: Fix hostaudio build errors
Date: Wed, 20 Sep 2023 13:30:03 +0200
Message-ID: <20230920112851.561465885@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112846.440597133@linuxfoundation.org>
References: <20230920112846.440597133@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LZOX2W3RLDDDTWROEETJUSCZX25BESJX
X-Message-ID-Hash: LZOX2W3RLDDDTWROEETJUSCZX25BESJX
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZOX2W3RLDDDTWROEETJUSCZX25BESJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

4.19-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit db4bfcba7bb8d10f00bba2a3da6b9a9c2a1d7b71 ]

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
Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/um/configs/i386_defconfig   |  1 +
 arch/um/configs/x86_64_defconfig |  1 +
 arch/um/drivers/Kconfig          | 16 +++-------------
 arch/um/drivers/Makefile         |  2 +-
 sound/Kconfig                    |  2 +-
 5 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
index 8f114e3b0a7a3..8d06b799a0e4e 100644
--- a/arch/um/configs/i386_defconfig
+++ b/arch/um/configs/i386_defconfig
@@ -35,6 +35,7 @@ CONFIG_TTY_CHAN=y
 CONFIG_XTERM_CHAN=y
 CONFIG_CON_CHAN="pts"
 CONFIG_SSL_CHAN="pts"
+CONFIG_SOUND=m
 CONFIG_UML_SOUND=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
index 5d0875fc0db25..446bdda4cbfb6 100644
--- a/arch/um/configs/x86_64_defconfig
+++ b/arch/um/configs/x86_64_defconfig
@@ -33,6 +33,7 @@ CONFIG_TTY_CHAN=y
 CONFIG_XTERM_CHAN=y
 CONFIG_CON_CHAN="pts"
 CONFIG_SSL_CHAN="pts"
+CONFIG_SOUND=m
 CONFIG_UML_SOUND=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
diff --git a/arch/um/drivers/Kconfig b/arch/um/drivers/Kconfig
index 2638e46f50ccd..494f7c27056e3 100644
--- a/arch/um/drivers/Kconfig
+++ b/arch/um/drivers/Kconfig
@@ -104,24 +104,14 @@ config SSL_CHAN
 
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
diff --git a/arch/um/drivers/Makefile b/arch/um/drivers/Makefile
index 693319839f69e..d945abf90c319 100644
--- a/arch/um/drivers/Makefile
+++ b/arch/um/drivers/Makefile
@@ -52,7 +52,7 @@ obj-$(CONFIG_UML_NET) += net.o
 obj-$(CONFIG_MCONSOLE) += mconsole.o
 obj-$(CONFIG_MMAPPER) += mmapper_kern.o 
 obj-$(CONFIG_BLK_DEV_UBD) += ubd.o 
-obj-$(CONFIG_HOSTAUDIO) += hostaudio.o
+obj-$(CONFIG_UML_SOUND) += hostaudio.o
 obj-$(CONFIG_NULL_CHAN) += null.o 
 obj-$(CONFIG_PORT_CHAN) += port.o
 obj-$(CONFIG_PTY_CHAN) += pty.o
diff --git a/sound/Kconfig b/sound/Kconfig
index 1140e9988fc50..76febc37862de 100644
--- a/sound/Kconfig
+++ b/sound/Kconfig
@@ -1,6 +1,6 @@
 menuconfig SOUND
 	tristate "Sound card support"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM || UML
 	help
 	  If you have a sound card in your computer, i.e. if it can say more
 	  than an occasional beep, say Y.
-- 
2.40.1



