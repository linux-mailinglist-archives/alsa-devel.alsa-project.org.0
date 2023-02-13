Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7CD6997F5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:54:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D97EC1;
	Thu, 16 Feb 2023 15:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D97EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559281;
	bh=gIV/oJRw26WlvPqibHioU11aUhIPun7fMfARunHmZBQ=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qlCy4kjn1rBB7RhajdujrQzeDdPoNmWlkQmyemXcOy9Rj3dj2VNtwpFbJG5EaXelL
	 P5EUhn22aRclM23rlaxwT1z+mybz3LuN/Q2XQ4vEuteLoUK087apz7CliZQD1SsKBV
	 PKi7M93L5oiAvfNUlfwHYJQMGfksAku4klj24tAg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7845CF80533;
	Thu, 16 Feb 2023 15:53:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53D2FF804B4; Mon, 13 Feb 2023 18:41:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7A97F800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 18:41:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A97F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256
 header.s=mailo header.b=fGoIHUGo
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1676310049; bh=gIV/oJRw26WlvPqibHioU11aUhIPun7fMfARunHmZBQ=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=fGoIHUGorho3vV4FPnzXe5AxlralGTCDzDUI5xIZ4lR8uTvrTxKPPCw/O4IvSFa3/
	 ld+jfYUyb8Hvb7YP/7BGGH6p2xMSP7MMVaOWEltVYzmVyRMFdfnw7kmLolGY1MtL0K
	 ZhzMEu5q1RSK6BIzxM6+GG0LZYWHzcnIw8lthEZ8=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon, 13 Feb 2023 18:40:49 +0100 (CET)
X-EA-Auth: 
 aED07gXN0glhKVo5pX08bsrz9596Z3CtvxLY3EviswtJbMPx2KMKyKYpVSExM4qOSx/YOIsZOPfNOTX8GPDySJhsn78U3eDA
Date: Mon, 13 Feb 2023 23:10:46 +0530
From: Deepak R Varma <drv@mailo.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd934x: Use min macro for comparison and
 assignment
Message-ID: <Y+p2Hn0nrtHiKwPR@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J7UBMG6XGUB727TOZEAF3XU77Z6POJAC
X-Message-ID-Hash: J7UBMG6XGUB727TOZEAF3XU77Z6POJAC
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:53:34 +0000
CC: Saurabh Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7UBMG6XGUB727TOZEAF3XU77Z6POJAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify code by using min helper macro for logical evaluation and value
assignment. The change also facilitates code realignment for improved
readability.
Proposed change is identified using minmax.cocci Coccinelle script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 sound/soc/codecs/wcd934x.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 28175c746b9a..783479a4d535 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -4737,13 +4737,9 @@ static u32 wcd934x_get_dmic_sample_rate(struct snd_soc_component *comp,
 	if (dec_found && adc_mux_index <= 8) {
 		tx_fs_reg = WCD934X_CDC_TX0_TX_PATH_CTL + (16 * adc_mux_index);
 		tx_stream_fs = snd_soc_component_read(comp, tx_fs_reg) & 0x0F;
-		if (tx_stream_fs <= 4)  {
-			if (wcd->dmic_sample_rate <=
-					WCD9XXX_DMIC_SAMPLE_RATE_2P4MHZ)
-				dmic_fs = wcd->dmic_sample_rate;
-			else
-				dmic_fs = WCD9XXX_DMIC_SAMPLE_RATE_2P4MHZ;
-		} else
+		if (tx_stream_fs <= 4)
+			dmic_fs = min(wcd->dmic_sample_rate, WCD9XXX_DMIC_SAMPLE_RATE_2P4MHZ);
+		else
 			dmic_fs = WCD9XXX_DMIC_SAMPLE_RATE_4P8MHZ;
 	} else {
 		dmic_fs = wcd->dmic_sample_rate;
-- 
2.34.1



