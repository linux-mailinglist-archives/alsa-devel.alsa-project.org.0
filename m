Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF46152774
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 09:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABFD169C;
	Wed,  5 Feb 2020 09:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABFD169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580890571;
	bh=u5aQInrml1MOFXf6zxJmuRL8LI5nmLVuhJOpMJok7qw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1EJgduJPTqljBpad5uI8XT2ofkCOixNHwNXVCPeYJVQTouPMu6xvwN23sAElmBp4
	 CJr17lLTeBhu9aWKM2KG3jzh/6PxBYpobFxZoaY08rvv3u5+rtNmtsQ9NwQcvg6iXe
	 0KWvrXDh0GslVvzt5wYc+CZfXLxrLbT8ml1vhxR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAE96F800AB;
	Wed,  5 Feb 2020 09:12:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F34CF80279; Wed,  5 Feb 2020 09:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F07F80148
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 09:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F07F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="DSx4+8SZ"
Received: by mail-pf1-x443.google.com with SMTP id q8so792916pfh.7
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yx3PdR2KHIeLwMva7mSmkX/voAZgjOltWtTOmYLfJuU=;
 b=DSx4+8SZu/JJ8FOlN2sAjDJaeJdRj54OLYBgmDHrEPj6xiAnQkFcahbiAt7/9+lhCH
 eWLtH+rtfmMcszANT9XdqPz4nS90D04WgADcJhNpkpdwHXCW3ekbqmZcQ52dYh6VcNtP
 tmBp++OFMJ51BoSqMvNWd5ga4N3qaq/mPFeP4eA7VXy+QuFNC1rz9q0ZGMVB8wIUSshj
 dCJZlNODSZSbbc+GnSQNtbXDcYCDsXOiqPFwK8i4pqMPLWv4Om6wZR+00bPI91GvldEy
 U1E53iuLHXv7c51yav9R1hnY3YDIZzmoZuZweGp1VFDEWIlbozOHQfzzFbBvYi8MP6Zi
 6zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yx3PdR2KHIeLwMva7mSmkX/voAZgjOltWtTOmYLfJuU=;
 b=FX9mSsskwCeoJjkP3MqLGW8aBJxPnqDOBtFzWkZJpPOcpg6yxVjIrfIWZ4Wm0g3xAJ
 UCNgUOYGjh/GzhWpKlPmBwYVMtsfmZ+BgaYNRZ5vEPvMaa6j7W8Pb1HOpEOilFEUZBZ3
 5597PRspT4gBFHcoWDJbPYg0enTGUHKm12k+c5lEbV4mgIy22aK+leeDRuaaxWE12A/R
 +7kbxpu4cEjbPYHoxgJ1VDIaiBSQyL/7UGsNCzSEDmmMN3EQgPB2jzpIZMyHUM6mts8I
 5qt14igmFwynVe/Hf4TT3yXkKueZxM9fqlQaaDzAgUj1wdEXizt/WQQH5Wrf5q/Ju5Ni
 ztVw==
X-Gm-Message-State: APjAAAV2crw8UtMCLHN0/DyWZkhu8ONhplzWNSrKxel2afayEFOn09eK
 bnes/TdTCjugGaHZIALbTToHnvkWkncfzQ==
X-Google-Smtp-Source: APXvYqzsihNMVp7pjySQ1KAqrcQkhCCq7lENdoKk8ClpomxiqkfZO3Wy8jt0nR9O3OnMBZFAFi+Rug==
X-Received: by 2002:aa7:8098:: with SMTP id v24mr36146951pff.33.1580890362416; 
 Wed, 05 Feb 2020 00:12:42 -0800 (PST)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id d24sm29083508pfq.75.2020.02.05.00.12.41
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 00:12:41 -0800 (PST)
From: Michael Forney <mforney@mforney.org>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Feb 2020 00:12:21 -0800
Message-Id: <20200205081221.18665-4-mforney@mforney.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200205081221.18665-1-mforney@mforney.org>
References: <20200205081221.18665-1-mforney@mforney.org>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH alsa-utils 4/4] Avoid empty initializer list
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

To zero-initialize an object, use `{0}` instead.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 alsamixer/cli.c             | 2 +-
 amidi/amidi.c               | 2 +-
 seq/aplaymidi/aplaymidi.c   | 2 +-
 seq/aplaymidi/arecordmidi.c | 2 +-
 seq/aseqdump/aseqdump.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/alsamixer/cli.c b/alsamixer/cli.c
index 3f8f52f..7468325 100644
--- a/alsamixer/cli.c
+++ b/alsamixer/cli.c
@@ -58,7 +58,7 @@ static void parse_options(int argc, char *argv[])
 		{ .name = "view", .has_arg = 1, .val = 'V' },
 		{ .name = "no-color", .val = 'g' },
 		{ .name = "abstraction", .has_arg = 1, .val = 'a' },
-		{ }
+		{ 0 }
 	};
 	int option;
 	int card_index;
diff --git a/amidi/amidi.c b/amidi/amidi.c
index c6268e4..cde4697 100644
--- a/amidi/amidi.c
+++ b/amidi/amidi.c
@@ -469,7 +469,7 @@ int main(int argc, char *argv[])
 		{"active-sensing", 0, NULL, 'a'},
 		{"clock", 0, NULL, 'c'},
 		{"sysex-interval", 1, NULL, 'i'},
-		{ }
+		{0}
 	};
 	int c, err, ok = 0;
 	int ignore_active_sensing = 1;
diff --git a/seq/aplaymidi/aplaymidi.c b/seq/aplaymidi/aplaymidi.c
index b086e70..e8491e1 100644
--- a/seq/aplaymidi/aplaymidi.c
+++ b/seq/aplaymidi/aplaymidi.c
@@ -869,7 +869,7 @@ int main(int argc, char *argv[])
 		{"list", 0, NULL, 'l'},
 		{"port", 1, NULL, 'p'},
 		{"delay", 1, NULL, 'd'},
-		{}
+		{0}
 	};
 	int c;
 	int do_list = 0;
diff --git a/seq/aplaymidi/arecordmidi.c b/seq/aplaymidi/arecordmidi.c
index 604cd0d..2034df7 100644
--- a/seq/aplaymidi/arecordmidi.c
+++ b/seq/aplaymidi/arecordmidi.c
@@ -740,7 +740,7 @@ int main(int argc, char *argv[])
 		{"metronome", 1, NULL, 'm'},
 		{"timesig", 1, NULL, 'i'},
 		{"num-events", 1, NULL, 'n'},
-		{ }
+		{0}
 	};
 
 	char *filename = NULL;
diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index 578e06f..44ae3bb 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -357,7 +357,7 @@ int main(int argc, char *argv[])
 		{"version", 0, NULL, 'V'},
 		{"list", 0, NULL, 'l'},
 		{"port", 1, NULL, 'p'},
-		{ }
+		{0}
 	};
 
 	int do_list = 0;
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
