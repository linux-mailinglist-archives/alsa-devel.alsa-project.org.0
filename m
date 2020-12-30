Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F982E7803
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 12:23:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6750D1708;
	Wed, 30 Dec 2020 12:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6750D1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609327435;
	bh=6n+G5imY5NOpIGRR6k66vIskcgQ94nu/Ya5L2SXUFMY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYdLkSXKOJWgEjRBMmBc/QPY1v4AKBkd7ggLE2RvqaZZ/FIhTA5pvRXjsUTvWYKiI
	 KHIkMRpR7L6gVKCkY7z6k+y6namH2zEMHMiadtomPb2n+S2fRmvUiExOmvJITVIPSo
	 ABF5OPoL3jGSKT9GVRfO9B3P8B4BqUhlRmoh5DTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD588F80132;
	Wed, 30 Dec 2020 12:22:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66BA7F801F5; Wed, 30 Dec 2020 12:22:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from st43p00im-zteg10063501.me.com (st43p00im-zteg10063501.me.com
 [17.58.63.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 408AFF80141
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 12:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 408AFF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="CzIz4Cd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1609327332; bh=u8vNBKkJBeENQUWHNcyHxDvh/UkfG24ft3OMmx23qEc=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=CzIz4Cd6SH1UJ4zvIiLNnHT930hV/hJtBL6VakiHYy+iACTYZVsTRHEy0vSrfPQcU
 tS5Qc4wFsAOEl5GRnqGrstvP4Yk53KKTNgZ/+37GnDKEV2V3hYDBR+p0SdyQaDmZHR
 XYtl8nx2qY1RjXioXab4JxN8ckx2sLnnDFkJuSi9NHSFUE9iIiLuufrcPWoaWZHEba
 f8Gigd0nBPUK5oNwuxI8hRsfU8fR4/bI66svxRHC7ZmmaVXPt7ggRBmb4Bk7FxEOD8
 9CPdylcm0A3SD/rW+ZNtBXk2eXWkxx2G9eOmEfUlZxuKhHSue3RM9wWGlrQgBx03X4
 GpAKQlfO8Kbpg==
Received: from HP-Pavilion-13 (static-168-222-226-77.ipcom.comunitel.net
 [77.226.222.168])
 by st43p00im-zteg10063501.me.com (Postfix) with ESMTPSA id B1FF9C80846
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 11:22:11 +0000 (UTC)
Date: Wed, 30 Dec 2020 12:22:07 +0100
From: Manuel =?iso-8859-1?Q?Jim=E9nez?= <mjbfm99@me.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for more HP laptops
Message-ID: <X+xi36k5pxo4NDcD@HP-Pavilion-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-30_06:2020-12-30,
 2020-12-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=613 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2012300070
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

