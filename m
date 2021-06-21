Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5B3AF4E6
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0357175E;
	Mon, 21 Jun 2021 20:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0357175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299681;
	bh=wpRxZMuofkDNnw4WeDCTuEGnPy9h5qWxJ39QtcmvWb4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gzuNhAe7nuIpIazYWCr23ewJlmPemapsHhc3bpMrCbG5Dvy4wTQGpILeYtpmdl4mz
	 YlUfOvltzyD5puEDfgDoN64jR/6DFjGXtxBR+yeGWMwP7VXR3VlCSlBcQfKCH81VQN
	 K+0yQ1LUQIWfas24UR3YxyrVYlEcqvw9prW0QyqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE412F805E4;
	Mon, 21 Jun 2021 20:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74C15F805C9; Mon, 21 Jun 2021 20:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B08BEF8057D
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B08BEF8057D
Received: by m.b4.vu (Postfix, from userid 1000)
 id 37B8061E2871; Tue, 22 Jun 2021 03:40:10 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:40:10 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 28/31] ALSA: usb-audio: scarlett2: Update mux controls to
 allow updates
Message-ID: <3aaee481c6aeb5e9005d56fc94b0079ba094c00e.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Enabling/disabling speaker switching will update the mux
configuration. To prepare for this, add a private->mux_updated flag
and update the scarlett2_mux_src_enum_ctl_get() callback to check it.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index efa65bdb48c8..dce40d2e0ba6 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -378,6 +378,7 @@ struct scarlett2_data {
 	u8 vol_updated;
 	u8 input_other_updated;
 	u8 monitor_other_updated;
+	u8 mux_updated;
 	u8 sync;
 	u8 master_vol;
 	u8 vol[SCARLETT2_ANALOGUE_MAX];
@@ -1446,6 +1447,8 @@ static int scarlett2_usb_get_mux(struct usb_mixer_interface *mixer)
 
 	__le32 data[SCARLETT2_MUX_MAX];
 
+	private->mux_updated = 0;
+
 	req.num = 0;
 	req.count = cpu_to_le16(count);
 
@@ -2794,7 +2797,8 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 					  struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int line_out_count =
@@ -2804,7 +2808,12 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 	if (index < line_out_count)
 		index = line_out_remap(private, index);
 
+	mutex_lock(&private->data_mutex);
+	if (private->mux_updated)
+		scarlett2_usb_get_mux(mixer);
 	ucontrol->value.enumerated.item[0] = private->mux[index];
+	mutex_unlock(&private->data_mutex);
+
 	return 0;
 }
 
-- 
2.31.1

