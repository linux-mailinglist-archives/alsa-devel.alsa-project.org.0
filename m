Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C24C4602
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:22:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697171B02;
	Fri, 25 Feb 2022 14:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697171B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795325;
	bh=VCLpP+mfC5yC5cMO+0JDeJ/M40lflzsLuNleX1PqHFM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXOllaMz0ZXmt/1mdX6eCF70pk7K+oE39dhrN1ZJihI8xCLWgWAoGLZpMzIUPqnhw
	 bu+tZJPz7FatEoNgF83rS0mM2A7jhfC34aQQs6FRHfwa0Nn7nL6axaebvXFRU/9LOd
	 2gfxv3zLxhdWD4IAlBDGJh4I3kBs0LLqJROAtn+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E80F80601;
	Fri, 25 Feb 2022 14:11:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C83F8030F; Thu, 24 Feb 2022 19:28:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE090F800F3;
 Thu, 24 Feb 2022 19:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE090F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gnuweeb.org header.i=@gnuweeb.org
 header.b="iizxB05m"
Received: from integral2.. (unknown [36.78.50.60])
 by gnuweeb.org (Postfix) with ESMTPSA id 014677E2A3;
 Thu, 24 Feb 2022 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
 s=default; t=1645727318;
 bh=VCLpP+mfC5yC5cMO+0JDeJ/M40lflzsLuNleX1PqHFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iizxB05mBRlsWLerBWLOhdxxfjyOmS1tTpb0mgou/nd2+hLHVvlf/LYrPBg6/uKgJ
 nGHV0ZIEuOidHk8ekAKqgncu9ZAqftWV1RlmPRzD+ki/CazTDCEc+/Pla52/QnZQ5l
 A0u+Xt6V44lLpXQKEp8akEk6J94FL7lnVXGpoX7XtzJMV8kvd3Z/r7a7gkIsOOWhsD
 77T5qbUfeEKBwXvykN/5VeGiib/8yCna7iPH9MKU6SxjcPjWzL7rZp2PdOsn0bsglQ
 i6uishd7V8rb+vbMGxCDMUVEla/kNxo8fmFFLym9ynNP9CLc2uBz1vYIsJunTdmjzn
 ILoI0f2FhVGww==
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v3] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
Date: Fri, 25 Feb 2022 01:28:18 +0700
Message-Id: <20220224182818.40301-1-ammarfaizi2@gnuweeb.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <YhfLCWm0Ms3E+j4z@sirena.org.uk>
References: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
 <cfe9e583-e20a-f1d6-2a81-2538ca3ca054@linux.intel.com>
 <Yhe/3rELNfFOdU4L@sirena.org.uk>
 <04e79b9c-ccb1-119a-c2e2-34c8ca336215@linux.intel.com>
 <20220224180850.34592-1-ammarfaizi2@gnuweeb.org>
 <YhfLCWm0Ms3E+j4z@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Ammar Faizi <ammarfaizi2@gnuweeb.org>

Do not call snd_dma_free_pages() when snd_dma_alloc_pages() returns
-ENOMEM because it leads to a NULL pointer dereference bug.

The dmesg says:

  [ T1387] sof-audio-pci-intel-tgl 0000:00:1f.3: error: memory alloc failed: -12
  [ T1387] BUG: kernel NULL pointer dereference, address: 0000000000000000
  [ T1387] #PF: supervisor read access in kernel mode
  [ T1387] #PF: error_code(0x0000) - not-present page
  [ T1387] PGD 0 P4D 0
  [ T1387] Oops: 0000 [#1] PREEMPT SMP NOPTI
  [ T1387] CPU: 6 PID: 1387 Comm: alsa-sink-HDA A Tainted: G        W         5.17.0-rc4-superb-owl-00055-g80d47f5de5e3 #3 56590caeed02394520e20ca5a2059907eb2d5079
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
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Rander Wang <rander.wang@intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>
Fixes: d16046ffa6de040bf580a64d5f4d0aa18258a854 ("ASoC: SOF: Intel: Add Intel specific HDA firmware loader")
Cc: stable@vger.kernel.org # v5.2+
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Link: https://lore.kernel.org/lkml/20220224145124.15985-1-ammarfaizi2@gnuweeb.org/ # v1
Link: https://lore.kernel.org/lkml/20220224180850.34592-1-ammarfaizi2@gnuweeb.org/ # v2
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---

On 2/25/22 1:14 AM, Mark Brown wrote:
> On Fri, Feb 25, 2022 at 01:08:50AM +0700, Ammar Faizi wrote:
> 
>> The dmesg says:
>>
>>    [ T1387] sof-audio-pci-intel-tgl 0000:00:1f.3: error: memory alloc failed: -12
>>    [ T1387] BUG: kernel NULL pointer dereference, address: 0000000000000000
>>    [ T1387] #PF: supervisor read access in kernel mode
>>    [ T1387] #PF: error_code(0x0000) - not-present page
>>    [ T1387] PGD 0 P4D 0
>>    [ T1387] Oops: 0000 [#1] PREEMPT SMP NOPTI
> 
> This is still an enormous and not super useful section of backtrace, at
> a glance the backtrace is longer than the rest of the commit :(

Should be okay now...

"cl_stream_prepare()" and "RIP: 0010:dma_free_noncontiguous+0x37/0x80"
should be the important parts to find this bug.

 v3:
   - Address comment from Mark Brown (strip not useful kernel log
     from the commit message, again).

 v2:
   - Append Reviewed-by tag from Peter Ujfalusi.
   - Append Reviewed-by tag from Pierre-Louis Bossart.
   - Address comment from Mark Brown (strip irrelevant kernel log
     from the commit message).

 sound/soc/sof/intel/hda-loader.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 33306d2023a7..9bbfdab8009d 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -47,7 +47,7 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, &pci->dev, size, dmab);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: memory alloc failed: %d\n", ret);
-		goto error;
+		goto out_put;
 	}
 
 	hstream->period_bytes = 0;/* initialize period_bytes */
@@ -58,22 +58,23 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
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
 

base-commit: 23d04328444a8fa0ca060c5e532220dac8e8bc26
-- 
2.32.0

