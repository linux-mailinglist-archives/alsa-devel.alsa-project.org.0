Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B925636F
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 01:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7C7E18CD;
	Sat, 29 Aug 2020 01:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7C7E18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598656962;
	bh=+SQc60KJfz4gwyntBUAIrlL+3zYWjhZvRmc7CLeSRM0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aIo+KTCXjyMSwIB+uFfu64685BP7TlwdL2OtyMHW4dGHcyKP4ZD/+wg7w3D0yZdUU
	 JI9Nma636VRNVz10O1ATuPTSr9xyygn2gAW2ZYQT/rA4Ei5LUud8C/JR7ASFqGjwkc
	 4lCy/EM4Db4RJwTkW38o7yCwMtulDfsplD4abwck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A44F800EB;
	Sat, 29 Aug 2020 01:21:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D388F8016F; Sat, 29 Aug 2020 01:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE40EF800EB
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 01:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE40EF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="LUFgVPrt"
Received: by mail-pj1-x1044.google.com with SMTP id n3so347802pjq.1
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 16:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vekX/Mq23RWwnDgk+6LdcBexEyHMvoMGcRuZ1SgDRMk=;
 b=LUFgVPrt2Xx4hKMx9nbPEckkaLhVk6gHlJYu31JIplGtbqqbxXGUs9Ik6zkfNEzONc
 Fepsz9ipT6OZQsO5sUpYT1lTke6Xc3PnJAMODWEsolbqaXJvBZ7hg8bsyHYf9Vsqqf1m
 qIT2L2wYuYRca4ABfr2Odlioxk5YGEVymiJNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vekX/Mq23RWwnDgk+6LdcBexEyHMvoMGcRuZ1SgDRMk=;
 b=Orj+2KHcWyJvhWAx5Maxsbg/XWRTVFS4UcHjwEfvIRrCdgRRQCj9YZ1FI/+mYTy2wR
 S/odxtbF/3krjyLMwgvOkuPJdGfVatVapX1Z3E+eTdTn6Hf9bbGsmkFBPKWqFrWNpMS7
 2Gq+o84byd7QCLSW3t37IDa+H2UipoXWHqUH9XhULZenmJs4zR2OA7Gra0IseSHc7eL4
 HIo9WzKrvdrg7DRtNFvP6TodBiZsKkpH2rCBYxkyn24WKrs+sDzFHwMKL0VNEKL1bcU/
 ml3/GpLpWycJgeAoCBxLgyKvS1wQ1syi91I9B15Th5xjiSB+lbMvyaFQ5uDvsrzNq1AN
 noBA==
X-Gm-Message-State: AOAM533FnLv/HAm6KiaqxcQuJWdqTw4mGmWTWuu7cMiZdSusNJrmYz9F
 EqRMEDNzBUX1Xuije3DJN69vvA==
X-Google-Smtp-Source: ABdhPJw5KEwmKeKe8mZkKXkaEnaqU+EpMdmR9lHHNGzs1BSmbnljanSuhsnw5f0EIMVjUuqQ+S6WOA==
X-Received: by 2002:a17:902:c24b:: with SMTP id 11mr922349plg.64.1598656851274; 
 Fri, 28 Aug 2020 16:20:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id h10sm517971pgn.32.2020.08.28.16.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 16:20:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: rt5682: Prefer async probe
Date: Fri, 28 Aug 2020 16:20:27 -0700
Message-Id: <20200828162005.1.I4f67f494c4f759b0e5c7f487e040dfdcf16e0876@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 cychiang@chromium.org
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

The probe of rt5682 is pretty slow.  A quick measurement shows that it
takes ~650 ms on at least one board.  There's no reason to block all
other drivers waiting for this probe to finish.  Set the flag to allow
other drivers to probe while we're probing.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
NOTE: I haven't done any analysis of the driver to see _why_ it's so
slow, only that I have measured it to be slow.  Someone could
certainly take the time to profile / optimize it, but in any case it
still won't hurt to be async.

This is a very safe flag to turn on since:

1. It's not like our probe order was defined by anything anyway.  When
we probe is at the whim of when our i2c controller probes and that can
be any time.

2. If some other driver needs us then they have to handle the fact
that we might not have probed yet anyway.

3. There may be other drivers probing at the same time as us anyway
because _they_ used async probe.

While I won't say that it's impossible to tickle a bug by turning on
async probe, I would assert that in almost all cases the bug was
already there and needed to be fixed anyway.

 sound/soc/codecs/rt5682-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 85aba311bdc8..6b4e0eb30c89 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -294,6 +294,7 @@ static struct i2c_driver rt5682_i2c_driver = {
 		.name = "rt5682",
 		.of_match_table = rt5682_of_match,
 		.acpi_match_table = rt5682_acpi_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = rt5682_i2c_probe,
 	.shutdown = rt5682_i2c_shutdown,
-- 
2.28.0.402.g5ffc5be6b7-goog

