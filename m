Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE99077D1
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1EE1919;
	Thu, 13 Jun 2024 18:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1EE1919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294809;
	bh=Lp+scTaXNWTPUO0ppKiFayLUI/w7Lod4/XYkk1TOgYk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dI0AuayhWJOI28kWFLcrvywu+Epp3RclYA+pa5MqYmnXkNSmEOl45U+/V+MCb01xe
	 LWlEQs2XkTPqb0bphmWt7iL+brUL8UuvG0QWqgkO8ZCUN+MqiPG0UfakI33kpIXTG+
	 +sTsJopKVKCbVdFh7v5C+iby4YeOtIcnWGSXMsAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8795F80C0F; Thu, 13 Jun 2024 18:02:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D56F89619;
	Thu, 13 Jun 2024 18:02:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BC60F804B2; Tue,  4 Jun 2024 12:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_PASS,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1320F8025A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 12:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1320F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=IB3PJij0
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454A2Eqt119443;
	Tue, 4 Jun 2024 05:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717495334;
	bh=lfjn9I1R/062IS1FRzQ4jeA8Nt7VVXqJ001gnIjP820=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=IB3PJij0syg7D8TMfkGVBc+WxszFobhT9YL4/mCHGdK8Pwd+nvixYuB8+ynHgBger
	 w5Ag+LUYHCZVZ4VFpMoBkaseaU1UzxFOtYFzunDIgIsiFRcamXm7uIvVp/irkDXnhc
	 gUQdod2teL379xV5jEGGCW61CtBOfA8cuyJJZrzE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454A2Eas007025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:02:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:02:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:02:14 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454A2DUp130419;
	Tue, 4 Jun 2024 05:02:13 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Tue, 4 Jun 2024 15:31:50 +0530
Subject: [PATCH 1/2] ALSA: dmaengine: Synchronize dma channel in prepare()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240604-asoc_next-v1-1-e895c88e744d@ti.com>
References: <20240604-asoc_next-v1-0-e895c88e744d@ti.com>
In-Reply-To: <20240604-asoc_next-v1-0-e895c88e744d@ti.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3301; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=Lp+scTaXNWTPUO0ppKiFayLUI/w7Lod4/XYkk1TOgYk=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmXuYh9yZyRFY1oPeChZAutrbwaZau4OIiTYsWG
 pV9DiYd19yJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZl7mIQAKCRBD3pH5JJpx
 RS2/D/41LHb4Icv0t+Lr/32mgIHhUKYtv2gO0KaylT2Q4MuMNr8MCN5WYT5tvAfjffSWaKjuJJw
 h16AQbN/tvOyixRyIpvROT/gslnNbrcgl4hTkEGpqZfzOxHqrupF1vf8vBrugqj1/nZ+4HwU3d/
 j4PCQCR23mkm/HEqA5liaAP6E0y74ffddxyODC83zzOYmYqMDffEelGHNsA1Lb5VpiHWpG9KGTn
 SAYp3M4J7D2M2Ve08MjPGtWysIL0HObBslzq/1SU8W9+xXxdCNcTcvOJwPMrmjBnzsRzVHnTL6l
 Oh2WiClkZJwtgS0y7+XtpukbI4zU+OAhdAY5JOxpMDAC9stfMXEFqtd+GGpeSQDQCHbqXE+F7pO
 6UeKyz+uCfTuY3OdB61OamgOl+oAoRsRtyDocZctceqL1JKqHkgAQC3a2A3ciZfonj8WGd5teTI
 iUfbsQVnbYdwI4NowAxHX7BD2bZks+HP5CPA8zU9hZ4PPG2T2kuiLJqGkZM+FA+pEVsa7I13Z7N
 xneZa/NLYjl8V+pXti1RZBmKMBSbBCYaWs56I6wCGX040JTRouzM8X8NP6ltC9z6wuznZkzMOVq
 Dsh5/0i8ix7YkpEBcSBfgEQQkaW9WS0Y3tneXNAMLH9ZeYOtc8jjzT+U2y9+TW2trR12CvGSp9j
 AC6e1lbZ3Y97v9w==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HRLGB3NYRA5MGHOPTERDWZCHWYU3KQZ2
X-Message-ID-Hash: HRLGB3NYRA5MGHOPTERDWZCHWYU3KQZ2
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:02:19 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRLGB3NYRA5MGHOPTERDWZCHWYU3KQZ2/>
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
stopped by snd_pcm_drop() without any synchronization.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 include/sound/dmaengine_pcm.h         |  1 +
 sound/core/pcm_dmaengine.c            | 10 ++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c |  8 ++++++++
 3 files changed, 19 insertions(+)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index c11aaf8079fb..9c5800e5659f 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -36,6 +36,7 @@ snd_pcm_uframes_t snd_dmaengine_pcm_pointer_no_residue(struct snd_pcm_substream
 int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 	struct dma_chan *chan);
 int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream);
+int snd_dmaengine_pcm_prepare(struct snd_pcm_substream *substream);
 
 int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
 	dma_filter_fn filter_fn, void *filter_data);
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 12aa1cef11a1..dbf5c6136d68 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -349,6 +349,16 @@ int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
 
+int snd_dmaengine_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
+
+	dmaengine_synchronize(prtd->dma_chan);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_prepare);
+
 /**
  * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
  * @substream: PCM substream
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index ea3bc9318412..af439486d33a 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -318,6 +318,12 @@ static int dmaengine_copy(struct snd_soc_component *component,
 	return 0;
 }
 
+int dmaengine_pcm_prepare(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
+{
+	return snd_dmaengine_pcm_prepare(substream);
+}
+
 static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.name		= SND_DMAENGINE_PCM_DRV_NAME,
 	.probe_order	= SND_SOC_COMP_ORDER_LATE,
@@ -327,6 +333,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
 	.pcm_construct	= dmaengine_pcm_new,
+	.prepare	= dmaengine_pcm_prepare,
 };
 
 static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
@@ -339,6 +346,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.pointer	= dmaengine_pcm_pointer,
 	.copy		= dmaengine_copy,
 	.pcm_construct	= dmaengine_pcm_new,
+	.prepare	= dmaengine_pcm_prepare,
 };
 
 static const char * const dmaengine_pcm_dma_channel_names[] = {

-- 
2.43.0

