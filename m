Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007D586F1B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39CF1620;
	Mon,  1 Aug 2022 18:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39CF1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373146;
	bh=qRve12a+z13PtRHdSIb5MeWO1AydoJzCJ5gB8ec8GZg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oevcUjtJgIOI0QUlp1o0Ckt1u4pbVqg1+LUb9Uls+1/qcV7tl+wlzqPp0pvSUaETe
	 T8F9B2OFtAM1IAKgCM97PVz23Rd9MQ5s4QURgA1mCxLFaW1c3W+IWhhVc2lNAzMAOa
	 376BQAE3iu1CkHGvFrQL6QDlQ9dW9D/axvGcIr9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F1CF80564;
	Mon,  1 Aug 2022 18:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B51FF8054A; Mon,  1 Aug 2022 18:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1181FF802DB
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1181FF802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="SkHaj1gi"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="50HwP7n/"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA78B2067B;
 Mon,  1 Aug 2022 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=toBsslfWCJJPflnUPbfZxL81dQGX6k4XqJBtdCj+KWk=;
 b=SkHaj1giv8XEdpdpioeVK2pYE9vrHoXbITJRgvdo1CuzRmAal8a10zITiTT3x99mqKWbfw
 TtJGG6EjYs8lK/EgdSBEk69oZeo46h/3hVn12iygHFjxs06RfDP7S5skV4L1O+hc2TS9Kl
 YllcN/MLaojc11lILyyx7paCPdoqnQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=toBsslfWCJJPflnUPbfZxL81dQGX6k4XqJBtdCj+KWk=;
 b=50HwP7n/Zma5GbBZ+wdl9bQycZSlY565dtx7ioaFViQxOHkNYuKnKaZJI9HOE+dvJP+6Zw
 0CtjZA3pCmgrjeCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1ACD13AAE;
 Mon,  1 Aug 2022 16:56:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ODYxKcsF6GLXGgAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:56:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ALSA: line6: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 18:56:39 +0200
Message-Id: <20220801165639.26030-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801165639.26030-1-tiwai@suse.de>
References: <20220801165639.26030-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For sysfs outputs, it's safer to use a new helper, sysfs_emit(),
instead of the raw sprintf() & co.  This patch replaces those usages
straightforwardly with a new helper, sysfs_emit().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/pod.c   | 8 ++++----
 sound/usb/line6/podhd.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index 16e644330c4d..cd41aa7f0385 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -235,7 +235,7 @@ static ssize_t serial_number_show(struct device *dev,
 	struct snd_card *card = dev_to_snd_card(dev);
 	struct usb_line6_pod *pod = card->private_data;
 
-	return sprintf(buf, "%u\n", pod->serial_number);
+	return sysfs_emit(buf, "%u\n", pod->serial_number);
 }
 
 /*
@@ -247,8 +247,8 @@ static ssize_t firmware_version_show(struct device *dev,
 	struct snd_card *card = dev_to_snd_card(dev);
 	struct usb_line6_pod *pod = card->private_data;
 
-	return sprintf(buf, "%d.%02d\n", pod->firmware_version / 100,
-		       pod->firmware_version % 100);
+	return sysfs_emit(buf, "%d.%02d\n", pod->firmware_version / 100,
+			  pod->firmware_version % 100);
 }
 
 /*
@@ -260,7 +260,7 @@ static ssize_t device_id_show(struct device *dev,
 	struct snd_card *card = dev_to_snd_card(dev);
 	struct usb_line6_pod *pod = card->private_data;
 
-	return sprintf(buf, "%d\n", pod->device_id);
+	return sysfs_emit(buf, "%d\n", pod->device_id);
 }
 
 /*
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index b24bc82f89e3..ffd8c157a281 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -146,7 +146,7 @@ static ssize_t serial_number_show(struct device *dev,
 	struct snd_card *card = dev_to_snd_card(dev);
 	struct usb_line6_podhd *pod = card->private_data;
 
-	return sprintf(buf, "%u\n", pod->serial_number);
+	return sysfs_emit(buf, "%u\n", pod->serial_number);
 }
 
 static ssize_t firmware_version_show(struct device *dev,
@@ -155,7 +155,7 @@ static ssize_t firmware_version_show(struct device *dev,
 	struct snd_card *card = dev_to_snd_card(dev);
 	struct usb_line6_podhd *pod = card->private_data;
 
-	return sprintf(buf, "%06x\n", pod->firmware_version);
+	return sysfs_emit(buf, "%06x\n", pod->firmware_version);
 }
 
 static DEVICE_ATTR_RO(firmware_version);
-- 
2.35.3

