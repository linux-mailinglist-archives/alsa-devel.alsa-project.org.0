Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B97520CC01
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 05:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DC71658;
	Mon, 29 Jun 2020 05:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DC71658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593399740;
	bh=f9a/Uh2FgpVP1xpkgrlsgWUZHoP34cJM8i5Cfs8bVow=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a7ky0dYRWyZcj0Hr5jpsMQ6Af8YVo2C9QR9E8yWeU39zSmGPjIYhvjxu5zOl4TJ4R
	 /jTImHYOBjm2LuDw19k+Sg2rUZSVUWfej2QfaJ1Vs8OxVm/N6bhwMB2bGJCWX3/9u3
	 kaN5M/2MbwaNEbJ1OMyMLq5SiGMzptPem7mZFOrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD42F80256;
	Mon, 29 Jun 2020 04:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C99F8020C; Mon, 29 Jun 2020 04:59:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A8ABF800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 04:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A8ABF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="KzRR0dcf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mc9i2ZK3gwds1gRgo2eSMw+8HK7J7GXFupwKk48KXpg=; b=KzRR0dcfcDTghi2kcLCWCQBJqE
 s2XLkSfaVZyHB5NuOYP3ntzCu8HdiUltkyLmGiK/JcNDFOmtk3kNCydSNXoO6iiNYtFn7LmRP15bj
 hKFQiPet14SyqJI7nUbxd6FkEJXYf0nY46hsT5si9HVFSg1EwheGs8RRE/gS3+QWWyiQ=;
Received: from [2a00:1370:8125:614e:c510:d933:d0ef:dfce]
 (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1jpk1A-000nGE-6D; Mon, 29 Jun 2020 05:59:36 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: usb-audio: Fix packet size calculation
Date: Mon, 29 Jun 2020 05:59:33 +0300
Message-Id: <20200629025934.154288-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Peter Bui <pbui@kernel.bx612.space>
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

Commit f0bd62b64016 ("ALSA: usb-audio: Improve frames size computation")
introduced a regression for devices which have playback endpoints with
bInterval > 1. Fix this by taking ep->datainterval into account.

Note that frame and fps are actually mean packet and packets per second
in the code introduces by the mentioned commit. This will be fixed in a
follow-up patch.

Fixes: f0bd62b64016 ("ALSA: usb-audio: Improve frames size computation")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208353
Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/endpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 9bea7d3f99f8..11f23778f0a5 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1093,6 +1093,7 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 		ep->freqn = get_usb_high_speed_rate(rate);
 		ep->fps = 8000;
 	}
+	ep->fps >>= ep->datainterval;
 
 	ep->sample_rem = rate % ep->fps;
 	ep->framesize[0] = rate / ep->fps;
-- 
2.26.2

