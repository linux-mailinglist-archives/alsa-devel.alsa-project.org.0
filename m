Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3087466298A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 16:14:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82B7FB3D6;
	Mon,  9 Jan 2023 16:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82B7FB3D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673277241;
	bh=3/wjuL1YbOaJAKytJRlm2FfCw3CGRr2gS1GTsUgSqsc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=N0WyXMQYJdqWGZ5eNPuTrIS8W2Wx7pmqh33Apim81cOkIrkHy30tvmkoJWKpiF0B8
	 MW0hrpCucMDiWhtE4qEIsHpSK0lPJRizzus8qUEoBP2HARXBFEBtl7YpM0pHiuO2N8
	 ryYEfa5GEEgo3HAght2SjsWe0g87+l3bQgEyQOfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FBCF803DC;
	Mon,  9 Jan 2023 16:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 986F2F8030F; Mon,  9 Jan 2023 16:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00579F802BE
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 16:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00579F802BE
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=y31VGSY+
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C7B61A0040;
 Mon,  9 Jan 2023 16:12:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C7B61A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673277178; bh=VETaylCI6Iv/LOQZi/JXQYyAJhoJr3CGCu2KIBSTyFc=;
 h=From:To:Cc:Subject:Date:From;
 b=y31VGSY+Emwzpx/QwrLZEsaPQU5Qpd0S2VQxkz+bB4sucEII1/NkU9DINTeb3NMLQ
 fLF7i5YfyAARh6Dqp939RXnIjFqanaj2JvGvPCucsHYHBgVoCxCY1xDtHqls1TFJQP
 8+NC9JVC8j2Fo87LlR0fxCOXP7/wm6csw5HmF6jc=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  9 Jan 2023 16:12:53 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v3] ALSA: control-led: use strscpy in set_led_id()
Date: Mon,  9 Jan 2023 16:12:49 +0100
Message-Id: <20230109151249.343741-1-perex@perex.cz>
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

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Reported-by: yang.yang29@zte.com.cn
Link: https://lore.kernel.org/alsa-devel/202301091945513559977@zte.com.cn/
Cc: <stable@vger.kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>

v1..v2:
  - remove min() expression which strips the last char
v2..v3:
  - BugLink -> Link
  - add Fixes tag
---
 sound/core/control_led.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index f975cc85772b..3cadd40100f3 100644
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
+	if (strscpy(buf2, buf, sizeof(buf2)) < 0)
+		return -E2BIG;
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	s = buf2;
-- 
2.39.0
