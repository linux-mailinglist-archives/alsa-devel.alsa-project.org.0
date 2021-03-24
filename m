Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D54347F15
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 18:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D57E1655;
	Wed, 24 Mar 2021 18:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D57E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616606177;
	bh=Smv1/2B7jaAEm9r6AUsFlIPgkB5uQKB59jUujCAkoJ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aVUBk8hetzOcEKg9JKGlwNzKWUg6myGzWhBilrWCB7wtHJs9ZAER5grsBppyhcqij
	 U00ce9L/UufcE0ttVdY5hvaROs7WsaazboVLzEsr9iBuQcktLN+rB0MqZ1EwCiJJb9
	 GT5iJhvv56GIgv1RtGv839W4Ytp5YumAOtmP5KMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49606F801EB;
	Wed, 24 Mar 2021 18:14:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39E40F8016B; Wed, 24 Mar 2021 18:14:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8466DF80156
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 18:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8466DF80156
Received: from 1-171-92-165.dynamic-ip.hinet.net ([1.171.92.165]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1lP75D-0002q7-UY; Wed, 24 Mar 2021 17:14:16 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH 1/2] ALSA: usb-audio: Carve out connector value checking into
 a helper
Date: Thu, 25 Mar 2021 01:14:07 +0800
Message-Id: <20210324171410.285848-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chris Chiu <chiu@endlessm.com>,
 open list <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Joe Perches <joe@perches.com>, Tom Yan <tom.ty89@gmail.com>
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

This is preparation for next patch, no functional change intended.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/usb/mixer.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b004b2e63a5d..98f5417a70e4 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1446,13 +1446,11 @@ static int mixer_ctl_master_bool_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/* get the connectors status and report it as boolean type */
-static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
+static int get_connector_value(struct usb_mixer_elem_info *cval,
+			       char *name, int *val)
 {
-	struct usb_mixer_elem_info *cval = kcontrol->private_data;
 	struct snd_usb_audio *chip = cval->head.mixer->chip;
-	int idx = 0, validx, ret, val;
+	int idx = 0, validx, ret;
 
 	validx = cval->control << 8 | 0;
 
@@ -1467,21 +1465,24 @@ static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
 		ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), UAC2_CS_CUR,
 				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 				      validx, idx, &uac2_conn, sizeof(uac2_conn));
-		val = !!uac2_conn.bNrChannels;
+		if (val)
+			*val = !!uac2_conn.bNrChannels;
 	} else { /* UAC_VERSION_3 */
 		struct uac3_insertion_ctl_blk uac3_conn;
 
 		ret = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0), UAC2_CS_CUR,
 				      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 				      validx, idx, &uac3_conn, sizeof(uac3_conn));
-		val = !!uac3_conn.bmConInserted;
+		if (val)
+			*val = !!uac3_conn.bmConInserted;
 	}
 
 	snd_usb_unlock_shutdown(chip);
 
 	if (ret < 0) {
-		if (strstr(kcontrol->id.name, "Speaker")) {
-			ucontrol->value.integer.value[0] = 1;
+		if (name && strstr(name, "Speaker")) {
+			if (val)
+				*val = 1;
 			return 0;
 		}
 error:
@@ -1491,6 +1492,21 @@ static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
 		return filter_error(cval, ret);
 	}
 
+	return ret;
+}
+
+/* get the connectors status and report it as boolean type */
+static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *cval = kcontrol->private_data;
+	int ret, val;
+
+	ret = get_connector_value(cval, kcontrol->id.name, &val);
+
+	if (ret)
+		return ret;
+
 	ucontrol->value.integer.value[0] = val;
 	return 0;
 }
-- 
2.30.2

