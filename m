Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF616E933D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79CDEC2;
	Thu, 20 Apr 2023 13:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79CDEC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681991091;
	bh=wFpWNIIDhaIKD745Kh9+TsFWilmntXuS24kAJ4xnIPg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IQvuOm8FLyDQ1iVsh4lrdx285OTsl5pkptTCk45MGV1XX4BfPtvg5utZ/ZIO26e9D
	 3vSus2qRl5yehx9h7FRPz19U/l6UXc5kohuImmr0GIZreW9sH0DUdhgnHXlcFqi1lZ
	 OhELbOBcrZX1B7swOV5IN70Oki+RKzxnynQVTSa4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E944F800AC;
	Thu, 20 Apr 2023 13:44:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BDFDF80155; Thu, 20 Apr 2023 13:43:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A603CF800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A603CF800F8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D396220076;
	Thu, 20 Apr 2023 07:43:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppShR-gWa-00; Thu, 20 Apr 2023 13:43:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] docs: sound/kernel-api/writing-an-alsa-driver.rst:
 polishing
Date: Thu, 20 Apr 2023 13:43:41 +0200
Message-Id: <20230420114341.878441-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KKYV4WGIE4UQ2JARB4DR77QU2ZG2SLDI
X-Message-ID-Hash: KKYV4WGIE4UQ2JARB4DR77QU2ZG2SLDI
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKYV4WGIE4UQ2JARB4DR77QU2ZG2SLDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Update some outdated info
- Language fixes
- Whitespace/formatting fixes
- Prefer attached over stand-alone '::'

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

v2:
- dropped questionable hunk from period timer example code
- new hunk: improved wording wrt period sizes
---
Range-diff against v1:
1:  d9eb90fe56ae ! 1:  0f0ea8a17ff1 docs: sound: kernel-api: writing-an-alsa-driver.rst: polishing
    @@ Metadata
     Author: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
     
      ## Commit message ##
    -    docs: sound: kernel-api: writing-an-alsa-driver.rst: polishing
    +    docs: sound/kernel-api/writing-an-alsa-driver.rst: polishing
     
         - Update some outdated info
         - Language fixes
         - Whitespace/formatting fixes
         - Prefer attached over stand-alone '::'
     
         Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
     
    +    ---
    +
    +    v2:
    +    - dropped questionable hunk from period timer example code
    +    - new hunk: improved wording wrt period sizes
    +
      ## Documentation/sound/kernel-api/writing-an-alsa-driver.rst ##
     @@ Documentation/sound/kernel-api/writing-an-alsa-driver.rst: explain the general topic of linux kernel coding and doesn't cover
      low-level driver implementation details. It only describes the standard
    @@ Documentation/sound/kernel-api/writing-an-alsa-driver.rst: Typically, you'll hav
     -   world. The period defines the size at which a PCM interrupt is
     -   generated. This size strongly depends on the hardware. Generally,
     -   the smaller period size will give you more interrupts, that is,
    +-   more controls. In the case of capture, this size defines the input
    +-   latency. On the other hand, the whole buffer size defines the
    +-   output latency for the playback direction.
     +   world. The period defines the point at which a PCM interrupt is
     +   generated. This point strongly depends on the hardware. Generally,
    -+   a smaller period size will give you more interrupts, that is,
    -    more controls. In the case of capture, this size defines the input
    -    latency. On the other hand, the whole buffer size defines the
    -    output latency for the playback direction.
    ++   a smaller period size will give you more interrupts, which results
    ++   in being able to fill/drain the buffer more timely. In the case of
    ++   capture, this size defines the input latency. On the other hand,
    ++   the whole buffer size defines the output latency for the playback
    ++   direction.
      
      -  There is also a field ``fifo_size``. This specifies the size of the
     -   hardware FIFO, but currently it is neither used in the driver nor
    @@ Documentation/sound/kernel-api/writing-an-alsa-driver.rst: position and accumula
      
      
            static irqreturn_t snd_mychip_interrupt(int irq, void *dev_id)
    -@@ Documentation/sound/kernel-api/writing-an-alsa-driver.rst: Typical code would be like the following.
    -                       /* over the period boundary? */
    -                       if (chip->size >= runtime->period_size) {
    -                               /* reset the accumulator */
    --                              chip->size %= runtime->period_size;
    -+                              chip->size -= runtime->period_size;
    -                               /* call updater */
    -                               spin_unlock(&chip->lock);
    -                               snd_pcm_period_elapsed(substream);
     @@ Documentation/sound/kernel-api/writing-an-alsa-driver.rst: Typical code would be like the following.
      On calling :c:func:`snd_pcm_period_elapsed()`
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 .../kernel-api/writing-an-alsa-driver.rst     | 1052 +++++++----------
 1 file changed, 399 insertions(+), 653 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index a368529e8ed3..a22fa9642011 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -19,18 +19,13 @@ explain the general topic of linux kernel coding and doesn't cover
 low-level driver implementation details. It only describes the standard
 way to write a PCI sound driver on ALSA.
 
-This document is still a draft version. Any feedback and corrections,
-please!!
-
 File Tree Structure
 ===================
 
 General
 -------
 
-The file tree structure of ALSA driver is depicted below.
-
-::
+The file tree structure of ALSA driver is depicted below::
 
             sound
                     /core
@@ -68,39 +63,39 @@ kernel config.
 core/oss
 ~~~~~~~~
 
-The codes for PCM and mixer OSS emulation modules are stored in this
-directory. The rawmidi OSS emulation is included in the ALSA rawmidi
+The code for OSS PCM and mixer emulation modules is stored in this
+directory. The OSS rawmidi emulation is included in the ALSA rawmidi
 code since it's quite small. The sequencer code is stored in
 ``core/seq/oss`` directory (see `below <core/seq/oss_>`__).
 
 core/seq
 ~~~~~~~~
 
 This directory and its sub-directories are for the ALSA sequencer. This
 directory contains the sequencer core and primary sequencer modules such
-like snd-seq-midi, snd-seq-virmidi, etc. They are compiled only when
+as snd-seq-midi, snd-seq-virmidi, etc. They are compiled only when
 ``CONFIG_SND_SEQUENCER`` is set in the kernel config.
 
 core/seq/oss
 ~~~~~~~~~~~~
 
-This contains the OSS sequencer emulation codes.
+This contains the OSS sequencer emulation code.
 
 include directory
 -----------------
 
 This is the place for the public header files of ALSA drivers, which are
-to be exported to user-space, or included by several files at different
+to be exported to user-space, or included by several files in different
 directories. Basically, the private header files should not be placed in
 this directory, but you may still find files there, due to historical
 reasons :)
 
 drivers directory
 -----------------
 
 This directory contains code shared among different drivers on different
 architectures. They are hence supposed not to be architecture-specific.
-For example, the dummy pcm driver and the serial MIDI driver are found
+For example, the dummy PCM driver and the serial MIDI driver are found
 in this directory. In the sub-directories, there is code for components
 which are independent from bus and cpu architectures.
 
@@ -156,8 +151,8 @@ these architectures.
 usb directory
 -------------
 
-This directory contains the USB-audio driver. In the latest version, the
-USB MIDI driver is integrated in the usb-audio driver.
+This directory contains the USB-audio driver.
+The USB MIDI driver is integrated in the usb-audio driver.
 
 pcmcia directory
 ----------------
@@ -175,9 +170,9 @@ layer including ASoC core, codec and machine drivers.
 oss directory
 -------------
 
-Here contains OSS/Lite codes.
-All codes have been deprecated except for dmasound on m68k as of
-writing this.
+This contains OSS/Lite code.
+At the time of writing, all code has been removed except for dmasound
+on m68k.
 
 
 Basic Flow for PCI Drivers
@@ -341,7 +336,7 @@ to details explained in the following section.
 
       error:
               snd_card_free(card);
-	      return err;
+              return err;
       }
 
       /* destructor -- see the "Destructor" sub-section */
@@ -381,7 +376,7 @@ where ``enable[dev]`` is the module option.
 
 Each time the ``probe`` callback is called, check the availability of
 the device. If not available, simply increment the device index and
-returns. dev will be incremented also later (`step 7
+return. dev will be incremented also later (`step 7
 <7) Set the PCI driver data and return zero._>`__).
 
 2) Create a card instance
@@ -402,9 +397,7 @@ Components`_.
 3) Create a main component
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-In this part, the PCI resources are allocated.
-
-::
+In this part, the PCI resources are allocated::
 
   struct mychip *chip;
   ....
@@ -417,13 +410,11 @@ Management`_.
 
 When something goes wrong, the probe function needs to deal with the
 error.  In this example, we have a single error handling path placed
-at the end of the function.
-
-::
+at the end of the function::
 
   error:
           snd_card_free(card);
-	  return err;
+          return err;
 
 Since each component can be properly freed, the single
 :c:func:`snd_card_free()` call should suffice in most cases.
@@ -483,13 +474,11 @@ remove callback and power-management callbacks, too.
 Destructor
 ----------
 
-The destructor, remove callback, simply releases the card instance. Then
-the ALSA middle layer will release all the attached components
+The destructor, the remove callback, simply releases the card instance.
+Then the ALSA middle layer will release all the attached components
 automatically.
 
-It would be typically just calling :c:func:`snd_card_free()`:
-
-::
+It would be typically just calling :c:func:`snd_card_free()`::
 
   static void snd_mychip_remove(struct pci_dev *pci)
   {
@@ -504,9 +493,7 @@ Header Files
 ------------
 
 For the above example, at least the following include files are
-necessary.
-
-::
+necessary::
 
   #include <linux/init.h>
   #include <linux/pci.h>
@@ -544,9 +531,7 @@ list on the card record is used to manage the correct release of
 resources at destruction.
 
 As mentioned above, to create a card instance, call
-:c:func:`snd_card_new()`.
-
-::
+:c:func:`snd_card_new()`::
 
   struct snd_card *card;
   int err;
@@ -572,10 +557,8 @@ struct snd_device object. A component
 can be a PCM instance, a control interface, a raw MIDI interface, etc.
 Each such instance has one component entry.
 
-A component can be created via :c:func:`snd_device_new()`
-function.
-
-::
+A component can be created via the :c:func:`snd_device_new()`
+function::
 
   snd_device_new(card, SNDRV_DEV_XXX, chip, &ops);
 
@@ -591,7 +574,7 @@ allocated manually beforehand, and its pointer is passed as the
 argument. This pointer (``chip`` in the above example) is used as the
 identifier for the instance.
 
-Each pre-defined ALSA component such as ac97 and pcm calls
+Each pre-defined ALSA component such as AC97 and PCM calls
 :c:func:`snd_device_new()` inside its constructor. The destructor
 for each component is defined in the callback pointers. Hence, you don't
 need to take care of calling a destructor for such a component.
@@ -605,9 +588,7 @@ Chip-Specific Data
 ------------------
 
 Chip-specific information, e.g. the I/O port address, its resource
-pointer, or the irq number, is stored in the chip-specific record.
-
-::
+pointer, or the irq number, is stored in the chip-specific record::
 
   struct mychip {
           ....
@@ -620,9 +601,7 @@ In general, there are two ways of allocating the chip record.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 As mentioned above, you can pass the extra-data-length to the 5th
-argument of :c:func:`snd_card_new()`, i.e.
-
-::
+argument of :c:func:`snd_card_new()`, e.g.::
 
   err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
                      sizeof(struct mychip), &card);
@@ -642,9 +621,7 @@ released together with the card instance.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 After allocating a card instance via :c:func:`snd_card_new()`
-(with ``0`` on the 4th arg), call :c:func:`kzalloc()`.
-
-::
+(with ``0`` on the 4th arg), call :c:func:`kzalloc()`::
 
   struct snd_card *card;
   struct mychip *chip;
@@ -663,39 +640,33 @@ The chip record should have the field to hold the card pointer at least,
   };
 
 
-Then, set the card pointer in the returned chip instance.
-
-::
+Then, set the card pointer in the returned chip instance::
 
   chip->card = card;
 
 Next, initialize the fields, and register this chip record as a
-low-level device with a specified ``ops``,
-
-::
+low-level device with a specified ``ops``::
 
   static const struct snd_device_ops ops = {
           .dev_free =        snd_mychip_dev_free,
   };
   ....
   snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
 
 :c:func:`snd_mychip_dev_free()` is the device-destructor
-function, which will call the real destructor.
-
-::
+function, which will call the real destructor::
 
   static int snd_mychip_dev_free(struct snd_device *device)
   {
           return snd_mychip_free(device->device_data);
   }
 
 where :c:func:`snd_mychip_free()` is the real destructor.
 
-The demerit of this method is the obviously more amount of codes.
-The merit is, however, you can trigger the own callback at registering
-and disconnecting the card via setting in snd_device_ops.
-About the registering and disconnecting the card, see the subsections
+The demerit of this method is the obviously larger amount of code.
+The merit is, however, that you can trigger your own callback at
+registering and disconnecting the card via a setting in snd_device_ops.
+About registering and disconnecting the card, see the subsections
 below.
 
 
@@ -724,9 +695,7 @@ Full Code Example
 -----------------
 
 In this section, we'll complete the chip-specific constructor,
-destructor and PCI entries. Example code is shown first, below.
-
-::
+destructor and PCI entries. Example code is shown first, below::
 
       struct mychip {
               struct snd_card *card;
@@ -866,9 +835,7 @@ resources. Also, you need to set the proper PCI DMA mask to limit the
 accessed I/O range. In some cases, you might need to call
 :c:func:`pci_set_master()` function, too.
 
-Suppose the 28bit mask, and the code to be added would be like:
-
-::
+Suppose a 28bit mask, the code to be added would look like::
 
   err = pci_enable_device(pci);
   if (err < 0)
@@ -890,9 +857,7 @@ function (see below).
 
 Now assume that the PCI device has an I/O port with 8 bytes and an
 interrupt. Then struct mychip will have the
-following fields:
-
-::
+following fields::
 
   struct mychip {
           struct snd_card *card;
@@ -905,14 +870,12 @@ following fields:
 For an I/O port (and also a memory region), you need to have the
 resource pointer for the standard resource management. For an irq, you
 have to keep only the irq number (integer). But you need to initialize
-this number as -1 before actual allocation, since irq 0 is valid. The
+this number to -1 before actual allocation, since irq 0 is valid. The
 port address and its resource pointer can be initialized as null by
 :c:func:`kzalloc()` automatically, so you don't have to take care of
 resetting them.
 
-The allocation of an I/O port is done like this:
-
-::
+The allocation of an I/O port is done like this::
 
   err = pci_request_regions(pci, "My Chip");
   if (err < 0) { 
@@ -928,9 +891,7 @@ The returned value, ``chip->res_port``, is allocated via
 must be released via :c:func:`kfree()`, but there is a problem with
 this. This issue will be explained later.
 
-The allocation of an interrupt source is done like this:
-
-::
+The allocation of an interrupt source is done like this::
 
   if (request_irq(pci->irq, snd_mychip_interrupt,
                   IRQF_SHARED, KBUILD_MODNAME, chip)) {
@@ -954,36 +915,31 @@ used for that, but you can use what you like, too.
 
 I won't give details about the interrupt handler at this point, but at
 least its appearance can be explained now. The interrupt handler looks
-usually like the following:
-
-::
+usually as follows::
 
   static irqreturn_t snd_mychip_interrupt(int irq, void *dev_id)
   {
           struct mychip *chip = dev_id;
           ....
           return IRQ_HANDLED;
   }
 
 After requesting the IRQ, you can passed it to ``card->sync_irq``
-field:
-::
+field::
 
           card->irq = chip->irq;
 
-This allows PCM core automatically performing
-:c:func:`synchronize_irq()` at the necessary timing like ``hw_free``.
+This allows the PCM core to automatically call
+:c:func:`synchronize_irq()` at the right time, like before ``hw_free``.
 See the later section `sync_stop callback`_ for details.
 
 Now let's write the corresponding destructor for the resources above.
 The role of destructor is simple: disable the hardware (if already
 activated) and release the resources. So far, we have no hardware part,
 so the disabling code is not written here.
 
 To release the resources, the “check-and-release” method is a safer way.
-For the interrupt, do like this:
-
-::
+For the interrupt, do like this::
 
   if (chip->irq >= 0)
           free_irq(chip->irq, chip);
@@ -997,72 +953,59 @@ When you requested I/O ports or memory regions via
 :c:func:`pci_request_regions()` like in this example, release the
 resource(s) using the corresponding function,
 :c:func:`pci_release_region()` or
-:c:func:`pci_release_regions()`.
-
-::
+:c:func:`pci_release_regions()`::
 
   pci_release_regions(chip->pci);
 
 When you requested manually via :c:func:`request_region()` or
 :c:func:`request_mem_region()`, you can release it via
 :c:func:`release_resource()`. Suppose that you keep the resource
 pointer returned from :c:func:`request_region()` in
-chip->res_port, the release procedure looks like:
-
-::
+chip->res_port, the release procedure looks like::
 
   release_and_free_resource(chip->res_port);
 
 Don't forget to call :c:func:`pci_disable_device()` before the
 end.
 
-And finally, release the chip-specific record.
-
-::
+And finally, release the chip-specific record::
 
   kfree(chip);
 
-We didn't implement the hardware disabling part in the above. If you
+We didn't implement the hardware disabling part above. If you
 need to do this, please note that the destructor may be called even
 before the initialization of the chip is completed. It would be better
 to have a flag to skip hardware disabling if the hardware was not
 initialized yet.
 
 When the chip-data is assigned to the card using
-:c:func:`snd_device_new()` with ``SNDRV_DEV_LOWLELVEL`` , its
-destructor is called at the last. That is, it is assured that all other
+:c:func:`snd_device_new()` with ``SNDRV_DEV_LOWLELVEL``, its
+destructor is called last. That is, it is assured that all other
 components like PCMs and controls have already been released. You don't
 have to stop PCMs, etc. explicitly, but just call low-level hardware
 stopping.
 
 The management of a memory-mapped region is almost as same as the
-management of an I/O port. You'll need three fields like the
-following:
-
-::
+management of an I/O port. You'll need two fields as follows::
 
   struct mychip {
           ....
           unsigned long iobase_phys;
           void __iomem *iobase_virt;
   };
 
-and the allocation would be like below:
-
-::
+and the allocation would look like below::
 
   err = pci_request_regions(pci, "My Chip");
   if (err < 0) {
           kfree(chip);
           return err;
   }
   chip->iobase_phys = pci_resource_start(pci, 0);
   chip->iobase_virt = ioremap(chip->iobase_phys,
                                       pci_resource_len(pci, 0));
 
-and the corresponding destructor would be:
-
-::
+and the corresponding destructor would be::
 
   static int snd_mychip_free(struct mychip *chip)
   {
@@ -1075,9 +1018,7 @@ and the corresponding destructor would be:
   }
 
 Of course, a modern way with :c:func:`pci_iomap()` will make things a
-bit easier, too.
-
-::
+bit easier, too::
 
   err = pci_request_regions(pci, "My Chip");
   if (err < 0) {
@@ -1097,9 +1038,7 @@ struct pci_device_id table for
 this chipset. It's a table of PCI vendor/device ID number, and some
 masks.
 
-For example,
-
-::
+For example::
 
   static struct pci_device_id snd_mychip_ids[] = {
           { PCI_VENDOR_ID_FOO, PCI_DEVICE_ID_BAR,
@@ -1120,24 +1059,20 @@ The last entry of this list is the terminator. You must specify this
 all-zero entry.
 
 Then, prepare the struct pci_driver
-record:
-
-::
+record::
 
   static struct pci_driver driver = {
           .name = KBUILD_MODNAME,
           .id_table = snd_mychip_ids,
           .probe = snd_mychip_probe,
           .remove = snd_mychip_remove,
   };
 
 The ``probe`` and ``remove`` functions have already been defined in
 the previous sections. The ``name`` field is the name string of this
-device. Note that you must not use a slash “/” in this string.
+device. Note that you must not use slashes (“/”) in this string.
 
-And at last, the module entries:
-
-::
+And at last, the module entries::
 
   static int __init alsa_card_mychip_init(void)
   {
@@ -1167,33 +1102,31 @@ The PCM middle layer of ALSA is quite powerful and it is only necessary
 for each driver to implement the low-level functions to access its
 hardware.
 
-For accessing to the PCM layer, you need to include ``<sound/pcm.h>``
+To access the PCM layer, you need to include ``<sound/pcm.h>``
 first. In addition, ``<sound/pcm_params.h>`` might be needed if you
-access to some functions related with hw_param.
+access some functions related with hw_param.
 
-Each card device can have up to four pcm instances. A pcm instance
-corresponds to a pcm device file. The limitation of number of instances
-comes only from the available bit size of the Linux's device numbers.
-Once when 64bit device number is used, we'll have more pcm instances
+Each card device can have up to four PCM instances. A PCM instance
+corresponds to a PCM device file. The limitation of number of instances
+comes only from the available bit size of Linux' device numbers.
+Once 64bit device numbers are used, we'll have more PCM instances
 available.
 
-A pcm instance consists of pcm playback and capture streams, and each
-pcm stream consists of one or more pcm substreams. Some soundcards
+A PCM instance consists of PCM playback and capture streams, and each
+PCM stream consists of one or more PCM substreams. Some soundcards
 support multiple playback functions. For example, emu10k1 has a PCM
 playback of 32 stereo substreams. In this case, at each open, a free
 substream is (usually) automatically chosen and opened. Meanwhile, when
-only one substream exists and it was already opened, the successful open
+only one substream exists and it was already opened, a subsequent open
 will either block or error with ``EAGAIN`` according to the file open
 mode. But you don't have to care about such details in your driver. The
 PCM middle layer will take care of such work.
 
 Full Code Example
 -----------------
 
 The example code below does not include any hardware access routines but
-shows only the skeleton, how to build up the PCM interfaces.
-
-::
+shows only the skeleton, how to build up the PCM interfaces::
 
       #include <sound/pcm.h>
       ....
@@ -1399,10 +1332,8 @@ shows only the skeleton, how to build up the PCM interfaces.
 PCM Constructor
 ---------------
 
-A pcm instance is allocated by the :c:func:`snd_pcm_new()`
-function. It would be better to create a constructor for pcm, namely,
-
-::
+A PCM instance is allocated by the :c:func:`snd_pcm_new()`
+function. It would be better to create a constructor for the PCM, namely::
 
   static int snd_mychip_new_pcm(struct mychip *chip)
   {
@@ -1415,16 +1346,16 @@ function. It would be better to create a constructor for pcm, namely,
           pcm->private_data = chip;
           strcpy(pcm->name, "My Chip");
           chip->pcm = pcm;
-	  ....
+          ...
           return 0;
   }
 
-The :c:func:`snd_pcm_new()` function takes four arguments. The
-first argument is the card pointer to which this pcm is assigned, and
+The :c:func:`snd_pcm_new()` function takes six arguments. The
+first argument is the card pointer to which this PCM is assigned, and
 the second is the ID string.
 
 The third argument (``index``, 0 in the above) is the index of this new
-pcm. It begins from zero. If you create more than one pcm instances,
+PCM. It begins from zero. If you create more than one PCM instances,
 specify the different numbers in this argument. For example, ``index =
 1`` for the second PCM device.
 
@@ -1437,26 +1368,20 @@ If a chip supports multiple playbacks or captures, you can specify more
 numbers, but they must be handled properly in open/close, etc.
 callbacks. When you need to know which substream you are referring to,
 then it can be obtained from struct snd_pcm_substream data passed to each
-callback as follows:
-
-::
+callback as follows::
 
   struct snd_pcm_substream *substream;
   int index = substream->number;
 
 
-After the pcm is created, you need to set operators for each pcm stream.
-
-::
+After the PCM is created, you need to set operators for each PCM stream::
 
   snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
                   &snd_mychip_playback_ops);
   snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
                   &snd_mychip_capture_ops);
 
-The operators are defined typically like this:
-
-::
+The operators are defined typically like this::
 
   static struct snd_pcm_ops snd_mychip_playback_ops = {
           .open =        snd_mychip_pcm_open,
@@ -1472,41 +1397,35 @@ All the callbacks are described in the Operators_ subsection.
 
 After setting the operators, you probably will want to pre-allocate the
 buffer and set up the managed allocation mode.
-For that, simply call the following:
-
-::
+For that, simply call the following::
 
   snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
                                  &chip->pci->dev,
                                  64*1024, 64*1024);
 
-It will allocate a buffer up to 64kB as default. Buffer management
+It will allocate a buffer up to 64kB by default. Buffer management
 details will be described in the later section `Buffer and Memory
 Management`_.
 
-Additionally, you can set some extra information for this pcm in
+Additionally, you can set some extra information for this PCM in
 ``pcm->info_flags``. The available values are defined as
 ``SNDRV_PCM_INFO_XXX`` in ``<sound/asound.h>``, which is used for the
 hardware definition (described later). When your soundchip supports only
-half-duplex, specify like this:
-
-::
+half-duplex, specify it like this::
 
   pcm->info_flags = SNDRV_PCM_INFO_HALF_DUPLEX;
 
 
 ... And the Destructor?
 -----------------------
 
-The destructor for a pcm instance is not always necessary. Since the pcm
+The destructor for a PCM instance is not always necessary. Since the PCM
 device will be released by the middle layer code automatically, you
 don't have to call the destructor explicitly.
 
 The destructor would be necessary if you created special records
 internally and needed to release them. In such a case, set the
-destructor function to ``pcm->private_free``:
-
-::
+destructor function to ``pcm->private_free``::
 
       static void mychip_pcm_free(struct snd_pcm *pcm)
       {
@@ -1537,13 +1456,11 @@ Runtime Pointer - The Chest of PCM Information
 When the PCM substream is opened, a PCM runtime instance is allocated
 and assigned to the substream. This pointer is accessible via
 ``substream->runtime``. This runtime pointer holds most information you
-need to control the PCM: the copy of hw_params and sw_params
+need to control the PCM: a copy of hw_params and sw_params
 configurations, the buffer pointers, mmap records, spinlocks, etc.
 
 The definition of runtime instance is found in ``<sound/pcm.h>``. Here
-are the contents of this file:
-
-::
+is the relevant part of this file::
 
   struct _snd_pcm_runtime {
           /* -- Status -- */
@@ -1638,24 +1555,20 @@ Hardware Description
 
 The hardware descriptor (struct snd_pcm_hardware) contains the definitions of
 the fundamental hardware configuration. Above all, you'll need to define this
-in the `PCM open callback`_. Note that the runtime instance holds the copy of
-the descriptor, not the pointer to the existing descriptor. That is,
+in the `PCM open callback`_. Note that the runtime instance holds a copy of
+the descriptor, not a pointer to the existing descriptor. That is,
 in the open callback, you can modify the copied descriptor
 (``runtime->hw``) as you need. For example, if the maximum number of
 channels is 1 only on some chip models, you can still use the same
-hardware descriptor and change the channels_max later:
-
-::
+hardware descriptor and change the channels_max later::
 
           struct snd_pcm_runtime *runtime = substream->runtime;
           ...
           runtime->hw = snd_mychip_playback_hw; /* common definition */
           if (chip->model == VERY_OLD_ONE)
                   runtime->hw.channels_max = 1;
 
-Typically, you'll have a hardware descriptor as below:
-
-::
+Typically, you'll have a hardware descriptor as below::
 
   static struct snd_pcm_hardware snd_mychip_playback_hw = {
           .info = (SNDRV_PCM_INFO_MMAP |
@@ -1676,71 +1589,72 @@ Typically, you'll have a hardware descriptor as below:
   };
 
 -  The ``info`` field contains the type and capabilities of this
-   pcm. The bit flags are defined in ``<sound/asound.h>`` as
+   PCM. The bit flags are defined in ``<sound/asound.h>`` as
    ``SNDRV_PCM_INFO_XXX``. Here, at least, you have to specify whether
-   the mmap is supported and which interleaved format is
+   mmap is supported and which interleaving formats are
    supported. When the hardware supports mmap, add the
    ``SNDRV_PCM_INFO_MMAP`` flag here. When the hardware supports the
-   interleaved or the non-interleaved formats,
+   interleaved or the non-interleaved formats, the
    ``SNDRV_PCM_INFO_INTERLEAVED`` or ``SNDRV_PCM_INFO_NONINTERLEAVED``
    flag must be set, respectively. If both are supported, you can set
    both, too.
 
    In the above example, ``MMAP_VALID`` and ``BLOCK_TRANSFER`` are
    specified for the OSS mmap mode. Usually both are set. Of course,
-   ``MMAP_VALID`` is set only if the mmap is really supported.
+   ``MMAP_VALID`` is set only if mmap is really supported.
 
    The other possible flags are ``SNDRV_PCM_INFO_PAUSE`` and
-   ``SNDRV_PCM_INFO_RESUME``. The ``PAUSE`` bit means that the pcm
+   ``SNDRV_PCM_INFO_RESUME``. The ``PAUSE`` bit means that the PCM
    supports the “pause” operation, while the ``RESUME`` bit means that
-   the pcm supports the full “suspend/resume” operation. If the
+   the PCM supports the full “suspend/resume” operation. If the
    ``PAUSE`` flag is set, the ``trigger`` callback below must handle
    the corresponding (pause push/release) commands. The suspend/resume
    trigger commands can be defined even without the ``RESUME``
-   flag. See `Power Management`_ section for details.
+   flag. See the `Power Management`_ section for details.
 
    When the PCM substreams can be synchronized (typically,
-   synchronized start/stop of a playback and a capture streams), you
+   synchronized start/stop of a playback and a capture stream), you
    can give ``SNDRV_PCM_INFO_SYNC_START``, too. In this case, you'll
    need to check the linked-list of PCM substreams in the trigger
-   callback. This will be described in the later section.
+   callback. This will be described in a later section.
 
--  ``formats`` field contains the bit-flags of supported formats
+-  The ``formats`` field contains the bit-flags of supported formats
    (``SNDRV_PCM_FMTBIT_XXX``). If the hardware supports more than one
    format, give all or'ed bits. In the example above, the signed 16bit
    little-endian format is specified.
 
--  ``rates`` field contains the bit-flags of supported rates
+-  The ``rates`` field contains the bit-flags of supported rates
    (``SNDRV_PCM_RATE_XXX``). When the chip supports continuous rates,
-   pass ``CONTINUOUS`` bit additionally. The pre-defined rate bits are
-   provided only for typical rates. If your chip supports
+   pass the ``CONTINUOUS`` bit additionally. The pre-defined rate bits
+   are provided only for typical rates. If your chip supports
    unconventional rates, you need to add the ``KNOT`` bit and set up
    the hardware constraint manually (explained later).
 
 -  ``rate_min`` and ``rate_max`` define the minimum and maximum sample
    rate. This should correspond somehow to ``rates`` bits.
 
--  ``channels_min`` and ``channels_max`` define, as you might already
+-  ``channels_min`` and ``channels_max`` define, as you might have already
    expected, the minimum and maximum number of channels.
 
 -  ``buffer_bytes_max`` defines the maximum buffer size in
    bytes. There is no ``buffer_bytes_min`` field, since it can be
    calculated from the minimum period size and the minimum number of
    periods. Meanwhile, ``period_bytes_min`` and ``period_bytes_max``
    define the minimum and maximum size of the period in bytes.
    ``periods_max`` and ``periods_min`` define the maximum and minimum
    number of periods in the buffer.
 
    The “period” is a term that corresponds to a fragment in the OSS
-   world. The period defines the size at which a PCM interrupt is
-   generated. This size strongly depends on the hardware. Generally,
-   the smaller period size will give you more interrupts, that is,
-   more controls. In the case of capture, this size defines the input
-   latency. On the other hand, the whole buffer size defines the
-   output latency for the playback direction.
+   world. The period defines the point at which a PCM interrupt is
+   generated. This point strongly depends on the hardware. Generally,
+   a smaller period size will give you more interrupts, which results
+   in being able to fill/drain the buffer more timely. In the case of
+   capture, this size defines the input latency. On the other hand,
+   the whole buffer size defines the output latency for the playback
+   direction.
 
 -  There is also a field ``fifo_size``. This specifies the size of the
-   hardware FIFO, but currently it is neither used in the driver nor
+   hardware FIFO, but currently it is neither used by the drivers nor
    in the alsa-lib. So, you can ignore this field.
 
 PCM Configurations
@@ -1759,63 +1673,60 @@ One thing to be noted is that the configured buffer and period sizes
 are stored in “frames” in the runtime. In the ALSA world, ``1 frame =
 channels \* samples-size``. For conversion between frames and bytes,
 you can use the :c:func:`frames_to_bytes()` and
-:c:func:`bytes_to_frames()` helper functions.
-
-::
+:c:func:`bytes_to_frames()` helper functions::
 
   period_bytes = frames_to_bytes(runtime, runtime->period_size);
 
 Also, many software parameters (sw_params) are stored in frames, too.
-Please check the type of the field. ``snd_pcm_uframes_t`` is for the
-frames as unsigned integer while ``snd_pcm_sframes_t`` is for the
+Please check the type of the field. ``snd_pcm_uframes_t`` is for
+frames as unsigned integer while ``snd_pcm_sframes_t`` is for
 frames as signed integer.
 
 DMA Buffer Information
 ~~~~~~~~~~~~~~~~~~~~~~
 
-The DMA buffer is defined by the following four fields, ``dma_area``,
-``dma_addr``, ``dma_bytes`` and ``dma_private``. The ``dma_area``
+The DMA buffer is defined by the following four fields: ``dma_area``,
+``dma_addr``, ``dma_bytes`` and ``dma_private``. ``dma_area``
 holds the buffer pointer (the logical address). You can call
 :c:func:`memcpy()` from/to this pointer. Meanwhile, ``dma_addr`` holds
 the physical address of the buffer. This field is specified only when
-the buffer is a linear buffer. ``dma_bytes`` holds the size of buffer
-in bytes. ``dma_private`` is used for the ALSA DMA allocator.
+the buffer is a linear buffer. ``dma_bytes`` holds the size of the
+buffer in bytes. ``dma_private`` is used for the ALSA DMA allocator.
 
 If you use either the managed buffer allocation mode or the standard
 API function :c:func:`snd_pcm_lib_malloc_pages()` for allocating the buffer,
 these fields are set by the ALSA middle layer, and you should *not*
 change them by yourself. You can read them but not write them. On the
 other hand, if you want to allocate the buffer by yourself, you'll
-need to manage it in hw_params callback. At least, ``dma_bytes`` is
+need to manage it in the hw_params callback. At least, ``dma_bytes`` is
 mandatory. ``dma_area`` is necessary when the buffer is mmapped. If
 your driver doesn't support mmap, this field is not
 necessary. ``dma_addr`` is also optional. You can use dma_private as
 you like, too.
 
 Running Status
 ~~~~~~~~~~~~~~
 
 The running status can be referred via ``runtime->status``. This is
-the pointer to the struct snd_pcm_mmap_status record.
+a pointer to a struct snd_pcm_mmap_status record.
 For example, you can get the current
 DMA hardware pointer via ``runtime->status->hw_ptr``.
 
 The DMA application pointer can be referred via ``runtime->control``,
-which points to the struct snd_pcm_mmap_control record.
-However, accessing directly to this value is not recommended.
+which points to a struct snd_pcm_mmap_control record.
+However, accessing this value directly is not recommended.
 
 Private Data
 ~~~~~~~~~~~~
 
 You can allocate a record for the substream and store it in
 ``runtime->private_data``. Usually, this is done in the `PCM open
 callback`_. Don't mix this with ``pcm->private_data``. The
 ``pcm->private_data`` usually points to the chip instance assigned
-statically at the creation of PCM, while the ``runtime->private_data``
-points to a dynamic data structure created at the PCM open
-callback.
-
-::
+statically at creation time of the PCM device, while
+``runtime->private_data``
+points to a dynamic data structure created in the PCM open
+callback::
 
   static int snd_xxx_open(struct snd_pcm_substream *substream)
   {
@@ -1832,20 +1743,18 @@ The allocated object must be released in the `close callback`_.
 Operators
 ---------
 
-OK, now let me give details about each pcm callback (``ops``). In
+OK, now let me give details about each PCM callback (``ops``). In
 general, every callback must return 0 if successful, or a negative
 error number such as ``-EINVAL``. To choose an appropriate error
 number, it is advised to check what value other parts of the kernel
 return when the same kind of request fails.
 
-The callback function takes at least the argument with
+Each callback function takes at least one argument containing a
 struct snd_pcm_substream pointer. To retrieve the chip
 record from the given substream instance, you can use the following
-macro.
+macro::
 
-::
-
-  int xxx() {
+  int xxx(...) {
           struct mychip *chip = snd_pcm_substream_chip(substream);
           ....
   }
@@ -1864,12 +1773,10 @@ PCM open callback
 
   static int snd_xxx_open(struct snd_pcm_substream *substream);
 
-This is called when a pcm substream is opened.
+This is called when a PCM substream is opened.
 
 At least, here you have to initialize the ``runtime->hw``
-record. Typically, this is done by like this:
-
-::
+record. Typically, this is done like this::
 
   static int snd_xxx_open(struct snd_pcm_substream *substream)
   {
@@ -1883,7 +1790,7 @@ record. Typically, this is done by like this:
 where ``snd_mychip_playback_hw`` is the pre-defined hardware
 description.
 
-You can allocate a private data in this callback, as described in
+You can allocate private data in this callback, as described in the
 `Private Data`_ section.
 
 If the hardware configuration needs more constraints, set the hardware
@@ -1897,73 +1804,69 @@ close callback
   static int snd_xxx_close(struct snd_pcm_substream *substream);
 
 
-Obviously, this is called when a pcm substream is closed.
+Obviously, this is called when a PCM substream is closed.
 
-Any private instance for a pcm substream allocated in the ``open``
-callback will be released here.
-
-::
+Any private instance for a PCM substream allocated in the ``open``
+callback will be released here::
 
   static int snd_xxx_close(struct snd_pcm_substream *substream)
   {
           ....
           kfree(substream->runtime->private_data);
           ....
   }
 
 ioctl callback
 ~~~~~~~~~~~~~~
 
-This is used for any special call to pcm ioctls. But usually you can
-leave it as NULL, then PCM core calls the generic ioctl callback
-function :c:func:`snd_pcm_lib_ioctl()`.  If you need to deal with the
+This is used for any special call to PCM ioctls. But usually you can
+leave it NULL, then the PCM core calls the generic ioctl callback
+function :c:func:`snd_pcm_lib_ioctl()`.  If you need to deal with a
 unique setup of channel info or reset procedure, you can pass your own
 callback function here.
 
 hw_params callback
 ~~~~~~~~~~~~~~~~~~~
 
 ::
 
   static int snd_xxx_hw_params(struct snd_pcm_substream *substream,
                                struct snd_pcm_hw_params *hw_params);
 
-This is called when the hardware parameter (``hw_params``) is set up
+This is called when the hardware parameters (``hw_params``) are set up
 by the application, that is, once when the buffer size, the period
-size, the format, etc. are defined for the pcm substream.
+size, the format, etc. are defined for the PCM substream.
 
 Many hardware setups should be done in this callback, including the
 allocation of buffers.
 
-Parameters to be initialized are retrieved by
+Parameters to be initialized are retrieved by the
 :c:func:`params_xxx()` macros.
 
-When you set up the managed buffer allocation mode for the substream,
+When you choose managed buffer allocation mode for the substream,
 a buffer is already allocated before this callback gets
 called. Alternatively, you can call a helper function below for
-allocating the buffer, too.
-
-::
+allocating the buffer::
 
   snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 
 :c:func:`snd_pcm_lib_malloc_pages()` is available only when the
 DMA buffers have been pre-allocated. See the section `Buffer Types`_
 for more details.
 
-Note that this and ``prepare`` callbacks may be called multiple times
-per initialization. For example, the OSS emulation may call these
+Note that this one and the ``prepare`` callback may be called multiple
+times per initialization. For example, the OSS emulation may call these
 callbacks at each change via its ioctl.
 
 Thus, you need to be careful not to allocate the same buffers many
 times, which will lead to memory leaks! Calling the helper function
 above many times is OK. It will release the previous buffer
 automatically when it was already allocated.
 
-Another note is that this callback is non-atomic (schedulable) as
+Another note is that this callback is non-atomic (schedulable) by
 default, i.e. when no ``nonatomic`` flag set. This is important,
 because the ``trigger`` callback is atomic (non-schedulable). That is,
-mutexes or any schedule-related functions are not available in
+mutexes or any schedule-related functions are not available in the
 ``trigger`` callback. Please see the subsection Atomicity_ for
 details.
 
@@ -1979,33 +1882,31 @@ This is called to release the resources allocated via
 
 This function is always called before the close callback is called.
 Also, the callback may be called multiple times, too. Keep track
-whether the resource was already released.
+whether each resource was already released.
 
-When you have set up the managed buffer allocation mode for the PCM
+When you have chosen managed buffer allocation mode for the PCM
 substream, the allocated PCM buffer will be automatically released
 after this callback gets called.  Otherwise you'll have to release the
 buffer manually.  Typically, when the buffer was allocated from the
 pre-allocated pool, you can use the standard API function
-:c:func:`snd_pcm_lib_malloc_pages()` like:
-
-::
+:c:func:`snd_pcm_lib_malloc_pages()` like::
 
   snd_pcm_lib_free_pages(substream);
 
 prepare callback
 ~~~~~~~~~~~~~~~~
 
 ::
 
   static int snd_xxx_prepare(struct snd_pcm_substream *substream);
 
-This callback is called when the pcm is “prepared”. You can set the
+This callback is called when the PCM is “prepared”. You can set the
 format type, sample rate, etc. here. The difference from ``hw_params``
 is that the ``prepare`` callback will be called each time
 :c:func:`snd_pcm_prepare()` is called, i.e. when recovering after
 underruns, etc.
 
-Note that this callback is now non-atomic. You can use
+Note that this callback is non-atomic. You can use
 schedule-related functions safely in this callback.
 
 In this and the following callbacks, you can refer to the values via
@@ -2026,13 +1927,11 @@ trigger callback
 
   static int snd_xxx_trigger(struct snd_pcm_substream *substream, int cmd);
 
-This is called when the pcm is started, stopped or paused.
+This is called when the PCM is started, stopped or paused.
 
-Which action is specified in the second argument,
-``SNDRV_PCM_TRIGGER_XXX`` in ``<sound/pcm.h>``. At least, the ``START``
-and ``STOP`` commands must be defined in this callback.
-
-::
+The action is specified in the second argument, ``SNDRV_PCM_TRIGGER_XXX``
+defined in ``<sound/pcm.h>``. At least, the ``START``
+and ``STOP`` commands must be defined in this callback::
 
   switch (cmd) {
   case SNDRV_PCM_TRIGGER_START:
@@ -2045,49 +1944,49 @@ and ``STOP`` commands must be defined in this callback.
           return -EINVAL;
   }
 
-When the pcm supports the pause operation (given in the info field of
+When the PCM supports the pause operation (given in the info field of
 the hardware table), the ``PAUSE_PUSH`` and ``PAUSE_RELEASE`` commands
-must be handled here, too. The former is the command to pause the pcm,
-and the latter to restart the pcm again.
+must be handled here, too. The former is the command to pause the PCM,
+and the latter to restart the PCM again.
 
-When the pcm supports the suspend/resume operation, regardless of full
+When the PCM supports the suspend/resume operation, regardless of full
 or partial suspend/resume support, the ``SUSPEND`` and ``RESUME``
 commands must be handled, too. These commands are issued when the
 power-management status is changed. Obviously, the ``SUSPEND`` and
-``RESUME`` commands suspend and resume the pcm substream, and usually,
+``RESUME`` commands suspend and resume the PCM substream, and usually,
 they are identical to the ``STOP`` and ``START`` commands, respectively.
 See the `Power Management`_ section for details.
 
-As mentioned, this callback is atomic as default unless ``nonatomic``
+As mentioned, this callback is atomic by default unless the ``nonatomic``
 flag set, and you cannot call functions which may sleep. The
 ``trigger`` callback should be as minimal as possible, just really
-triggering the DMA. The other stuff should be initialized
+triggering the DMA. The other stuff should be initialized in
 ``hw_params`` and ``prepare`` callbacks properly beforehand.
 
 sync_stop callback
 ~~~~~~~~~~~~~~~~~~
 
 ::
 
   static int snd_xxx_sync_stop(struct snd_pcm_substream *substream);
 
 This callback is optional, and NULL can be passed.  It's called after
-the PCM core stops the stream and changes the stream state
+the PCM core stops the stream, before it changes the stream state via
 ``prepare``, ``hw_params`` or ``hw_free``.
 Since the IRQ handler might be still pending, we need to wait until
 the pending task finishes before moving to the next step; otherwise it
-might lead to a crash due to resource conflicts or access to the freed
+might lead to a crash due to resource conflicts or access to freed
 resources.  A typical behavior is to call a synchronization function
 like :c:func:`synchronize_irq()` here.
 
-For majority of drivers that need only a call of
+For the majority of drivers that need only a call of
 :c:func:`synchronize_irq()`, there is a simpler setup, too.
-While keeping NULL to ``sync_stop`` PCM callback, the driver can set
-``card->sync_irq`` field to store the valid interrupt number after
-requesting an IRQ, instead.   Then PCM core will look call
+While keeping the ``sync_stop`` PCM callback NULL, the driver can set
+the ``card->sync_irq`` field to the returned interrupt number after
+requesting an IRQ, instead.   Then PCM core will call
 :c:func:`synchronize_irq()` with the given IRQ appropriately.
 
-If the IRQ handler is released at the card destructor, you don't need
+If the IRQ handler is released by the card destructor, you don't need
 to clear ``card->sync_irq``, as the card itself is being released.
 So, usually you'll need to add just a single line for assigning
 ``card->sync_irq`` in the driver code unless the driver re-acquires
@@ -2103,76 +2002,76 @@ pointer callback
   static snd_pcm_uframes_t snd_xxx_pointer(struct snd_pcm_substream *substream)
 
 This callback is called when the PCM middle layer inquires the current
-hardware position on the buffer. The position must be returned in
+hardware position in the buffer. The position must be returned in
 frames, ranging from 0 to ``buffer_size - 1``. 
 
-This is called usually from the buffer-update routine in the pcm
+This is usually called from the buffer-update routine in the PCM
 middle layer, which is invoked when :c:func:`snd_pcm_period_elapsed()`
-is called in the interrupt routine. Then the pcm middle layer updates
+is called by the interrupt routine. Then the PCM middle layer updates
 the position and calculates the available space, and wakes up the
 sleeping poll threads, etc.
 
-This callback is also atomic as default.
+This callback is also atomic by default.
 
 copy_user, copy_kernel and fill_silence ops
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 These callbacks are not mandatory, and can be omitted in most cases.
 These callbacks are used when the hardware buffer cannot be in the
-normal memory space. Some chips have their own buffer on the hardware
+normal memory space. Some chips have their own buffer in the hardware
 which is not mappable. In such a case, you have to transfer the data
 manually from the memory buffer to the hardware buffer. Or, if the
 buffer is non-contiguous on both physical and virtual memory spaces,
 these callbacks must be defined, too.
 
 If these two callbacks are defined, copy and set-silence operations
-are done by them. The detailed will be described in the later section
+are done by them. The details will be described in the later section
 `Buffer and Memory Management`_.
 
 ack callback
 ~~~~~~~~~~~~
 
 This callback is also not mandatory. This callback is called when the
 ``appl_ptr`` is updated in read or write operations. Some drivers like
 emu10k1-fx and cs46xx need to track the current ``appl_ptr`` for the
 internal buffer, and this callback is useful only for such a purpose.
 
 The callback function may return 0 or a negative error. When the
-return value is ``-EPIPE``, PCM core treats as a buffer XRUN happens,
+return value is ``-EPIPE``, PCM core treats that as a buffer XRUN,
 and changes the state to ``SNDRV_PCM_STATE_XRUN`` automatically.
 
-This callback is atomic as default.
+This callback is atomic by default.
 
 page callback
 ~~~~~~~~~~~~~
 
 This callback is optional too. The mmap calls this callback to get the
 page fault address.
 
-Since the recent changes, you need no special callback any longer for
-the standard SG-buffer or vmalloc-buffer. Hence this callback should
-be rarely used.
+You need no special callback for the standard SG-buffer or vmalloc-
+buffer. Hence this callback should be rarely used.
 
-mmap calllback
-~~~~~~~~~~~~~~
+mmap callback
+~~~~~~~~~~~~~
 
 This is another optional callback for controlling mmap behavior.
-Once when defined, PCM core calls this callback when a page is
-memory-mapped instead of dealing via the standard helper.
+When defined, the PCM core calls this callback when a page is
+memory-mapped, instead of using the standard helper.
 If you need special handling (due to some architecture or
 device-specific issues), implement everything here as you like.
 
 
 PCM Interrupt Handler
 ---------------------
 
-The rest of pcm stuff is the PCM interrupt handler. The role of PCM
+The remainder of the PCM stuff is the PCM interrupt handler. The role
+of the PCM
 interrupt handler in the sound driver is to update the buffer position
 and to tell the PCM middle layer when the buffer position goes across
-the prescribed period size. To inform this, call the
+the specified period boundary. To inform about this, call the
 :c:func:`snd_pcm_period_elapsed()` function.
 
-There are several types of sound chips to generate the interrupts.
+There are several ways sound chips can generate interrupts.
 
 Interrupts at the period (fragment) boundary
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -2188,14 +2087,12 @@ chip record to hold the current running substream pointer, and set the
 pointer value at ``open`` callback (and reset at ``close`` callback).
 
 If you acquire a spinlock in the interrupt handler, and the lock is used
-in other pcm callbacks, too, then you have to release the lock before
+in other PCM callbacks, too, then you have to release the lock before
 calling :c:func:`snd_pcm_period_elapsed()`, because
-:c:func:`snd_pcm_period_elapsed()` calls other pcm callbacks
+:c:func:`snd_pcm_period_elapsed()` calls other PCM callbacks
 inside.
 
-Typical code would be like:
-
-::
+Typical code would look like::
 
 
       static irqreturn_t snd_mychip_interrupt(int irq, void *dev_id)
@@ -2233,9 +2130,7 @@ position and accumulate the processed sample length at each interrupt.
 When the accumulated size exceeds the period size, call
 :c:func:`snd_pcm_period_elapsed()` and reset the accumulator.
 
-Typical code would be like the following.
-
-::
+Typical code would look as follows::
 
 
       static irqreturn_t snd_mychip_interrupt(int irq, void *dev_id)
@@ -2280,25 +2175,25 @@ Typical code would be like the following.
 On calling :c:func:`snd_pcm_period_elapsed()`
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-In both cases, even if more than one period are elapsed, you don't have
+In both cases, even if more than one period has elapsed, you don't have
 to call :c:func:`snd_pcm_period_elapsed()` many times. Call only
-once. And the pcm layer will check the current hardware pointer and
+once. And the PCM layer will check the current hardware pointer and
 update to the latest status.
 
 Atomicity
 ---------
 
 One of the most important (and thus difficult to debug) problems in
 kernel programming are race conditions. In the Linux kernel, they are
 usually avoided via spin-locks, mutexes or semaphores. In general, if a
 race condition can happen in an interrupt handler, it has to be managed
 atomically, and you have to use a spinlock to protect the critical
-session. If the critical section is not in interrupt handler code and if
+section. If the critical section is not in interrupt handler code and if
 taking a relatively long time to execute is acceptable, you should use
 mutexes or semaphores instead.
 
-As already seen, some pcm callbacks are atomic and some are not. For
-example, the ``hw_params`` callback is non-atomic, while ``trigger``
+As already seen, some PCM callbacks are atomic and some are not. For
+example, the ``hw_params`` callback is non-atomic, while the ``trigger``
 callback is atomic. This means, the latter is called already in a
 spinlock held by the PCM middle layer, the PCM stream lock. Please
 take this atomicity into account when you choose a locking scheme in
@@ -2313,13 +2208,13 @@ callback, please use :c:func:`udelay()` or :c:func:`mdelay()`.
 All three atomic callbacks (trigger, pointer, and ack) are called with
 local interrupts disabled.
 
-The recent changes in PCM core code, however, allow all PCM operations
-to be non-atomic. This assumes that the all caller sides are in
+However, it is possible to request all PCM operations to be non-atomic.
+This assumes that all call sites are in
 non-atomic contexts. For example, the function
 :c:func:`snd_pcm_period_elapsed()` is called typically from the
 interrupt handler. But, if you set up the driver to use a threaded
 interrupt handler, this call can be in non-atomic context, too. In such
-a case, you can set ``nonatomic`` filed of struct snd_pcm object
+a case, you can set the ``nonatomic`` field of the struct snd_pcm object
 after creating it. When this flag is set, mutex and rwsem are used internally
 in the PCM core instead of spin and rwlocks, so that you can call all PCM
 functions safely in a non-atomic
@@ -2335,14 +2230,12 @@ too.
 Constraints
 -----------
 
-If your chip supports unconventional sample rates, or only the limited
-samples, you need to set a constraint for the condition.
+Due to physical limitations, hardware is not infinitely configurable.
+These limitations are expressed by setting constraints.
 
-For example, in order to restrict the sample rates in the some supported
+For example, in order to restrict the sample rates to some supported
 values, use :c:func:`snd_pcm_hw_constraint_list()`. You need to
-call this function in the open callback.
-
-::
+call this function in the open callback::
 
       static unsigned int rates[] =
               {4000, 10000, 22050, 44100};
@@ -2364,16 +2257,12 @@ call this function in the open callback.
               ....
       }
 
-
-
 There are many different constraints. Look at ``sound/pcm.h`` for a
 complete list. You can even define your own constraint rules. For
 example, let's suppose my_chip can manage a substream of 1 channel if
 and only if the format is ``S16_LE``, otherwise it supports any format
-specified in struct snd_pcm_hardware> (or in any other
-constraint_list). You can build a rule like this:
-
-::
+specified in struct snd_pcm_hardware (or in any other
+constraint_list). You can build a rule like this::
 
       static int hw_rule_channels_by_format(struct snd_pcm_hw_params *params,
                                             struct snd_pcm_hw_rule *rule)
@@ -2393,20 +2282,16 @@ constraint_list). You can build a rule like this:
       }
 
 
-Then you need to call this function to add your rule:
-
-::
+Then you need to call this function to add your rule::
 
   snd_pcm_hw_rule_add(substream->runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
                       hw_rule_channels_by_format, NULL,
                       SNDRV_PCM_HW_PARAM_FORMAT, -1);
 
 The rule function is called when an application sets the PCM format, and
 it refines the number of channels accordingly. But an application may
 set the number of channels before setting the format. Thus you also need
-to define the inverse rule:
-
-::
+to define the inverse rule::
 
       static int hw_rule_format_by_channels(struct snd_pcm_hw_params *params,
                                             struct snd_pcm_hw_rule *rule)
@@ -2425,34 +2310,30 @@ to define the inverse rule:
       }
 
 
-... and in the open callback:
-
-::
+... and in the open callback::
 
   snd_pcm_hw_rule_add(substream->runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
                       hw_rule_format_by_channels, NULL,
                       SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 
 One typical usage of the hw constraints is to align the buffer size
-with the period size.  As default, ALSA PCM core doesn't enforce the
+with the period size.  By default, ALSA PCM core doesn't enforce the
 buffer size to be aligned with the period size.  For example, it'd be
 possible to have a combination like 256 period bytes with 999 buffer
 bytes.
 
 Many device chips, however, require the buffer to be a multiple of
 periods.  In such a case, call
 :c:func:`snd_pcm_hw_constraint_integer()` for
-``SNDRV_PCM_HW_PARAM_PERIODS``.
-
-::
+``SNDRV_PCM_HW_PARAM_PERIODS``::
 
   snd_pcm_hw_constraint_integer(substream->runtime,
                                 SNDRV_PCM_HW_PARAM_PERIODS);
 
 This assures that the number of periods is integer, hence the buffer
 size is aligned with the period size.
 
-The hw constraint is a very much powerful mechanism to define the
+The hw constraint is a very powerful mechanism to define the
 preferred PCM configuration, and there are relevant helpers.
 I won't give more details here, rather I would like to say, “Luke, use
 the source.”
@@ -2479,9 +2360,7 @@ Definition of Controls
 
 To create a new control, you need to define the following three
 callbacks: ``info``, ``get`` and ``put``. Then, define a
-struct snd_kcontrol_new record, such as:
-
-::
+struct snd_kcontrol_new record, such as::
 
 
       static struct snd_kcontrol_new my_control = {
@@ -2524,7 +2403,7 @@ The ``private_value`` field contains an arbitrary long integer value
 for this record. When using the generic ``info``, ``get`` and ``put``
 callbacks, you can pass a value through this field. If several small
 numbers are necessary, you can combine them in bitwise. Or, it's
-possible to give a pointer (casted to unsigned long) of some record to
+possible to store a pointer (casted to unsigned long) of some record in
 this field, too. 
 
 The ``tlv`` field can be used to provide metadata about the control;
@@ -2591,7 +2470,7 @@ The access flag is the bitmask which specifies the access type of the
 given control. The default access type is
 ``SNDRV_CTL_ELEM_ACCESS_READWRITE``, which means both read and write are
 allowed to this control. When the access flag is omitted (i.e. = 0), it
-is considered as ``READWRITE`` access as default.
+is considered as ``READWRITE`` access by default.
 
 When the control is read-only, pass ``SNDRV_CTL_ELEM_ACCESS_READ``
 instead. In this case, you don't have to define the ``put`` callback.
@@ -2604,21 +2483,22 @@ If the control value changes frequently (e.g. the VU meter),
 changed without `Change notification`_. Applications should poll such
 a control constantly.
 
-When the control is inactive, set the ``INACTIVE`` flag, too. There are
-``LOCK`` and ``OWNER`` flags to change the write permissions.
+When the control may be updated, but currently has no effect on anything,
+setting the ``INACTIVE`` flag may be appropriate. For example, PCM
+controls should be inactive while no PCM device is open.
+
+There are ``LOCK`` and ``OWNER`` flags to change the write permissions.
 
 Control Callbacks
 -----------------
 
 info callback
 ~~~~~~~~~~~~~
 
 The ``info`` callback is used to get detailed information on this
 control. This must store the values of the given
 struct snd_ctl_elem_info object. For example,
-for a boolean control with a single element:
-
-::
+for a boolean control with a single element::
 
 
       static int snd_myctl_mono_info(struct snd_kcontrol *kcontrol,
@@ -2637,13 +2517,11 @@ The ``type`` field specifies the type of the control. There are
 ``BOOLEAN``, ``INTEGER``, ``ENUMERATED``, ``BYTES``, ``IEC958`` and
 ``INTEGER64``. The ``count`` field specifies the number of elements in
 this control. For example, a stereo volume would have count = 2. The
-``value`` field is a union, and the values stored are depending on the
+``value`` field is a union, and the values stored depend on the
 type. The boolean and integer types are identical.
 
-The enumerated type is a bit different from others. You'll need to set
-the string for the currently given item index.
-
-::
+The enumerated type is a bit different from the others. You'll need to
+set the string for the selectec item index::
 
   static int snd_myctl_enum_info(struct snd_kcontrol *kcontrol,
                           struct snd_ctl_elem_info *uinfo)
@@ -2688,13 +2566,10 @@ stereo channel boolean item.
 get callback
 ~~~~~~~~~~~~
 
-This callback is used to read the current value of the control and to
-return to user-space.
-
-For example,
-
-::
+This callback is used to read the current value of the control, so it
+can be returned to user-space.
 
+For example::
 
       static int snd_myctl_get(struct snd_kcontrol *kcontrol,
                                struct snd_ctl_elem_value *ucontrol)
@@ -2709,39 +2584,32 @@ For example,
 The ``value`` field depends on the type of control as well as on the
 info callback. For example, the sb driver uses this field to store the
 register offset, the bit-shift and the bit-mask. The ``private_value``
-field is set as follows:
-
-::
+field is set as follows::
 
   .private_value = reg | (shift << 16) | (mask << 24)
 
-and is retrieved in callbacks like
-
-::
+and is retrieved in callbacks like::
 
   static int snd_sbmixer_get_single(struct snd_kcontrol *kcontrol,
                                     struct snd_ctl_elem_value *ucontrol)
   {
           int reg = kcontrol->private_value & 0xff;
           int shift = (kcontrol->private_value >> 16) & 0xff;
           int mask = (kcontrol->private_value >> 24) & 0xff;
           ....
   }
 
 In the ``get`` callback, you have to fill all the elements if the
-control has more than one elements, i.e. ``count > 1``. In the example
+control has more than one element, i.e. ``count > 1``. In the example
 above, we filled only one element (``value.integer.value[0]``) since
-it's assumed as ``count = 1``.
+``count = 1`` is assumed.
 
 put callback
 ~~~~~~~~~~~~
 
-This callback is used to write a value from user-space.
-
-For example,
-
-::
+This callback is used to write a value coming from user-space.
 
+For example::
 
       static int snd_myctl_put(struct snd_kcontrol *kcontrol,
                                struct snd_ctl_elem_value *ucontrol)
@@ -2764,23 +2632,21 @@ value is not changed, return 0 instead. If any fatal error happens,
 return a negative error code as usual.
 
 As in the ``get`` callback, when the control has more than one
-elements, all elements must be evaluated in this callback, too.
+element, all elements must be evaluated in this callback, too.
 
 Callbacks are not atomic
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
-All these three callbacks are basically not atomic.
+All these three callbacks are basically (FIXME: but ...?) not atomic.
 
 Control Constructor
 -------------------
 
 When everything is ready, finally we can create a new control. To create
 a control, there are two functions to be called,
 :c:func:`snd_ctl_new1()` and :c:func:`snd_ctl_add()`.
 
-In the simplest way, you can do like this:
-
-::
+In the simplest way, you can do it like this::
 
   err = snd_ctl_add(card, snd_ctl_new1(&my_control, chip));
   if (err < 0)
@@ -2798,9 +2664,7 @@ Change Notification
 -------------------
 
 If you need to change and update a control in the interrupt routine, you
-can call :c:func:`snd_ctl_notify()`. For example,
-
-::
+can call :c:func:`snd_ctl_notify()`. For example::
 
   snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, id_pointer);
 
@@ -2814,13 +2678,11 @@ for hardware volume interrupts.
 Metadata
 --------
 
-To provide information about the dB values of a mixer control, use on of
+To provide information about the dB values of a mixer control, use one of
 the ``DECLARE_TLV_xxx`` macros from ``<sound/tlv.h>`` to define a
 variable containing this information, set the ``tlv.p`` field to point to
 this variable, and include the ``SNDRV_CTL_ELEM_ACCESS_TLV_READ`` flag
-in the ``access`` field; like this:
-
-::
+in the ``access`` field; like this::
 
   static DECLARE_TLV_DB_SCALE(db_scale_my_control, -4050, 150, 0);
 
@@ -2910,24 +2772,20 @@ AC97 Constructor
 ----------------
 
 To create an ac97 instance, first call :c:func:`snd_ac97_bus()`
-with an ``ac97_bus_ops_t`` record with callback functions.
-
-::
+with an ``ac97_bus_ops_t`` record with callback functions::
 
   struct snd_ac97_bus *bus;
   static struct snd_ac97_bus_ops ops = {
         .write = snd_mychip_ac97_write,
         .read = snd_mychip_ac97_read,
   };
 
   snd_ac97_bus(card, 0, &ops, NULL, &pbus);
 
 The bus record is shared among all belonging ac97 instances.
 
-And then call :c:func:`snd_ac97_mixer()` with an struct snd_ac97_template
-record together with the bus pointer created above.
-
-::
+And then call :c:func:`snd_ac97_mixer()` with a struct snd_ac97_template
+record together with the bus pointer created above::
 
   struct snd_ac97_template ac97;
   int err;
@@ -2952,9 +2810,7 @@ correspond to the functions for read and write accesses to the
 hardware low-level codes.
 
 The ``read`` callback returns the register value specified in the
-argument.
-
-::
+argument::
 
   static unsigned short snd_mychip_ac97_read(struct snd_ac97 *ac97,
                                              unsigned short reg)
@@ -2967,9 +2823,7 @@ argument.
 Here, the chip can be cast from ``ac97->private_data``.
 
 Meanwhile, the ``write`` callback is used to set the register
-value
-
-::
+value::
 
   static void snd_mychip_ac97_write(struct snd_ac97 *ac97,
                        unsigned short reg, unsigned short val)
@@ -3002,32 +2856,24 @@ Both :c:func:`snd_ac97_write()` and
 the given register (``AC97_XXX``). The difference between them is that
 :c:func:`snd_ac97_update()` doesn't write a value if the given
 value has been already set, while :c:func:`snd_ac97_write()`
-always rewrites the value.
-
-::
+always rewrites the value::
 
   snd_ac97_write(ac97, AC97_MASTER, 0x8080);
   snd_ac97_update(ac97, AC97_MASTER, 0x8080);
 
 :c:func:`snd_ac97_read()` is used to read the value of the given
-register. For example,
-
-::
+register. For example::
 
   value = snd_ac97_read(ac97, AC97_MASTER);
 
 :c:func:`snd_ac97_update_bits()` is used to update some bits in
-the given register.
-
-::
+the given register::
 
   snd_ac97_update_bits(ac97, reg, mask, value);
 
 Also, there is a function to change the sample rate (of a given register
 such as ``AC97_PCM_FRONT_DAC_RATE``) when VRA or DRA is supported by the
-codec: :c:func:`snd_ac97_set_rate()`.
-
-::
+codec: :c:func:`snd_ac97_set_rate()`::
 
   snd_ac97_set_rate(ac97, AC97_PCM_FRONT_DAC_RATE, 44100);
 
@@ -3082,9 +2928,7 @@ mpu401 stuff. For example, emu10k1 has its own mpu401 routines.
 MIDI Constructor
 ----------------
 
-To create a rawmidi object, call :c:func:`snd_mpu401_uart_new()`.
-
-::
+To create a rawmidi object, call :c:func:`snd_mpu401_uart_new()`::
 
   struct snd_rawmidi *rmidi;
   snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401, port, info_flags,
@@ -3129,16 +2973,12 @@ corresponds to the data port. If not, you may change the ``cport``
 field of struct snd_mpu401 manually afterward.
 However, struct snd_mpu401 pointer is
 not returned explicitly by :c:func:`snd_mpu401_uart_new()`. You
-need to cast ``rmidi->private_data`` to struct snd_mpu401 explicitly,
-
-::
+need to cast ``rmidi->private_data`` to struct snd_mpu401 explicitly::
 
   struct snd_mpu401 *mpu;
   mpu = rmidi->private_data;
 
-and reset the ``cport`` as you like:
-
-::
+and reset the ``cport`` as you like::
 
   mpu->cport = my_own_control_port;
 
@@ -3162,9 +3002,7 @@ occurred.
 
 In this case, you need to pass the private_data of the returned rawmidi
 object from :c:func:`snd_mpu401_uart_new()` as the second
-argument of :c:func:`snd_mpu401_uart_interrupt()`.
-
-::
+argument of :c:func:`snd_mpu401_uart_interrupt()`::
 
   snd_mpu401_uart_interrupt(irq, rmidi->private_data, regs);
 
@@ -3188,9 +3026,7 @@ RawMIDI Constructor
 -------------------
 
 To create a rawmidi device, call the :c:func:`snd_rawmidi_new()`
-function:
-
-::
+function::
 
   struct snd_rawmidi *rmidi;
   err = snd_rawmidi_new(chip->card, "MyMIDI", 0, outs, ins, &rmidi);
@@ -3220,29 +3056,23 @@ output and input at the same time.
 
 After the rawmidi device is created, you need to set the operators
 (callbacks) for each substream. There are helper functions to set the
-operators for all the substreams of a device:
-
-::
+operators for all the substreams of a device::
 
   snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_mymidi_output_ops);
   snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_mymidi_input_ops);
 
-The operators are usually defined like this:
-
-::
+The operators are usually defined like this::
 
   static struct snd_rawmidi_ops snd_mymidi_output_ops = {
           .open =    snd_mymidi_output_open,
           .close =   snd_mymidi_output_close,
           .trigger = snd_mymidi_output_trigger,
   };
 
 These callbacks are explained in the `RawMIDI Callbacks`_ section.
 
 If there are more than one substream, you should give a unique name to
-each of them:
-
-::
+each of them::
 
   struct snd_rawmidi_substream *substream;
   list_for_each_entry(substream,
@@ -3260,9 +3090,7 @@ device can be accessed as ``substream->rmidi->private_data``.
 
 If there is more than one port, your callbacks can determine the port
 index from the struct snd_rawmidi_substream data passed to each
-callback:
-
-::
+callback::
 
   struct snd_rawmidi_substream *substream;
   int index = substream->number;
@@ -3307,23 +3135,19 @@ of bytes that have been read; this will be less than the number of bytes
 requested when there are no more data in the buffer. After the data have
 been transmitted successfully, call
 :c:func:`snd_rawmidi_transmit_ack()` to remove the data from the
-substream buffer:
-
-::
+substream buffer::
 
   unsigned char data;
   while (snd_rawmidi_transmit_peek(substream, &data, 1) == 1) {
           if (snd_mychip_try_to_transmit(data))
                   snd_rawmidi_transmit_ack(substream, 1);
           else
                   break; /* hardware FIFO full */
   }
 
 If you know beforehand that the hardware will accept data, you can use
 the :c:func:`snd_rawmidi_transmit()` function which reads some
-data and removes them from the buffer at once:
-
-::
+data and removes them from the buffer at once::
 
   while (snd_mychip_transmit_possible()) {
           unsigned char data;
@@ -3358,9 +3182,7 @@ The ``trigger`` callback must not sleep; the actual reading of data
 from the device is usually done in an interrupt handler.
 
 When data reception is enabled, your interrupt handler should call
-:c:func:`snd_rawmidi_receive()` for all received data:
-
-::
+:c:func:`snd_rawmidi_receive()` for all received data::
 
   void snd_mychip_midi_interrupt(...)
   {
@@ -3406,9 +3228,7 @@ whereas in OSS compatible mode, FM registers can be accessed with the
 OSS direct-FM compatible API in ``/dev/dmfmX`` device.
 
 To create the OPL3 component, you have two functions to call. The first
-one is a constructor for the ``opl3_t`` instance.
-
-::
+one is a constructor for the ``opl3_t`` instance::
 
   struct snd_opl3 *opl3;
   snd_opl3_create(card, lport, rport, OPL3_HW_OPL3_XXX,
@@ -3426,9 +3246,7 @@ the opl3 module will allocate the specified ports by itself.
 
 When the accessing the hardware requires special method instead of the
 standard I/O access, you can create opl3 instance separately with
-:c:func:`snd_opl3_new()`.
-
-::
+:c:func:`snd_opl3_new()`::
 
   struct snd_opl3 *opl3;
   snd_opl3_new(card, OPL3_HW_OPL3_XXX, &opl3);
@@ -3445,9 +3263,7 @@ proper state. Note that :c:func:`snd_opl3_create()` always calls
 it internally.
 
 If the opl3 instance is created successfully, then create a hwdep device
-for this opl3.
-
-::
+for this opl3::
 
   struct snd_hwdep *opl3hwdep;
   snd_opl3_hwdep_new(opl3, 0, 1, &opl3hwdep);
@@ -3469,40 +3285,32 @@ the micro code. In such a case, you can create a hwdep
 ``isa/sb/sb16_csp.c``.
 
 The creation of the ``hwdep`` instance is done via
-:c:func:`snd_hwdep_new()`.
-
-::
+:c:func:`snd_hwdep_new()`::
 
   struct snd_hwdep *hw;
   snd_hwdep_new(card, "My HWDEP", 0, &hw);
 
 where the third argument is the index number.
 
 You can then pass any pointer value to the ``private_data``. If you
-assign a private data, you should define the destructor, too. The
-destructor function is set in the ``private_free`` field.
-
-::
+assign private data, you should define a destructor, too. The
+destructor function is set in the ``private_free`` field::
 
   struct mydata *p = kmalloc(sizeof(*p), GFP_KERNEL);
   hw->private_data = p;
   hw->private_free = mydata_free;
 
-and the implementation of the destructor would be:
-
-::
+and the implementation of the destructor would be::
 
   static void mydata_free(struct snd_hwdep *hw)
   {
           struct mydata *p = hw->private_data;
           kfree(p);
   }
 
 The arbitrary file operations can be defined for this instance. The file
 operators are defined in the ``ops`` table. For example, assume that
-this chip needs an ioctl.
-
-::
+this chip needs an ioctl::
 
   hw->ops.open = mydata_open;
   hw->ops.ioctl = mydata_ioctl;
@@ -3552,92 +3360,87 @@ Buffer Types
 
 ALSA provides several different buffer allocation functions depending on
 the bus and the architecture. All these have a consistent API. The
-allocation of physically-contiguous pages is done via
+allocation of physically-contiguous pages is done via the
 :c:func:`snd_malloc_xxx_pages()` function, where xxx is the bus
 type.
 
-The allocation of pages with fallback is
-:c:func:`snd_malloc_xxx_pages_fallback()`. This function tries
-to allocate the specified pages but if the pages are not available, it
-tries to reduce the page sizes until enough space is found.
+The allocation of pages with fallback is done via
+:c:func:`snd_dma_alloc_pages_fallback()`. This function tries
+to allocate the specified number of pages, but if not enough pages are
+available, it tries to reduce the request size until enough space
+is found, down to one page.
 
-The release the pages, call :c:func:`snd_free_xxx_pages()`
+To release the pages, call the :c:func:`snd_dma_free_pages()`
 function.
 
 Usually, ALSA drivers try to allocate and reserve a large contiguous
-physical space at the time the module is loaded for the later use. This
+physical space at the time the module is loaded for later use. This
 is called “pre-allocation”. As already written, you can call the
-following function at pcm instance construction time (in the case of PCI
-bus).
-
-::
+following function at PCM instance construction time (in the case of PCI
+bus)::
 
   snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
                                         &pci->dev, size, max);
 
-where ``size`` is the byte size to be pre-allocated and the ``max`` is
-the maximum size to be changed via the ``prealloc`` proc file. The
+where ``size`` is the byte size to be pre-allocated and ``max`` is
+the maximum size settable via the ``prealloc`` proc file. The
 allocator will try to get an area as large as possible within the
 given size.
 
 The second argument (type) and the third argument (device pointer) are
 dependent on the bus. For normal devices, pass the device pointer
 (typically identical as ``card->dev``) to the third argument with
 ``SNDRV_DMA_TYPE_DEV`` type.
 
-For the continuous buffer unrelated to the
+A continuous buffer unrelated to the
 bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type.
 You can pass NULL to the device pointer in that case, which is the
-default mode implying to allocate with ``GFP_KERNEL`` flag.
+default mode implying to allocate with the ``GFP_KERNEL`` flag.
 If you need a restricted (lower) address, set up the coherent DMA mask
 bits for the device, and pass the device pointer, like the normal
 device memory allocations.  For this type, it's still allowed to pass
 NULL to the device pointer, too, if no address restriction is needed.
 
 For the scatter-gather buffers, use ``SNDRV_DMA_TYPE_DEV_SG`` with the
 device pointer (see the `Non-Contiguous Buffers`_ section).
 
 Once the buffer is pre-allocated, you can use the allocator in the
-``hw_params`` callback:
-
-::
+``hw_params`` callback::
 
   snd_pcm_lib_malloc_pages(substream, size);
 
 Note that you have to pre-allocate to use this function.
 
-Most of drivers use, though, rather the newly introduced "managed
-buffer allocation mode" instead of the manual allocation or release.
+But most drivers use the "managed buffer allocation mode" instead
+of manual allocation and release.
 This is done by calling :c:func:`snd_pcm_set_managed_buffer_all()`
-instead of :c:func:`snd_pcm_lib_preallocate_pages_for_all()`.
-
-::
+instead of :c:func:`snd_pcm_lib_preallocate_pages_for_all()`::
 
   snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
                                  &pci->dev, size, max);
 
-where passed arguments are identical in both functions.
+where the passed arguments are identical for both functions.
 The difference in the managed mode is that PCM core will call
 :c:func:`snd_pcm_lib_malloc_pages()` internally already before calling
 the PCM ``hw_params`` callback, and call :c:func:`snd_pcm_lib_free_pages()`
 after the PCM ``hw_free`` callback automatically.  So the driver
 doesn't have to call these functions explicitly in its callback any
-longer.  This made many driver code having NULL ``hw_params`` and
+longer.  This allows many drivers to have NULL ``hw_params`` and
 ``hw_free`` entries.
 
 External Hardware Buffers
 -------------------------
 
-Some chips have their own hardware buffers and the DMA transfer from the
+Some chips have their own hardware buffers and DMA transfer from the
 host memory is not available. In such a case, you need to either 1)
 copy/set the audio data directly to the external hardware buffer, or 2)
 make an intermediate buffer and copy/set the data from it to the
 external hardware buffer in interrupts (or in tasklets, preferably).
 
 The first case works fine if the external hardware buffer is large
 enough. This method doesn't need any extra buffers and thus is more
-effective. You need to define the ``copy_user`` and ``copy_kernel``
-callbacks for the data transfer, in addition to ``fill_silence``
+efficient. You need to define the ``copy_user`` and ``copy_kernel``
+callbacks for the data transfer, in addition to the ``fill_silence``
 callback for playback. However, there is a drawback: it cannot be
 mmapped. The examples are GUS's GF1 PCM or emu8000's wavetable PCM.
 
@@ -3651,157 +3454,137 @@ buffer instead of the host memory. In this case, mmap is available only
 on certain architectures like the Intel one. In non-mmap mode, the data
 cannot be transferred as in the normal way. Thus you need to define the
 ``copy_user``, ``copy_kernel`` and ``fill_silence`` callbacks as well,
-as in the cases above. The examples are found in ``rme32.c`` and
+as in the cases above. Examples are found in ``rme32.c`` and
 ``rme96.c``.
 
 The implementation of the ``copy_user``, ``copy_kernel`` and
 ``silence`` callbacks depends upon whether the hardware supports
 interleaved or non-interleaved samples. The ``copy_user`` callback is
-defined like below, a bit differently depending whether the direction
-is playback or capture:
-
-::
+defined like below, a bit differently depending on whether the direction
+is playback or capture::
 
   static int playback_copy_user(struct snd_pcm_substream *substream,
                int channel, unsigned long pos,
                void __user *src, unsigned long count);
   static int capture_copy_user(struct snd_pcm_substream *substream,
                int channel, unsigned long pos,
                void __user *dst, unsigned long count);
 
 In the case of interleaved samples, the second argument (``channel``) is
-not used. The third argument (``pos``) points the current position
-offset in bytes.
+not used. The third argument (``pos``) specifies the position in bytes.
 
 The meaning of the fourth argument is different between playback and
 capture. For playback, it holds the source data pointer, and for
 capture, it's the destination data pointer.
 
 The last argument is the number of bytes to be copied.
 
 What you have to do in this callback is again different between playback
 and capture directions. In the playback case, you copy the given amount
 of data (``count``) at the specified pointer (``src``) to the specified
-offset (``pos``) on the hardware buffer. When coded like memcpy-like
-way, the copy would be like:
-
-::
+offset (``pos``) in the hardware buffer. When coded like memcpy-like
+way, the copy would look like::
 
   my_memcpy_from_user(my_buffer + pos, src, count);
 
 For the capture direction, you copy the given amount of data (``count``)
-at the specified offset (``pos``) on the hardware buffer to the
-specified pointer (``dst``).
-
-::
+at the specified offset (``pos``) in the hardware buffer to the
+specified pointer (``dst``)::
 
   my_memcpy_to_user(dst, my_buffer + pos, count);
 
-Here the functions are named as ``from_user`` and ``to_user`` because
+Here the functions are named ``from_user`` and ``to_user`` because
 it's the user-space buffer that is passed to these callbacks.  That
-is, the callback is supposed to copy from/to the user-space data
+is, the callback is supposed to copy data from/to the user-space
 directly to/from the hardware buffer.
 
 Careful readers might notice that these callbacks receive the
 arguments in bytes, not in frames like other callbacks.  It's because
-it would make coding easier like the examples above, and also it makes
-easier to unify both the interleaved and non-interleaved cases, as
-explained in the following.
+this makes coding easier like in the examples above, and also it makes
+it easier to unify both the interleaved and non-interleaved cases, as
+explained below.
 
 In the case of non-interleaved samples, the implementation will be a bit
-more complicated.  The callback is called for each channel, passed by
-the second argument, so totally it's called for N-channels times per
-transfer.
+more complicated.  The callback is called for each channel, passed in
+the second argument, so in total it's called N times per transfer.
 
-The meaning of other arguments are almost same as the interleaved
-case.  The callback is supposed to copy the data from/to the given
-user-space buffer, but only for the given channel.  For the detailed
-implementations, please check ``isa/gus/gus_pcm.c`` or
-"pci/rme9652/rme9652.c" as examples.
+The meaning of the other arguments are almost the same as in the
+interleaved case.  The callback is supposed to copy the data from/to
+the given user-space buffer, but only for the given channel. For
+details, please check ``isa/gus/gus_pcm.c`` or ``pci/rme9652/rme9652.c``
+as examples.
 
-The above callbacks are the copy from/to the user-space buffer.  There
-are some cases where we want copy from/to the kernel-space buffer
-instead.  In such a case, ``copy_kernel`` callback is called.  It'd
-look like:
-
-::
+The above callbacks are the copies from/to the user-space buffer.  There
+are some cases where we want to copy from/to the kernel-space buffer
+instead.  In such a case, the ``copy_kernel`` callback is called.  It'd
+look like::
 
   static int playback_copy_kernel(struct snd_pcm_substream *substream,
                int channel, unsigned long pos,
                void *src, unsigned long count);
   static int capture_copy_kernel(struct snd_pcm_substream *substream,
                int channel, unsigned long pos,
                void *dst, unsigned long count);
 
 As found easily, the only difference is that the buffer pointer is
-without ``__user`` prefix; that is, a kernel-buffer pointer is passed
+without a ``__user`` prefix; that is, a kernel-buffer pointer is passed
 in the fourth argument.  Correspondingly, the implementation would be
-a version without the user-copy, such as:
-
-::
+a version without the user-copy, such as::
 
   my_memcpy(my_buffer + pos, src, count);
 
 Usually for the playback, another callback ``fill_silence`` is
 defined.  It's implemented in a similar way as the copy callbacks
-above:
-
-::
+above::
 
   static int silence(struct snd_pcm_substream *substream, int channel,
                      unsigned long pos, unsigned long count);
 
 The meanings of arguments are the same as in the ``copy_user`` and
 ``copy_kernel`` callbacks, although there is no buffer pointer
 argument. In the case of interleaved samples, the channel argument has
-no meaning, as well as on ``copy_*`` callbacks.
+no meaning, as for the ``copy_*`` callbacks.
 
-The role of ``fill_silence`` callback is to set the given amount
-(``count``) of silence data at the specified offset (``pos``) on the
+The role of the ``fill_silence`` callback is to set the given amount
+(``count``) of silence data at the specified offset (``pos``) in the
 hardware buffer. Suppose that the data format is signed (that is, the
 silent-data is 0), and the implementation using a memset-like function
-would be like: 
-
-::
+would look like::
 
   my_memset(my_buffer + pos, 0, count);
 
 In the case of non-interleaved samples, again, the implementation
-becomes a bit more complicated, as it's called N-times per transfer
+becomes a bit more complicated, as it's called N times per transfer
 for each channel. See, for example, ``isa/gus/gus_pcm.c``.
 
 Non-Contiguous Buffers
 ----------------------
 
-If your hardware supports the page table as in emu10k1 or the buffer
-descriptors as in via82xx, you can use the scatter-gather (SG) DMA. ALSA
+If your hardware supports a page table as in emu10k1 or buffer
+descriptors as in via82xx, you can use scatter-gather (SG) DMA. ALSA
 provides an interface for handling SG-buffers. The API is provided in
 ``<sound/pcm.h>``.
 
 For creating the SG-buffer handler, call
 :c:func:`snd_pcm_set_managed_buffer()` or
 :c:func:`snd_pcm_set_managed_buffer_all()` with
-``SNDRV_DMA_TYPE_DEV_SG`` in the PCM constructor like other PCI
-pre-allocator. You need to pass ``&pci->dev``, where pci is
-the struct pci_dev pointer of the chip as
-well.
-
-::
+``SNDRV_DMA_TYPE_DEV_SG`` in the PCM constructor like for other PCI
+pre-allocations. You need to pass ``&pci->dev``, where pci is
+the struct pci_dev pointer of the chip as well::
 
   snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
                                  &pci->dev, size, max);
 
+// FIXME: dma_private again
 The ``struct snd_sg_buf`` instance is created as
-``substream->dma_private`` in turn. You can cast the pointer like:
-
-::
+``substream->dma_private`` in turn. You can cast the pointer like::
 
   struct snd_sg_buf *sgbuf = (struct snd_sg_buf *)substream->dma_private;
 
-Then in :c:func:`snd_pcm_lib_malloc_pages()` call, the common SG-buffer
+Then in the :c:func:`snd_pcm_lib_malloc_pages()` call, the common SG-buffer
 handler will allocate the non-contiguous kernel pages of the given size
-and map them onto the virtually contiguous memory. The virtual pointer
-is addressed in runtime->dma_area. The physical address
+and map them as virtually contiguous memory. The virtual pointer
+is addressed via runtime->dma_area. The physical address
 (``runtime->dma_addr``) is set to zero, because the buffer is
 physically non-contiguous. The physical address table is set up in
 ``sgbuf->table``. You can get the physical address at a certain offset
@@ -3814,36 +3597,32 @@ Vmalloc'ed Buffers
 ------------------
 
 It's possible to use a buffer allocated via :c:func:`vmalloc()`, for
-example, for an intermediate buffer. In the recent version of kernel,
-you can simply allocate it via standard
-:c:func:`snd_pcm_lib_malloc_pages()` and co after setting up the
-buffer preallocation with ``SNDRV_DMA_TYPE_VMALLOC`` type.
-
-::
+example, for an intermediate buffer.
+You can simply allocate it via the standard
+:c:func:`snd_pcm_lib_malloc_pages()` and co. after setting up the
+buffer preallocation with ``SNDRV_DMA_TYPE_VMALLOC`` type::
 
   snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
                                  NULL, 0, 0);
 
-The NULL is passed to the device pointer argument, which indicates
-that the default pages (GFP_KERNEL and GFP_HIGHMEM) will be
+NULL is passed as the device pointer argument, which indicates
+that default pages (GFP_KERNEL and GFP_HIGHMEM) will be
 allocated.
 
-Also, note that zero is passed to both the size and the max size
-arguments here.  Since each vmalloc call should succeed at any time,
+Also, note that zero is passed as both the size and the max size
+argument here.  Since each vmalloc call should succeed at any time,
 we don't need to pre-allocate the buffers like other continuous
 pages.
 
 Proc Interface
 ==============
 
 ALSA provides an easy interface for procfs. The proc files are very
 useful for debugging. I recommend you set up proc files if you write a
 driver and want to get a running status or register dumps. The API is
 found in ``<sound/info.h>``.
 
-To create a proc file, call :c:func:`snd_card_proc_new()`.
-
-::
+To create a proc file, call :c:func:`snd_card_proc_new()`::
 
   struct snd_info_entry *entry;
   int err = snd_card_proc_new(card, "my-file", &entry);
@@ -3859,79 +3638,66 @@ automatically in the card registration and release functions.
 When the creation is successful, the function stores a new instance in
 the pointer given in the third argument. It is initialized as a text
 proc file for read only. To use this proc file as a read-only text file
-as it is, set the read callback with a private data via
-:c:func:`snd_info_set_text_ops()`.
-
-::
+as-is, set the read callback with private data via
+:c:func:`snd_info_set_text_ops()`::
 
   snd_info_set_text_ops(entry, chip, my_proc_read);
 
 where the second argument (``chip``) is the private data to be used in
-the callbacks. The third parameter specifies the read buffer size and
+the callback. The third parameter specifies the read buffer size and
 the fourth (``my_proc_read``) is the callback function, which is
-defined like
-
-::
+defined like::
 
   static void my_proc_read(struct snd_info_entry *entry,
                            struct snd_info_buffer *buffer);
 
 In the read callback, use :c:func:`snd_iprintf()` for output
 strings, which works just like normal :c:func:`printf()`. For
-example,
-
-::
+example::
 
   static void my_proc_read(struct snd_info_entry *entry,
                            struct snd_info_buffer *buffer)
   {
           struct my_chip *chip = entry->private_data;
 
           snd_iprintf(buffer, "This is my chip!\n");
           snd_iprintf(buffer, "Port = %ld\n", chip->port);
   }
 
-The file permissions can be changed afterwards. As default, it's set as
+The file permissions can be changed afterwards. By default, they are
 read only for all users. If you want to add write permission for the
-user (root as default), do as follows:
-
-::
+user (root by default), do as follows::
 
  entry->mode = S_IFREG | S_IRUGO | S_IWUSR;
 
-and set the write buffer size and the callback
-
-::
+and set the write buffer size and the callback::
 
   entry->c.text.write = my_proc_write;
 
-For the write callback, you can use :c:func:`snd_info_get_line()`
+In the write callback, you can use :c:func:`snd_info_get_line()`
 to get a text line, and :c:func:`snd_info_get_str()` to retrieve
 a string from the line. Some examples are found in
 ``core/oss/mixer_oss.c``, core/oss/and ``pcm_oss.c``.
 
-For a raw-data proc-file, set the attributes as follows:
-
-::
+For a raw-data proc-file, set the attributes as follows::
 
   static const struct snd_info_entry_ops my_file_io_ops = {
           .read = my_file_io_read,
   };
 
   entry->content = SNDRV_INFO_CONTENT_DATA;
   entry->private_data = chip;
   entry->c.ops = &my_file_io_ops;
   entry->size = 4096;
   entry->mode = S_IFREG | S_IRUGO;
 
-For the raw data, ``size`` field must be set properly. This specifies
+For raw data, ``size`` field must be set properly. This specifies
 the maximum size of the proc file access.
 
 The read/write callbacks of raw mode are more direct than the text mode.
 You need to use a low-level I/O functions such as
-:c:func:`copy_from_user()` and :c:func:`copy_to_user()` to transfer the data.
-
-::
+:c:func:`copy_from_user()` and :c:func:`copy_to_user()` to transfer the
+data::
 
   static ssize_t my_file_io_read(struct snd_info_entry *entry,
                               void *file_private_data,
@@ -3956,37 +3722,33 @@ Power Management
 If the chip is supposed to work with suspend/resume functions, you need
 to add power-management code to the driver. The additional code for
 power-management should be ifdef-ed with ``CONFIG_PM``, or annotated
-with __maybe_unused attribute; otherwise the compiler will complain
-you.
+with __maybe_unused attribute; otherwise the compiler will complain.
 
 If the driver *fully* supports suspend/resume that is, the device can be
 properly resumed to its state when suspend was called, you can set the
-``SNDRV_PCM_INFO_RESUME`` flag in the pcm info field. Usually, this is
+``SNDRV_PCM_INFO_RESUME`` flag in the PCM info field. Usually, this is
 possible when the registers of the chip can be safely saved and restored
 to RAM. If this is set, the trigger callback is called with
 ``SNDRV_PCM_TRIGGER_RESUME`` after the resume callback completes.
 
 Even if the driver doesn't support PM fully but partial suspend/resume
 is still possible, it's still worthy to implement suspend/resume
 callbacks. In such a case, applications would reset the status by
 calling :c:func:`snd_pcm_prepare()` and restart the stream
 appropriately. Hence, you can define suspend/resume callbacks below but
-don't set ``SNDRV_PCM_INFO_RESUME`` info flag to the PCM.
+don't set the ``SNDRV_PCM_INFO_RESUME`` info flag to the PCM.
 
 Note that the trigger with SUSPEND can always be called when
 :c:func:`snd_pcm_suspend_all()` is called, regardless of the
 ``SNDRV_PCM_INFO_RESUME`` flag. The ``RESUME`` flag affects only the
 behavior of :c:func:`snd_pcm_resume()`. (Thus, in theory,
 ``SNDRV_PCM_TRIGGER_RESUME`` isn't needed to be handled in the trigger
 callback when no ``SNDRV_PCM_INFO_RESUME`` flag is set. But, it's better
 to keep it for compatibility reasons.)
 
-In the earlier version of ALSA drivers, a common power-management layer
-was provided, but it has been removed. The driver needs to define the
+The driver needs to define the
 suspend/resume hooks according to the bus the device is connected to. In
-the case of PCI drivers, the callbacks look like below:
-
-::
+the case of PCI drivers, the callbacks look like below::
 
   static int __maybe_unused snd_my_suspend(struct device *dev)
   {
@@ -3999,7 +3761,7 @@ the case of PCI drivers, the callbacks look like below:
           return 0;
   }
 
-The scheme of the real suspend job is as follows.
+The scheme of the real suspend job is as follows:
 
 1. Retrieve the card and the chip data.
 
@@ -4013,9 +3775,7 @@ The scheme of the real suspend job is as follows.
 
 5. Stop the hardware if necessary.
 
-A typical code would be like:
-
-::
+Typical code would look like::
 
   static int __maybe_unused mychip_suspend(struct device *dev)
   {
@@ -4034,24 +3794,22 @@ A typical code would be like:
   }
 
 
-The scheme of the real resume job is as follows.
+The scheme of the real resume job is as follows:
 
 1. Retrieve the card and the chip data.
 
 2. Re-initialize the chip.
 
 3. Restore the saved registers if necessary.
 
-4. Resume the mixer, e.g. calling :c:func:`snd_ac97_resume()`.
+4. Resume the mixer, e.g. by calling :c:func:`snd_ac97_resume()`.
 
 5. Restart the hardware (if any).
 
 6. Call :c:func:`snd_power_change_state()` with
    ``SNDRV_CTL_POWER_D0`` to notify the processes.
 
-A typical code would be like:
-
-::
+Typical code would look like::
 
   static int __maybe_unused mychip_resume(struct pci_dev *pci)
   {
@@ -4078,9 +3836,7 @@ been already suspended via its own PM ops calling
 OK, we have all callbacks now. Let's set them up. In the initialization
 of the card, make sure that you can get the chip data from the card
 instance, typically via ``private_data`` field, in case you created the
-chip data individually.
-
-::
+chip data individually::
 
   static int snd_mychip_probe(struct pci_dev *pci,
                               const struct pci_device_id *pci_id)
@@ -4100,9 +3856,7 @@ chip data individually.
   }
 
 When you created the chip data with :c:func:`snd_card_new()`, it's
-anyway accessible via ``private_data`` field.
-
-::
+anyway accessible via ``private_data`` field::
 
   static int snd_mychip_probe(struct pci_dev *pci,
                               const struct pci_device_id *pci_id)
@@ -4119,14 +3873,12 @@ anyway accessible via ``private_data`` field.
           ....
   }
 
-If you need a space to save the registers, allocate the buffer for it
+If you need space to save the registers, allocate the buffer for it
 here, too, since it would be fatal if you cannot allocate a memory in
 the suspend phase. The allocated buffer should be released in the
 corresponding destructor.
 
-And next, set suspend/resume callbacks to the pci_driver.
-
-::
+And next, set suspend/resume callbacks to the pci_driver::
 
   static SIMPLE_DEV_PM_OPS(snd_my_pm_ops, mychip_suspend, mychip_resume);
 
@@ -4146,9 +3898,7 @@ have the ``index``, ``id`` and ``enable`` options.
 
 If the module supports multiple cards (usually up to 8 = ``SNDRV_CARDS``
 cards), they should be arrays. The default initial values are defined
-already as constants for easier programming:
-
-::
+already as constants for easier programming::
 
   static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
   static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
@@ -4162,9 +3912,7 @@ The module parameters must be declared with the standard
 ``module_param()``, ``module_param_array()`` and
 :c:func:`MODULE_PARM_DESC()` macros.
 
-The typical coding would be like below:
-
-::
+Typical code would look as below::
 
   #define CARD_NAME "My Chip"
 
@@ -4177,9 +3925,7 @@ The typical coding would be like below:
 
 Also, don't forget to define the module description and the license.
 Especially, the recent modprobe requires to define the
-module license as GPL, etc., otherwise the system is shown as “tainted”.
-
-::
+module license as GPL, etc., otherwise the system is shown as “tainted”::
 
   MODULE_DESCRIPTION("Sound driver for My Chip");
   MODULE_LICENSE("GPL");
@@ -4242,50 +3988,50 @@ Driver with A Single Source File
 
 1. Modify sound/pci/Makefile
 
-   Suppose you have a file xyz.c. Add the following two lines
-
-::
+   Suppose you have a file xyz.c. Add the following two lines::
 
   snd-xyz-objs := xyz.o
   obj-$(CONFIG_SND_XYZ) += snd-xyz.o
 
 2. Create the Kconfig entry
 
-   Add the new entry of Kconfig for your xyz driver. config SND_XYZ
-   tristate "Foobar XYZ" depends on SND select SND_PCM help Say Y here
-   to include support for Foobar XYZ soundcard. To compile this driver
-   as a module, choose M here: the module will be called snd-xyz. the
-   line, select SND_PCM, specifies that the driver xyz supports PCM. In
-   addition to SND_PCM, the following components are supported for
-   select command: SND_RAWMIDI, SND_TIMER, SND_HWDEP,
-   SND_MPU401_UART, SND_OPL3_LIB, SND_OPL4_LIB, SND_VX_LIB,
-   SND_AC97_CODEC. Add the select command for each supported
-   component.
+   Add the new entry of Kconfig for your xyz driver::
 
-   Note that some selections imply the lowlevel selections. For example,
-   PCM includes TIMER, MPU401_UART includes RAWMIDI, AC97_CODEC
-   includes PCM, and OPL3_LIB includes HWDEP. You don't need to give
-   the lowlevel selections again.
+  config SND_XYZ 
+    tristate "Foobar XYZ"
+    depends on SND
+    select SND_PCM
+    help
+      Say Y here to include support for Foobar XYZ soundcard.
+      To compile this driver as a module, choose M here:
+      the module will be called snd-xyz.
 
-   For the details of Kconfig script, refer to the kbuild documentation.
+The line ``select SND_PCM`` specifies that the driver xyz supports PCM.
+In addition to SND_PCM, the following components are supported for
+select command: SND_RAWMIDI, SND_TIMER, SND_HWDEP, SND_MPU401_UART,
+SND_OPL3_LIB, SND_OPL4_LIB, SND_VX_LIB, SND_AC97_CODEC.
+Add the select command for each supported component.
+
+Note that some selections imply the lowlevel selections. For example,
+PCM includes TIMER, MPU401_UART includes RAWMIDI, AC97_CODEC
+includes PCM, and OPL3_LIB includes HWDEP. You don't need to give
+the lowlevel selections again.
+
+For the details of Kconfig script, refer to the kbuild documentation.
 
 Drivers with Several Source Files
 ---------------------------------
 
 Suppose that the driver snd-xyz have several source files. They are
 located in the new subdirectory, sound/pci/xyz.
 
 1. Add a new directory (``sound/pci/xyz``) in ``sound/pci/Makefile``
-   as below
-
-::
+   as below::
 
   obj-$(CONFIG_SND) += sound/pci/xyz/
 
 
-2. Under the directory ``sound/pci/xyz``, create a Makefile
-
-::
+2. Under the directory ``sound/pci/xyz``, create a Makefile::
 
          snd-xyz-objs := xyz.o abc.o def.o
          obj-$(CONFIG_SND_XYZ) += snd-xyz.o
-- 
2.40.0.152.g15d061e6df

