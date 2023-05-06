Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CAC6F911E
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 12:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E209729F2;
	Sat,  6 May 2023 12:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E209729F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683368312;
	bh=FE6a8TaePop5OFoBL7g8fp7aHS1Z467cVEw1lcuevwI=;
	h=Subject:To:From:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AqmnWE1U9bDuSmjXCAbnnjmZ1EYn15tHVzQdx2DAGz96zM3jzk4t12tsdIqaus3yy
	 QgUGPG0Y2MnxAATJkJ+Ta5tSg4bA0gouE5yUeS08YH3yiTXE61/V7q79oOPvfSPT+x
	 ZpmJPgY3gGJKgNjTUwP0GfZ/kFiwmidyZxqEpS3o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1B3F80529;
	Sat,  6 May 2023 12:17:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE3FF8052D; Sat,  6 May 2023 12:17:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FEADF80529
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 12:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FEADF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=g2JNMdfc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 445D361A0A;
	Sat,  6 May 2023 10:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B78AC433EF;
	Sat,  6 May 2023 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683368242;
	bh=IzaebC34xnm30FO38AtSRInVDBojZ0h23QIATNug8rI=;
	h=Subject:To:Cc:From:Date:From;
	b=g2JNMdfcNdKvBvKeHQng2eP3tERgJxBZ3gNtfSTi9Dn67juClg+Z1cyRqryKfCbzq
	 8Cavzj6dlyHsC85/72wi7Sj+bkiCaT/pydpQsbD1CpZYMeAszSZX81BAgAdu71fx6b
	 32+d4DtlINWJcc/4YZIYvBQ85bV1i7tkRX8kOico=
Subject: Patch "sound/oss/dmasound: fix build when drivers are mixed =y/=m"
 has been added to the 5.10-stable tree
To: 
 alsa-devel@alsa-project.org,arnd@arndb.de,geert@linux-m68k.org,gregkh@linuxfoundation.org,lkp@intel.com,perex@perex.cz,rdunlap@infradead.org,tiwai@suse.com,tiwai@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 06 May 2023 16:00:12 +0900
Message-ID: <2023050612-yelp-gents-31e8@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Message-ID-Hash: G6RI5TVCZTLAWAZFCRZ65E3OBPCO7XSH
X-Message-ID-Hash: G6RI5TVCZTLAWAZFCRZ65E3OBPCO7XSH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable-commits@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6RI5TVCZTLAWAZFCRZ65E3OBPCO7XSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


This is a note to let you know that I've just added the patch titled

    sound/oss/dmasound: fix build when drivers are mixed =y/=m

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     sound-oss-dmasound-fix-build-when-drivers-are-mixed-y-m.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 9dd7c46346ca4390f84a7ea9933005eb1b175c15 Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 5 Apr 2022 16:41:18 -0700
Subject: sound/oss/dmasound: fix build when drivers are mixed =y/=m

From: Randy Dunlap <rdunlap@infradead.org>

commit 9dd7c46346ca4390f84a7ea9933005eb1b175c15 upstream.

When CONFIG_DMASOUND_ATARI=m and CONFIG_DMASOUND_Q40=y (or vice versa),
dmasound_core.o can be built without dmasound_deinit() being defined,
causing a build error:

ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_atari.ko] undefined!

Modify dmasound_core.c and dmasound.h so that dmasound_deinit() is
always available.

The mixed modes (=y/=m) also mean that several variables and structs
have to be declared in all cases.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: lore.kernel.org/r/202204032138.EFT9qGEd-lkp@intel.com
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/20220405234118.24830-1-rdunlap@infradead.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/oss/dmasound/dmasound.h      |    6 ------
 sound/oss/dmasound/dmasound_core.c |   24 +-----------------------
 2 files changed, 1 insertion(+), 29 deletions(-)

--- a/sound/oss/dmasound/dmasound.h
+++ b/sound/oss/dmasound/dmasound.h
@@ -88,11 +88,7 @@ static inline int ioctl_return(int __use
      */
 
 extern int dmasound_init(void);
-#ifdef MODULE
 extern void dmasound_deinit(void);
-#else
-#define dmasound_deinit()	do { } while (0)
-#endif
 
 /* description of the set-up applies to either hard or soft settings */
 
@@ -114,9 +110,7 @@ typedef struct {
     void *(*dma_alloc)(unsigned int, gfp_t);
     void (*dma_free)(void *, unsigned int);
     int (*irqinit)(void);
-#ifdef MODULE
     void (*irqcleanup)(void);
-#endif
     void (*init)(void);
     void (*silence)(void);
     int (*setFormat)(int);
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -206,12 +206,10 @@ module_param(writeBufSize, int, 0);
 
 MODULE_LICENSE("GPL");
 
-#ifdef MODULE
 static int sq_unit = -1;
 static int mixer_unit = -1;
 static int state_unit = -1;
 static int irq_installed;
-#endif /* MODULE */
 
 /* control over who can modify resources shared between play/record */
 static fmode_t shared_resource_owner;
@@ -391,9 +389,6 @@ static const struct file_operations mixe
 
 static void mixer_init(void)
 {
-#ifndef MODULE
-	int mixer_unit;
-#endif
 	mixer_unit = register_sound_mixer(&mixer_fops, -1);
 	if (mixer_unit < 0)
 		return;
@@ -1176,9 +1171,6 @@ static const struct file_operations sq_f
 static int sq_init(void)
 {
 	const struct file_operations *fops = &sq_fops;
-#ifndef MODULE
-	int sq_unit;
-#endif
 
 	sq_unit = register_sound_dsp(fops, -1);
 	if (sq_unit < 0) {
@@ -1380,9 +1372,6 @@ static const struct file_operations stat
 
 static int state_init(void)
 {
-#ifndef MODULE
-	int state_unit;
-#endif
 	state_unit = register_sound_special(&state_fops, SND_DEV_STATUS);
 	if (state_unit < 0)
 		return state_unit ;
@@ -1400,10 +1389,9 @@ static int state_init(void)
 int dmasound_init(void)
 {
 	int res ;
-#ifdef MODULE
+
 	if (irq_installed)
 		return -EBUSY;
-#endif
 
 	/* Set up sound queue, /dev/audio and /dev/dsp. */
 
@@ -1422,9 +1410,7 @@ int dmasound_init(void)
 		printk(KERN_ERR "DMA sound driver: Interrupt initialization failed\n");
 		return -ENODEV;
 	}
-#ifdef MODULE
 	irq_installed = 1;
-#endif
 
 	printk(KERN_INFO "%s DMA sound driver rev %03d installed\n",
 		dmasound.mach.name, (DMASOUND_CORE_REVISION<<4) +
@@ -1438,8 +1424,6 @@ int dmasound_init(void)
 	return 0;
 }
 
-#ifdef MODULE
-
 void dmasound_deinit(void)
 {
 	if (irq_installed) {
@@ -1458,8 +1442,6 @@ void dmasound_deinit(void)
 		unregister_sound_dsp(sq_unit);
 }
 
-#else /* !MODULE */
-
 static int dmasound_setup(char *str)
 {
 	int ints[6], size;
@@ -1503,8 +1485,6 @@ static int dmasound_setup(char *str)
 
 __setup("dmasound=", dmasound_setup);
 
-#endif /* !MODULE */
-
     /*
      *  Conversion tables
      */
@@ -1591,9 +1571,7 @@ char dmasound_alaw2dma8[] = {
 
 EXPORT_SYMBOL(dmasound);
 EXPORT_SYMBOL(dmasound_init);
-#ifdef MODULE
 EXPORT_SYMBOL(dmasound_deinit);
-#endif
 EXPORT_SYMBOL(dmasound_write_sq);
 EXPORT_SYMBOL(dmasound_catchRadius);
 #ifdef HAS_8BIT_TABLES


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-5.10/sound-oss-dmasound-fix-build-when-drivers-are-mixed-y-m.patch
queue-5.10/driver-core-don-t-require-dynamic_debug-for-initcall_debug-probe-timing.patch
queue-5.10/ima-allow-fix-uml-builds.patch
