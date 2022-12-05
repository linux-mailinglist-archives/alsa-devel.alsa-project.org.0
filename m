Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D0642946
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 14:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5641862;
	Mon,  5 Dec 2022 14:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5641862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670246599;
	bh=/FBjqSKEorfTQO+vOH3acyVzb88QItRffERyd4le2fU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UgBmZsmzB5Ys03pBbXSVbjDBAzoELhtBfp90FePntsDXBGCSDQ4LZSquTr18U/vwz
	 8WUJpQFFlQUrG/0oprwX11BChLwU5F92byPK9zYH9bxNz7ag3vczlVjemqXhr2QJk9
	 DnKprsQwVShBG4/FTjD+5WM4osror9oBniDWhjrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 210DAF80567;
	Mon,  5 Dec 2022 14:21:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92930F80533; Mon,  5 Dec 2022 14:21:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF30F8047C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 14:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF30F8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="kK0PkwJX"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="yJq3yWdA"
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3654C22531;
 Mon,  5 Dec 2022 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670246487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iT8YLiVDC1kSiuWgCUq47AtNdwQomwn3P1F7nXLJXtA=;
 b=kK0PkwJXljIxw3DLHMDembFNJsLTKNiWWB3q7NQaKH9UPL0PvSUg04KbU4hh+aotm4f1+R
 0Fj1Kl3ehWI9Ac/bVJXOnnkN/7FdhT2+nv9Tm9c6MF3/CTXU1hBttgsBMs+dxb26FRLN4G
 jyzyhvIn4HzX9VrB+UoP0W2TBRLGceo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670246487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iT8YLiVDC1kSiuWgCUq47AtNdwQomwn3P1F7nXLJXtA=;
 b=yJq3yWdAEW/z8wBKgMaFMNA8TgBT5W9jyF0trfONjWr/nRyzOAj78CAe4n5EFdnTp8b+YA
 TT+v72DucqqEh2Bg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0CD9913326;
 Mon,  5 Dec 2022 13:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +m07AlfwjWOZagAAGKfGzw
 (envelope-from <tiwai@suse.de>); Mon, 05 Dec 2022 13:21:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: Fix XRUN handling of USB-audio implicit fb
Date: Mon,  5 Dec 2022 14:21:21 +0100
Message-Id: <20221205132124.11585-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Carl Hetherington <lists@carlh.net>
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

this is a patch set to cover a corner-case bug that happens with
the USB-audio implicit feedback mode.  When XRUN happens in the
implicit fb full-duplex streams, the driver may get EPIPE error at
prepare but re-issuing fails again.  The essential fix is the 3rd
patch but the former two are covering other corner cases I spotted
(only theoretical).


Takashi

===

Takashi Iwai (3):
  ALSA: pcm: Set missing stop_operating flag at undoing trigger start
  ALSA: pcm: Handle XRUN at trigger START
  ALSA: usb-audio: Workaround for XRUN at prepare

 sound/core/pcm_native.c | 12 ++++++++++--
 sound/usb/pcm.c         | 13 +++++++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.35.3

