Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9992C99C8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 09:46:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17AFC17B8;
	Tue,  1 Dec 2020 09:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17AFC17B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606812369;
	bh=wRfA2eiyYjs3uaueRdHiSH0bfZ4IkXUG0p/Y3ymd9Lw=;
	h=Subject:To:From:Date:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bdu1E6nC+7o8TL3+7S7zU/t10lbNKbnyuAJvn+x6eQxH8KTQF3ElNRFAg5gHbrZgJ
	 avZbQnuYG/+9u1l7+7O3d2NM8R+jiVcZtn8GDBBoCyXZn34UkMUb4OWfOfW9DOMBdw
	 TnUu+4rp3I6Um6HBL5PimYsgGq5GblFUmLL/VGX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64125F804FC;
	Tue,  1 Dec 2020 09:42:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6B8CF804F2; Tue,  1 Dec 2020 09:42:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24BDAF804EC
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 09:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24BDAF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="u4VP/S52"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75ED2221EB;
 Tue,  1 Dec 2020 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606812127;
 bh=wRfA2eiyYjs3uaueRdHiSH0bfZ4IkXUG0p/Y3ymd9Lw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=u4VP/S52P+2EnSEa7lWfGPnTcsy4q+bLRnX/QjDNGw7NlyBiTruIILrXTwiDMubhH
 4FTMyxaSAigM0JJlYPgaaIk0pYxAgZEkhwafkifszx4Ti27KJ8hVbZcTr9oM7/k5K+
 aYZ1/bTsdzn5lBQkqV77PHz3LCd3mlw5aCN4hcpo=
Subject: Patch "ASoC: Intel: Skylake: Remove superfluous chip initialization"
 has been added to the 5.4-stable tree
To: alsa-devel@alsa-project.org, broonie@kernel.org, cezary.rojewski@intel.com,
 gregkh@linuxfoundation.org, mateusz.gorski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Dec 2020 09:42:55 +0100
In-Reply-To: <20201129114148.13772-2-cezary.rojewski@intel.com>
Message-ID: <1606812175208143@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Cc: stable-commits@vger.kernel.org
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


This is a note to let you know that I've just added the patch titled

    ASoC: Intel: Skylake: Remove superfluous chip initialization

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asoc-intel-skylake-remove-superfluous-chip-initialization.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Tue Dec  1 09:41:56 AM CET 2020
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Sun, 29 Nov 2020 12:41:41 +0100
Subject: ASoC: Intel: Skylake: Remove superfluous chip initialization
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com, mateusz.gorski@linux.intel.com, Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20201129114148.13772-2-cezary.rojewski@intel.com>

From: Cezary Rojewski <cezary.rojewski@intel.com>

commit 2ef81057d80456870b97890dd79c8f56a85b1242 upstream.

Skylake driver does the controller init operation twice:
- first during probe (only to stop it just before scheduling probe_work)
- and during said probe_work where the actual correct sequence is
executed

To properly complete boot sequence when iDisp codec is present, bus
initialization has to be called only after _i915_init() finishes.
With additional _reset_list preceding _i915_init(), iDisp codec never
gets the chance to enumerate on the link. Remove the superfluous
initialization to address the issue.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-2-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/intel/skylake/skl.c |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -807,6 +807,9 @@ static void skl_probe_work(struct work_s
 			return;
 	}
 
+	skl_init_pci(skl);
+	skl_dum_set(bus);
+
 	err = skl_init_chip(bus, true);
 	if (err < 0) {
 		dev_err(bus->dev, "Init chip failed with err: %d\n", err);
@@ -922,8 +925,6 @@ static int skl_first_init(struct hdac_bu
 		return -ENXIO;
 	}
 
-	snd_hdac_bus_reset_link(bus, true);
-
 	snd_hdac_bus_parse_capabilities(bus);
 
 	/* check if PPCAP exists */
@@ -971,11 +972,7 @@ static int skl_first_init(struct hdac_bu
 	if (err < 0)
 		return err;
 
-	/* initialize chip */
-	skl_init_pci(skl);
-	skl_dum_set(bus);
-
-	return skl_init_chip(bus, true);
+	return 0;
 }
 
 static int skl_probe(struct pci_dev *pci,
@@ -1080,8 +1077,6 @@ static int skl_probe(struct pci_dev *pci
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	snd_hdac_bus_stop_chip(bus);
-
 	/* create device for soc dmic */
 	err = skl_dmic_device_register(skl);
 	if (err < 0) {


Patches currently in stable-queue which might be from cezary.rojewski@intel.com are

queue-5.4/asoc-intel-skylake-select-hda-configuration-permissively.patch
queue-5.4/asoc-intel-skylake-enable-codec-wakeup-during-chip-init.patch
queue-5.4/asoc-intel-allow-for-rom-init-retry-on-cnl-platforms.patch
queue-5.4/asoc-intel-skylake-await-purge-request-ack-on-cnl.patch
queue-5.4/asoc-intel-skylake-remove-superfluous-chip-initialization.patch
queue-5.4/asoc-intel-skylake-shield-against-no-nhlt-configurations.patch
queue-5.4/asoc-intel-multiple-i-o-pcm-format-support-for-pipe.patch
queue-5.4/asoc-intel-skylake-automatic-dmic-format-configuration-according-to-information-from-nhlt.patch
