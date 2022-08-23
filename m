Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F259D31F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 10:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B083165E;
	Tue, 23 Aug 2022 10:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B083165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661242317;
	bh=b8VuVgOuZDevcudz008dxVSiVD+AoUij/xbedJwHh/o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P2lGRWNgBSsaVmXG+zM2ltsqZcAOf/fMA82FAbW+JzC+PeH/PsW31NOdlmCgM4hTh
	 A8kkoUpmKW3Z5zzd5JAguxot85DwXu2fa0w2fu2vTIURvHrp7uc1CeIVZD7ZpPQX9F
	 9HbL65zu2nShUwYuE+XFG0Vt++oufmQsj71rSzkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB9F9F8052F;
	Tue, 23 Aug 2022 10:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 382C0F804E7; Tue, 23 Aug 2022 10:10:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF8B9F8020D
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 10:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8B9F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Pt8HGtt0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="zYbt0bfM"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24419340E8;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661242202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UdcbpW+4O2XBigIe5Io8NYbicx2KWbxi1WDQRJy2QFc=;
 b=Pt8HGtt0UiwV8cv3PvZlrCEeLAwBTba1gTEensoNM14cqhNIwZFgjj85MKFBFVFjJV/OYC
 1UxaKlSC/DxR8mkNjIah6IU9I2Kqh4ZfygeFBPennsWMunnSr0UIkId8/r+wJjjt9MLq7A
 1E5psM3fx7jmEQsS9PHsS+gZjyaeEz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661242202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UdcbpW+4O2XBigIe5Io8NYbicx2KWbxi1WDQRJy2QFc=;
 b=zYbt0bfM/KYTwbN44xio7zvFVF+cG8/YOp/h99g2dGr+ZUaxGMy37hADfa2W8Dh5LIPLwt
 o+B4xXWRHLTTrnBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0110113A89;
 Tue, 23 Aug 2022 08:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cw8VO1mLBGMxTgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 08:10:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: nau8xxx: Implement hw constraint for rates
Date: Tue, 23 Aug 2022 10:09:55 +0200
Message-Id: <20220823081000.2965-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Hi,

this is a series of patches to address the issues on nau8xxx codecs
I've stumbled upon while dealing with a bug report for Steam Deck.
Most of them are to implement the missing hw constraint for rate
restrictions while one patch is to fix the semaphore unbalance in
nau8824 driver.


Takashi

===

Takashi Iwai (5):
  ASoC: nau8821: Implement hw constraint for rates
  ASoC: nau8824: Fix semaphore unbalance at error paths
  ASoC: nau8824: Implement hw constraint for rates
  ASoC: nau8825: Implement hw constraint for rates
  ASoC: nau8540: Implement hw constraint for rates

 sound/soc/codecs/nau8540.c | 40 +++++++++++++-----
 sound/soc/codecs/nau8821.c | 66 ++++++++++++++++--------------
 sound/soc/codecs/nau8824.c | 80 ++++++++++++++++++++----------------
 sound/soc/codecs/nau8825.c | 83 +++++++++++++++++++++-----------------
 4 files changed, 156 insertions(+), 113 deletions(-)

-- 
2.35.3

