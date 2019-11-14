Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D155DFD180
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 00:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A721666;
	Fri, 15 Nov 2019 00:21:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A721666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573773731;
	bh=30LZuCpxPNBcq8hDoSmUekRTbELy2PKx5H9QVnFESjI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rK0/L6jwc+Ai4ZNGCGQlekCtMObZAziIs19d/p32SZ9IOY4KepkNiTCw/G1+zCY2E
	 DXWXDbTsiQ1f/1cs5rZgBq++E7PqM9SfVjbXpeuV9XxFUqhC2CjfX0UD7IG6Qci6kH
	 r0c0T5vQmCvb27Odl0yMy+cazRR7piU7NA5XPdhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCA0F800CD;
	Fri, 15 Nov 2019 00:20:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31136F800CF; Fri, 15 Nov 2019 00:20:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C530F8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 00:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C530F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Vy6GA8dd"
Received: by mail-il1-x143.google.com with SMTP id q15so7045870ils.8
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 15:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFs5XbPF3HYTosWYp06fmiVryxSTFoWBcu4a+ZdX1+A=;
 b=Vy6GA8ddbLbjLQ0/vxsC1OSA5VAU5monEtQPIKzqFbxFLBEu5W07DTGCEUNuxvMCoT
 nsfLyheQYO63ApFFBM9PBav2L3dtOhJJNPH9orYwGwiKZNoPCURhAucodOQEyLdNXVdc
 qgi6uNyeIjrgrzGiU92WPrD4S2PRg2KHsuxZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kFs5XbPF3HYTosWYp06fmiVryxSTFoWBcu4a+ZdX1+A=;
 b=eFth+FSbVQK/2WwSxLLfNGS0eVepUF9qG84IFWLEa24fO51K8XJkIlyyTJroB+AVtq
 f/DeD5gU2Cq42RdaMtbFhVAhA9caXm1tdJwgXB3okURgXQnztISG62gOBjneFa8Opbjo
 peIJPJM6ZSOaE3IEVIiNp8u+FqjSZKoSFFn7r1hPg+orgvjJm2AJZQLBbbOK4NcoAYOO
 rpZupNbcO69mn33WsZQgSlBAzb6Ux0vIcxhO2A4Af6yZ16IwP7yIg+7/FU22cOKsDt6s
 7bt3ttixn7AP1WoDyiuq8NSM/uEsGqgZAguuGMDa4pQs3kzSj/alnB+voi/S1k+Maqzx
 yM/g==
X-Gm-Message-State: APjAAAVSfwcdViJLTRGRHNbR1lE+m+IR3RYdR4NvcUR647Hrw4uTOBJw
 UqmJEv62kT2QM+9fpQMpwklV5Q==
X-Google-Smtp-Source: APXvYqyYK3wJiqqhy/FBkuHJZyqIoqryDSG+Bdm4KNKKICytbtzzTrU2P8ejRbTFDQceewqACfSslw==
X-Received: by 2002:a5d:88c6:: with SMTP id i6mr3528170iol.251.1573773616389; 
 Thu, 14 Nov 2019 15:20:16 -0800 (PST)
Received: from localhost ([2620:15c:183:200:2bde:b0e1:a0d8:ffc6])
 by smtp.gmail.com with ESMTPSA id q3sm1018269ill.0.2019.11.14.15.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2019 15:20:15 -0800 (PST)
From: Jacob Rasmussen <jacobraz@chromium.org>
X-Google-Original-From: Jacob Rasmussen <jacobraz@google.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 14 Nov 2019 16:20:11 -0700
Message-Id: <20191114232011.165762-1-jacobraz@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@google.com>, Takashi Iwai <tiwai@suse.com>,
 Ross Zwisler <zwisler@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] [PATCH v2] ASoC: rt5645: Fixed typo for buddy jack
	support.
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

Had a typo in e7cfd867fd98 that resulted in buddy jack support not being
fixed.

Fixes: e7cfd867fd98 ("ASoC: rt5645: Fixed buddy jack support.")
Signed-off-by: Jacob Rasmussen <jacobraz@google.com>
Reviewed-by: Ross Zwisler <zwisler@google.com>
Cc: <jacobraz@google.com>
CC: stable@vger.kernel.org
---
 sound/soc/codecs/rt5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 902ac98a3fbe..19662ee330d6 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3271,7 +3271,7 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 				    report, SND_JACK_MICROPHONE);
 		return;
 	case 4:
-		val = snd_soc_component_read32(rt5645->component, RT5645_A_JD_CTRL1) & 0x002;
+		val = snd_soc_component_read32(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
 		break;
 	default: /* read rt5645 jd1_1 status */
 		val = snd_soc_component_read32(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
