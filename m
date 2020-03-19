Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C4518BB7B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 16:47:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E33FD177D;
	Thu, 19 Mar 2020 16:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E33FD177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584632842;
	bh=PFRsJw02diOYPrjHUmNHK6J0wf0Naz27moCuyjyfqKk=;
	h=Subject:From:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NNhGvIARg9doe6XiQjMER2xt4LezxQZ2Pm5X00kU4vMSjg4AtV1nN52RTA6hWEhx9
	 d39FRJmnYwUTHylo7q9wDNIa86GMFaW37KnH1rLG37lSXL3K8L4qVVJNrJZF8jsN2D
	 n7XVC8WOhElNPV7S1RyW+fsfycaLKO2w29K9H2a4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5FF5F8029A;
	Thu, 19 Mar 2020 16:43:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1305AF8022B; Thu, 19 Mar 2020 15:01:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4727BF800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 15:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4727BF800C0
Received: from GeoffPC ([5.151.70.212]) by mrelayeu.kundenserver.de (mreue108
 [213.165.67.115]) with ESMTPSA (Nemesis) id 1MlNl5-1jiS3x06ZR-00lkUp
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 15:00:56 +0100
Message-ID: <a6cd56b678c00ce2db3685e4278919f2584f8244.camel@allott.email>
Subject: [PATCH] ALSA: hda/ca0132 - Add Recon3Di quirk to handle integrated
 sound on EVGA X99 Classified motherboard
From: Geoffrey Allott <geoffrey@allott.email>
To: alsa-devel@alsa-project.org
Date: Thu, 19 Mar 2020 14:00:48 +0000
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dfX90Zw6ZVvBumEQhqODBIwkUkDNPYdiB4OsoIom9y/WgkCrQrh
 +lVYcJTNpfTSX07SFZu5v2j6PYSHp5gWLKNurYCQxjdnj/kqB8y9cNjPYXfb0DA7JsUowhj
 4PviB1eYbhmjkn3soZqTUs3VUWph7sbKQcHBLzhtCwIhK4RFl4NB6Mb0oshGlkf680BLyOT
 Utq3wiFNTGBCLjYPrhnqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dl1OdYo+GoE=:nP/WbliY9oQhH7RZRY0UjD
 jgts7Vnj3f+UuVEdZubyUX9X8hqfZ1KaTDu37fZZeZBN2ERWSZF4qlfEN1qrCqDfrImEH6z7e
 7QEAPOReWKU9vomAmPY27FrD+qYzf5xYkVuumtraURwcxc0g+fXlW28vKnx+IM7pNGopq9W6o
 +nPsR9Vz7/AaHWcKg/aK9Jmq2STI6HcIWmrKHzUR1t2i8O4dCqizeYfkYBTaHLXtE9UApG9WH
 VSsYzVn9p12B/9ko3P7EhyZnTV4oR46Euys9nlSNe+3qGzo6Dzoxa1vgPkVPbsKP6gcGsCtHc
 7sFoWio4XSI52sM46CsXR08/YfQZ+rIF4hG2p1ojA+jsQs4kVsDNNk7SsUM35OAjZ34kD8GFS
 loHEuGilOxpaZNMjjl9v8v9haEb4QlQK4Pr6Uqov4xSN7MxMJwh/vTGoQplJycm1Md/keGUDo
 xNnZkztYynsJfJVfL+SJBiyUEsRM+pvaQfjQ5NdBf6SLqziXdFXPMmqphrNFXHsGounU6nA9f
 SuzxIxlrDar58PddPIEihjO0yXmOTrAeASx9IiAXdHgPL9RHpjAX/oXLRCBZiLA8//kFXJ1C/
 3TvtFt4dqX0flkJ2VltBvVGEPfywLROHVIf+NM9zibhblFj6xM2YJOSWp/hfQUTmngjF5aZIF
 DKF1XdOtDWygRSHdTX37UOb0ZjghPDLSzx9iBgMbgVp9tTa86dnSQV1Rbm/305QuvZJU4tmSH
 x+usCFtQm6hyliiFF64NkJnk2qTwtuQ3duyAaIoQc24eODsGgH9gSSUE1OhwRjEBwsy8Q0DY8
 djVBgquKyG1VI/4P7Tihp7KEGYOU3XJpVBoD/NYabRHo5PN+a6h4Go+GzoW9MScoK7U5VM2
X-Mailman-Approved-At: Thu, 19 Mar 2020 16:43:13 +0100
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

I have a system which has an EVGA X99 Classified motherboard. The pin
assignments for the HD Audio controller are not correct under Linux.
Windows 10 works fine and informs me that it's using the Recon3Di
driver, and on Linux, `cat
/sys/class/sound/card0/device/subsystem_{vendor,device}` yields

0x3842
0x1038

This patch adds a corresponding entry to the quirk list.

Signed-off-by: Geoffrey Allott <geoffrey@allott.email>

---
 sound/pci/hda/patch_ca0132.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_ca0132.c
b/sound/pci/hda/patch_ca0132.c
index ded8bc07d755..10223e080d59 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1180,6 +1180,7 @@ static const struct snd_pci_quirk ca0132_quirks[]
= {
 	SND_PCI_QUIRK(0x1458, 0xA016, "Recon3Di", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x1458, 0xA026, "Gigabyte G1.Sniper Z97",
QUIRK_R3DI),
 	SND_PCI_QUIRK(0x1458, 0xA036, "Gigabyte GA-Z170X-Gaming 7",
QUIRK_R3DI),
+	SND_PCI_QUIRK(0x3842, 0x1038, "EVGA X99 Classified",
QUIRK_R3DI),
 	SND_PCI_QUIRK(0x1102, 0x0013, "Recon3D", QUIRK_R3D),
 	SND_PCI_QUIRK(0x1102, 0x0051, "Sound Blaster AE-5", QUIRK_AE5),
 	{}
-- 
2.25.1


