Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C612A729D3F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2029574C;
	Fri,  9 Jun 2023 16:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2029574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322125;
	bh=kZPaklLY0Epo4Ly9aR8VhYI2wkVwXiltDaxcQIoitIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XCK5x5rH7mjYgoOZ0PJOILDUw363fpW2lP6NW9ZSCbMbp4SkimFWJKCkwypo8AIZC
	 1HUaErawpsqQfYZb5zOJt1DYdObIr0N1nP7/gM/EHGUSGP6HXIHcKYdCnIuSWTBta7
	 Z7rQdRmZ4QfMr2V7nZwFV27XnbmNXwqNVwwf2+s0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49086F80557; Fri,  9 Jun 2023 16:47:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7502AF8016C;
	Fri,  9 Jun 2023 16:47:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32356F80494; Wed,  7 Jun 2023 11:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ECF4F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ECF4F800C8
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Cxe+o5TIBkWRcAAA--.329S3;
	Wed, 07 Jun 2023 17:22:01 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxNeQ2TIBkvzcEAA--.14996S5;
	Wed, 07 Jun 2023 17:22:00 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH RESEND v3 3/4] ALSA: hda: Workaround for SDnCTL register on
 loongson
Date: Wed,  7 Jun 2023 17:21:51 +0800
Message-Id: 
 <27aeddf5ebbe7c69631cec0e489c1b264be94990.1686128807.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686128807.git.siyanteng@loongson.cn>
References: <cover.1686128807.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxNeQ2TIBkvzcEAA--.14996S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJry8uFy3Kw1fCrW8uw1ktFc_yoW8ZF1fpr
	4kCay8KFZrtF40kF4DKa4UKF1UG3WxGFnxCrW0k348Ar4vvr1FqwnrtF48ZFy5GrW5Wrya
	9a45t34rX345XwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzKZXUUUUU
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YSINLJWAMHKJ5ZYPIZL6SD37D4BJHRL4
X-Message-ID-Hash: YSINLJWAMHKJ5ZYPIZL6SD37D4BJHRL4
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:46:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
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
 include/sound/hdaudio.h   | 1 +
 sound/hda/hdac_stream.c   | 6 +++++-
 sound/pci/hda/hda_intel.c | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index a0bb40a4b721..94efbbeaa531 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -348,6 +348,7 @@ struct hdac_bus {
 	bool polling_mode:1;
 	bool needs_damn_long_delay:1;
 	bool not_use_interrupts:1;	/* prohibiting the RIRB IRQ */
+	bool access_sdnctl_in_dword:1;	/* accessing the sdnctl register by dword */
 
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
index b7a7a92d03ef..fc4787c7782a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1878,6 +1878,7 @@ static int azx_first_init(struct azx *chip)
 	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
 		bus->polling_mode = 1;
 		bus->not_use_interrupts = 1;
+		bus->access_sdnctl_in_dword = 1;
 	}
 
 	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
-- 
2.31.4

