Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A505F0830
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 12:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882DF1699;
	Fri, 30 Sep 2022 12:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882DF1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664532172;
	bh=h5mGeqiUssM2hH2/MAGIcwDC+iQUzm8w4ohCqHGQh7c=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XLlhRVj5ccIMxrpMVkI5FqXSBvkaQceQhsbUAwQId68AS/XK5F0j3CaejHQoivlmh
	 i+upJsRl/jmg+LScAjrA6ulYPK/VoQrUjQqn1L22IOs9lVdQ8bL7N8z/X+iNQvPNcp
	 ZW+nvtoDcSVwsuRrx3ITWIzFIxU1GiRz2vz1bmSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1BFF800E8;
	Fri, 30 Sep 2022 12:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0978F804D8; Fri, 30 Sep 2022 12:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0393F800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 12:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0393F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cqmZDgIi"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="LShLQQ8p"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 879A31F892;
 Fri, 30 Sep 2022 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664532113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=D50unlS1m/u4iRD67WRYbBjDY2DlL/L8kIWP9JeekoI=;
 b=cqmZDgIiMi0yspH7KjPo8WmVkfuSwTT4u4X7Z834T9UqMgh6kcS36h9EwbNwJOqjsB2I2m
 RTqrIUabsTH+8MzodXND2pPIyLvWYlUjNHQutVssnQ/K+yGdgkmxUvz88b3uPI9H/Za4MH
 K8otHWkQlSTtIQgRY7pV0DDLCsovUAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664532113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=D50unlS1m/u4iRD67WRYbBjDY2DlL/L8kIWP9JeekoI=;
 b=LShLQQ8p8l0BjfZnhlIzfQVjJsispQgVW6NhajZMknxLshKoOAeFPfZREXIRwHpXEFVU4/
 OGfFjpJBIXGFnvBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 700EB13677;
 Fri, 30 Sep 2022 10:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hHG6GpG+NmMNawAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 30 Sep 2022 10:01:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix potential memory leaks
Date: Fri, 30 Sep 2022 12:01:51 +0200
Message-Id: <20220930100151.19461-1-tiwai@suse.de>
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

When the driver hits -ENOMEM at allocating a URB or a buffer, it
aborts and goes to the error path that releases the all previously
allocated resources.  However, when -ENOMEM hits at the middle of the
sync EP URB allocation loop, the partially allocated URBs might be
left without released, because ep->nurbs is still zero at that point.

Fix it by setting ep->nurbs at first, so that the error handler loops
over the full URB list.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 36f753a28341..48a3843a08f1 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1268,6 +1268,7 @@ static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 	if (!ep->syncbuf)
 		return -ENOMEM;
 
+	ep->nurbs = SYNC_URBS;
 	for (i = 0; i < SYNC_URBS; i++) {
 		struct snd_urb_ctx *u = &ep->urb[i];
 		u->index = i;
@@ -1287,8 +1288,6 @@ static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 		u->urb->complete = snd_complete_urb;
 	}
 
-	ep->nurbs = SYNC_URBS;
-
 	return 0;
 
 out_of_memory:
-- 
2.35.3

