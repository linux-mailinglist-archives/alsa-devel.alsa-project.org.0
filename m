Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA7463BCD
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BBA12313;
	Tue, 30 Nov 2021 17:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BBA12313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638289967;
	bh=cgsfoZ5K+bVvgquLfWdqMpJR0iy1lSIe9jkl2JnBIIU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Na89ILlzYGwwPmdBwOSqVMt9QI42r74c0MnsrSqBAThm45JrjFTlOE5qbeyMolPmJ
	 17yDpfhdtVe+jw9n2srxh15lZioFSdJDagTPZKdJ7nFOIjRRhaHjkY4oP3CcxmR3X0
	 gfYnc77CnnlSG9fND6atfpEHdu7PkJOFsAnR4dGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC05F802A0;
	Tue, 30 Nov 2021 17:31:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CE08F80290; Tue, 30 Nov 2021 17:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD913F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD913F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LObOyDUu"
Received: by mail-wr1-x432.google.com with SMTP id i5so45725836wrb.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W10woHZpi0yaDIjYw0FpzhAqwn1F6zlCzTC2v3vpIcc=;
 b=LObOyDUuFFkHoDoRVHkoP6QvDsbJhcNuOM6BtpA0qdm5n4tfBcNIW+GstxjF7LntQq
 jyyxsk88JUGpEbzg9hnQdAbZErNRf2fcheQwkGPPu6NTHH+6pJYLEY92YGBZ2+Cj09Rq
 CgtIZ0DBFZWerBYK7EW+NfgPzuSnuxNmYhqt0zaK7AB35onfxsnC210TCAlQRH6MZcpH
 e/H4mbDFqCa7CUXIKSVCI/lpVvfEKggGJ8UZf0GdQPXDQAiUwKxsG9OOoWGVsx73siA4
 sq0D5Y9rOfI3QF82mEFhW0//KzgzGud9eedun+CshQ9AA9OltdmPylhWt5er96rONPl5
 pcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W10woHZpi0yaDIjYw0FpzhAqwn1F6zlCzTC2v3vpIcc=;
 b=OGPaGH0X0jaSlzw/JrOpwFBMCIydcNWQ/YGmzwgnT+7xDrgMUUskbieQDRaEx/ncuq
 k+vAQtwLyMLN6NOJ0OxE5ZQK6/3/AGQib0S3SLGd9uLxy05TKOpAas00QVZXvvmAeXrs
 Ug2/q3mrkAwmvjEJYemW+BsCAxFGkB3J9I6ZcyKCXwUKXLyO2CNVFuK0zz7lXDdX6bBJ
 yMx+VjCR+Wrgj7RbCq1kf+PXyEbKkQoQmX8sabrrOoOKgxdDTn0N+awrNFrxdER/huJz
 pDY5YlYmf+kn45/P714591NGEmGSObMRtcalu6JlH+GK5ylA7sMxOnxDIsVjz8iwD3Af
 0mRw==
X-Gm-Message-State: AOAM532YRtgz8rZcxM5pWLo9TenB39hxZdeuEHGvsOrFJACsKI2C4t7b
 ZM4Tmvbt3Bnj5o1i1X46ESuplA==
X-Google-Smtp-Source: ABdhPJy2/6mcj0f9rWAnlluxbk1tHyaWCLL7ZqCSP8Lh+AcZ82VRWGNDeET8o4erufcgaZXybp0Ozw==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr7667wrl.158.1638289881104;
 Tue, 30 Nov 2021 08:31:21 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l26sm3335900wms.15.2021.11.30.08.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 08:31:20 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2] ASoC: qdsp6: q6routing: Fix return value from
 msm_routing_put_audio_mixer
Date: Tue, 30 Nov 2021 16:31:10 +0000
Message-Id: <20211130163110.5628-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

msm_routing_put_audio_mixer() can return incorrect value in various scenarios.

scenario 1:
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 0

return value is 0 instead of 1 eventhough value was changed

scenario 2:
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1

return value is 1 instead of 0 eventhough the value was not changed

scenario 3:
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 0
return value is 1 instead of 0 eventhough the value was not changed

Fix this by adding checks, so that change notifications are sent correctly.

Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index cd74681e811e..928fd23e2c27 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -498,14 +498,16 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
 	struct session_data *session = &data->sessions[session_id];
 
 	if (ucontrol->value.integer.value[0]) {
+		if (session->port_id == be_id)
+			return 0;
+
 		session->port_id = be_id;
 		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, update);
 	} else {
-		if (session->port_id == be_id) {
-			session->port_id = -1;
+		if (session->port_id == -1 || session->port_id != be_id)
 			return 0;
-		}
 
+		session->port_id = -1;
 		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, update);
 	}
 
-- 
2.21.0

