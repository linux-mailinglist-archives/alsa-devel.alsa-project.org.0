Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5FB5EA7D0
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 16:00:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01151614;
	Mon, 26 Sep 2022 15:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01151614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200829;
	bh=WcZGD6u3y0uY37QhMq+pmfSFaw9Z0NrBsoqIDFrzFWk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ReC9J0RWA/3A+nhh57kwzY4FPqevPFsodku0j7Mx3XP8GZyYHh3xp1kXq5DerNhQ6
	 bOHYjJoHkf26q5psC1v4V9qaTERRI53KY8gzkmZIH2AxwCNtwXDRLNhYaWmjODOZ8H
	 gwB7ucVm0e3B+BE6yR2ILwfxkuF9fDukhYm3OECQ=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA3CF805B1;
	Mon, 26 Sep 2022 15:56:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 272CDF8057F; Mon, 26 Sep 2022 15:56:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73986F80551
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73986F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="aFzj/2HD"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="08rdBjs3"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E08D1F8A4;
 Mon, 26 Sep 2022 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRZxSv7smy3QDjQkWD9RsTq7RsLGu89BFpMCDZ1fSqs=;
 b=aFzj/2HDzgIVxQswoWix7yM84Zj7JpCBd4jtTvV1DWXZQonx6aVn61qXUVOzHbZuMuOiJu
 9Kpz87+dlLfKWSBOmQ3rJoqMNT708IDAUEdBaNeCbfQ8ElNgEN3TuJwVW11SFv025fWHI0
 ldrSxB+Ga021gzUaj1i8kgZgtQ1MBfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRZxSv7smy3QDjQkWD9RsTq7RsLGu89BFpMCDZ1fSqs=;
 b=08rdBjs3Womb//T4+muGP5CIJ2Xmnrhd8XT+LeK1OuM6ouyKtMcPnZBSutZGA9J+253ULL
 vYLntFzX0AxCoxDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2338139BD;
 Mon, 26 Sep 2022 13:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8C11OoCvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] usb: gadget: Replace runtime->status->state reference
 to runtime->state
Date: Mon, 26 Sep 2022 15:55:58 +0200
Message-Id: <20220926135558.26580-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

The recent change in ALSA core allows drivers to get the current PCM
state directly from runtime object.  Replace the calls accordingly.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I'm going to merge this through sound git tree as it requires ALSA core
changes.

 drivers/usb/gadget/function/u_uac1_legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_uac1_legacy.c b/drivers/usb/gadget/function/u_uac1_legacy.c
index 60ae8b2d3f6a..dd21c251542c 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.c
+++ b/drivers/usb/gadget/function/u_uac1_legacy.c
@@ -158,8 +158,8 @@ size_t u_audio_playback(struct gaudio *card, void *buf, size_t count)
 	snd_pcm_sframes_t frames;
 
 try_again:
-	if (runtime->status->state == SNDRV_PCM_STATE_XRUN ||
-		runtime->status->state == SNDRV_PCM_STATE_SUSPENDED) {
+	if (runtime->state == SNDRV_PCM_STATE_XRUN ||
+		runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
 		result = snd_pcm_kernel_ioctl(substream,
 				SNDRV_PCM_IOCTL_PREPARE, NULL);
 		if (result < 0) {
-- 
2.35.3

