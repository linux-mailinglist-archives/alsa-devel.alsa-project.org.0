Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314234977E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:01:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A711669;
	Thu, 25 Mar 2021 18:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A711669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616691680;
	bh=HbT7oOQtcw7TZHVbTmgnrevi/YOxCIk7cXg5e1aXQJ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F1Nu9wFdO3K1bt8TDvy0HliHpFQlqeHfE4EFktRj6be6O2d76ETSsMeVw45nshRHk
	 fkrZGP3L4dsKSyhuYFFzPQIV5Jyur8OpYg/Q5C3FgEyLUWZfKb1l/6UlO5+fwmQPdv
	 vUHEsmYrFWJEeprsmZR880P9j+AAdCpC7FNHAK1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04C1BF80104;
	Thu, 25 Mar 2021 17:59:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06C5F8025F; Thu, 25 Mar 2021 17:59:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76359F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 17:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76359F80103
Received: from 1-171-92-165.dynamic-ip.hinet.net ([1.171.92.165]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1lPTKM-0003UD-BU; Thu, 25 Mar 2021 16:59:23 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v3 1/2] ALSA: usb-audio: Carve out connector value checking
 into a helper
Date: Fri, 26 Mar 2021 00:59:12 +0800
Message-Id: <20210325165918.22593-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chris Chiu <chiu@endlessm.com>,
 open list <linux-kernel@vger.kernel.org>, Tom Yan <tom.ty89@gmail.com>,
 Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>
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
v3:
 - No change.
v2:
 - Only return early when ret < 0.

 sound/usb/mixer.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b004b2e63a5d..5a2d9a768f70 100644
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
+	if (ret < 0)
+		return ret;
+
 	ucontrol->value.integer.value[0] = val;
 	return 0;
 }
-- 
2.30.2

