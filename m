Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E2B3B0B4D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 375541654;
	Tue, 22 Jun 2021 19:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 375541654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624382349;
	bh=u+WaGpu0qZdM0WtR03j0NYtFMYZ24vKgjU1cz/OQfiw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MGsRSzeXVkdJ7B1ZmVSgbEASnv1KZ8vBdFePtycSZZz/0BkGl+YQL+Ep/g3EUa6G7
	 MI0yj6wgG93g+laPV2tRkbkNfV8J9N7b79eAt3uYY7B3X3vR7y0DLuRQkvTKA7th1W
	 S4ZYw0/uELZF6KB3aKO09LFtmNLXSEzZNyomlw7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A330F8026A;
	Tue, 22 Jun 2021 19:17:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72CC4F80268; Tue, 22 Jun 2021 19:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0A30F80161
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A30F80161
Received: by m.b4.vu (Postfix, from userid 1000)
 id C255D61E2869; Wed, 23 Jun 2021 02:47:24 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:47:24 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] MAINTAINERS: Add Focusrite Scarlett Gen 2/3 Mixer Driver entry
Message-ID: <20210622171724.GA15534@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Add Focusrite Scarlett Gen 2/3 Mixer Driver entry.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..71e327d970d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7103,6 +7103,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/joystick/fsia6b.c
 
+FOCUSRITE SCARLETT GEN 2/3 MIXER DRIVER
+M:	Geoffrey D. Bennett <g@b4.vu>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
+F:	sound/usb/mixer_scarlett_gen2.c
+
 FORCEDETH GIGABIT ETHERNET DRIVER
 M:	Rain River <rain.1986.08.12@gmail.com>
 M:	Zhu Yanjun <zyjzyj2000@gmail.com>
-- 
2.31.1

