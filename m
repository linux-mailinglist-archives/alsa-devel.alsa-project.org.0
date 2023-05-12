Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF86170064D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 13:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EBA34E;
	Fri, 12 May 2023 13:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EBA34E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683889572;
	bh=Za4TafcYO0eOwrIprOEnQXgOqmb2GF9FLIDs/ojkZfY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FY0pMS0KogARmzuJqYtSj3wYj11FBU9/ZCBkwuNqjlBfZVYBZEJ6ZNBhFijNqTbdu
	 yU96Qi6yw9xQracioy0xRrKWTEexZQo+wkN1TaDUcwPJyjFC0tdztArzLkddIYB+cG
	 COjL9eTbq3+XcrlNTusuqbIYwpRJSh3/B/tC/gZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0BA0F8053D; Fri, 12 May 2023 13:05:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC95F8032D;
	Fri, 12 May 2023 13:05:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39274F8052E; Fri, 12 May 2023 13:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73C51F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 13:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C51F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=XB4yAN8Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=je7OqgOL46KxF9Wo57Ey82fR0zCQ62vb6w2+JBpFCoE=;
	t=1683889509;x=1683979509;
	b=XB4yAN8QSc2wWNtUEekdZSFihFo/CnJORZX8lUsGo7xqcEPexNtseZvIYck6EFQB60reSTUFUkDjx+em5lH0gdJc4wzIyNn6yEX24jtodryTf1XASQ2mIOwFKlK5KIzrZSERnAeP+IvUdbXigmmlHG0u8eP/p4gMTDgrTnhfrtpF38EAY4VlO49OWwbrHLA88qFZxIsQEJnlD3eb5FDA+BNaTWwg4e+1jPl5sezLiPzM5LkOl2pkPmX/lhrVCuGs9tw7V60MDc6syIThH24+skTNQo49oLMDLIwKs6sjDfq0do/Nb8MtSa+oa0kufmuu6z13Grf3WAazNlVyYalONg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1pxQaA-0000vR-93; Fri, 12 May 2023 14:05:06 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: 
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: dwc: move DMA init to snd_soc_dai_driver probe()
Date: Fri, 12 May 2023 14:03:42 +0300
Message-Id: <20230512110343.66664-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD92B2351A05AA37E8C85389922DA3DCC4DFF6E0EBA22BA430F00894C459B0CD1B96B068799970385446EB9552DF85FD1FB5C7A327EC81F0306E14ECCED8CD6B7DB
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E108D7A8C2ED8B17EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063721BEEAF38C6AE0B78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F1713DF00F5F97EBD6C36E123C53B2516F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A0F7C24A37A3D769FA2833FD35BB23D9E625A9149C048EE7B96B19DC4093321F04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B8C81B5738AFAA7AFA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6753C3A5E0A5AB5B7089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 
 0D63561A33F958A5EA76ED56A3D6937BF29CD2188F4765E52FCC6C3587AF6618F87CCE6106E1FC07E67D4AC08A07B9B01DAA61796BF5227B9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFD49B4D8FA2E583AA1F5B1FBC4B3A2FDF85A0C546F9F8EE4635B862EC01D5B355896E83BF38A960117FE5FAEF3080607C30454A151624EEB43D874FE5347755A6E346BF9FA413E5543082AE146A756F3
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj/wax08AvnvMDuqXPyvrFMA==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF5A480032B55C7882B05A62088049E684198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: OR4J6G4DKSBX63S2KU6VHKXSKTMIPLVC
X-Message-ID-Hash: OR4J6G4DKSBX63S2KU6VHKXSKTMIPLVC
X-MailFrom: fido_max@inbox.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OR4J6G4DKSBX63S2KU6VHKXSKTMIPLVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When using DMA mode we are facing with Oops:
[  396.458157] Unable to handle kernel access to user memory without uaccess routines at virtual address 000000000000000c
[  396.469374] Oops [#1]
[  396.471839] Modules linked in:
[  396.475144] CPU: 0 PID: 114 Comm: arecord Not tainted 6.0.0-00164-g9a8eccdaf2be-dirty #68
[  396.483619] Hardware name: YMP ELCT FPGA (DT)
[  396.488156] epc : dmaengine_pcm_open+0x1d2/0x342
[  396.493227]  ra : dmaengine_pcm_open+0x1d2/0x342
[  396.498140] epc : ffffffff807fe346 ra : ffffffff807fe346 sp : ffffffc804e138f0
[  396.505602]  gp : ffffffff817bf730 tp : ffffffd8042c8ac0 t0 : 6500000000000000
[  396.513045]  t1 : 0000000000000064 t2 : 656e69676e65616d s0 : ffffffc804e13990
[  396.520477]  s1 : ffffffd801b86a18 a0 : 0000000000000026 a1 : ffffffff816920f8
[  396.527897]  a2 : 0000000000000010 a3 : fffffffffffffffe a4 : 0000000000000000
[  396.535319]  a5 : 0000000000000000 a6 : ffffffd801b87040 a7 : 0000000000000038
[  396.542740]  s2 : ffffffd801b94a00 s3 : 0000000000000000 s4 : ffffffd80427f5e8
[  396.550153]  s5 : ffffffd80427f5e8 s6 : ffffffd801b44410 s7 : fffffffffffffff5
[  396.557569]  s8 : 0000000000000800 s9 : 0000000000000001 s10: ffffffff8066d254
[  396.564978]  s11: ffffffd8059cf768 t3 : ffffffff817d5577 t4 : ffffffff817d5577
[  396.572391]  t5 : ffffffff817d5578 t6 : ffffffc804e136e8
[  396.577876] status: 0000000200000120 badaddr: 000000000000000c cause: 000000000000000d
[  396.586007] [<ffffffff806839f4>] snd_soc_component_open+0x1a/0x68
[  396.592439] [<ffffffff807fdd62>] __soc_pcm_open+0xf0/0x502
[  396.598217] [<ffffffff80685d86>] soc_pcm_open+0x2e/0x4e
[  396.603741] [<ffffffff8066cea4>] snd_pcm_open_substream+0x442/0x68e
[  396.610313] [<ffffffff8066d1ea>] snd_pcm_open+0xfa/0x212
[  396.615868] [<ffffffff8066d39c>] snd_pcm_capture_open+0x3a/0x60
[  396.622048] [<ffffffff8065b35a>] snd_open+0xa8/0x17a
[  396.627421] [<ffffffff801ae036>] chrdev_open+0xa0/0x218
[  396.632893] [<ffffffff801a5a28>] do_dentry_open+0x17c/0x2a6
[  396.638713] [<ffffffff801a6d9a>] vfs_open+0x1e/0x26
[  396.643850] [<ffffffff801b8544>] path_openat+0x96e/0xc96
[  396.649518] [<ffffffff801b9390>] do_filp_open+0x7c/0xf6
[  396.655034] [<ffffffff801a6ff2>] do_sys_openat2+0x8a/0x11e
[  396.660765] [<ffffffff801a735a>] sys_openat+0x50/0x7c
[  396.666068] [<ffffffff80003aca>] ret_from_syscall+0x0/0x2
[  396.674964] ---[ end trace 0000000000000000 ]---

It happens because of play_dma_data/capture_dma_data pointers are NULL.
Current implementation assigns these pointers at snd_soc_dai_driver
startup() callback and reset them back to NULL at shutdown(). But
soc_pcm_open() sequence uses DMA pointers in dmaengine_pcm_open()
before snd_soc_dai_driver startup().
Most generic DMA capable I2S drivers use snd_soc_dai_driver probe()
callback to init DMA pointers only once at probe. So move DMA init
to dw_i2s_dai_probe and drop shutdown() and startup() callbacks.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 41 +++++++++--------------------------------
 1 file changed, 9 insertions(+), 32 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index dd5d8d77bdc9..9e7065dd854c 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -184,30 +184,6 @@ static void i2s_stop(struct dw_i2s_dev *dev,
 	}
 }
 
-static int dw_i2s_startup(struct snd_pcm_substream *substream,
-		struct snd_soc_dai *cpu_dai)
-{
-	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
-	union dw_i2s_snd_dma_data *dma_data = NULL;
-
-	if (!(dev->capability & DWC_I2S_RECORD) &&
-			(substream->stream == SNDRV_PCM_STREAM_CAPTURE))
-		return -EINVAL;
-
-	if (!(dev->capability & DWC_I2S_PLAY) &&
-			(substream->stream == SNDRV_PCM_STREAM_PLAYBACK))
-		return -EINVAL;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dma_data = &dev->play_dma_data;
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-		dma_data = &dev->capture_dma_data;
-
-	snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)dma_data);
-
-	return 0;
-}
-
 static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
 {
 	u32 ch_reg;
@@ -306,12 +282,6 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static void dw_i2s_shutdown(struct snd_pcm_substream *substream,
-		struct snd_soc_dai *dai)
-{
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
-}
-
 static int dw_i2s_prepare(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
@@ -383,8 +353,6 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 }
 
 static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
-	.startup	= dw_i2s_startup,
-	.shutdown	= dw_i2s_shutdown,
 	.hw_params	= dw_i2s_hw_params,
 	.prepare	= dw_i2s_prepare,
 	.trigger	= dw_i2s_trigger,
@@ -626,6 +594,14 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 
 }
 
+static int dw_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &dev->play_dma_data, &dev->capture_dma_data);
+	return 0;
+}
+
 static int dw_i2s_probe(struct platform_device *pdev)
 {
 	const struct i2s_platform_data *pdata = pdev->dev.platform_data;
@@ -644,6 +620,7 @@ static int dw_i2s_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dw_i2s_dai->ops = &dw_i2s_dai_ops;
+	dw_i2s_dai->probe = dw_i2s_dai_probe;
 
 	dev->i2s_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dev->i2s_base))
-- 
2.39.2

