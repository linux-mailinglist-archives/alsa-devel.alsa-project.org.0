Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED996AEB8C5
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A96B601D5;
	Fri, 27 Jun 2025 15:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A96B601D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030591;
	bh=mGfdFbhfI+Pnn4crkrnlT+qDY+DyTPa3VFRA2Zf2mvc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eSg1Da0OnE7Sh6aNkubG8F8GM86FsI5A6TvTXimO8j+NahjLXuc71IIo1eB4TaX6l
	 cpYa148bykyPVcow5HmME6F/cXobH7FHWBUAKeUTlto5u12YIdjw8eC3D/Nmm4ZCni
	 +RbHdTX+KbqBpsMmIEqCspgSzZ1ODZw4FkI5NWw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D135EF805B6; Fri, 27 Jun 2025 15:22:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2827F805C7;
	Fri, 27 Jun 2025 15:22:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 009B9F8021D; Thu, 19 Jun 2025 09:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A966F800C1
	for <alsa-devel@alsa-project.org>; Thu, 19 Jun 2025 09:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A966F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=HtxkfpH8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ge
	3/1dKmjOlli2sCo/IoWSdyQdAy14557ORsoDHz+LE=; b=HtxkfpH8k1iIB82ztg
	tNvThswZWG27I8lbt9xo2KM6s1z1X5e4wBqtIAvJR7KDQ0z5Y9WbvAYeb8+E5joh
	jDvdlCvDyO8x8uzq5PyL3MOwwNVu080jLwkWZ/s/kboy9LmoOM3dMMQ6UKFCHcwl
	YizXFvdqfmAmslfn4H0n51WZE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHUY2buVNow9j6AA--.3773S2;
	Thu, 19 Jun 2025 15:17:48 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
Date: Thu, 19 Jun 2025 15:17:45 +0800
Message-Id: <20250619071745.149299-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDHUY2buVNow9j6AA--.3773S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur1UuF1rZr48Zry5AF4ruFg_yoWxtwc_Cr
	Z5Xr48uayUJ3Wq9rnxAF9YyrW8t39xXayagFyxtF45Xay3Ga4rZFW8JFn0yFyxK3yfWFyx
	JrWqgw4YgryjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUj-ntUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiMBVxT2hTs0e1KgAAsL
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 32TY5XS5Y5JWIKOKOV6LT2BBT7UFBSWW
X-Message-ID-Hash: 32TY5XS5Y5JWIKOKOV6LT2BBT7UFBSWW
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:22:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32TY5XS5Y5JWIKOKOV6LT2BBT7UFBSWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba7320e..2a08115d8c17 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1088,6 +1088,7 @@ static const struct alc_codec_rename_pci_table rename_pci_tbl[] = {
 	{ 0x10ec0668, 0x103c, 0, "ALC3662" },
 	{ 0x10ec0283, 0x17aa, 0, "ALC3239" },
 	{ 0x10ec0292, 0x17aa, 0, "ALC3232" },
+	{ 0x10ec0257, 0x12f0, 0, "ALC3328" },
 	{ } /* terminator */
 };
 
-- 
2.25.1

