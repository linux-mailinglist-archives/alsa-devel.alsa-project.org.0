Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58D6627A1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 14:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86327307;
	Mon,  9 Jan 2023 14:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86327307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673272125;
	bh=Jd+4u+vQpcZxC+XzxFysjp3HoPdFA9H0rhDwzicPZ+0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ipR93tatysUbNGgxI6fg28Qwmqn0/qBxtFknREwMKlnYQmZUGR8iN+RfHBxKbov+0
	 fgZ8/aSI704ZTilQABEPrf74DRoOo+dg4mVzGrlNlHL4uhVsiUziVB9135K5YAgDW3
	 82yiJfIvNUaVCuBmDDj8ifQvzPlDaByNeOKYhuy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0790F800C7;
	Mon,  9 Jan 2023 14:47:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0482F803DC; Mon,  9 Jan 2023 14:47:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4D07F800C7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 14:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4D07F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=l9fcbuld
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8B2FEA0047;
 Mon,  9 Jan 2023 14:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8B2FEA0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673272061; bh=tadL4Xyx4wSfJPL9BsL3pVlwT9nrk52x1+B6CFo7qRI=;
 h=From:To:Cc:Subject:Date:From;
 b=l9fcbuldR4Wjnu/KmddjM0yJ6TcfaEwH1Pcl6OxKeviC61OctE3bS/qFvlJYQgufR
 kLJ+Ifh0ePZZ8OZVK4WtGiwd8QOUicpPsp48gnXwA2WyawxpGECNhHb+6XAbYrfBA4
 7CV0wMTrYcWqTAhlKR43mSORTt3RJY4I1oRDusGU=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  9 Jan 2023 14:47:36 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: control-led: use strscpy in set_led_id()
Date: Mon,  9 Jan 2023 14:47:24 +0100
Message-Id: <20230109134724.332868-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.de>, yang.yang29@zte.com.cn,
 stable@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The use of strncpy() in the set_led_id() was incorrect.
The len variable should use 'min(sizeof(buf2) - 1, count)'
expression.

Use strscpy() function to simplify things and handle the error gracefully.

Reported-by: yang.yang29@zte.com.cn
BugLink: https://lore.kernel.org/alsa-devel/202301091945513559977@zte.com.cn/
Cc: <stable@vger.kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/control_led.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index f975cc85772b..45c8eb5700c1 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -530,12 +530,11 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 			  bool attach)
 {
 	char buf2[256], *s, *os;
-	size_t len = max(sizeof(s) - 1, count);
 	struct snd_ctl_elem_id id;
 	int err;
 
-	strncpy(buf2, buf, len);
-	buf2[len] = '\0';
+	if (strscpy(buf2, buf, min(sizeof(buf2), count)) < 0)
+		return -E2BIG;
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	s = buf2;
-- 
2.39.0
