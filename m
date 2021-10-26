Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0991E43AF90
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 11:56:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9172416D7;
	Tue, 26 Oct 2021 11:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9172416D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635242169;
	bh=nyUiNsWaXu7J7EBCjgMBONE2lBGC6AijnH3+208gHk0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QJ4wvpFrlNrdNMvdi+VdBi9zgY+CIFgrezdQERotrFA2zELFO2WU1xgB8xGSi5yQS
	 pp3MPS+jhGzSoPtpppdEm2lspjvLlDiMezAp+st4TrKqmpBt1wPyaC8Rt+rQmQEm9y
	 beDahhatFT2JUyYfvIp981mL83oWUikkAlrCAFcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A64F8010A;
	Tue, 26 Oct 2021 11:54:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2139F802E7; Tue, 26 Oct 2021 11:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E42F7F80269
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 11:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E42F7F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IcCrcZA6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03A7D60F24;
 Tue, 26 Oct 2021 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635242081;
 bh=nyUiNsWaXu7J7EBCjgMBONE2lBGC6AijnH3+208gHk0=;
 h=From:To:Cc:Subject:Date:From;
 b=IcCrcZA6ot/XDbhxUd+ZROF+GVbjsIi9MGCTkO6xkTLTMrWzMPIMvHk4UN7tysl63
 bxH75ZdPC3kMW433GIjN69XarQu5ic2SukukWUrfVH+r/KSgDpiKqMQL8kGzfYUGwr
 xKidZ4eZJ+7PhkdMPIdIbsYgw+C0Gy51P1VNLtMc2Um1/QshPAHvuGPW97v5vspN8B
 QA9y2RGbc+LV0xQKVzUW6EU8XkeKkJuaTyRmkYvH7Eg/izoy8RmsZ8fyI8Wkt3Iufw
 euwNO+WFOFl4jwQsrKfTg9NU3lGnkXLLxzVW827kUnKihjDoTw5gSEID1TAYHpUPhm
 0YnwekDKkhszg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mfJA0-0006uh-Kv; Tue, 26 Oct 2021 11:54:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH] sound: ua101: fix division by zero at probe
Date: Tue, 26 Oct 2021 11:54:01 +0200
Message-Id: <20211026095401.26522-1-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Johan Hovold <johan@kernel.org>
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

Add the missing endpoint max-packet sanity check to probe() to avoid
division by zero in alloc_stream_buffers() in case a malicious device
has broken descriptors (or when doing descriptor fuzz testing).

Note that USB core will reject URBs submitted for endpoints with zero
wMaxPacketSize but that drivers doing packet-size calculations still
need to handle this (cf. commit 2548288b4fb0 ("USB: Fix: Don't skip
endpoint descriptors with maxpacket=0")).

Fixes: 63978ab3e3e9 ("sound: add Edirol UA-101 support")
Cc: stable@vger.kernel.org      # 2.6.34
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/usb/misc/ua101.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 5834d1dc317e..4f6b20ed29dd 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -1000,7 +1000,7 @@ static int detect_usb_format(struct ua101 *ua)
 		fmt_playback->bSubframeSize * ua->playback.channels;
 
 	epd = &ua->intf[INTF_CAPTURE]->altsetting[1].endpoint[0].desc;
-	if (!usb_endpoint_is_isoc_in(epd)) {
+	if (!usb_endpoint_is_isoc_in(epd) || usb_endpoint_maxp(epd) == 0) {
 		dev_err(&ua->dev->dev, "invalid capture endpoint\n");
 		return -ENXIO;
 	}
@@ -1008,7 +1008,7 @@ static int detect_usb_format(struct ua101 *ua)
 	ua->capture.max_packet_bytes = usb_endpoint_maxp(epd);
 
 	epd = &ua->intf[INTF_PLAYBACK]->altsetting[1].endpoint[0].desc;
-	if (!usb_endpoint_is_isoc_out(epd)) {
+	if (!usb_endpoint_is_isoc_out(epd) || usb_endpoint_maxp(epd) == 0) {
 		dev_err(&ua->dev->dev, "invalid playback endpoint\n");
 		return -ENXIO;
 	}
-- 
2.32.0

