Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B44F04F0
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 18:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E9FA17A3;
	Sat,  2 Apr 2022 18:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E9FA17A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648917175;
	bh=eBD0US2XIxp4F/ffI9gYxv6zA7XVqWq2OlUPNGB/UPo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJN+Z8VRABEspM7Jx/T92MdQIDVAcjkuSfuKpCrJca69bY5o5JcXjoLtw3NWD4l3g
	 vhxAOoq8UK+q8Z5CbpvZkNeaMsxO7gfL1unopntGHVv3zmXwj557wcHkcwfG5ocJU5
	 QRlXfP+OiCelXJGGSsIJ6Wlg/VW06B73jlgJh0WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10817F8047C;
	Sat,  2 Apr 2022 18:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C01CF80423; Sat,  2 Apr 2022 18:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2240FF80100;
 Sat,  2 Apr 2022 18:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2240FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gnuweeb.org header.i=@gnuweeb.org
 header.b="eADNGdZi"
Received: from integral2.. (unknown [182.2.36.61])
 by gnuweeb.org (Postfix) with ESMTPSA id 496827E312;
 Sat,  2 Apr 2022 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
 s=default; t=1648917115;
 bh=eBD0US2XIxp4F/ffI9gYxv6zA7XVqWq2OlUPNGB/UPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eADNGdZi2euUZuamRSiTQ5O5Q7kME4KHnDQvK+4eOWOe8A3LI9bkDFakQZhA+x+6e
 WpzdC3empnQs4JBvECdztpW5N5Nc2Xf/z+mPJ4iH5L4v4qCAPEAPMDI5WX2L+wI7u7
 fyq56i5rOHxLR6J9NYjVdHy2Ru9etS+01p8KN8z5M2ZO5ZiB373DuXdvCx2e9maEIg
 oC7R7gAfCYqzAqBPljh+NLVONCfjP2svRk+9beCDtmqx4EYFJiBZgtLnFHWZBgYY5w
 0DMN/D7AcHefmYtXShnQO1h7iVdHFIrQYpvBLIuZJlVq3X07ztQoMgCspouD4Ir6lF
 g1fps/OKkoYHQ==
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH linux-5.4.y] ASoC: SOF: Intel: Fix NULL ptr dereference when
 ENOMEM
Date: Sat,  2 Apr 2022 23:31:38 +0700
Message-Id: <20220402163138.11632-1-ammarfaizi2@gnuweeb.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402163026.11299-1-ammarfaizi2@gnuweeb.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, gwml@vger.gnuweeb.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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
[ammarfaizi2: Backport to Linux 5.4 LTS]
Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 sound/soc/sof/intel/hda-loader.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 356bb134ae93..7573f3f9f0f2 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -50,7 +50,7 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, &pci->dev, size, dmab);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: memory alloc failed: %x\n", ret);
-		goto error;
+		goto out_put;
 	}
 
 	hstream->period_bytes = 0;/* initialize period_bytes */
@@ -60,16 +60,17 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 	ret = hda_dsp_stream_hw_params(sdev, dsp_stream, dmab, NULL);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: hdac prepare failed: %x\n", ret);
-		goto error;
+		goto out_free;
 	}
 
 	hda_dsp_stream_spib_config(sdev, dsp_stream, HDA_DSP_SPIB_ENABLE, size);
 
 	return hstream->stream_tag;
 
-error:
-	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
+out_free:
 	snd_dma_free_pages(dmab);
+out_put:
+	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
 	return ret;
 }
 

base-commit: 2845ff3fd34499603249676495c524a35e795b45
-- 
2.32.0

