Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50D6CD0A8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 05:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 039C11F0;
	Wed, 29 Mar 2023 05:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 039C11F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680060580;
	bh=it6Sksw65RKDnSZBQ0wtjAfqmUD5txZuskikpFuqJIc=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=BDiPM90sPepCGzeeU8FPgRvUgEEkkmqO0hnKbq0HvB1XQPYJOZrfH7Oi+KqAnzO0g
	 8dJ+BK4nPnVwXxk8i6DRC2gJqb81iFhAqVYkRPD8rt5OeMiW/e/jawKGiwdd2Ab6fm
	 KbQxuUXY19Oo3tw0f6GBuWb1mpg8nH8B057cYJGk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E1B7F8024E;
	Wed, 29 Mar 2023 05:28:49 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Fix BUG_ON in probe function
Date: Wed, 29 Mar 2023 06:28:08 +0300
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYQXFSJ47UGFHP6PT5GMXLYETDPESVZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006052754.26.7162462641185461365@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E41F80272; Wed, 29 Mar 2023 05:28:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from devnull.tasossah.com (devnull.tasossah.com
 [IPv6:2001:41d0:1:e60e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94227F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 05:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94227F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=KX//ukem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cgSGmzGeV7Uadp4jZzkMSsnfM/ie5SYTK0lU06jc1kY=; b=KX//ukem+SMqFTI5duMmHclAFD
	vLZT3nU3I6KgSach7EnVaNTC6OwAgh3mBHG5iaIdaf8wQYm+4mvwjTuhA6YWltiAiWcXZ1x9ivKVP
	4Mje1cWCZ1UuoaYqhd/Ibteu08WvInnsGx+KuxSZATUNko1m1Kfzvr5+LDNVKggS8nO8=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phMU9-00GuFZ-Jp; Wed, 29 Mar 2023 06:28:29 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Fix BUG_ON in probe function
Date: Wed, 29 Mar 2023 06:28:08 +0300
Message-Id: <20230329032808.170403-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FYQXFSJ47UGFHP6PT5GMXLYETDPESVZW
X-Message-ID-Hash: FYQXFSJ47UGFHP6PT5GMXLYETDPESVZW
X-MailFrom: tasos@tasossah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, tasos@tasossah.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYQXFSJ47UGFHP6PT5GMXLYETDPESVZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The snd_dma_buffer.bytes field now contains the aligned size, which this
snd_BUG_ON() did not account for, resulting in the following:

[    9.625915] ------------[ cut here ]------------
[    9.633440] WARNING: CPU: 0 PID: 126 at sound/pci/ymfpci/ymfpci_main.c:2168 snd_ymfpci_create+0x681/0x698 [snd_ymfpci]
[    9.648926] Modules linked in: snd_ymfpci(+) snd_intel_dspcfg kvm(+) snd_intel_sdw_acpi snd_ac97_codec snd_mpu401_uart snd_opl3_lib irqbypass snd_hda_codec gameport snd_rawmidi crct10dif_pclmul crc32_pclmul cfg80211 snd_hda_core polyval_clmulni polyval_generic gf128mul snd_seq_device ghash_clmulni_intel snd_hwdep ac97_bus sha512_ssse3 rfkill snd_pcm aesni_intel tg3 snd_timer crypto_simd snd mxm_wmi libphy cryptd k10temp fam15h_power pcspkr soundcore sp5100_tco wmi acpi_cpufreq mac_hid dm_multipath sg loop fuse dm_mod bpf_preload ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 sr_mod cdrom ata_generic pata_acpi firewire_ohci crc32c_intel firewire_core xhci_pci crc_itu_t pata_via xhci_pci_renesas floppy
[    9.711849] CPU: 0 PID: 126 Comm: kworker/0:2 Not tainted 6.1.21-1-lts #1 08d2e5ece03136efa7c6aeea9a9c40916b1bd8da
[    9.722200] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./990FX Extreme4, BIOS P2.70 06/05/2014
[    9.732204] Workqueue: events work_for_cpu_fn
[    9.736580] RIP: 0010:snd_ymfpci_create+0x681/0x698 [snd_ymfpci]
[    9.742594] Code: 8c c0 4c 89 e2 48 89 df 48 c7 c6 92 c6 8c c0 e8 15 d0 e9 ff 48 83 c4 08 44 89 e8 5b 5d 41 5c 41 5d 41 5e 41 5f e9 d3 7a 33 e3 <0f> 0b e9 cb fd ff ff 41 bd fb ff ff ff eb db 41 bd f4 ff ff ff eb
[    9.761358] RSP: 0018:ffffab64804e7da0 EFLAGS: 00010287
[    9.766594] RAX: ffff8fa2df06c400 RBX: ffff8fa3073a8000 RCX: ffff8fa303fbc4a8
[    9.773734] RDX: ffff8fa2df06d000 RSI: 0000000000000010 RDI: 0000000000000020
[    9.780876] RBP: ffff8fa300b5d0d0 R08: ffff8fa3073a8e50 R09: 00000000df06bf00
[    9.788018] R10: ffff8fa2df06bf00 R11: 00000000df068200 R12: ffff8fa3073a8918
[    9.795159] R13: 0000000000000000 R14: 0000000000000080 R15: ffff8fa2df068200
[    9.802317] FS:  0000000000000000(0000) GS:ffff8fa9fec00000(0000) knlGS:0000000000000000
[    9.810414] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.816158] CR2: 000055febaf66500 CR3: 0000000101a2e000 CR4: 00000000000406f0
[    9.823301] Call Trace:
[    9.825747]  <TASK>
[    9.827889]  snd_card_ymfpci_probe+0x194/0x950 [snd_ymfpci b78a5fe64b5663a6390a909c67808567e3e73615]
[    9.837030]  ? finish_task_switch.isra.0+0x90/0x2d0
[    9.841918]  local_pci_probe+0x45/0x80
[    9.845680]  work_for_cpu_fn+0x1a/0x30
[    9.849431]  process_one_work+0x1c7/0x380
[    9.853464]  worker_thread+0x1af/0x390
[    9.857225]  ? rescuer_thread+0x3b0/0x3b0
[    9.861254]  kthread+0xde/0x110
[    9.864414]  ? kthread_complete_and_exit+0x20/0x20
[    9.869210]  ret_from_fork+0x22/0x30
[    9.872792]  </TASK>
[    9.874985] ---[ end trace 0000000000000000 ]---

Fixes: 5c1733e33c88 ("ALSA: memalloc: Align buffer allocations in page size")
Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 2858736ed..912ab0b21 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2160,7 +2160,7 @@ static int snd_ymfpci_memalloc(struct snd_ymfpci *chip)
 	chip->work_base = ptr;
 	chip->work_base_addr = ptr_addr;
 	
-	snd_BUG_ON(ptr + chip->work_size !=
+	snd_BUG_ON(ptr + PAGE_ALIGN(chip->work_size) !=
 		   chip->work_ptr->area + chip->work_ptr->bytes);
 
 	snd_ymfpci_writel(chip, YDSXGR_PLAYCTRLBASE, chip->bank_base_playback_addr);
-- 
2.25.1

