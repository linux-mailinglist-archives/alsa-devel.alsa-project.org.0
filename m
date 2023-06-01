Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA127719CF3
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 15:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBAC2822;
	Thu,  1 Jun 2023 15:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBAC2822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685624880;
	bh=PZgpQmAhXGQkr8TsrTzePzM+36hwwsd+HeqKfauYxDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JBeEul0rIBSdWCvn+ssmv1lIcP4VUo/26dxbWRCvLrlRHks+E3ndaHxmmb53Ye6gn
	 DU/9KpI5NwKziMVLBLiVxSu/Z1uRjgm8hW5QqusaWbH2pE8HY3qAJSRp4NJUzfReY0
	 hyOxk5VFZQtb+rhjF6Job3IAo2LYj2k+9J9Bnie4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78BBEF80199; Thu,  1 Jun 2023 15:06:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FDEBF80549;
	Thu,  1 Jun 2023 15:06:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D696F80149; Thu,  1 Jun 2023 15:06:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 865B8F800ED
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 15:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 865B8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=RdSP/OEU
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-53f70f7c2d2so385590a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Jun 2023 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685624779; x=1688216779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+80VYIfhjZ5fSjcUibNsG+b2Hi4A7lyy0lDCFEbZBs=;
        b=RdSP/OEUyw387gUXs4br35uVFKo5guW8++Hou3cYfb7YCLhJMNQHx0nY5w8nffjBkM
         DddJF2l7xiFfCvYAErVvbOKXfXK87LvjsJyA1Wn1/uGZEg6vADkS6jE+tfwI+Yp9H3Jw
         2pkiNKyMxdsBS+3ZLMANxPjzX0Pm/VO4EJkb9FGd2St73BTQStxSN1CXVYXLWE50MBsB
         fwYmcu2bUrLeWKCerok1e7fFLabA58hrgW56dnTDv6ls37XYC1yS7V/fVcMMkbLS9u3h
         qYOP+U4DY3n3gNtJavEp19/1aICn9Y/ZtpQf2jdHQE8+ylIove6pIe9U6hVMfZEbRSN7
         1oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685624779; x=1688216779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+80VYIfhjZ5fSjcUibNsG+b2Hi4A7lyy0lDCFEbZBs=;
        b=kfObJGTwLDQYUIUx7uVU5iVyBbxMMRmlJ+Szh+TtzMZgejbLA9DTecb5h6XEOXaiWz
         6iLiThpgbPjp45HIZLIF0Nfx3l19rUqndAfwa2l2ZnL0fsDHJLVaRH9hbkzIZENskwlB
         oN/EcT4W5Pc5n3crEAIiAYPpdpF8INFJik6IKZeN5mX/ead2U46SlG3U5O7zM2sHSct1
         sl6HElrLy+dUuzqE7WhM5IhghZTQabdpl7hOh/HPZcGU+m31/zjSXzrq0JODli9BQGSO
         vscYsmK+H7O+Cj8VBgmuW6Qt8AzsyAEdg4qHoAygSlmVc+BPUEuYkqSjR7KIEw7YA6xx
         d8kQ==
X-Gm-Message-State: AC+VfDx6sQLXGKCCpuVjNhDl/RjxOQrsKuzvye8Low6TULnwvL0SB+A+
	v+RLLiK0/NS5mMkEnm+UQxs=
X-Google-Smtp-Source: 
 ACHHUZ4/y8r7bunqlmbBydPYg4Y2Y9+zIUnPo4YaUaKfFxXcl6U6oJWx60TAFQel2zyVw3KAkTfULw==
X-Received: by 2002:a17:90b:17ca:b0:253:572f:79b2 with SMTP id
 me10-20020a17090b17ca00b00253572f79b2mr6352859pjb.36.1685624778892;
        Thu, 01 Jun 2023 06:06:18 -0700 (PDT)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 s34-20020a17090a2f2500b0024df6bbf5d8sm1430096pjd.30.2023.06.01.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 06:06:18 -0700 (PDT)
From: =?UTF-8?q?=E2=80=9CRyan?= <ryan.lee.analog@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ryans.lee@analog.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: jairaj.arava@intel.com
Subject: [PATCH 2/2] ASoC: max98363: limit the number of channel to 1
Date: Thu,  1 Jun 2023 06:06:00 -0700
Message-Id: <20230601130600.25344-2-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601130600.25344-1-ryan.lee.analog@gmail.com>
References: <20230601130600.25344-1-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JR6GS2TEBB7IDNNX24XZSJ4VBUGWMEOY
X-Message-ID-Hash: JR6GS2TEBB7IDNNX24XZSJ4VBUGWMEOY
X-MailFrom: ryan.lee.analog@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JR6GS2TEBB7IDNNX24XZSJ4VBUGWMEOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ryan Lee <ryans.lee@analog.com>

MAX98363 is a mono amplifier. The number of channel needs to be always 1.

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
---
 sound/soc/codecs/max98363.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 8aa9d9c67aa2..7f5062ac4523 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -246,7 +246,7 @@ static int max98363_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 	stream_config.frame_rate = params_rate(params);
 	stream_config.bps = snd_pcm_format_width(params_format(params));
 	stream_config.direction = direction;
-	stream_config.ch_count = params_channels(params);
+	stream_config.ch_count = 1;
 
 	if (stream_config.ch_count > runtime->hw.channels_max) {
 		stream_config.ch_count = runtime->hw.channels_max;
-- 
2.34.1

