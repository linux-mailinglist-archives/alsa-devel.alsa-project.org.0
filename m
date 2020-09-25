Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650D278342
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 10:52:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A59CC183D;
	Fri, 25 Sep 2020 10:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A59CC183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601023944;
	bh=+zJ8FWYNpYlCLv0Y6BDibFkbaeDFB989v55Bv6m7Urs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l29sp3Ve2A5Mhvo6dN6NVpf8c/ArtEglHnq6hpfAFlctWCXaoImy9dlQG7EUaMemq
	 td/XjrmIBI2Y0rmqVYt8mQ1DiWdYiHMgxQDhUXE2rtskEDb9lkbeS4Kf9tGM6L1sYY
	 lSroiM4WWAxBU9gr7iVTgL8fsdf9S2E85wRCpnws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B9BF80254;
	Fri, 25 Sep 2020 10:50:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6308AF800F6; Fri, 25 Sep 2020 10:49:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C66F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 10:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C66F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BBP+yI6T"
Received: by mail-wr1-x441.google.com with SMTP id z4so2692695wrr.4
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qms1gS4lsjyq2EFAJKsceqVkipGb5r5O0I7UP489Fdo=;
 b=BBP+yI6T825MLog7mvJ2vPGBwhstGthx3TiYbLE+w4tC+KUeJrjlznXJdb2pJGr/eK
 nGCix7rYk/S85var/SyzggRGil9X64GgXXmegH0YJ9B0kkLT0T6Qu9y/gHH1e7tfbrfG
 eK2JtFV44g5y5SWZT+5ZiJG8wXq+oJN23qN5t/xgjABTcJqDpBVg6fpw0whlMCsQitdJ
 9GVlreIwbD94a8srsHqEnEf5Fgr2lSx6gWfaLWxdinjheICfaKyqrf9iv0+9BFouVLt/
 QgiWwgRT6ja5UV5zViXMC0jHqzDGhW0LFcsK2trOEcbmtvoWYYGUSLN/uDtN2JNGN8/W
 Q6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qms1gS4lsjyq2EFAJKsceqVkipGb5r5O0I7UP489Fdo=;
 b=XC/oo3ycYWiovlvueMJwnT+7lBW572eUIoV479GoW/Kjr6IhIYicFt6y+/2vwH9q2k
 lKGLMwHuKOctxWX2WkOpPIvepZxiR9Xj50XfjisYPq2DirI0DRRneObTzjHKhmapUjrQ
 Dj6hVRgJ8iGhhtHAqy/AGi/OCYELGL3noikSu7QaikmKvaKbbnupFAigT3zIoW2C2SOt
 usJ1XLmul4Jk/flCa6WYfUh7yJX+fO9D7pHzrTMmEi5CnEO+dkiVAAMtpnGCsC/OJdw+
 sfQMf725732a4Z39yxL5Bdtcb48EZq9iEixkXWdQRp+wlqPaHaItowsUmcN/voDbKFZx
 lhZA==
X-Gm-Message-State: AOAM531GMibnlJosJcnTCE+ASTLmGEOB4OGBtd5QGJ4giv+JJ/iGqP//
 yW/rUSf89lCW6ihxOz43wDRGAg==
X-Google-Smtp-Source: ABdhPJxLFlslsmO+Ox1jM3w42tqn00wRtzs/jJ3tbNAy+X7g7nDVd+oB16s/z79eu4Gd5JZTqB+V+w==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr3159750wrs.281.1601023776824; 
 Fri, 25 Sep 2020 01:49:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u66sm2048623wme.12.2020.09.25.01.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:49:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: q6asm: fix kernel doc warnings
Date: Fri, 25 Sep 2020 09:49:25 +0100
Message-Id: <20200925084925.26926-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925084925.26926-1-srinivas.kandagatla@linaro.org>
References: <20200925084925.26926-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, tiwai@suse.com
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

This patch fixes below kernel doc warnings on not describing all the parmeters

sound/soc/qcom/qdsp6/q6asm.c:927: warning: Function parameter or member
 'stream_id' not described in 'q6asm_open_write'
sound/soc/qcom/qdsp6/q6asm.c:927: warning: Function parameter or member
 'is_gapless' not described in 'q6asm_open_write'
sound/soc/qcom/qdsp6/q6asm.c:1053: warning: Function parameter or member
 'stream_id' not described in 'q6asm_run'

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 34a6e894242e..91999c9f016c 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -915,9 +915,11 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
 /**
  * q6asm_open_write() - Open audio client for writing
  * @ac: audio client pointer
+ * @stream_id: stream id of q6asm session
  * @format: audio sample format
  * @codec_profile: compressed format profile
  * @bits_per_sample: bits per sample
+ * @is_gapless: flag to indicate if this is a gapless stream
  *
  * Return: Will be an negative value on error or zero on success
  */
@@ -1042,6 +1044,7 @@ static int __q6asm_run(struct audio_client *ac, uint32_t stream_id,
  * q6asm_run() - start the audio client
  *
  * @ac: audio client pointer
+ * @stream_id: stream id of q6asm session
  * @flags: flags associated with write
  * @msw_ts: timestamp msw
  * @lsw_ts: timestamp lsw
-- 
2.21.0

