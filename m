Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BB26EC52
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 04:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D77E174C;
	Fri, 18 Sep 2020 04:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D77E174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600395113;
	bh=3DMF38mldNUYA7yCL5j6zamAk3sB0jOQDvUCBZLfLl4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s80jcxKkkrUs5aHR8M0fvckpiMrEKW0Ig6+VsuyH6KiNnr+mXjWUfI17yZwEWNE+l
	 vmEN3O85sbGVyMANTUuLgEZpASPcB7qh0OkCyO/0Tzb1ZX0oUOERdwd7U2UJWu124e
	 XEuLScGLbBsVmE/cU6BZTs7AAyfhCIQFgJrZSqvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9458EF802A7;
	Fri, 18 Sep 2020 04:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 528DBF802C3; Fri, 18 Sep 2020 04:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3938F802C4
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 04:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3938F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E7gx+7BY"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B52282399C;
 Fri, 18 Sep 2020 02:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394980;
 bh=3DMF38mldNUYA7yCL5j6zamAk3sB0jOQDvUCBZLfLl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E7gx+7BYnC04ED1FWpWz+eFOz0lE1lREsuqAW534Q+kYJ7kUqaqN4QdFO9YfxR0zE
 MZ0Ug8LrmQIt5leSevPchrLffSmSvpiW5PNhu2we+2qsPgh5yahDVFVsEVFFBbhSos
 Y0aVj2AUzzLWl/nFY+bQkpCu2UnFOo4DtFOGlhy0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 080/206] ALSA: usb-audio: Don't create a mixer
 element with bogus volume range
Date: Thu, 17 Sep 2020 22:05:56 -0400
Message-Id: <20200918020802.2065198-80-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit e9a0ef0b5ddcbc0d56c65aefc0f18d16e6f71207 ]

Some USB-audio descriptors provide a bogus volume range (e.g. volume
min and max are identical), which confuses user-space.
This patch makes the driver skipping such a control element.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206221
Link: https://lore.kernel.org/r/20200214144928.23628-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 45bd3d54be54b..451b8ea383c61 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1699,6 +1699,16 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 	/* get min/max values */
 	get_min_max_with_quirks(cval, 0, kctl);
 
+	/* skip a bogus volume range */
+	if (cval->max <= cval->min) {
+		usb_audio_dbg(mixer->chip,
+			      "[%d] FU [%s] skipped due to invalid volume\n",
+			      cval->head.id, kctl->id.name);
+		snd_ctl_free_one(kctl);
+		return;
+	}
+
+
 	if (control == UAC_FU_VOLUME) {
 		check_mapped_dB(map, cval);
 		if (cval->dBmin < cval->dBmax || !cval->initialized) {
-- 
2.25.1

