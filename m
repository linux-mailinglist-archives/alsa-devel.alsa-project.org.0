Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9E6CB893
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 09:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ABDF1F4;
	Tue, 28 Mar 2023 09:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ABDF1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679989704;
	bh=91BEZCx/CttGwv3gt8ks42cJAa/Q+c/II/0o/XRayVM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c4QmbQgxbRzoXnoDQtyv7/ZhsHJbI7UzcH9fKoDEgMCIABKzw2RZe0JnYeVMRaNcY
	 BEBPhNsUXTbrFK5S8AE4r/p7B5+k/fo8nr4VM/oX0mx4qCNtrO225ELtnkARxf6V0G
	 veGZn9NgdE5+E8aRVcHw/Z+DUgaoa0QkV/VJRHSw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3EECF8024E;
	Tue, 28 Mar 2023 09:47:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EF25F80272; Tue, 28 Mar 2023 09:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtpbg156.qq.com (smtpbg156.qq.com [15.184.82.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E2F5F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 09:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E2F5F80114
X-QQ-mid: bizesmtp63t1679989626tk9po50m
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with
	id ; Tue, 28 Mar 2023 15:47:05 +0800 (CST)
X-QQ-SSF: 01400000002000C0U000B00A0000000
X-QQ-FEAT: TLc+rbMvNaE+nE3SnZ+3+7es3kKdIQBtKVQX21T6pNfaatXG4vTua8qg1dTZX
	K/P7NUDGKVVASzpQJ5/HcjUuyJ1VOI+1xI+wbND0fARl0Q2DbYVCWxGc9F6Au+rffDiZ0h/
	6imfCFSjCGpRqXhd9z7XZJ3Ov+WtTG6vq0O2W7z6MwAz/R3gGhHk3ocVgC0uiAOZPzhZOq9
	JWgZ1ZAI9Nt8Fq2TGwHh8xv/l4X8BCkzo06zJOoKBP2p3BV9uiR1m1wYc0FNd4ysNAn+j46
	+GgPEbfqYZ6IJLusGSLOsHzQ9Ml0TalleSE930rHywEVYQ8rg+B00rtQXHkvTpkj4sn5sY5
	5oC7tVxu1lb54tquG4fjqHQ/G8WX+uDCj60ewNWWnGZlrBhBzEiegWj3JsDUQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 6170109501948158026
From: huangwenhui <huangwenhuia@uniontech.com>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo ZhaoYang CF4620Z
Date: Tue, 28 Mar 2023 15:46:44 +0800
Message-Id: <20230328074644.30142-1-huangwenhuia@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr6
Message-ID-Hash: DOY3ONAGXVJ2AE7NAO7NWS7DUPYOAGJC
X-Message-ID-Hash: DOY3ONAGXVJ2AE7NAO7NWS7DUPYOAGJC
X-MailFrom: huangwenhuia@uniontech.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: jeremy.szu@canonical.com, hui.wang@canonical.com, wse@tuxedocomputers.com,
 cam@neo-zeon.de, kailang@realtek.com, tanureal@opensource.cirrus.com,
 sami@loone.fi, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 huangwenhui <huangwenhuia@uniontech.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOY3ONAGXVJ2AE7NAO7NWS7DUPYOAGJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix headset microphone detection on Lenovo ZhaoYang CF4620Z.

Signed-off-by: huangwenhui <huangwenhuia@uniontech.com>
Change-Id: I89d3f4d1d18193418f74d0095b0e4daaf24c839f
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e8b7f6bbfc59..a8810231a5b5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7137,6 +7137,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
+	SND_PCI_QUIRK(0x17aa, 0x9e56, "Lenovo ZhaoYang CF4620Z", ALC286_FIXUP_SONY_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MBXP", ALC256_FIXUP_HUAWEI_MBXP_PINS),
 	SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
-- 
2.20.1

