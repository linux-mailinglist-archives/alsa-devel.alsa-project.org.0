Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5874F020C
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 15:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 597FF175C;
	Sat,  2 Apr 2022 15:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 597FF175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648905433;
	bh=mwn2EYlSvXdgiaem2q8IbZiA5vRAA2+Xj7/UXF7qDEw=;
	h=Subject:To:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LLXnP67HwVahfZ7RwWJ4SnyiqpUtEovIOKYA4+Uq8JJTV7kIvGLQuPqYMFucVx/ir
	 BweP4FnIlI203cr/nT9OWGOor9s590aduZNDV80n0d8C0KOpjqF5AR6VktCiChqPCs
	 0BNNfmBFkppYKNDW8z2rEQofCpgqXZhpAsH01f4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3B49F80310;
	Sat,  2 Apr 2022 15:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 925E0F802DB; Sat,  2 Apr 2022 15:16:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B12F80084;
 Sat,  2 Apr 2022 15:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B12F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="cgIk7yZ0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 797C2B808CE;
 Sat,  2 Apr 2022 13:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E3AC340EC;
 Sat,  2 Apr 2022 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648905353;
 bh=mwn2EYlSvXdgiaem2q8IbZiA5vRAA2+Xj7/UXF7qDEw=;
 h=Subject:To:Cc:From:Date:From;
 b=cgIk7yZ0psc6wo9AEEOlCplH1c6ZQ1HS27INlKZbeb8Vx1Xx38ngP5mRYox6yuhQk
 qQubnkuRgaq1DNmlwgGOXlXYnKz72jesu/70vxPI4YaFvFGkIeRghuzHybz9FGriLi
 npSI+0JGAnpZSyNeOSEcJKrEvmZLjPJLuUDZB82I=
Subject: Patch "ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM" has
 been added to the 5.15-stable tree
To: alsa-devel@alsa-project.org, ammarfaizi2@gnuweeb.org, broonie@kernel.org,
 daniel.baluta@nxp.com, gregkh@linuxfoundation.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, ranjani.sridharan@linux.intel.com,
 sound-open-firmware@alsa-project.org, tiwai@suse.com, yang.jie@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Sat, 02 Apr 2022 15:10:53 +0200
Message-ID: <1648905053135159@kroah.com>
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

    ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asoc-sof-intel-fix-null-ptr-dereference-when-enomem.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From b7fb0ae09009d076964afe4c1a2bde1ee2bd88a9 Mon Sep 17 00:00:00 2001
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Date: Fri, 25 Feb 2022 01:58:36 +0700
Subject: ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM

From: Ammar Faizi <ammarfaizi2@gnuweeb.org>

commit b7fb0ae09009d076964afe4c1a2bde1ee2bd88a9 upstream.

Do not call snd_dma_free_pages() when snd_dma_alloc_pages() returns
-ENOMEM because it leads to a NULL pointer dereference bug.

The dmesg says:

  [ T1387] sof-audio-pci-intel-tgl 0000:00:1f.3: error: memory alloc failed: -12
  [ T1387] BUG: kernel NULL pointer dereference, address: 0000000000000000
  [ T1387] #PF: supervisor read access in kernel mode
  [ T1387] #PF: error_code(0x0000) - not-present page
  [ T1387] PGD 0 P4D 0
  [ T1387] Oops: 0000 [#1] PREEMPT SMP NOPTI
  [ T1387] CPU: 6 PID: 1387 Comm: alsa-sink-HDA A Tainted: G        W         5.17.0-rc4-superb-owl-00055-g80d47f5de5e3
  [ T1387] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, BIOS F.15 09/15/2021
  [ T1387] RIP: 0010:dma_free_noncontiguous+0x37/0x80
  [ T1387] Code: [... snip ...]
  [ T1387] RSP: 0000:ffffc90002b87770 EFLAGS: 00010246
  [ T1387] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
  [ T1387] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888101db30d0
  [ T1387] RBP: 00000000fffffff4 R08: 0000000000000000 R09: 0000000000000000
  [ T1387] R10: 0000000000000000 R11: ffffc90002b874d0 R12: 0000000000000001
  [ T1387] R13: 0000000000058000 R14: ffff888105260c68 R15: ffff888105260828
  [ T1387] FS:  00007f42e2ffd640(0000) GS:ffff888466b80000(0000) knlGS:0000000000000000
  [ T1387] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [ T1387] CR2: 0000000000000000 CR3: 000000014acf0003 CR4: 0000000000770ee0
  [ T1387] PKRU: 55555554
  [ T1387] Call Trace:
  [ T1387]  <TASK>
  [ T1387]  cl_stream_prepare+0x10a/0x120 [snd_sof_intel_hda_common 146addf995b9279ae7f509621078cccbe4f875e1]
  [... snip ...]
  [ T1387]  </TASK>

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Keyon Jie <yang.jie@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rander Wang <rander.wang@intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org # v5.2+
Fixes: d16046ffa6de040bf580a64d5f4d0aa18258a854 ("ASoC: SOF: Intel: Add Intel specific HDA firmware loader")
Link: https://lore.kernel.org/lkml/20220224145124.15985-1-ammarfaizi2@gnuweeb.org/ # v1
Link: https://lore.kernel.org/lkml/20220224180850.34592-1-ammarfaizi2@gnuweeb.org/ # v2
Link: https://lore.kernel.org/lkml/20220224182818.40301-1-ammarfaizi2@gnuweeb.org/ # v3
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Link: https://lore.kernel.org/r/20220224185836.44907-1-ammarfaizi2@gnuweeb.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/sof/intel/hda-loader.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -48,7 +48,7 @@ static struct hdac_ext_stream *cl_stream
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, &pci->dev, size, dmab);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: memory alloc failed: %d\n", ret);
-		goto error;
+		goto out_put;
 	}
 
 	hstream->period_bytes = 0;/* initialize period_bytes */
@@ -59,22 +59,23 @@ static struct hdac_ext_stream *cl_stream
 		ret = hda_dsp_iccmax_stream_hw_params(sdev, dsp_stream, dmab, NULL);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: iccmax stream prepare failed: %d\n", ret);
-			goto error;
+			goto out_free;
 		}
 	} else {
 		ret = hda_dsp_stream_hw_params(sdev, dsp_stream, dmab, NULL);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: hdac prepare failed: %d\n", ret);
-			goto error;
+			goto out_free;
 		}
 		hda_dsp_stream_spib_config(sdev, dsp_stream, HDA_DSP_SPIB_ENABLE, size);
 	}
 
 	return dsp_stream;
 
-error:
-	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
+out_free:
 	snd_dma_free_pages(dmab);
+out_put:
+	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
 	return ERR_PTR(ret);
 }
 


Patches currently in stable-queue which might be from ammarfaizi2@gnuweeb.org are

queue-5.15/asoc-sof-intel-fix-null-ptr-dereference-when-enomem.patch
