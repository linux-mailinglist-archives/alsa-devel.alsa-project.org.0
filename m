Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FD3AB628
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:39:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41995172F;
	Thu, 17 Jun 2021 16:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41995172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940769;
	bh=wR0zsm5XZBSx1gzuFPkAWcBDw1QgFtRQcuAbRbKCGLc=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MayG1tce+YXt8LXkooETPtiCYXsLaC15ZPsmTYm3Ljd+hVChU08IhPgHNAMixWBsa
	 hg2BUhmG2p8/5993RLajsem75VBT07q9/aF+7bqeCNu5ZKfDzGERSrTVQojbxWR9sA
	 9FNbh3yg1GI/+Jw4ZDPxP80hrUjVQ/18+tNGQSiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13259F804FF;
	Thu, 17 Jun 2021 16:34:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68EC2F80423; Wed, 16 Jun 2021 11:49:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62125F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 11:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62125F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="gwcAi80e"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210616094915epoutp0297131ec21148250244951d507f310cff~JBxt1R2CH2960029600epoutp02e
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 09:49:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210616094915epoutp0297131ec21148250244951d507f310cff~JBxt1R2CH2960029600epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623836955;
 bh=InoYbTqSTzJL0k7/VDUViR0EokAGZGmL8Den3Cd50hU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=gwcAi80eppQ9a3BzC31PvCfIaL07xl7R1eNtRXLgnHYrXnJmXLE2C8aiZ4b3z3HKW
 cYIEz7neOwp4EMrXN9AswMt7I4A9P412QiCaudiqg4BrulTTPW8nvBgu2mlYcCIf48
 yFlx9W8E951RHVX4b7UScg0AgUtxUBrBIEdOHVjY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20210616094914epcas2p17aac116fa16cc76b4d01c94e4ccee7e8~JBxtbvKuq2085820858epcas2p1z;
 Wed, 16 Jun 2021 09:49:14 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.187]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4G4gPh61BBz4x9Q0; Wed, 16 Jun
 2021 09:49:12 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 CF.0C.09604.819C9C06; Wed, 16 Jun 2021 18:49:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20210616094912epcas2p38028df32b89b7cc79ba16c0215f8f664~JBxrPyOOa1694316943epcas2p3m;
 Wed, 16 Jun 2021 09:49:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210616094912epsmtrp13d6d60a40b2aec747e4f611bf7a9f82b~JBxrPH8_e1175011750epsmtrp1V;
 Wed, 16 Jun 2021 09:49:12 +0000 (GMT)
X-AuditID: b6c32a45-db3ff70000002584-12-60c9c91860d6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EE.F6.08637.819C9C06; Wed, 16 Jun 2021 18:49:12 +0900 (KST)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.36.155.120]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210616094912epsmtip16089c6878fe9a1082cbf507d29f2dade~JBxrC6JHF3056130561epsmtip1Z;
 Wed, 16 Jun 2021 09:49:12 +0000 (GMT)
From: Daehwan Jung <dh10.jung@samsung.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: ALSA: usb-audio: fix rate on Ozone Z90 USB headset
Date: Wed, 16 Jun 2021 18:34:55 +0900
Message-Id: <1623836097-61918-1-git-send-email-dh10.jung@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7bCmma7EyZMJBuse61tcuXiIyeLOgmlM
 Fs2L17NZNN3oYbW4vGsOm8Wu/3eZLDp39bNabPi+ltGBw2PD5yY2j52z7rJ7bFrVyeaxf+4a
 do99b5exefRtWcXosX7LVRaPz5vkAjiicmwyUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
 LS3MlRTyEnNTbZVcfAJ03TJzgE5TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BQY
 GhboFSfmFpfmpesl5+daGRoYGJkCVSbkZOw5dZux4Al7xfJHR5gaGDvYuhg5OSQETCSuHNzH
 3MXIxSEksINR4vfPKVDOJ0aJcze2MEI43xgllkydB9TCAdYyfz0TRHwvo8SenbPZIZwfjBL3
 Pv1hByliE9CS+L6QEWSFiICzxMS978AamAWeMEqcv9QMtltYwFrix5YJYDaLgKrE7fmbmUBs
 XgFXiZlXb7JD3CcncfNcJ9hJEgLn2CXmHbrDBJFwkdjV8wTKFpZ4dXwLVIOUxMv+NnaIS8sl
 Fs23g+jtYJRY8+ksI0SNscSsZ+2MIDXMApoS63fpQ5QrSxy5xQJSwSzAJ9Fx+C/UFF6JjjYh
 iEZliemXJ7BC2JISB1+fY4awPST+nFoHZgsJxEpcnNPDMoFRdhbC/AWMjKsYxVILinPTU4uN
 CgyR42gTIzi1abnuYJz89oPeIUYmDsZDjBIczEoivLrFJxKEeFMSK6tSi/Lji0pzUosPMZoC
 g2sis5Rocj4wueaVxBuaGpmZGViaWpiaGVkoifNysB9KEBJITyxJzU5NLUgtgulj4uCUamDy
 z9b/zisafLom0DP4i3X8zLiQJ7+THZpO2JpVS3OlO3H1+3Zlz/13Luzf7SaRQJX8zVqfld2T
 Nbfbbrrcc/lxdCTLy+cd34WOPc+f/vPaTPW1R24r72g+In9lwdx1+bdVMhY+ufxn2kqzwpn2
 4jVL02+eVDxjM3dh3/ufx60sn17pmuLncWQeC+vVD4aci07x7H946Wf/5qJDvR3Wl6e9vnnD
 xvK0ekJJVabDszmaL2QPWyu+e/brTfOpNsN1kxtkPgb6njzmnOx3MmzGguIUW+f7e63lNx59
 PC/+6vxzE2cqxEl3/DF0WJeWPq9/Z//T7MJ90i9ese9LKPflbtF9Fs8u/lDUU1Bt78v+xyGP
 lFiKMxINtZiLihMBWehk5vYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprILMWRmVeSWpSXmKPExsWy7bCSnK7EyZMJBg/XC1lcuXiIyeLOgmlM
 Fs2L17NZNN3oYbW4vGsOm8Wu/3eZLDp39bNabPi+ltGBw2PD5yY2j52z7rJ7bFrVyeaxf+4a
 do99b5exefRtWcXosX7LVRaPz5vkAjiiuGxSUnMyy1KL9O0SuDL2nLrNWPCEvWL5oyNMDYwd
 bF2MHBwSAiYS89czdTFycggJ7GaUOHxaBsSWEJCUWDr3BjuELSxxv+UIaxcjF1DNN0aJn+tX
 MoH0sgloSXxfyAhSIyLgKnH13m1GkBpmgReMEn+vHmIBSQgLWEv82DKBDcRmEVCVuD1/M9gy
 XqCGmVdvQi2Qk7h5rpN5AiPPAkaGVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwaGm
 pbmDcfuqD3qHGJk4GA8xSnAwK4nw6hafSBDiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQ
 QHpiSWp2ampBahFMlomDU6qBqb3h+J4fSoLZHHlq1rMs/i/Rfihl6TglXmaZyWXpve/ENqwM
 C8vrnnh37ZXS7DrPCQLTtnpo3IgwnLr6s+y2jeX24XL1klv2tvywcVpUbNdv/6ioJrqu+E2z
 hUulwaa735yfaxfkveTY7dbv41ecvKJ618ETkUIxtYJrt3jlqCYbzu7Z1nDk+3WJx4Kdzxme
 Rm/ReGI0veVQ8c36DIaTX/2Y+FfPLrrm8+RTgySPcffCfq7Ntw6ULAj6c23f3ZwDb6oTypeZ
 Z0apsHj8yJ+nLXNZ6nJ9SK7y2tdHq8psTs+5fXvXni1u4Vf77ii3mPza4B29Tjxn16WJE6Q2
 nfXgUWq50DGrVEJhw7LAq2sklFiKMxINtZiLihMBvJHyXqQCAAA=
X-CMS-MailID: 20210616094912epcas2p38028df32b89b7cc79ba16c0215f8f664
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210616094912epcas2p38028df32b89b7cc79ba16c0215f8f664
References: <CGME20210616094912epcas2p38028df32b89b7cc79ba16c0215f8f664@epcas2p3.samsung.com>
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:46 +0200
Cc: Lukasz Halman <lukasz.halman@gmail.com>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Daehwan Jung <dh10.jung@samsung.com>
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

It mislabels its 96 kHz altsetting and that's why it causes some noise

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
---
 sound/usb/format.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 2287f8c..eb216fe 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -223,9 +223,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 				continue;
 			/* C-Media CM6501 mislabels its 96 kHz altsetting */
 			/* Terratec Aureon 7.1 USB C-Media 6206, too */
+			/* Ozone Z90 USB C-Media, too */
 			if (rate == 48000 && nr_rates == 1 &&
 			    (chip->usb_id == USB_ID(0x0d8c, 0x0201) ||
 			     chip->usb_id == USB_ID(0x0d8c, 0x0102) ||
+			     chip->usb_id == USB_ID(0x0d8c, 0x0078) ||
 			     chip->usb_id == USB_ID(0x0ccd, 0x00b1)) &&
 			    fp->altsetting == 5 && fp->maxpacksize == 392)
 				rate = 96000;
-- 
2.7.4

