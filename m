Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6453327FE1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E2E81688;
	Mon,  1 Mar 2021 14:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E2E81688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606428;
	bh=vdzXL2/ySjHgTH+ijSHxEwyHJcY2nnm7r32wop9NIxg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROQcLH+sB1B9gqgi+TVcUDy4V/NDEycFoJ8hJPAFUK19kFcRveDUWRSmNh2NmR0fP
	 wRK1bQOuwvL2/X+Wedz2s8246UVcPVI64vRjiIoBmFpQJEzhbKArd5QRNfayISsCKj
	 En1YUR/K4J1QUbC9FqwKs8yX9NWD80CEW2YTQHPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 380B7F8051C;
	Mon,  1 Mar 2021 14:43:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C943F8025E; Fri, 26 Feb 2021 14:35:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87D14F80161
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 14:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D14F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q7wdNd7f"
Received: by mail-wm1-x329.google.com with SMTP id w7so7449636wmb.5
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 05:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxac2EZ2FKYl4R5ArrNEemLJ12gs169LloPc1HbjabE=;
 b=Q7wdNd7fXk1oXdTO4LTL5UVoul4SoOp86RO7p2GNkUWHolJ8s6fyL5c7EUQPlbc5SF
 vbt5Hv8KGy9I40tq4Za71fDvGeRnYb+jvmOyGKq76dAl18DdH1984PuUgh7fGF8x2xZE
 0QdwhqVd3MEpgGgt7YxtqTa4Pw7jjvwNLl2qelfPc3kMCdVju2txTbbvzrprN1S5/+w8
 opijqiOJAvCuwdXNuPkbuk0rXiOfuin40APB8r6tHAz1g0FkEpFewhIgrhG2n4ftFF88
 CONKrQFsYTl4Gjli2rq22TFybz0GH9tTcitzFstZf4/k4DHmO89LxNEhG92/Luz8rvcI
 uz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxac2EZ2FKYl4R5ArrNEemLJ12gs169LloPc1HbjabE=;
 b=nNfA6SDuORR2m/m/nqtzJOOf3qPymScWZG0sl9Cd/wFkb73OwxZqQ7yDHUNxS3yO9x
 yCLM0b3BkXwmcet/xvt+GGLu0bcdmcYC4m6G541Y6wsIVYyfs+X0yYHi2QeKhniHU2Tq
 rT866fD11P12CrHl9kbwQNBp2hWg5EsUaNmR5e6AXrYM1t+JxxzNV6VutxKbluNmbkMO
 O9j54QLdoCfKE2YIjy4bgLXRLXOPyNHdiw/PacK/7635Phe6d0UcJZEtOOGyVlUJfTbp
 inmKAhmXMRxvLYI7iBPr4xiImLFlUthTMJjZK3OCUSWCPK/+7EK60EjVrQVB/XbKhu9R
 cKAw==
X-Gm-Message-State: AOAM5328NovuUW3JqhPk3C6pLFYI0R99/jZ2yButc7B6IZ1MlW0eKJcS
 sduTxHYKmt5C/VZ0NYMQMunLslm/ysz5f3m7
X-Google-Smtp-Source: ABdhPJwGvYvW1L1F26puN0lUXcUBDZ1s2nfKM58Lthhzo39PBEe+oObtS+jlE9H+UfR+2OjThY5FXA==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr3007047wmj.122.1614346520353; 
 Fri, 26 Feb 2021 05:35:20 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c26sm13175547wrb.87.2021.02.26.05.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:35:20 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: usb-audio: Configure Pioneer DJM-850 samplerate
Date: Fri, 26 Feb 2021 14:34:28 +0100
Message-Id: <20210226133429.20081-4-nicolas.mure2019@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226133429.20081-1-nicolas.mure2019@gmail.com>
References: <20210226133429.20081-1-nicolas.mure2019@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Mar 2021 14:43:22 +0100
Cc: Nicolas MURE <nicolas.mure2019@gmail.com>, livvy@base.nu
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

Send an `URB_CONTROL out` USB frame to the device to configure its
samplerate. This should be done before using the device for audio
streaming (capture or playback).

About the change of `usb_rcvctrlpipe` to `usb_sndctrlpipe`, I reached
the author of this line and she agrees about this change. Control frames
to set device options should have the `out` direction instead of the `in`
direction.

See https://github.com/nm2107/Pioneer-DJM-850-driver-reverse-engineering
    /blob/172fb9a61055960c88c67b7c416fe5bf3609807b
    /doc/windows-dvs/framerate-setting/README.md

Signed-off-by: Nicolas MURE <nicolas.mure2019@gmail.com>
---
 sound/usb/quirks.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 9ba4682ebc48..d02dac5fcd40 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1482,7 +1482,7 @@ static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs,
 	usb_set_interface(subs->dev, 0, 1);
 	// we should derive windex from fmt-sync_ep but it's not set
 	snd_usb_ctl_msg(subs->stream->chip->dev,
-		usb_rcvctrlpipe(subs->stream->chip->dev, 0),
+		usb_sndctrlpipe(subs->stream->chip->dev, 0),
 		0x01, 0x22, 0x0100, windex, &sr, 0x0003);
 	return 0;
 }
@@ -1503,6 +1503,9 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x2b73, 0x0013): /* Pioneer DJM-450 */
 		pioneer_djm_set_format_quirk(subs, 0x0082);
 		break;
+	case USB_ID(0x08e4, 0x0163): /* Pioneer DJM-850 */
+		pioneer_djm_set_format_quirk(subs, 0x0086);
+		break;
 	}
 }
 
-- 
2.29.2

