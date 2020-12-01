Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3F2C99C6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 09:45:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 988F017BF;
	Tue,  1 Dec 2020 09:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 988F017BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606812320;
	bh=HaKpuJN8Gf4z4+WKdcVI4Mx9hXF1u8A/PlWaYAMaLU8=;
	h=Subject:To:From:Date:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Me2qx6em8qbYrGuLL0doTxgGLxptO8l6ttiWbUTiGNcNtWwKZJ911CmUeHqIYgtP7
	 bfF+5sme1/xEmda+y+VS+pxM4NcnMCUt5uiWRQmJ4fsJ/cq0sB2RpeRIMlL9ZqwnJg
	 M5/i7z7tPth2VHxn4H7jkhaD8bIjOVGbmfC4p6Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E896CF804EB;
	Tue,  1 Dec 2020 09:42:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08CBAF804E7; Tue,  1 Dec 2020 09:42:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19CA2F804D6
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 09:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19CA2F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="dIhTmf1y"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D076621D7A;
 Tue,  1 Dec 2020 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606812121;
 bh=HaKpuJN8Gf4z4+WKdcVI4Mx9hXF1u8A/PlWaYAMaLU8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=dIhTmf1yIZG/caFZgqpDyDIQ7Hc5Fqbp8FxSDdNI+MHZQeJxZuUkrCAqS5WQfKLjR
 H6sW2LE0pEj/QJ5cL2KSnJq61xVOQv3OHSl58hKuq3aG0RprjT/QJuUl7ImAO/jMoh
 MAphcGenmkSd1UeTLVuByqktxDTwlmITFy8GxoWg=
Subject: Patch "ASoC: Intel: Skylake: Select hda configuration permissively"
 has been added to the 5.4-stable tree
To: alsa-devel@alsa-project.org, broonie@kernel.org, cezary.rojewski@intel.com,
 gregkh@linuxfoundation.org, mateusz.gorski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Dec 2020 09:42:55 +0100
In-Reply-To: <20201129114148.13772-3-cezary.rojewski@intel.com>
Message-ID: <160681217511268@kroah.com>
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

    ASoC: Intel: Skylake: Select hda configuration permissively

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asoc-intel-skylake-select-hda-configuration-permissively.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Tue Dec  1 09:41:56 AM CET 2020
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Sun, 29 Nov 2020 12:41:42 +0100
Subject: ASoC: Intel: Skylake: Select hda configuration permissively
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com, mateusz.gorski@linux.intel.com, Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20201129114148.13772-3-cezary.rojewski@intel.com>

From: Cezary Rojewski <cezary.rojewski@intel.com>

commit a66f88394a78fec9a05fa6e517e9603e8eca8363 upstream.

With _reset_link removed from the probe sequence, codec_mask at the time
skl_find_hda_machine() is invoked will always be 0, so hda machine will
never be chosen. Rather than reorganizing boot flow, be permissive about
invalid mask. codec_mask will be set to proper value during probe_work -
before skl_codec_create() ever gets called.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-3-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/intel/skylake/skl.c |    5 -----
 1 file changed, 5 deletions(-)

--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -480,13 +480,8 @@ static struct skl_ssp_clk skl_ssp_clks[]
 static struct snd_soc_acpi_mach *skl_find_hda_machine(struct skl_dev *skl,
 					struct snd_soc_acpi_mach *machines)
 {
-	struct hdac_bus *bus = skl_to_bus(skl);
 	struct snd_soc_acpi_mach *mach;
 
-	/* check if we have any codecs detected on bus */
-	if (bus->codec_mask == 0)
-		return NULL;
-
 	/* point to common table */
 	mach = snd_soc_acpi_intel_hda_machines;
 


Patches currently in stable-queue which might be from cezary.rojewski@intel.com are

queue-5.4/asoc-intel-skylake-select-hda-configuration-permissively.patch
queue-5.4/asoc-intel-skylake-enable-codec-wakeup-during-chip-init.patch
queue-5.4/asoc-intel-allow-for-rom-init-retry-on-cnl-platforms.patch
queue-5.4/asoc-intel-skylake-await-purge-request-ack-on-cnl.patch
queue-5.4/asoc-intel-skylake-remove-superfluous-chip-initialization.patch
queue-5.4/asoc-intel-skylake-shield-against-no-nhlt-configurations.patch
queue-5.4/asoc-intel-multiple-i-o-pcm-format-support-for-pipe.patch
queue-5.4/asoc-intel-skylake-automatic-dmic-format-configuration-according-to-information-from-nhlt.patch
