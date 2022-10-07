Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C792E5FAC0F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55EB23650;
	Tue, 11 Oct 2022 08:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55EB23650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468198;
	bh=N+NuVxqRooNTakbxk1bqF3wFzdu4yfd8bsHoqtziESA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vdo4XEzJiEG8Re8A4Ij7BVnBBmkIG8Iq4LlApgoZT3QBdAbuBQHkFubl3DqgundbB
	 wxvUzF1JcNWGkCr8lk88uciWu2OO9kIVI8nyGYm4ATLNvVG6x4zMfGhTGn+sZfHHIZ
	 NSHWpluNISz7MlRwAKi03WaxfW9emCP+60iRdyUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD1D6F8021D;
	Tue, 11 Oct 2022 08:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C2AF8025E; Fri,  7 Oct 2022 17:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03858F8012B
 for <alsa-devel@alsa-project.org>; Fri,  7 Oct 2022 17:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03858F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dylanvanassche.be
 header.i=@dylanvanassche.be header.b="xNNjmk0w"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4MkXy85zXBz9sRG;
 Fri,  7 Oct 2022 17:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
 s=MBO0001; t=1665158256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k35lImm5f5L+QWNkc7HMTUrpu9Bmr/eFTnLYAfMsySo=;
 b=xNNjmk0wETjtFc8+yEGHj7biMko3UcZa68E1WWTBLCDslNz0iGtwm8BccG+ys+nhveoLoK
 LKDPO9PhD72itXKG4qZTLOxKk2wRy9ipB2DPiUS1u3aLHirm79s+nhwhzJH3CplYSCCYJP
 W7Sn/N7apRRnwvBlF4e6EobfDAeOyPJcQAH2ab/RCl+KrJ+M1iv0SquBgiFzPimbadYOsy
 myKknYM8fgjYYLP8OU4TOxrtofOWpewyISyVPMS/gCYawnoC92FsrCC68TmjXe781zdz5l
 otRNXAELmKW5KBzcEZeT3TED78pdwcEiQCEOzYSISH1TTi7ReW7YuiaK+lqYOA==
From: Dylan Van Assche <me@dylanvanassche.be>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sound: soc: codecs: wcd-mbhc-v2: expose ALSA control for
 jack
Date: Fri,  7 Oct 2022 17:57:16 +0200
Message-Id: <20221007155716.10594-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:20 +0200
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Dylan Van Assche <me@dylanvanassche.be>
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

Jack detection is currently fully functional via the input
interface together with multimedia buttons, but is not exposed
as an ALSA control. Therefore, ALSA clients such as PulseAudio
do not pick up the jack detection events as they only support
one of the possible interface (ALSA control or input interface,
but not both). Expose the jack events as an ALSA control and input
interface to provide ALSA clients both interfaces.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 1911750f7445..1b75f49b2858 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -725,6 +725,10 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 
 	mutex_lock(&mbhc->lock);
 
+	ret = snd_jack_add_new_kctl(mbhc->jack->jack, "Headset Jack", WCD_MBHC_JACK_MASK);
+	if (ret)
+		dev_warn(component->dev, "failed creating Headset Jack kctl with err: %d\n", ret);
+
 	/* enable HS detection */
 	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
 		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
-- 
2.37.3

