Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705D5EB35A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 23:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05BAA204;
	Mon, 26 Sep 2022 23:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05BAA204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664228529;
	bh=nJA1vq18hGF5czX+YZ/5cu1/Q/04JTv3WsfWyuNLU98=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jJ9PKwseE1PJ8HQdQgPRJSOvVPn2pi4DKfwyJF5TzCM+1r5FQoilGWai3GZMeLOFa
	 GaXpuAVX4Xdqk5mKv1ragWWpbnyAPmFeqmbw4Dd1H3bTQ1r0mPN2wHP0ll1d1/7HHb
	 yYr3H4gZx3rIQdlsYBKUCXTgsUiyC2DtdtlJMiY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 626D0F802BE;
	Mon, 26 Sep 2022 23:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE4A3F8027D; Mon, 26 Sep 2022 23:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 606E2F80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 23:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 606E2F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LdO+D7fr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3488D6146C;
 Mon, 26 Sep 2022 21:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BDCC433D6;
 Mon, 26 Sep 2022 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664228460;
 bh=nJA1vq18hGF5czX+YZ/5cu1/Q/04JTv3WsfWyuNLU98=;
 h=Date:From:To:Cc:Subject:From;
 b=LdO+D7fr3NTekOZ9TO67LzdnRndI0bSiPuk/vaSCbQnh5IexuusEDs2JQSzOQX/+h
 IhZ/2ymVHFA+S68q8XKpPhonAyPaKWHq7ufKKqioe9KIYMYHySV3B/v9jMfAOwBmp6
 Y95W2p68e7AzJBWJGNR4xZvU2FJ2UZZambRQ0pz101mm3piun/eEQGp/0AG6VahTll
 Y1dlozoUohWuLcC4s10H291NHlbNt+IyM1HgtlN6Mkv78emhcQCemBMXXbisPGW2pb
 qtmwVVJo9KRCKnyk7FpCgNt5bwYuZjPqfPw3gM6Il2YWx/hBp3Cf8dKQsg5RAUS89Q
 E5sMUgfSVkd3w==
Date: Mon, 26 Sep 2022 16:40:55 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <YzIcZ11k8RiQtS2T@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Zero-length arrays are deprecated and we are moving towards adopting
C99 flexible-array members, instead. So, replace zero-length arrays
declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
helper macro.

This helper allows for flexible-array members in unions.

Link: https://github.com/KSPP/linux/issues/193
Link: https://github.com/KSPP/linux/issues/211
Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/sound/sof/control.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/sof/control.h b/include/sound/sof/control.h
index 7379a33d7247..983d374fe511 100644
--- a/include/sound/sof/control.h
+++ b/include/sound/sof/control.h
@@ -117,11 +117,11 @@ struct sof_ipc_ctrl_data {
 	/* control data - add new types if needed */
 	union {
 		/* channel values can be used by volume type controls */
-		struct sof_ipc_ctrl_value_chan chanv[0];
+		DECLARE_FLEX_ARRAY(struct sof_ipc_ctrl_value_chan, chanv);
 		/* component values used by routing controls like mux, mixer */
-		struct sof_ipc_ctrl_value_comp compv[0];
+		DECLARE_FLEX_ARRAY(struct sof_ipc_ctrl_value_comp, compv);
 		/* data can be used by binary controls */
-		struct sof_abi_hdr data[0];
+		DECLARE_FLEX_ARRAY(struct sof_abi_hdr, data);
 	};
 } __packed;
 
-- 
2.34.1

