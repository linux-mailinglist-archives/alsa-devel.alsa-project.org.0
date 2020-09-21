Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC9927214A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF26171A;
	Mon, 21 Sep 2020 12:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF26171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684659;
	bh=eWiiq5Url4azgTOk6WrrOLGo89ieP4u00auyyK+0BG8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIpMbNTW6VHrnNWefl//Mmx3DT/gORpDja0BEeglHzFCplSQRVBLwxFlERjWyLzG/
	 QvLRJj8zLSRz35BUBrH/RkzZUCHArAxZrjxwXCfcq3gmJEvjoM0rIR9MPqHe4RNJ/5
	 yJXGs+PvGCZ/ma4q0gq2kLNq9uJxNl2GNDcwX7fQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AE3AF80341;
	Mon, 21 Sep 2020 12:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 681BBF80315; Mon, 21 Sep 2020 12:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B35EF802E0
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B35EF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f7TSlv3Z"
Received: by mail-wr1-x441.google.com with SMTP id c18so12147386wrm.9
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x/iq/UaybIFP5fVA6Ln+hpouuRJu9kADukrtHp3BLVg=;
 b=f7TSlv3Zki9LVbtvu9NTG3s0n6hpuVnFM4+BDV1KEd+sdjo0/0RIPme/6ti1gx6khV
 DzTa1eRKRHfldjY21P8bYwuO1QyW4Msnmk6zxA/NWGd1keNd8nfDeDL93cXk3jPDmDVW
 duxZ5dXVHcn4IyOQlQ+4WUVj1UxdK3lWj2WKYyu84zSn8zZE9VQUM5n3YOa+N6jvPr4R
 DNIkDdugvM9ta8xIWyCq9kivXj/Ga19PAc9rgCh46UvBCxXIYaKbMzPjViGyevQEgVSq
 K/eh9qn69H8FHONI9nH9+tanPIpG2bC9FWE5/1NHcVPfC0Z3rMKjVjBHrNQ42iHDs+pi
 8mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/iq/UaybIFP5fVA6Ln+hpouuRJu9kADukrtHp3BLVg=;
 b=sgfUCPvbJkO3adeo9pEuz+d2Jmxtl5fSdKyo1a4eol5gH0SjHNZkta3nDx2aiP1Pe7
 oUG4El3efxD/3Dt8u6jFwe4L7QbVODp5dd4U64Pgtsgjyg54+uPBY6VPibFCkTAVOSFD
 tLQidmbNik6DVLI+jf11niFmZUj5tbehaX2eH9XoHFYfbBS8sz+k74kXmzOSwmlmWSqq
 ElQwmai2PRu1H8ZOhPKfE4+V0b7qRVdXYGWMQ9RScg2ZJT9SmSqS4kjfog3Y26vZ6kcu
 b8M3Q0139/0Xdw7/3adfb17SFylE9yekZzaoqR3OFTqEbC/2qu2vZt8HZ2g1QUHgyg7H
 D93Q==
X-Gm-Message-State: AOAM531GdSScg5grPkNatCa6bMfjAP77IJNwh0v+MAhfaFRiNgawrW7z
 0j7tNeeVQRvEJmtoGfoteSw=
X-Google-Smtp-Source: ABdhPJya/DfIfX42lmgcaaMFvDOf6VbMI/5f6dCC2Jc+wM8fb/BSa4GzprNf9ummrrBnFz+joK74qw==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr47888141wrt.295.1600684068018; 
 Mon, 21 Sep 2020 03:27:48 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 10/22] arm64: dts: allwinner: h6: Enable HDMI sound for
 Beelink GS1
Date: Mon, 21 Sep 2020 12:27:19 +0200
Message-Id: <20200921102731.747736-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Now that HDMI sound node is available in the SoC dtsi.
Enable it for this board.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 3f7ceeb1a767..049c21718846 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -118,6 +118,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s1 {
+	status = "okay";
+};
+
 &mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.25.1

