Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BA12E1FDC
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6E21772;
	Wed, 23 Dec 2020 18:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6E21772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608744341;
	bh=Kwe3NSnx3ATxR/gkMIQyth8n1zRipBg78/jeVl78FRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wu3hXC3WLxyzFK7d5LdVct4nnyf7XTLEsRSwiOl2ZZmjDMwHJz4NGMA5eoA2Crfhw
	 3p5d6t75MuJwZkVAxy5lx/mWzJDk9NKWve81iORojOdOwpLViCd91Y5TgkUg9qskGu
	 qTa7dmiZZ5H2DmhoKGZwxMsqY4yNW4ej5QrDx+lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A830F8021C;
	Wed, 23 Dec 2020 18:23:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C7E1F801EB; Wed, 23 Dec 2020 18:23:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD862F801EC
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD862F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="gBQ3VvHb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=xSaVLDQrpYlBbROf7yYNwGUWbk/mzpp9ArlhnhNCSJ8=; b=gBQ3VvHb7RH7OBBf7er/5hM1Zv
 NR6ERBNzxKxsjxMgWqTPGQHdWLLLYzTYsW6R5nmZCd2nstRPrthfUrxj7VYVDCO7CHzdkVTnYHF/6
 Ce2esJXA4C/6bL07/j45Cv220fMSoN7C9i2wxpydVGRtDVMl3qBdzFNY/u3cK2dK6TJ4NvAp8iY5g
 tGlTKUOI8Sz4bctUH20CzNc3atqwZu7NPhURT4Rkw7QJ1AYex0MLHmDEIprSJwOo0GDjDlaP/H8ko
 jhJ06+HcLcj13np7adMuypjI/OJm/sCNasfeLjY+CXEHvIUS3lVPKHqmdFV4Yw25nriczef6sF/dx
 YKyyHlVA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks7qt-000Eum-Je; Wed, 23 Dec 2020 18:23:07 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-G5; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 09/18] ALSA: hda: Use DIV_ROUND_UP()/roundup() instead of
 open-coding it
Date: Wed, 23 Dec 2020 18:22:20 +0100
Message-Id: <20201223172229.781-9-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use DIV_ROUND_UP() and roundup() instead of open-coding them. This
documents intent and makes it more clear what is going on for the casual
reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@@
expression x, y;
@@
-((((x) + (y) - 1) / (y)) * y)
+roundup(x, y)

@r1@
expression x;
constant C1;
constant C2;
@@
 (x + C1) / C2

@script:python@
C1 << r1.C1;
C2 << r1.C2;
@@
print C1, C2
try:
	if int(C1) != int(C2) - 1:
		cocci.include_match(False)
except:
	cocci.include_match(False)

@@
expression r1.x;
constant r1.C1;
constant r1.C2;
@@
-(((x) + C1) / C2)
+DIV_ROUND_UP(x, C2)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/hda/hdac_stream.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index abe7a1b16fe1..a6ed3dc35f7e 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -435,12 +435,11 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 	pos_adj = bus->bdl_pos_adj;
 	if (!azx_dev->no_period_wakeup && pos_adj > 0) {
 		pos_align = pos_adj;
-		pos_adj = (pos_adj * runtime->rate + 47999) / 48000;
+		pos_adj = DIV_ROUND_UP(pos_adj * runtime->rate, 48000);
 		if (!pos_adj)
 			pos_adj = pos_align;
 		else
-			pos_adj = ((pos_adj + pos_align - 1) / pos_align) *
-				pos_align;
+			pos_adj = roundup(pos_adj, pos_align);
 		pos_adj = frames_to_bytes(runtime, pos_adj);
 		if (pos_adj >= period_bytes) {
 			dev_warn(bus->dev, "Too big adjustment %d\n",
-- 
2.20.1

