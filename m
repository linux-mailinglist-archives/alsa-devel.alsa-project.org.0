Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A3299652
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27DE816DF;
	Mon, 26 Oct 2020 19:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27DE816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738770;
	bh=60zxquPKLnsbksZbwegVG6qgSflf7ml96IH/ixcT+5A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hiQvpw+9RX5YyhnuFk5l3tLG86POGWF85yLovEcSkSRSGUFlcGrHiLb7xLc3/varK
	 zHLQxdPDFuMzdfz4pWDfotp0ceS+l53W963ZceF9cg1oI7RcYwwshLu6blgAXEHLa3
	 O0A2TtBJYRj9mgT6wKBTVe0wBoGfoTdRi3uJlGe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0812F80526;
	Mon, 26 Oct 2020 19:53:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5A4FF804CC; Mon, 26 Oct 2020 19:53:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 375BDF804CB
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 375BDF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iw8Tt0Is"
Received: by mail-wr1-x441.google.com with SMTP id b8so13942228wrn.0
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Q1L59OjiDLpqGnNODju6fMwtd7Ss5Fh+8syeSPkSMs=;
 b=iw8Tt0Is9e1poafENrpZRdDGZVwI7kf1UF12fsc7eBsHdZG7m/c+OWT9rpHv00odup
 dtimc86iK7hxhdNQiK1T2fHMKOB41WAQarBsqN7LAHDC/vE/NMqBNRwLgU/ojm1MWIRe
 TrpqOy0sgIPCyhQ6iJp9FdUq6gpdFdyFj+a1Pi2qU8WzCPgj089ano7c43mgJwr1SCLZ
 VBQqHv/KZRwg1VYINGpImGAbKEdYS5t36i3vLyjSEII8IZlxSTYIxcYx9JVCLyden0Mg
 Jo/OYJxHDb7A9p2M/q2S3MGkYq+DfxE97bporPOXdUEgZX3RuNpmRqe3g8iH/MVFb/L1
 yJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Q1L59OjiDLpqGnNODju6fMwtd7Ss5Fh+8syeSPkSMs=;
 b=c7e8QbFRnBLdpSI45shceXouaEgkc0XhcVW2atXVoVkAo56W9XGJOvv25p3R+LVJro
 XGu+9Mdja5jmHWZbGm4Bltm9RSshriP/YvvQIQRcfIg4fVgO2RoVf0KpX5eUFPGSoE5n
 pR8Y61JUG7u884MbfKZrD+xGwsXJyA/bB7eV2bOriV0BE3b5IwoYzqI8JH9gNkJ2nUqL
 hC9hC8YUNuew5kqiE8zIWEQt/lWf4vDjLJbZe1YS0Xb4lfCnp5Ypde2rPodYmqbd0fnK
 hzkYuHKLc3zgdDB35KGx1sm89zRQKfTJ2mTlbCh2BchWB4ueJDl1mMc6kU0a3HwTlYLk
 woMg==
X-Gm-Message-State: AOAM533c0J9IBFfE4HSwsFW4PE5MLrxajiiXPfWbtcgdMEQ39H7UNROd
 3f83z+cC91mu7QcMzuVfSDE=
X-Google-Smtp-Source: ABdhPJyiT4V5gb6oDpX/aFZI1JeMO7JWfrwtaDrhwLJO/4XfXKX9LirC57kBfE+n68pmsi9+UXUx2A==
X-Received: by 2002:a5d:4409:: with SMTP id z9mr19000599wrq.236.1603738376721; 
 Mon, 26 Oct 2020 11:52:56 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 12/14] arm64: defconfig: Enable Allwinner i2s driver
Date: Mon, 26 Oct 2020 19:52:37 +0100
Message-Id: <20201026185239.379417-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
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

Enable Allwinner I2S driver for arm64 defconfig.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 17a2df6a263e..3f89f427a355 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -706,6 +706,7 @@ CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
+CONFIG_SND_SUN4I_I2S=m
 CONFIG_SND_SUN4I_SPDIF=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA210_AHUB=m
-- 
2.25.1

