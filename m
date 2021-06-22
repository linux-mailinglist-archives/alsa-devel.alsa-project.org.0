Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104163B0B1C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:07:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D4DF1664;
	Tue, 22 Jun 2021 19:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D4DF1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381662;
	bh=PggDVsK4dUhBzKbIp3aGFGqgVY0EVV6PXY0XT6a8mSc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9IA4fAsneAOB4TBU+ZJE6eR+qv0et3vMsoMp7nMWUAO8SAc4HF1ATtaBTyzg73gi
	 /MYItFJVaHoXMalLEGWEFuZfDyfZSQrq6BPSaRkrY0cvmzSdWrBMOByX6ZvpY/UGmi
	 2ZckjVZylJ9NDZx1PARxMzwMRpFPsfIPT59MoLDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 573F5F8051D;
	Tue, 22 Jun 2021 19:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2722CF8051D; Tue, 22 Jun 2021 19:03:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA0CCF804E4
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA0CCF804E4
Received: by m.b4.vu (Postfix, from userid 1000)
 id 37C7561E286E; Wed, 23 Jun 2021 02:33:50 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:33:50 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 14/17] ALSA: usb-audio: scarlett2: Update mux controls to
 allow updates
Message-ID: <5ce3bb9fe4006b550d18c783c5ff640fe0bfbfcb.1624379707.git.g@b4.vu>
References: <cover.1624379707.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624379707.git.g@b4.vu>
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
index b3e1cb943c3c..279196feb811 100644
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
 
@@ -2799,7 +2802,8 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
 					  struct snd_ctl_elem_value *ucontrol)
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
-	struct scarlett2_data *private = elem->head.mixer->private_data;
+	struct usb_mixer_interface *mixer = elem->head.mixer;
+	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int line_out_count =
@@ -2809,7 +2813,12 @@ static int scarlett2_mux_src_enum_ctl_get(struct snd_kcontrol *kctl,
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

