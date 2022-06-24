Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B1559680
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 11:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1BB5187A;
	Fri, 24 Jun 2022 11:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1BB5187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656062831;
	bh=/O0LQZyqZjmSBg9puEGZip40I7jXhFp3KCK53kp2VhY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Aav03jI7E9VR4m8O9W17DlHIyEEuxUWqWLQMVTaRMrqFIVCPEItTm8S3oaWOeR7IY
	 Wr0+HpEZ5gaSujGMjx+V8czRN+j+XJACY1fBmKoBUHqNJylw5BYAS3LDmPOK6Ai3sN
	 yr0DbHtiidU+RsLPIK2ja4aqBCrdUkK+wrKGgkT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48D87F80165;
	Fri, 24 Jun 2022 11:26:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AAE6F800CB; Fri, 24 Jun 2022 11:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF03EF800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 11:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF03EF800CB
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1o4fZj-0001yf-Ry; Fri, 24 Jun 2022 11:26:03 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1o4fZg-002Otj-V4; Fri, 24 Jun 2022 11:26:02 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1o4fZh-00AG7u-P6; Fri, 24 Jun 2022 11:26:01 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: audio_graph_card2: Fix port numbers in example
Date: Fri, 24 Jun 2022 11:26:01 +0200
Message-Id: <20220624092601.2445224-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

The example in audio-graph-card2.c has multiple nodes with the same name
in it. Change the port numbers to get different names.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/generic/audio-graph-card2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 77ac4051b8276..d34b29a49268e 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -90,12 +90,12 @@ links indicates connection part of CPU side (= A).
 			ports@0 {
 (X) (A)			mcpu:	port@0 { mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
 (y)				port@1 { mcpu1_ep: endpoint { remote-endpoint = <&cpu1_ep>; }; };
-(y)				port@1 { mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>; }; };
+(y)				port@2 { mcpu2_ep: endpoint { remote-endpoint = <&cpu2_ep>; }; };
 			};
 			ports@1 {
 (X)				port@0 { mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>; }; };
-(y)				port@0 { mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
-(y)				port@1 { mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
+(y)				port@1 { mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
+(y)				port@2 { mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
 			};
 		};
 	};
-- 
2.30.2

