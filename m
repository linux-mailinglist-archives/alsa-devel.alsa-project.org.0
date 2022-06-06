Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37AD53E5A1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 18:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD701A75;
	Mon,  6 Jun 2022 18:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD701A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654531820;
	bh=dmxhJvm409R6JUIeIY8V4nev9e5nbhEk6Ggzd3/sK28=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VOW55r6UbU3OTkF2TRvuMYv6n6XVS87KdBvawpMoa8XvfM6Y3SpF7qSPjp/eXlu2L
	 VnEHtjB84+RgthlCdxXvFHy3tAwjchV1+LDqGTNt2zgGPwx4WgzKRWmr3RjPOIB6We
	 cp8J/Xjyfar30iPQb2Vt/ewc8jY1KDSfDqNJnJ28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEFABF8052E;
	Mon,  6 Jun 2022 18:09:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D089FF8052D; Mon,  6 Jun 2022 18:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AD8DF80527
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 18:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AD8DF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="DJqRATF7"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="EvFONovc"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8895121AAD;
 Mon,  6 Jun 2022 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654531753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e0il8KYBlc76QtD+mjcJNn3ON1E+g2oBqR+OKzt6MHU=;
 b=DJqRATF72HiQxEIr2h6y6Cz2oC9TuIkh/gSdyO0Vi02bSi6fNTciqayzprVyf6OGL5VPzJ
 HEGZ7oq+E4+RnXJH1zZq/B1yH96NphVWBAq4ImFC59Urlmvq59Iw48Dzgab9SfP6Z4/OPI
 DHEQIVx2HUa6aJn4AwvMno38w0NW7IU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654531753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e0il8KYBlc76QtD+mjcJNn3ON1E+g2oBqR+OKzt6MHU=;
 b=EvFONovcAq0raOhVHcNWRcgkDeuQ6H8kAw23Dzd6b7oP2BGhUoDj3GAZymm2twEjUBOoOz
 Ql5Q04CrR1G36UCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6010413A5F;
 Mon,  6 Jun 2022 16:09:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w/meFqkmnmKoAwAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 06 Jun 2022 16:09:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: usb-audio: Fix regressions for Saffire 6
Date: Mon,  6 Jun 2022 18:09:08 +0200
Message-Id: <20220606160910.6926-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Andr=C3=A9=20Kapelrud?= <a.kapelrud@gmail.com>
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

this is a small patch set to address the still remaining regressions
for Focusrite Saffire 6.


Takashi

===

Takashi Iwai (2):
  ALSA: usb-audio: Skip generic sync EP parse for secondary EP
  ALSA: usb-audio: Set up (implicit) sync for Saffire 6

 sound/usb/pcm.c          | 5 ++++-
 sound/usb/quirks-table.h | 7 ++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.35.3

