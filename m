Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC953907800
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58DDC1928;
	Thu, 13 Jun 2024 18:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58DDC1928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295299;
	bh=fvFhI53dTK9iqQDVo32UnwFWX6dUsSzcHoVloVVQ3U0=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cQqw/kD0l/ii2yhdmsSg+OuFD54IbZWbrOP2/QWl4rxliiHNW4r89fLtZuVfxclex
	 P269JAXtcgxVt0F1ud+5ViqQoGFUF5YVs021cIKRsJglFvOWrRWD2HGTlaKZXvvHoV
	 B7CKZA6GZ/+8n6VJoQjrxLcNDE6owoh02pWJGSXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1061F89943; Thu, 13 Jun 2024 18:05:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1D0F8994E;
	Thu, 13 Jun 2024 18:05:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1BB1F80587; Tue, 11 Jun 2024 14:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E0E7F80579
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 14:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E0E7F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=dDDlRDhS
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45BCaYr1048160;
	Tue, 11 Jun 2024 07:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718109394;
	bh=JbmIH2ytin76u0iZ2JCQK6vEjj144c5OCWcTe8D7XfM=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=dDDlRDhSQ+6eSNrye+1m5ob6Vnf/EePEg+JsGeynJut74HnOt0ublERZJ1hz4Wbxj
	 gC/wwcA8s8q++kBpgIPjNQuSDBpBCdZC9uKAef+Eh74kASqZKf8rnFv+47aE/dtvYj
	 vGalZpY/yfXqn0oJRBC5IumNjO1zmyuNOL9C6CDE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45BCaYKp007146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Jun 2024 07:36:34 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Jun 2024 07:36:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Jun 2024 07:36:34 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45BCaX6H123484;
	Tue, 11 Jun 2024 07:36:34 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Tue, 11 Jun 2024 18:02:55 +0530
Subject: [PATCH v3 1/2] ALSA: dmaengine: Synchronize dma channel after
 drop()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-asoc_next-v3-1-fcfd84b12164@ti.com>
References: <20240611-asoc_next-v3-0-fcfd84b12164@ti.com>
In-Reply-To: <20240611-asoc_next-v3-0-fcfd84b12164@ti.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Devarsh Thakkar <devarsht@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Jayesh Choudhary <j-choudhary@ti.com>, Jai
 Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3460; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=fvFhI53dTK9iqQDVo32UnwFWX6dUsSzcHoVloVVQ3U0=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmaETNG9S7+0ODFUMsfnXellmz1gcZX3Q6zKftx
 Ut3QmLKhh2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZmhEzQAKCRBD3pH5JJpx
 Rcl5EACdUKrqsvcM7ouIqAzpy2KzQcHFoK7Fu8GPaD4waODCc+r2jFi3yC/Cq9L2AKV74Hy6JHt
 thw1+UEtO+HtoYNHHzdq0JOxiUkLpsdgABAhj2WLw8cFXGoUTosj4kE6ntM1TGViymXdd4P6I1m
 CAOzIPy3hSe8TV4tdZ6qtaSp/8S+NaFia7jyExaZ82seYAqvTZa63Ze89f9xUI256CyVpIuAYmu
 OPr5OjI/axJJQ8DFCzm6i/Tn5JzKaQIDpdn0wCAj5zUTOYY1CYDDIianHWotDpcgoGuovaOq97y
 gYgu/XOMT/0dzYTQWEL4ybuQXphanjjV5CEOOCwZWbPkpHFQIEvU3uuVjokudHidLNNr1nuNRR8
 BEd4TC5zOfuFPFKhrKKGmJfUiExoR+xEQ37KdXwSS+OzVXpi+/HrVftB8ZqR2eQdKYcVZ9hWsR/
 kodMUcQbtGmmzev8YHPDij9OYpnyzTKev1jGeyhLnQ0YOr7mQwmWhRAEnz18v0gMwEgBXwfUS7V
 HpmI13yKK/+8QLBIsrzbPn3tSVZFet4CkUQ/PpSqaiIrTNAuXkkjh3YzXSuHbzkMhVTixAwGOYr
 6zUidr9wFpTPS0lVkEgtVMbQgEFIBvC+BMgp+ea9l6JkQXMW1u6ytcLIgPAtLihNgfGxusa2I6r
 t/sYjwBsz9YBoIw==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JHQTDYQ2IYA32UJ455MHYLAECGNFKWEZ
X-Message-ID-Hash: JHQTDYQ2IYA32UJ455MHYLAECGNFKWEZ
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHQTDYQ2IYA32UJ455MHYLAECGNFKWEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sometimes the stream may be stopped due to XRUN events, in which case
the userspace can call snd_pcm_drop() and snd_pcm_prepare() to stop and
start the stream again.

In these cases, we must wait for the DMA channel to synchronize before
marking the stream as prepared for playback, as the DMA channel gets
stopped by drop() without any synchronization. Make sure the ALSA core
synchronizes the DMA channel by adding a sync_stop() hook.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 include/sound/dmaengine_pcm.h         |  1 +
 sound/core/pcm_dmaengine.c            | 10 ++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c |  8 ++++++++
 3 files changed, 19 insertions(+)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index c11aaf8079fb..f6baa9a01868 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -36,6 +36,7 @@ snd_pcm_uframes_t snd_dmaengine_pcm_pointer_no_residue(struct snd_pcm_substream
 int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 	struct dma_chan *chan);
 int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream);
+int snd_dmaengine_pcm_sync_stop(struct snd_pcm_substream *substream);
 
 int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
 	dma_filter_fn filter_fn, void *filter_data);
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 12aa1cef11a1..ed07fa5693d2 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -349,6 +349,16 @@ int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
 
+int snd_dmaengine_pcm_sync_stop(struct snd_pcm_substream *substream)
+{
+	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
+
+	dmaengine_synchronize(prtd->dma_chan);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_sync_stop);
+
 /**
  * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
  * @substream: PCM substream
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index ea3bc9318412..a63e942fdc0b 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -318,6 +318,12 @@ static int dmaengine_copy(struct snd_soc_component *component,
 	return 0;
 }
 
+static int dmaengine_pcm_sync_stop(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
+{
+	return snd_dmaengine_pcm_sync_stop(substream);
+}
+
 static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.name		= SND_DMAENGINE_PCM_DRV_NAME,
 	.probe_order	= SND_SOC_COMP_ORDER_LATE,
@@ -327,6 +333,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
 	.pcm_construct	= dmaengine_pcm_new,
+	.sync_stop	= dmaengine_pcm_sync_stop,
 };
 
 static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
@@ -339,6 +346,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.pointer	= dmaengine_pcm_pointer,
 	.copy		= dmaengine_copy,
 	.pcm_construct	= dmaengine_pcm_new,
+	.sync_stop	= dmaengine_pcm_sync_stop,
 };
 
 static const char * const dmaengine_pcm_dma_channel_names[] = {

-- 
2.43.0

