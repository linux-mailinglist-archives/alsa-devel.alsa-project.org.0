Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7747F6CD0CA
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 05:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49BBC1F1;
	Wed, 29 Mar 2023 05:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49BBC1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680061439;
	bh=Z9MLbxN1y1FYQ3fpZDPrND5+9oADOQYOYfQSKEM29rQ=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=Fx4wjnKU9nB0YFm1OariPhiScw90pY8uOnfJAp0k6/CIycWHvfpx/D/1vPxZXT7/a
	 hzx9zioHRZ22sahwAFFpSMNNn9rfA0bbRqRrfJJT3+8hbrN0oPSDOorlEIfssPE4/g
	 DmPzfcCmbmgTOSiUGlhfWAyH5FQlsAyNrEnS2DdQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8211CF8024E;
	Wed, 29 Mar 2023 05:43:08 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Add error messages for abritrary IO ports on
 older chips
Date: Wed, 29 Mar 2023 06:42:04 +0300
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006138739.26.16436862701500259301@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C330DF80272; Wed, 29 Mar 2023 05:43:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C0903F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 05:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0903F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=vfoak8xs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ziq/jGWpLC/n6alqejFSgr4MJv2Xynwp34TQ3DqonPM=; b=vfoak8xsSsZ3QS6pkQKMjwkGnM
	KqYuUVDS9SlQnIrWhAoKKdo9kjuoqhlHO0hmjGl+neHo9SwvqS4gN6CXt9hRBpjoU9dEhd/IWx72n
	6jcAwrl+2+qxTSqzkPWERHfs3uRTz8qUdeQc+S2hy8x0WuTi9XrFM5eVgFL8ZCSULauE=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phMi4-00GuNu-7k; Wed, 29 Mar 2023 06:42:52 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Add error messages for abritrary IO ports on
 older chips
Date: Wed, 29 Mar 2023 06:42:04 +0300
Message-Id: <20230329034204.171901-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A4U22ORSTTKVL4JSK63V3VVBHCAAHGV4
X-Message-ID-Hash: A4U22ORSTTKVL4JSK63V3VVBHCAAHGV4
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As an end user, it can be confusing to request an arbitrary IO port be
used only to find out that it doesn't work without an obvious reason,
especially since /sys/module/snd_ymfpci/parameters/{fm,joystick,mpu}_port
indicate 0 after the module has been loaded.

In my case, I was unaware that the YMF724 did not support such usage, and
thus ended up spending time attempting to debug the issue.

Now, when a user attempts to request an IO port that isn't supported by
the hardware, the following message is printed:

[   25.549530] snd_ymfpci 0000:06:05.0: The Yamaha DS-1 (YMF724F) does not support arbitrary IO ports for FM (requested 0x1234)

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index 1e198e4d5..de5dc5337 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -98,8 +98,10 @@ static int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev,
 		case 0x204: legacy_ctrl2 |= 2 << 6; break;
 		case 0x205: legacy_ctrl2 |= 3 << 6; break;
 		default:
-			dev_err(chip->card->dev,
-				"invalid joystick port %#x", io_port);
+			if (io_port > 0)
+				dev_err(chip->card->dev,
+					"The %s does not support arbitrary IO ports for the game port (requested 0x%x)\n",
+					chip->card->shortname, (unsigned int)io_port);
 			return -EINVAL;
 		}
 	}
@@ -186,6 +188,13 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 	default: model = str = "???"; break;
 	}
 
+	strcpy(card->driver, str);
+	sprintf(card->shortname, "Yamaha %s (%s)", model, str);
+	sprintf(card->longname, "%s at 0x%lx, irq %i",
+		card->shortname,
+		chip->reg_area_phys,
+		chip->irq);
+
 	legacy_ctrl = 0;
 	legacy_ctrl2 = 0x0800;	/* SBEN = 0, SMOD = 01, LAD = 0 */
 
@@ -218,7 +227,13 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		case 0x398: legacy_ctrl2 |= 1; break;
 		case 0x3a0: legacy_ctrl2 |= 2; break;
 		case 0x3a8: legacy_ctrl2 |= 3; break;
-		default: fm_port[dev] = 0; break;
+		default:
+			if (fm_port[dev] > 0)
+				dev_err(card->dev,
+					"The %s does not support arbitrary IO ports for FM (requested 0x%x)\n",
+					card->shortname, (unsigned int)fm_port[dev]);
+			fm_port[dev] = 0;
+			break;
 		}
 		if (fm_port[dev] > 0)
 			fm_res = devm_request_region(&pci->dev, fm_port[dev],
@@ -234,7 +249,13 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 		case 0x300: legacy_ctrl2 |= 1 << 4; break;
 		case 0x332: legacy_ctrl2 |= 2 << 4; break;
 		case 0x334: legacy_ctrl2 |= 3 << 4; break;
-		default: mpu_port[dev] = 0; break;
+		default:
+			if (mpu_port[dev] > 0)
+				dev_err(card->dev,
+					"The %s does not support arbitrary IO ports for MPU-401 (requested 0x%x)\n",
+					card->shortname, (unsigned int)mpu_port[dev]);
+			mpu_port[dev] = 0;
+			break;
 		}
 		if (mpu_port[dev] > 0)
 			mpu_res = devm_request_region(&pci->dev, mpu_port[dev],
@@ -257,12 +278,6 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 	if (err  < 0)
 		return err;
 
-	strcpy(card->driver, str);
-	sprintf(card->shortname, "Yamaha %s (%s)", model, str);
-	sprintf(card->longname, "%s at 0x%lx, irq %i",
-		card->shortname,
-		chip->reg_area_phys,
-		chip->irq);
 	err = snd_ymfpci_pcm(chip, 0);
 	if (err < 0)
 		return err;
-- 
2.25.1

