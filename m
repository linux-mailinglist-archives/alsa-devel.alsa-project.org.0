Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F84751ACF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:08:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2AF847;
	Thu, 13 Jul 2023 10:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2AF847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689235692;
	bh=k1t7EGxyj2v6chAtKe0HuXuEvZijx6eZ9AqnjfNyULA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aQWHn6vtdeTTvc6RaBB7Dbb448/LIOCX8NUkY0jWt2rj+27hPgo3Lqr2/yhAmixjt
	 GtcM9MPs60l6ugwP93N9lRTG6qhK2J9D3dcannBEvVosIN96ujpFo/gaqjmneiBXN2
	 ofYMDEQCZyzHIsD+Q2YAQMJX6t/fTdE+18yAWLRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D303EF8056F; Thu, 13 Jul 2023 10:06:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5766CF8055C;
	Thu, 13 Jul 2023 10:06:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2132F80249; Thu, 13 Jul 2023 10:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D959F80236
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D959F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=AbdHpSx4
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fccade2141so38722e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689235208; x=1691827208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQWUSEoOR5t3MEXAfVU6qpzWsgyy+Mooxn06h3Z1zKo=;
        b=AbdHpSx4W0NU1QBnqdMfK5CRrsrCnCDXoNeNtfRok8O6iX1amyWXGG5Mk/QKRKTAwC
         9KW+bTz5eZFBTyuq4Y0wxP7KBdIO836HbQ73gkAb493zR4IwTrjk0tsXs3/IELE/H7wm
         VxkVNCGVeEIaAUwf0aZpMLOCq7J2zB+Pp84scSphSsXA1XTWl2vYk+4Oy++5BFR1ilkD
         wYDeskynXwOoE17nfa7gMUCT46k8f3zhiWQHJFTEOW9elUY+8yzuowcG3/TY8SJAaaje
         3Irjw2wlQ7B04AwJXPzb7gUGC1jcJbNNAMu+TbJt+VGfwjl1cseVeke5MlxYgx6EqwLv
         FTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689235208; x=1691827208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQWUSEoOR5t3MEXAfVU6qpzWsgyy+Mooxn06h3Z1zKo=;
        b=WaglONjFbt7sSE79amBzh7ca7eGRzxg0xdJ5u0ML+6swjfum2PvYy3zkyAamcRMHG/
         clU9MIlDs1jHNGmOkGivpY8vkEVQ15yHm8ViiMjZyTezX1TWEYEClr18nztTIrbUR2dm
         QqUO7CZSbl9eLp1oZioXuh4Be18LDCfq0/eJxToF8IDZC2yQdF8/9TxGcYRShpk+o3Pz
         weLN+sjSymR4dvpBaCtf5SsKZQ28+blMB/In2nfUdqcf/av5w9B5qrmWBPvsglIGN+H+
         ewizYSIWsHG/rPzYlMKbx66iS4+MdRNF5oeW/3qbGdwThbkegG3fEjeKHkuuahQc4P9Z
         f2NQ==
X-Gm-Message-State: ABy/qLZNYEeIpSvf8ez+raeJfOtVPiQ+8dwjlVhptxwxXjTzOhE2n6we
	yWWZgjr0Ehks/g7QlIPIzdo=
X-Google-Smtp-Source: 
 APBJJlHt2Zs4KS1Le0F4m4coeU4CvQdR1DZX2Yu483HL8m6d0Nk0AYwmmEWZ6I3sZYF5Hpm0aqVZoA==
X-Received: by 2002:ac2:4833:0:b0:4fb:8eac:8571 with SMTP id
 19-20020ac24833000000b004fb8eac8571mr491482lft.0.1689235208117;
        Thu, 13 Jul 2023 01:00:08 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 q8-20020ac25288000000b004fb8c0f247fsm1011385lfm.129.2023.07.13.01.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 01:00:07 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ALSA: pcmtest: minor optimizations
Date: Thu, 13 Jul 2023 11:59:53 +0400
Message-Id: <20230713075953.13692-2-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713075953.13692-1-ivan.orlov0322@gmail.com>
References: <20230713075953.13692-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VGLDUMMEHMNKMAQ7IH6WHNQAXK6RX7KS
X-Message-ID-Hash: VGLDUMMEHMNKMAQ7IH6WHNQAXK6RX7KS
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:06:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGLDUMMEHMNKMAQ7IH6WHNQAXK6RX7KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Decrease the buffer filling overhead with conditional remainder
calculation in the 'inc_buf_pos' inline function.

Fix the driver to use already defined variables where it is possible
in 'check_buf_block_ni' and 'fill_block_pattern_n' functions.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:
- Split changes in the patch into two different patches

 sound/drivers/pcmtest.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index e74c523e49eb..08e14b5eb772 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -144,7 +144,8 @@ static inline void inc_buf_pos(struct pcmtst_buf_iter *v_iter, size_t by, size_t
 {
 	v_iter->total_bytes += by;
 	v_iter->buf_pos += by;
-	v_iter->buf_pos %= bytes;
+	if (v_iter->buf_pos >= bytes)
+		v_iter->buf_pos %= bytes;
 }
 
 /*
@@ -200,10 +201,10 @@ static void check_buf_block_ni(struct pcmtst_buf_iter *v_iter, struct snd_pcm_ru
 	u8 current_byte;
 
 	for (i = 0; i < v_iter->b_rw; i++) {
-		current_byte = runtime->dma_area[buf_pos_n(v_iter, channels, i % channels)];
+		ch_num = i % channels;
+		current_byte = runtime->dma_area[buf_pos_n(v_iter, channels, ch_num)];
 		if (!current_byte)
 			break;
-		ch_num = i % channels;
 		if (current_byte != patt_bufs[ch_num].buf[(v_iter->total_bytes / channels)
 							  % patt_bufs[ch_num].len]) {
 			v_iter->is_buf_corrupted = true;
@@ -243,7 +244,7 @@ static void fill_block_pattern_n(struct pcmtst_buf_iter *v_iter, struct snd_pcm_
 
 	for (i = 0; i < v_iter->b_rw; i++) {
 		ch_num = i % channels;
-		runtime->dma_area[buf_pos_n(v_iter, channels, i % channels)] =
+		runtime->dma_area[buf_pos_n(v_iter, channels, ch_num)] =
 			patt_bufs[ch_num].buf[(v_iter->total_bytes / channels)
 					      % patt_bufs[ch_num].len];
 		inc_buf_pos(v_iter, 1, runtime->dma_bytes);
-- 
2.34.1

