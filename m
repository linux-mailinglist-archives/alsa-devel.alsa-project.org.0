Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D097A0C2B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 20:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2D83A4C;
	Thu, 14 Sep 2023 20:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2D83A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694714690;
	bh=2emOoWhXpt1ayXGDfRzqnYGnz1aaYaOfy+2azcDICqM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hq3iTE0p1CodDoJiJ0+tf+cgi69uMM4NREMobMLWe8uANI0TkcAiz3++Bh7TlYr+3
	 woCysCn2PQMRiEzM/L1UD2e1X4L1PazJuzaZ69LxLofA6OjXGUBqCJiu9Ta4WZ+hNQ
	 nLzG2hn1GL171ElRZKfGvt1D1snpHV3h9VMFcgKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 514EBF80141; Thu, 14 Sep 2023 20:03:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C951F80141;
	Thu, 14 Sep 2023 20:03:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37FCAF80425; Wed, 13 Sep 2023 07:33:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9496FF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 07:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9496FF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ya.ru header.i=@ya.ru header.a=rsa-sha256 header.s=mail
 header.b=FAdJJjkM
Received: from mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:440b:0:640:fa3a:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTP id 2C24E60031;
	Wed, 13 Sep 2023 08:33:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id hXX1UA6DUGk0-5KRTeYJK;
	Wed, 13 Sep 2023 08:33:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
	t=1694583225; bh=sB2ZQ7DHWeq2GnlLubNW3gqh2dptT89YWo7Pu1Ab5Pg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=FAdJJjkMCOJfN98f6Bcm3hbOA1whkXEhiTT1agCQsOUL97bZaoaz4de2Osh8sg14p
	 /wkPH67sIa8FA2llz+YKmFoVzfi1zYyKhdpSC1C5ryTe2AA2vSY5cGjMRdzjcKhmmk
	 K6lNyQu7XLuYL6yNEO/VeCYVtINtKDI1jxUipPe8=
Authentication-Results: 
 mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net;
 dkim=pass header.i=@ya.ru
From: poseaydone@ya.ru
To: Jaroslav Kysela <perex@perex.cz>
Cc: Knyazev Arseniy <poseaydone@ya.ru>,
	Takashi Iwai <tiwai@suse.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Andy Chi <andy.chi@canonical.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Matthew Anderson <ruinairas1992@gmail.com>,
	Luka Guzenko <l.guzenko@web.de>,
	Yuchi Yang <yangyuchi66@gmail.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] patch_realtek: Splitting the UX3402 into two separate models.
Date: Wed, 13 Sep 2023 10:33:43 +0500
Message-ID: <20230913053343.119798-1-poseaydone@ya.ru>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: poseaydone@ya.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LKEXSZF2CV24N4C3KFF5T4CUIJKBTCA6
X-Message-ID-Hash: LKEXSZF2CV24N4C3KFF5T4CUIJKBTCA6
X-Mailman-Approved-At: Thu, 14 Sep 2023 18:03:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKEXSZF2CV24N4C3KFF5T4CUIJKBTCA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Knyazev Arseniy <poseaydone@ya.ru>

UX3402VA and UX3402ZA models require different hex values, so comibining
them into one model is incorrect.

Signed-off-by: Knyazev Arseniy <poseaydone@ya.ru>
---
 sound/pci/hda/patch_realtek.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b7e78bfcffd8..b002f947b0d2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9812,7 +9812,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1d1f, "ASUS ROG Strix G17 2023 (G713PV)", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1d4e, "ASUS TM420", ALC256_FIXUP_ASUS_HPE),
-	SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402ZA", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x16a3, "ASUS UX3402VA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
 	SND_PCI_QUIRK(0x1043, 0x1e12, "ASUS UM3402", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1e51, "ASUS Zephyrus M15", ALC294_FIXUP_ASUS_GU502_PINS),
-- 
2.42.0

