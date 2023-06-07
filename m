Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB7725A0B
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3F66843;
	Wed,  7 Jun 2023 11:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3F66843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686129696;
	bh=D7p9poFEYTcRvJGFR3yI/k8yHWzOaeaiGW0v0YtdOe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dXXlxFn8rcInERZndp9Un5h4NH/qKlh1QMtYdlHM3s38NlMaiDMGGbt8ceQ/tkv9s
	 8khxOn2S8eKf22/oex6VdV868b5Uz93tePuEaphYDo8Og8xgiohxqBIIBQzAXyEdxs
	 RTv3mpGzyeydyycSTol9MF7g8YB5XCyNKAnxbaGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01220F805BD; Wed,  7 Jun 2023 11:18:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08FC1F805C1;
	Wed,  7 Jun 2023 11:18:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65A87F80290; Wed,  7 Jun 2023 10:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 0391CF800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 10:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0391CF800C8
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8DxCeoKRYBkrBQAAA--.310S3;
	Wed, 07 Jun 2023 16:51:22 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXMoGRYBkGikEAA--.6577S5;
	Wed, 07 Jun 2023 16:51:22 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 3/4] ALSA: hda: Workaround for SDnCTL register on loongson
Date: Wed,  7 Jun 2023 16:51:04 +0800
Message-Id: 
 <c33ab5d06000749d8578fd57b5cbf3b29819a587.1686125797.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686125797.git.siyanteng@loongson.cn>
References: <cover.1686125797.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXMoGRYBkGikEAA--.6577S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJry8uFy3Kw1fCr43XF4xuFX_yoW8ZF4rpr
	4kCa4rKFZrtF40kF4DK34UKF1UG3Z7GFn8CrW0k348Ar4vvr1Fq3srtr48ZFy5GrW5Wry3
	ua45t34rX345XwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 57TF2PSQZT2B3U2NI2KQYRNYIJO4XBQ7
X-Message-ID-Hash: 57TF2PSQZT2B3U2NI2KQYRNYIJO4XBQ7
X-Mailman-Approved-At: Wed, 07 Jun 2023 09:18:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57TF2PSQZT2B3U2NI2KQYRNYIJO4XBQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On loongson controller, after calling snd_hdac_stream_updateb()
to enable DMA engine, the SDnCTL.STRM will become to zero.  We
need to access SDnCTL in dword to keep SDnCTL.STRM is not changed.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Yingkun Meng <mengyingkun@loongson.cn>
---
 include/sound/hdaudio.h   | 2 ++
 sound/hda/hdac_stream.c   | 6 +++++-
 sound/pci/hda/hda_intel.c | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 8d34d932956d..0484b149060d 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -348,6 +348,8 @@ struct hdac_bus {
 	bool polling_mode:1;
 	bool needs_damn_long_delay:1;
 	bool not_using_interrupts:1;	/* prohibiting the RIRB IRQ */
+	/* Accessing the sdnctl register by dword */
+	bool access_sdnctl_in_dword:1;
 
 	int poll_count;
 
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 1f56fd33b9af..2633a4bb1d85 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -150,7 +150,11 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev)
 					stripe_ctl);
 	}
 	/* set DMA start and interrupt mask */
-	snd_hdac_stream_updateb(azx_dev, SD_CTL,
+	if (bus->access_sdnctl_in_dword)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL,
+				0, SD_CTL_DMA_START | SD_INT_MASK);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL,
 				0, SD_CTL_DMA_START | SD_INT_MASK);
 	azx_dev->running = true;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 2173a94a3315..a1e3883b00a4 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1878,6 +1878,7 @@ static int azx_first_init(struct azx *chip)
 	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
 		bus->polling_mode = 1;
 		bus->not_using_interrupts = 1;
+		bus->access_sdnctl_in_dword = 1;
 	}
 
 	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
-- 
2.31.4

