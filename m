Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB6481402
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 15:22:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A56C17AE;
	Wed, 29 Dec 2021 15:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A56C17AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640787744;
	bh=fZUx3744j8KIelBcjKzfySzCbbKXLfBDCZ5M8eSFqQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqIpnPOJETD8G0C9vxS+oQdC6NB0Kyk6HpytcDthg9kP1fGAlPgu+3IKDaJOmdfpf
	 aFEUB3sFp/R7o3yYwVJlz8gDAPW2p3Xsv8EMlz/GwBaNodF8U0ulhEDUr1/95WahsS
	 Xu2Z7pjA4G5BcrY53avZ0CZVgBM7xLds6X1h6hho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18ABDF80236;
	Wed, 29 Dec 2021 15:20:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1946F80158; Mon, 27 Dec 2021 17:43:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6781F800AB
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 17:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6781F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.b="q+/mpF4H"
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRFfTZq022176; 
 Mon, 27 Dec 2021 16:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OumYKR7x/kmTh36tJozCiGImOdb1vuza0DrcnTPvHyg=;
 b=q+/mpF4HPR2QyEgfOtmhEF/tjUffbfsnVsaBlJSN2r/9k0MECkNYnF9zl3C6Oo5avyOk
 kz25DPa3x4ZvrKwJfQDAxkqYqilBFa8LcRwC/MF2+KCGYjuzAjXvTbebZg12gTKhCa5i
 ctSG5uKRJM7NeD+Ie67ZmlzGcQqMct1Xko4vH/w2udxo/Jf7UKBaWj1NN8+hI5eTeX2N
 yEfqXL6Bt0NM/IJ4aupdOCN5ApX+9uPd94hMV8O2Bwp01gjzYS1UfoTrqAoJ3jgyuMi+
 rt0YKRieYwW05lz46QAbeZACIzwwkad49mHMdseVnSLNiURtwRzqWa73TgRLVeTCwaLn bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gbns17q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:40 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGWLke018109;
 Mon, 27 Dec 2021 16:43:39 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gbns16y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGbh7T001767;
 Mon, 27 Dec 2021 16:43:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3d5tx9as2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRGhYHi44499210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280A0A4064;
 Mon, 27 Dec 2021 16:43:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95B97A405C;
 Mon, 27 Dec 2021 16:43:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:33 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [RFC 09/32] sound: Kconfig: add HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:42:54 +0100
Message-Id: <20211227164317.4146918-10-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FloekVg-uv6CMDPoIQG0AcxlgTivbRcT
X-Proofpoint-GUID: p_95kSAAQrDh_g4HDZ0LOAh4gDCshcjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-Mailman-Approved-At: Wed, 29 Dec 2021 15:20:41 +0100
Cc: linux-arch@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
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

In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
not being declared. We thus need to add HAS_IOPORT as dependency for
those drivers using them.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 sound/drivers/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
index ca4cdf666f82..4b5ba916d93e 100644
--- a/sound/drivers/Kconfig
+++ b/sound/drivers/Kconfig
@@ -128,6 +128,7 @@ config SND_VIRMIDI
 
 config SND_MTPAV
 	tristate "MOTU MidiTimePiece AV multiport MIDI"
+	depends on HAS_IOPORT
 	select SND_RAWMIDI
 	help
 	  To use a MOTU MidiTimePiece AV multiport MIDI adapter
@@ -152,6 +153,7 @@ config SND_MTS64
 
 config SND_SERIAL_U16550
 	tristate "UART16550 serial MIDI driver"
+	depends on HAS_IOPORT
 	select SND_RAWMIDI
 	help
 	  To include support for MIDI serial port interfaces, say Y here
@@ -167,6 +169,7 @@ config SND_SERIAL_U16550
 
 config SND_MPU401
 	tristate "Generic MPU-401 UART driver"
+	depends on HAS_IOPORT
 	select SND_MPU401_UART
 	help
 	  Say Y here to include support for MIDI ports compatible with
-- 
2.32.0

