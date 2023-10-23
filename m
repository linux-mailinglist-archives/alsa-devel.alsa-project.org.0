Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A37D398D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA4DDEF;
	Mon, 23 Oct 2023 16:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA4DDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698072027;
	bh=rRGb3W2U1oYUXZPgENfGyeH8loz1AESxLnhvCIBMazk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OvgSb9ru8RDs78LVqcaeGOkQWwdr5I1JK6+VbQ/k6p8lLOFIRjvlW537TTT0R1qt/
	 Z04QZmnkisKKqqUFewpyCliuGTrveAk7RlYfxaBqoFU5WIkNZ3085jU9vqgwTkwKYZ
	 Dj23YTHvMWG4l50AL4z19q38z8ItZFmm3y1W2iSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA3D6F8055B; Mon, 23 Oct 2023 16:39:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA279F80536;
	Mon, 23 Oct 2023 16:39:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C790F80616; Mon, 23 Oct 2023 11:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AE11F80601
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AE11F80601
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=lelYArMj
X-UUID: 4157680e718a11eea33bb35ae8d461a2-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Qmbr2w5tujfuurOZRA3SRLMQeRjiZeSosCGmD3RvDX0=;
	b=lelYArMj6Z8CYRXKqWwADfGZFFDv+nvM/JZBlhCGHlOy+uCCvI6nkZIL07jJwtkmqIjo5uL2zDB7gTt8Zd2Yp4+B3BB+9r1sIBmmCI/R18oOd0o19Wgtf+E6m7QE1j1ZpdEqkPndQy3CevCr9mGTOK9v9vt7jXdccUvhM3n1B+U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:958110a5-7c95-4c0f-908d-d7c4d33ebd1e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:ee12a9fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4157680e718a11eea33bb35ae8d461a2-20231023
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1612167485; Mon, 23 Oct 2023 17:55:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 17:55:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 17:55:07 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 0/2] ASoC: mediatek: Remove redundant code and add sample rate
 checker of MT7986 SoC
Date: Mon, 23 Oct 2023 17:54:51 +0800
Message-ID: <20231023095453.4860-1-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.888400-8.000000
X-TMASE-MatchedRID: 1cUIhvZrMEAyRohotsnq51z+axQLnAVBojQrbrPpzzptJv7x/D93bILy
	KdE2c/PXKi8kfHJWoY+gVbxI8zQaQh8TzIzimOwP0C1sQRfQzEHEQdG7H66TyN+E/XGDLHcM5H4
	ky09s9NKNLGOuO04vodSYd3t+km3SiC7Dlcya3aYyzYzUVqX0RXmVKZusLp922v9OjYWA2uMMsw
	g45VMfPadst5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.888400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 
	5C758EFB01D13D8E60F6A8BE080B9F24FB0F074251EB3EF620CBB287C29401A22000:8
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VZHOPQEVUCWYPEO23VRK7KTFP2YCEJA7
X-Message-ID-Hash: VZHOPQEVUCWYPEO23VRK7KTFP2YCEJA7
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:39:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZHOPQEVUCWYPEO23VRK7KTFP2YCEJA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

1. Remove redundant remove function.
2. Add sample rate checker.
Patches are based on broonie tree "for-next" branch.

Maso Huang (2):
  ASoC: mediatek: mt7986: remove redundant remove function
  ASoC: mediatek: mt7986: add sample rate checker

 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 22 +++++++++--
 sound/soc/mediatek/mt7986/mt7986-wm8960.c   | 43 ++++++---------------
 2 files changed, 30 insertions(+), 35 deletions(-)

-- 
2.18.0

