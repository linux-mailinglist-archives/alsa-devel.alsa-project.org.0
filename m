Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F2A6161D2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 12:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373271681;
	Wed,  2 Nov 2022 12:34:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373271681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667388907;
	bh=p3aok1ZeUfN8Nlf50W5++PiYocCQER28x04AcC9JXgE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oRLC9j4yYx2fx2QVJ1w/RI4m3QbwZ82ho+lMlCmIBIZ8aWCFO1xDpDuEhJk0Gjve1
	 BWy5ejV1BcjoWI4uZIRelfKrTCAczJ1WiJgmSC6/f/8v0ocb1Pw4/UCny+qzfYW70E
	 sOzUzx5nErxRhKnMWW5sG38F+sV8/4LTsJUGDPPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96075F80423;
	Wed,  2 Nov 2022 12:34:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D240AF8026D; Wed,  2 Nov 2022 12:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58911F80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 12:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58911F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BsWWo5qN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="VKguWZ8V"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB18A1F8C5;
 Wed,  2 Nov 2022 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667388846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5/LBYDFKfVjKib9sztctbT8n0OQfNzOR3IgzhiUsutQ=;
 b=BsWWo5qNsLUgvFe2r0DW2zcyo5gnXxwtJxIL8g/Zto5DZFkHCF43K6KMIPID1bjr6iI6nl
 MSrHeC5yZbd6rSbzAWloO8nvSy8dKv3biD0m2i4tdAo70nnkGj9ZNJaI18dDi89p0H3skH
 tURYAIr0lG11qvEALv+N99K6tb9rhWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667388846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5/LBYDFKfVjKib9sztctbT8n0OQfNzOR3IgzhiUsutQ=;
 b=VKguWZ8VCXko1LqYepCepampebKZe3/3kGkAUhOqZ/IKArBtkGSQn0ueEVgFDm+CPBSDsj
 gOapiSyF+FckGGAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A138F139D3;
 Wed,  2 Nov 2022 11:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rL8IJ65VYmP1dQAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 02 Nov 2022 11:34:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix regression with Dell Dock jack detection
Date: Wed,  2 Nov 2022 12:34:04 +0100
Message-Id: <20221102113404.11291-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

The recent commit added Jack controls to Dell Dock, but it added with
iface = SNDRV_CTL_ELEM_IFACE_CARD.  Unfortunately this doesn't match
with the changes in user-space UCM profile, which expects iface =
SNDRV_CTL_ELEM_IFACE_MIXER as default.  This mismatch resulted in the
non-working profile, and the Dell Dock is gone on pipewire /
PulseAudio after the kernel update.

Fix the regression by adjusting the iface of the new ctl elements to
*_MIXER.

Fixes: 4b8ea38fabab ("ALSA: usb-audio: Support jack detection on Dell dock")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.opensuse.org/show_bug.cgi?id=1204719
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index ab0d459f4271..3039a17259ab 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2042,7 +2042,7 @@ static int realtek_ctl_connector_get(struct snd_kcontrol *kcontrol,
 }
 
 static const struct snd_kcontrol_new realtek_connector_ctl_ro = {
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "", /* will be filled later manually */
 	.access = SNDRV_CTL_ELEM_ACCESS_READ,
 	.info = snd_ctl_boolean_mono_info,
-- 
2.35.3

