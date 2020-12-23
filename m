Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1062E1FDB
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:25:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F861766;
	Wed, 23 Dec 2020 18:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F861766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608744297;
	bh=xeLoH1OD/V0cqdfJ566+2xnYuHJIftlJS0nJE+BjllI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1+xvB0dOJbnORQ670v8giA6Akx7Tff7/YX8O9jDjlRAzYtC7mj4yet/fqT+OB2tL
	 ETFnmC+ZTbRYJqKjX8W0xjsRT6YAPJyDgIN9vxOMlKyKdUQKC0cIKB5Zn1d9iK9Yd8
	 CRJDIVFO3hnDpKyOD3I61aRDUJT7XlxlpnO5WKkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57835F80116;
	Wed, 23 Dec 2020 18:23:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A84F804C3; Wed, 23 Dec 2020 18:23:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D78C9F801EB
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78C9F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="OgZhxd6V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=P58eCGvh3i4hWZxrddca8XJyC+8GhFjJTL+zu8A1d08=; b=OgZhxd6V9Xoz3jvKeSuluHORuR
 1dSlKZHTEFCKV9d/yDFs6Xz4xCERnGNeN+pAOuL4lAl3YrS75KLzCdFjuxnDmxc2gaMOKjnhPGFie
 VN6Y1URJWgqFiA6Df7Te2X/t3eoFMmcOstfkWi1EMdMvXWeyUfMw5ow9NVFK3+vaJbRDie83t5d5o
 z38Yk3FAiaBN1dHTJWKhPSv4GfZEERDkdw/GSzQmF+GaniknjrcsNLKFDGkJPC0aTgstPGJNsMquQ
 Bpyi+aADTjWvdlvK9Ojm1hiIApt0dRrHSzojae3gM/k9jUyOJOZ1tge+a9XgjKx70GKnDSpWPT6SA
 qk81b4mA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Etf-Ar; Wed, 23 Dec 2020 18:23:02 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-7f; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 04/18] ALSA: bt87x: Use DIV_ROUND_UP() instead of open-coding
 it
Date: Wed, 23 Dec 2020 18:22:15 +0100
Message-Id: <20201223172229.781-4-lars@metafoo.de>
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

Use DIV_ROUND_UP() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
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
 sound/pci/bt87x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 54cb223caa2f..cf9f8d80a0b6 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -327,7 +327,8 @@ static irqreturn_t snd_bt87x_interrupt(int irq, void *dev_id)
 		current_block = chip->current_line * 16 / chip->lines;
 		irq_block = status >> INT_RISCS_SHIFT;
 		if (current_block != irq_block)
-			chip->current_line = (irq_block * chip->lines + 15) / 16;
+			chip->current_line = DIV_ROUND_UP(irq_block * chip->lines,
+							  16);
 
 		snd_pcm_period_elapsed(chip->substream);
 	}
-- 
2.20.1

