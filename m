Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F63C2FC8
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0CF1706;
	Sat, 10 Jul 2021 04:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0CF1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884346;
	bh=nMSZoav4agHLXnYG/VNUjwfYIqAo8oXevKEPMS4VySs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+dr0+0stBA0+pJ0IGPViro6ksmmNyzqHYuZxOtQP5qAYfR/pRxmvVjjnIygRFx6u
	 Tu94g7XuCKe6qBeRnN2F2uCxziGL1+DKuE2Jp/u2NSDaiZZfrSmLDk3sCZVnrojgGa
	 Vpy1cmYN07q6SbpLDVBm2VYy6xzzCM/AOVj96n9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B4C5F805AA;
	Sat, 10 Jul 2021 04:24:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3EC9F805A0; Sat, 10 Jul 2021 04:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06079F8053C
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06079F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q0J3QzKH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D8B3613E1;
 Sat, 10 Jul 2021 02:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883840;
 bh=nMSZoav4agHLXnYG/VNUjwfYIqAo8oXevKEPMS4VySs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q0J3QzKHihS4PVzG1FJb47JQtKF/NOi7qQzea6D6ivI0x7sgiUH9QWKqWB49R/QIW
 GzX3Lt3VRNrNgTGFQxPegfUbftC/t0Fy3tjIP+kWN1OWdMWYEKcI8SE3WNPFhX1Rc9
 nr0CbQG43GeA2Bqrl48g72KmyZk3EDIq3H8b+otDDkh7o86mmyNEtmDXBh+JgjMIcq
 4JUhK06l+XX0dS9ATlRIfLyNsHaqwY5j2aLxeyIK8Y8slEmkanrv25O8Q2ImAxv/18
 7g7QD0MDGkKHt5eqeOlkqvqSzWQG+uS0H2uM3361DZH8hu9Atl33EUO+1oauWIhSUy
 VKiKMjW47AHQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 086/104] ALSA: usb-audio: scarlett2: Fix
 data_mutex lock
Date: Fri,  9 Jul 2021 22:21:38 -0400
Message-Id: <20210710022156.3168825-86-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, "Geoffrey D. Bennett" <g@b4.vu>
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

From: "Geoffrey D. Bennett" <g@b4.vu>

[ Upstream commit 9b5ddea9ce5a68d7d2bedcb69901ac2a86c96c7b ]

The private->vol_updated flag was being checked outside of the
mutex_lock/unlock() of private->data_mutex leading to the volume data
being fetched twice from the device unnecessarily or old volume data
being returned.

Update scarlett2_*_ctl_get() and include the private->vol_updated flag
check inside the critical region.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Link: https://lore.kernel.org/r/20210620164643.GA9216@m.b4.vu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer_scarlett_gen2.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index b2fa317ba2ab..63d6a5e45ba9 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1028,11 +1028,10 @@ static int scarlett2_master_volume_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_mixer_data *private = mixer->private_data;
 
-	if (private->vol_updated) {
-		mutex_lock(&private->data_mutex);
+	mutex_lock(&private->data_mutex);
+	if (private->vol_updated)
 		scarlett2_update_volumes(mixer);
-		mutex_unlock(&private->data_mutex);
-	}
+	mutex_unlock(&private->data_mutex);
 
 	ucontrol->value.integer.value[0] = private->master_vol;
 	return 0;
@@ -1046,11 +1045,10 @@ static int scarlett2_volume_ctl_get(struct snd_kcontrol *kctl,
 	struct scarlett2_mixer_data *private = mixer->private_data;
 	int index = elem->control;
 
-	if (private->vol_updated) {
-		mutex_lock(&private->data_mutex);
+	mutex_lock(&private->data_mutex);
+	if (private->vol_updated)
 		scarlett2_update_volumes(mixer);
-		mutex_unlock(&private->data_mutex);
-	}
+	mutex_unlock(&private->data_mutex);
 
 	ucontrol->value.integer.value[0] = private->vol[index];
 	return 0;
@@ -1314,11 +1312,10 @@ static int scarlett2_button_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_mixer_data *private = mixer->private_data;
 
-	if (private->vol_updated) {
-		mutex_lock(&private->data_mutex);
+	mutex_lock(&private->data_mutex);
+	if (private->vol_updated)
 		scarlett2_update_volumes(mixer);
-		mutex_unlock(&private->data_mutex);
-	}
+	mutex_unlock(&private->data_mutex);
 
 	ucontrol->value.enumerated.item[0] = private->buttons[elem->control];
 	return 0;
-- 
2.30.2

