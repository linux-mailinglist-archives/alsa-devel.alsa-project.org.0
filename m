Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DBB2E7F90
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:04:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927E616F0;
	Thu, 31 Dec 2020 12:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927E616F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609412694;
	bh=6n+G5imY5NOpIGRR6k66vIskcgQ94nu/Ya5L2SXUFMY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sQNJO5EuARBXBxNcvxPutdCtGMbJu91PpEFskI71sAbA2A4CS2FtIrzIFRU18AeiK
	 DAUZ5fAhZWWnQhEEs5AAsR/z/gkF+wEdAtXos1Zx659+tx+0NNvlRFno6ZgtdpFDEu
	 O6vNw1MunvpbhoDwGgsr4AgZw8E6CDnpR6/WGLnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0AFAF804D8;
	Thu, 31 Dec 2020 12:01:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 634F6F8022B; Tue, 29 Dec 2020 15:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from st43p00im-zteg10073501.me.com (st43p00im-zteg10073501.me.com
 [17.58.63.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3797BF80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 15:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3797BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="Oj/2yHcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1609252742; bh=u8vNBKkJBeENQUWHNcyHxDvh/UkfG24ft3OMmx23qEc=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=Oj/2yHclIjzJpO0410d80N/sS2kJ3CKdRl4j5ZGTKK2JnlRivQWuhTX2Lt7zsvtHL
 zHXCdlwS3I6BmNtGVeYZowdBT9Oc6tIDX0Kf88YyniReTVJ+UL492ofeefdGPf2eTe
 dLmR479mThZfwvBYMoJ3wDqX08iNJYTUjk6t3kRtnpxzvKuKaFWI2MCAlBuXFEBRcP
 eMhA/KACBC7c31T24Zgu6pUNyaQ6W+gNMuK7RId+3FmgXhaJxg30SaVs2ERzu+6TFz
 AvcIVwyb1Na7tef7QAlkyfwPCQjTa8xTZot1iVqDh2Arm4nM9FEHRUgSZVPYoepqOa
 RQ7HdxigYS+wQ==
Received: from HP-Pavilion-13 (static-168-222-226-77.ipcom.comunitel.net
 [77.226.222.168])
 by st43p00im-zteg10073501.me.com (Postfix) with ESMTPSA id 36AEDAE088F;
 Tue, 29 Dec 2020 14:39:00 +0000 (UTC)
Date: Tue, 29 Dec 2020 15:38:56 +0100
From: Manuel =?iso-8859-1?Q?Jim=E9nez?= <mjbfm99@me.com>
To: tiwai@suse.com, kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for more HP laptops
Message-ID: <X+s/gKNydVrI6nLj@HP-Pavilion-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-29_11:2020-12-28,
 2020-12-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=773 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2012290093
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:01:39 +0100
Cc: mjbfm99@me.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

HP Pavilion 13-bb0000 (SSID 103c:87c8) needs the same
quirk as other models with ALC287.

Signed-off-by: Manuel Jiménez <mjbfm99@me.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dde5ba209541..b77cef72c2d5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7964,6 +7964,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8760, "HP", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x877d, "HP", ALC236_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
-- 
2.29.2

