Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB592B756F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 05:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4884017A3;
	Wed, 18 Nov 2020 05:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4884017A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605674449;
	bh=D2HrBxxE9rvgOd6bbOQkpHP3k2pjozid27Iqs7jL4Vk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dagFdAWOjKTMFFdIwQow90kfv745ZVSuTet5cbd/vGYCcA1HBi/e50TRrjtTqcSu6
	 fQMGCKiaSjfD48ku5Mg6kChXICAzF32b/16odVprgQp8J5mU/NxumMMLRXIqLvJvYK
	 MlRx1xUDOgscPVNZeo1NXNMUoKcqRVXqU1mI0UnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 306DCF8016D;
	Wed, 18 Nov 2020 05:39:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBEDEF8016C; Wed, 18 Nov 2020 05:39:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CF83F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 05:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CF83F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="O940nd56"
Received: by mail-pg1-x542.google.com with SMTP id t21so337621pgl.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 20:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=owERzaYqHwi5W3jNP2ap5wqI6aYFg8h8r6Iq4kQIegs=;
 b=O940nd56EF39C6shvsKKS7HBzyblt8tQFn/ktV4VByDF3Bk4MvBDHLBh6/6DWlKKb2
 3TKGn7hW4DPSD1Yoqk7hTzjznUzG8YnmM1jz+RF7xckxqITG1sWpbnUeBApKS507K4v6
 F6l1Hpgmi4AZL6YUSAnqGw34DuXTeMVLXekVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=owERzaYqHwi5W3jNP2ap5wqI6aYFg8h8r6Iq4kQIegs=;
 b=NkEVELt1h+fTWOV9MD5emNYxKs8zadW33tMukYxKuNURwX+ZL61VOX45UyerTk57Qm
 2I2NDh02h04t0RGUCePK9Y3YS6q/qZ/Wain/B05mvTxn8/2kpsJ7He7KxPHMPJI0jQUg
 KzHWXRzebT/kheMNr/wSESY5dafrk3/E8e0XeQsspoAGk0emQ9TqBKe4Wy47bDL5IOQh
 B+gGiEnp7fSjeQ/TMrQpo/u79pwiPoGsPLxKnXVR27WP/urWxcrBa9Da7ZqL4BCYQc8r
 5CD67DEaH6/JiBHU5D+FqRHxv4TnRLXM8BsGiPN9r6uSh7VRh81swZFWdKKcHuJ8MFbp
 Tbpg==
X-Gm-Message-State: AOAM530WcB3APBo1gPwvIdYvjYSPdZSx1wWovBcHuXDOA034fdU1svzT
 eMQt3A1xzFoP7kI7CmM67CLVuA==
X-Google-Smtp-Source: ABdhPJyLY/ULmYE7kL4z+NpXB7dygkTdqOpK+q9RIVgz26oFSNkBFFbemBEILFCvjOfFPaMHn/lqfw==
X-Received: by 2002:aa7:84d0:0:b029:18b:fac7:29b with SMTP id
 x16-20020aa784d00000b029018bfac7029bmr2744535pfn.29.1605674338308; 
 Tue, 17 Nov 2020 20:38:58 -0800 (PST)
Received: from localhost ([100.102.99.29])
 by smtp.gmail.com with ESMTPSA id k7sm22725611pfa.184.2020.11.17.20.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 20:38:57 -0800 (PST)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: hdmi-codec: Get ELD in before reporting plugged event
Date: Wed, 18 Nov 2020 12:38:52 +0800
Message-Id: <20201118043852.1338877-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 tzungbi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, dgreid@chromium.org,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

In plugged callback, ELD should be updated from display driver so that
user space can query information from ELD immediately after receiving jack
plugged event.

When jack is unplugged, clear ELD buffer so that user space does not get
obsolete information of unplugged HDMI.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
Change from v1 to v2:
 - Report jack unplug event then clear ELD. This makes sure user will not get a
   cleared ELD during their usage of jack.

 sound/soc/codecs/hdmi-codec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 403d4c6a49a8..e8410b2433de 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -692,10 +692,16 @@ static void plugged_cb(struct device *dev, bool plugged)
 {
 	struct hdmi_codec_priv *hcp = dev_get_drvdata(dev);
 
-	if (plugged)
+	if (plugged) {
+		if (hcp->hcd.ops->get_eld) {
+			hcp->hcd.ops->get_eld(dev->parent, hcp->hcd.data,
+					    hcp->eld, sizeof(hcp->eld));
+		}
 		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
-	else
+	} else {
 		hdmi_codec_jack_report(hcp, 0);
+		memset(hcp->eld, 0, sizeof(hcp->eld));
+	}
 }
 
 static int hdmi_codec_set_jack(struct snd_soc_component *component,
-- 
2.29.2.299.gdc1121823c-goog

