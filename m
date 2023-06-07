Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9692B725A17
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2518A6C0;
	Wed,  7 Jun 2023 11:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2518A6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686129723;
	bh=7yqZhJ0v+BpvRMEE0LYL4fW3LNnUQorgP84ld0cBEA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q6kjWbjSppEjNxjqnHQTiVwNS6CF9ISOEaCVCl8rXERfNyblmIMxfju80ZURFOHnc
	 mA0qrollfwOMRRw7puunbMGw490tcxdCl7MKQPwDvZVH7ytUibEpanmflSKMsy2ioF
	 qNBGPrjbITOrnh8nbkGTLKa3S+7vU6ThQdnTEtrI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 165E9F805E3; Wed,  7 Jun 2023 11:19:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C71F805D6;
	Wed,  7 Jun 2023 11:19:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31835F80254; Wed,  7 Jun 2023 10:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id B7045F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 10:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7045F80155
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Bxb+sKRYBkpRQAAA--.362S3;
	Wed, 07 Jun 2023 16:51:22 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXMoGRYBkGikEAA--.6577S4;
	Wed, 07 Jun 2023 16:51:21 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: tiwai@suse.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH v3 2/4] ALSA: hda: Using polling mode for loongson controller
 by default
Date: Wed,  7 Jun 2023 16:51:03 +0800
Message-Id: 
 <830ae0b32e67f1964d78bca44d06c07bdf68aa43.1686125797.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1686125797.git.siyanteng@loongson.cn>
References: <cover.1686125797.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXMoGRYBkGikEAA--.6577S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWkuF1UCr1fGw1xXF4DJrc_yoW8tFW8pF
	97C348KFW7Gw1Yyr4DKa4UKr13Xan3GF13GrW8C348Arn2vw1fW39FyF40yFWjkrWIgry3
	X3ykta48JayYqwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8gAw7UUUUU==
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TIFSWG3CJ2VY5LP5YZ4AFFLFWJFK3QEV
X-Message-ID-Hash: TIFSWG3CJ2VY5LP5YZ4AFFLFWJFK3QEV
X-Mailman-Approved-At: Wed, 07 Jun 2023 09:18:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIFSWG3CJ2VY5LP5YZ4AFFLFWJFK3QEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On loongson controller, RIRBSTS.RINTFL cannot be cleared,
azx_interrupt() is called all the time. We disable RIRB
interrupt, and use polling mode by default.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 include/sound/hdaudio.h     | 1 +
 sound/hda/hdac_controller.c | 5 ++++-
 sound/pci/hda/hda_intel.c   | 5 +++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 97f09acae302..8d34d932956d 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -347,6 +347,7 @@ struct hdac_bus {
 	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
 	bool polling_mode:1;
 	bool needs_damn_long_delay:1;
+	bool not_using_interrupts:1;	/* prohibiting the RIRB IRQ */
 
 	int poll_count;
 
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 3c7af6558249..26fdf24886f8 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -79,7 +79,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	/* set N=1, get RIRB response interrupt for new entry */
 	snd_hdac_chip_writew(bus, RINTCNT, 1);
 	/* enable rirb dma and response irq */
-	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
+	if (bus->not_using_interrupts)
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
+	else
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 	spin_unlock_irq(&bus->reg_lock);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9c353dc7740c..2173a94a3315 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1875,6 +1875,11 @@ static int azx_first_init(struct azx *chip)
 	if (chip->driver_type == AZX_DRIVER_GFHDMI)
 		bus->polling_mode = 1;
 
+	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
+		bus->polling_mode = 1;
+		bus->not_using_interrupts = 1;
+	}
+
 	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
 	if (err < 0)
 		return err;
-- 
2.31.4

