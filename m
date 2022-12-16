Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F6664E822
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 09:27:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 056A8172F;
	Fri, 16 Dec 2022 09:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 056A8172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671179242;
	bh=zydTTqQ4+SLBBwo4sVJhl7ZG40+SC36k08EWeHOYlkw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DkE24HpTMtC+ZwePSIEkyddcg+B4wVfLeVHqa3/WIWV/v37mTgvon3ZcVm/Z6Up0x
	 WwSsS96Gqy4JNIrYYPA/g2DGNViV4vGRAA8fYOv0pOiLGVPkzjEp4xQpgr+wi4gnuF
	 P0KLyjo08bsO1ZRDU6UbOzBPaLe8Cz3XXtsVZ9R4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940B4F804CB;
	Fri, 16 Dec 2022 09:26:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43D12F804CB; Fri, 16 Dec 2022 09:26:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 548E3F804CB
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 09:26:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 548E3F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=pEMYZrKZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1671179181;
 x=1702715181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uW0jnoDcdvYMUbyt9zm9YtjxeR1GwOdQOWBDidHKg50=;
 b=pEMYZrKZFyC1980+JeS2C4+Ud+X+EdYlPnKPX1TcVF7Pvs7OSTn8pKVx
 Ic0eIpQyG2twCM8EFirzpEUtuxnVcAC1kOtiK8wXySONLe9HaQSVES5AQ
 KrK6rtX21Q6DY4PPLh0VEfiBkHRAbfR9vZep5jpWP72hTKM0CyKOzcvhi
 x9LEW/L04hzR8UWaVpPRNRWtrwdj6oXFf07lh5aXXHSumq6ZQT2Uuv/T0
 lisVOE8P6G6K8GQ5GlKfJzs9pD/DSjGuBti2kUVGEmLsYIcv+oEKmIOiW
 NWB1vLSMwluvyq2T3x/RTzQUkGb+PSh6lhD6IkjBfh5qjZJpp0i+4eL3i w==;
From: Jonas Holmberg <jonashg@axis.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] pcm: hw: Do not return error unless there is one
Date: Fri, 16 Dec 2022 09:26:13 +0100
Message-ID: <20221216082613.2439067-1-jonashg@axis.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

Add a line that was removed by mistake in commit
7f2d6c3aac3505ceee4b0d3e8b3ca423ce29b070.

Signed-off-by: Jonas Holmberg <jonashg@axis.com>
---
 src/pcm/pcm_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index 0588ce5e..daa3e1ff 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -356,7 +356,7 @@ static int snd_pcm_hw_hw_refine(snd_pcm_t *pcm, snd_pcm_hw_params_t *params)
 	if (hw->rates.min > 0) {
 		err = _snd_pcm_hw_param_set_minmax(params, SND_PCM_HW_PARAM_RATE,
 						   hw->rates.min, 0, hw->rates.max + 1, -1);
-
+		if (err < 0)
 			return err;
 	}
 
-- 
2.37.4

