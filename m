Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C234F085
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 20:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1EF11682;
	Tue, 30 Mar 2021 20:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1EF11682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617127692;
	bh=+x5pmPzoPs8tHsp3sxrP6YEbXvMqolyuXAH2U4BJq+A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eoayFHOAYoWmgEZY6kqaXYX/TsgbC6wJE1uY+SLmDNFkuo0y5PTMXq9EtHZuw5XQk
	 ke4dObu1nRXUdPMH9FQzcUXQ+8We5edExV9XrCBOGh4mE2YXqATsqPibIDIySH+3tE
	 f7OIMRoIiMgnJK8EIkf7TWSKZUJBeDL8CLMI2Q50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A77F8026B;
	Tue, 30 Mar 2021 20:06:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79A6EF80240; Tue, 30 Mar 2021 20:06:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50613F8014E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 20:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50613F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KILBfA6b"
Received: by mail-ed1-x52f.google.com with SMTP id x21so19258331eds.4
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0pgwGo5U4+mVpvBAlIW3XDhY6OzMGVQRD+8FoU11geg=;
 b=KILBfA6bAgwhgbaqL+MGXZDaxNFo9Jr5AheRhcv2NtJHd7OqaEXycAb+llcDIJT8Y8
 nNJQQ6wSIieG4jv4njYkeNg95rE5S2gnYCU5I2FU+WLJvNLTHrlC6Jx6CZhC5+0G9nZc
 KZU38T4duNWkfLotY+9ZUoGOojL6pQWNVLQTZdJ9TUkHGeROZhYjptk6zjrNzjyprDDS
 IlDAlQWedrdBDjHXssZGbt0ab2CeMRdKDxzUNPqO32B9EP4B/6iBMb0t8/mMn/kjbUhO
 p2vgVUSj/LlYP0Q6bsCia+bSG82MeSGXyzI+MhdnSrwgGsViSEod9Qq6koWteg5PskON
 PVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0pgwGo5U4+mVpvBAlIW3XDhY6OzMGVQRD+8FoU11geg=;
 b=fBm/JG33jVGVF2R3W6oX5+VtuszPSv8kG4irZsPcIhodJ55xSYDF0jtxW/00dJx6hC
 5n7Phm0zh6zQyhafrDUNtDRRhrmSfWU8uSWq3xyRI2Ed1BL777EEyIhthbsAdGq4K2Ra
 qi3pMeifvMyXPB813cp++67A8DSa9o5GPCrq/PLl9+Gg1DO/UD1eoaLh5HJKUf+LM5gj
 9eITiihqpuCWH6t8aJ5mitWxV8guJW9pkQy+75KnTCg+sG2ar9WZi0Px82gKCD9zswIF
 lvar+Qs7zbUcvRzRgevKUrPDRqLF9WMxg6ku9HP0+4JQOYS1rR25VtQ1nCuFyu3TUabz
 xBmg==
X-Gm-Message-State: AOAM531W20m+ItBw3kBpmX2CStgr/dONUSCD39U/lEfXEuGcTAg5fpLd
 9TeU0584I/3z1JkazPFnt2A=
X-Google-Smtp-Source: ABdhPJxcmA+mJu9zdZY6GgDUziWNePTkeU423wGspKbNdxgH6BOtT/Uk4a7w/ccx0pA9XK354RQ4vg==
X-Received: by 2002:a50:ed96:: with SMTP id h22mr34653915edr.39.1617127595723; 
 Tue, 30 Mar 2021 11:06:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id l12sm11597884edb.39.2021.03.30.11.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 11:06:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: tegra: Set driver name explicitly
Date: Tue, 30 Mar 2021 20:06:57 +0200
Message-Id: <20210330180657.1867971-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jon Hunter <jonathanh@nvidia.com>
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

From: Thierry Reding <treding@nvidia.com>

The SoC sound core will generate a driver name by normalizing the card
name. However, most of the time that name does not tell anything about
the driver and is therefore useless for this purpose.

Make the driver name more useful by setting it explicitly during card
initialization.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index ddedf18adde1..47b319504c8c 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -198,6 +198,7 @@ static int tegra_audio_graph_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card = simple_priv_to_card(&priv->simple);
+	card->driver_name = "tegra-ape";
 
 	card->probe = tegra_audio_graph_card_probe;
 
-- 
2.30.2

