Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED4347F16
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 18:16:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E5A167E;
	Wed, 24 Mar 2021 18:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E5A167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616606194;
	bh=prd4n3hJYvAyQrBWQcFsLTVrSxI04fm5fPyAnKHJ90U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EEtmMRIlI3OCiTk36XgKQZn823qoqIj8D25/pVwYbiQ2TPtRm/a7oc46ommL2Rk2u
	 vqyGCbosFxmUXug35MWPNZ9YNyXWiS5IR6RfKDcSeysjtppHc9DiWIXNuKI6K9cSvR
	 zYL0A+yT24tSdsXYwttnKIfhlaRfZLXTwPdQYmpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C0FF80240;
	Wed, 24 Mar 2021 18:14:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAAABF801D5; Wed, 24 Mar 2021 18:14:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89C45F8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 18:14:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89C45F8012B
Received: from 1-171-92-165.dynamic-ip.hinet.net ([1.171.92.165]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1lP75J-0002qF-Lu; Wed, 24 Mar 2021 17:14:22 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH 2/2] ALSA: usb-audio: Check connector value on resume
Date: Thu, 25 Mar 2021 01:14:08 +0800
Message-Id: <20210324171410.285848-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324171410.285848-1-kai.heng.feng@canonical.com>
References: <20210324171410.285848-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chris Chiu <chiu@endlessm.com>,
 open list <linux-kernel@vger.kernel.org>, Tom Yan <tom.ty89@gmail.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Joe Perches <joe@perches.com>
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

Rear Mic on Lenovo P620 cannot record after S3, despite that there's no
error and the other two functions of the USB audio, Line In and Line
Out, work just fine.

The mic starts to work again after running userspace app like "alsactl
store". Following the lead, the evidence shows that as soon as connector
status is queried, the mic can work again.

So also check connector value on resume to "wake up" the USB audio to
make it functional.

This can be device specific, however I think this generic approach may
benefit more than one device.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/usb/mixer.c | 18 ++++++++++++++++++
 sound/usb/mixer.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 98f5417a70e4..6a553d891b0f 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3631,11 +3631,28 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 	return 0;
 }
 
+static int resume_connector(struct usb_mixer_elem_list *list)
+{
+	struct usb_mixer_elem_info *cval = mixer_elem_list_to_info(list);
+
+	if (cval->val_type != USB_MIXER_BOOLEAN || cval->channels != 1)
+		return 0;
+
+	return get_connector_value(cval, NULL, NULL);
+}
+
 int snd_usb_mixer_resume(struct usb_mixer_interface *mixer, bool reset_resume)
 {
 	struct usb_mixer_elem_list *list;
 	int id, err;
 
+	for (id = 0; id < MAX_ID_ELEMS; id++) {
+		for_each_mixer_elem(list, mixer, id) {
+			if (list->resume_connector)
+				list->resume_connector(list);
+		}
+	}
+
 	if (reset_resume) {
 		/* restore cached mixer values */
 		for (id = 0; id < MAX_ID_ELEMS; id++) {
@@ -3664,5 +3681,6 @@ void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 	list->dump = snd_usb_mixer_dump_cval;
 #ifdef CONFIG_PM
 	list->resume = restore_mixer_value;
+	list->resume_connector = resume_connector;
 #endif
 }
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index c29e27ac43a7..843ccff0eea3 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -69,6 +69,7 @@ struct usb_mixer_elem_list {
 	bool is_std_info;
 	usb_mixer_elem_dump_func_t dump;
 	usb_mixer_elem_resume_func_t resume;
+	usb_mixer_elem_resume_func_t resume_connector;
 };
 
 /* iterate over mixer element list of the given unit id */
-- 
2.30.2

