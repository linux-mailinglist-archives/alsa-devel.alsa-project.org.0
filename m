Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C044E41C0B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 08:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55AD316FC;
	Wed, 12 Jun 2019 08:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55AD316FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560319966;
	bh=V/Ub92fg060mGYW/1MdR6hhBB44ZHslzhUXJzzY4LpE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnQJ+IQpGWBHtZb+ksZpD81/XfTD1xZJoQTFgHWRAGWIMB4FHyeFtIEgeP9+a2Mgc
	 lxXcmChtoGNu/Vwpwt7fUeJ/C1W8IPsOU+uRBBR8xpDpQL4hB1vzlgYpmOOiB6w5EO
	 HPznAlQMrS9Zs2lOMr4EDuRqs4UN4jFVb5jRFKho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A25C3F89747;
	Wed, 12 Jun 2019 08:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19B0CF896CE; Wed, 12 Jun 2019 08:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9413F896EA
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 08:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9413F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="lTJwN6sQ"
Received: by mail-pf1-x442.google.com with SMTP id s11so8953645pfm.12
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 23:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8U0Lbg8k5rv1wfrBh8efo+VlNv3upe4d9w7B0fdd9lQ=;
 b=lTJwN6sQK1RRha5Df5rpLz2pRoA5QWvv5CfLdtFewSfKza/pZA8XgGQaFUuY0yQoaR
 /8vH4CCrtX8SAJjW8NVXNDenFmn42lkI53U4cbJFLO8WJMRytAtH70M7kmSW0VdT+yEk
 BADwaz0SjR3sR2A2LMjvcSRtHfPBEnGCybTSvp9O/RqaBEIDkvvSJRd45TyGd5+0TZPF
 CIlLktebjQdawTwUIhRtONjxCFmcIH0Tpchs+9yTrx0wZ7F6YduqcpX8cPYxHKsD4swN
 cLDqfL+z6Mggs0HOP+wSopFyKeqd52xlwGWOoudG0pcx2OazsIWC72s7z8xaDx0DsWgk
 x4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8U0Lbg8k5rv1wfrBh8efo+VlNv3upe4d9w7B0fdd9lQ=;
 b=BG+TQsPH6ma7I9d9ks1tqzhFIh/SUrsXjFNDN14MPTJSNmvhIXEBNWwMnza0NQyYWW
 2wy2NsdK/neAvtZ17tKSFiZpOi3b/nVKJAeFYwnAx8K4vkYYLU+zKI6fa03rYrTnqMuE
 TrkMrgnw2gD8/MxIkeYfjDFGtXZ5ZCbYSsDmuIJ1mVb11EI+2aVIL0LX83bofJZ5y5Js
 ezLq7A1QS8mhLYq9mWgu1GM3VMBdlVSyAo5n/1tJX2orcwc2hep9+7C/2PlDf5a9E7wY
 Lb8Q0tTz9GZfnWIG00eoIh8z6ePgAG/UaHwP+cVY6GjJ74418M4VoN6x6JcIWAwFNSe6
 h0Ig==
X-Gm-Message-State: APjAAAXG3hOeOq0dPFcL7drwXVZStzLiwTDw9K0psOqfGlUl01J/IGm0
 NH/CM4B4Kz9DuIrMZe6Lb6rdgQ==
X-Google-Smtp-Source: APXvYqxaPTuKT9alXAmBYD1AYlmfvn0LPu0KhDvQ5uxR0dwLrF7l62knZyt2NfyWukM0a5jAtnOlBg==
X-Received: by 2002:a62:5801:: with SMTP id m1mr85433175pfb.32.1560319702928; 
 Tue, 11 Jun 2019 23:08:22 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::cf52])
 by smtp.gmail.com with ESMTPSA id k8sm15571785pfi.168.2019.06.11.23.08.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:08:22 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: patch@alsa-project.org
Date: Tue, 11 Jun 2019 23:08:14 -0700
Message-Id: <20190612060814.13534-7-mforney@mforney.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612060814.13534-1-mforney@mforney.org>
References: <20190612060814.13534-1-mforney@mforney.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/6] Avoid pointer arithmetic on `void *`
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The pointer operand to the binary `+` operator must be to a complete
object type.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 src/pcm/pcm_rate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index 5dc8a927..fdcaa8de 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -300,10 +300,10 @@ static int snd_pcm_rate_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	rate->sareas = rate->pareas + channels;
 	rate->sareas[0].addr = (char *)rate->pareas[0].addr + ((cwidth * channels * cinfo->period_size) / 8);
 	for (chn = 0; chn < channels; chn++) {
-		rate->pareas[chn].addr = rate->pareas[0].addr + (cwidth * chn * cinfo->period_size) / 8;
+		rate->pareas[chn].addr = (char *)rate->pareas[0].addr + (cwidth * chn * cinfo->period_size) / 8;
 		rate->pareas[chn].first = 0;
 		rate->pareas[chn].step = cwidth;
-		rate->sareas[chn].addr = rate->sareas[0].addr + (swidth * chn * sinfo->period_size) / 8;
+		rate->sareas[chn].addr = (char *)rate->sareas[0].addr + (swidth * chn * sinfo->period_size) / 8;
 		rate->sareas[chn].first = 0;
 		rate->sareas[chn].step = swidth;
 	}
@@ -513,14 +513,14 @@ static void do_convert(const snd_pcm_channel_area_t *dst_areas,
 		const int16_t *src;
 		int16_t *dst;
 		if (! rate->src_buf)
-			src = src_areas->addr + src_offset * 2 * channels;
+			src = (int16_t *)src_areas->addr + src_offset * channels;
 		else {
 			convert_to_s16(rate, rate->src_buf, src_areas, src_offset,
 				       src_frames, channels);
 			src = rate->src_buf;
 		}
 		if (! rate->dst_buf)
-			dst = dst_areas->addr + dst_offset * 2 * channels;
+			dst = (int16_t *)dst_areas->addr + dst_offset * channels;
 		else
 			dst = rate->dst_buf;
 		rate->ops.convert_s16(rate->obj, dst, dst_frames, src, src_frames);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
