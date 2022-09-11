Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542B5B5564
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DC416E4;
	Mon, 12 Sep 2022 09:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DC416E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662968101;
	bh=SEmxLa9DeGMwrLIwpxo62R72Cj6ZXdhrenbFqluEJrE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2XbUuwlxOH3DxUa5vCDKqgXEgyd4VyuNKcNwZYuKaN/yucFljkxM+YquzU9KtGRP
	 XIl364MgphcjUVSR4P9Qb1C2HjD1eCrcTpLGARyanmGQrWHcg1NIJv8FLHxxP/JRQS
	 YITbFI7PIA95HxcWbCp6CoaJ97NFQEUX7H7sf7NQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD5BF804FE;
	Mon, 12 Sep 2022 09:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AC0EF80256; Sun, 11 Sep 2022 16:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BEA0F800B8
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 16:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BEA0F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QQcsfunS"
Received: by mail-lj1-x234.google.com with SMTP id y18so7745603ljh.12
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=I8h6IKACxQlXXVq1OeWv2JZIqExd2BXra4rChfH99Xk=;
 b=QQcsfunSn1opiSC+tGIBb/82hXMfbk8jt/xhW4pgbxegftG1gG0ErLsBhw79+MXAab
 smwr36fp7WOYftAeRvzqTtLTMoRTkY1RlwVkBKd4o2vxpLJWOe6ozb5P9ntM2HKwLiQO
 GYLCCugpsnnPcWVXPpZ9hqYklyBCpuNGAEn6I068BtEtVIlQuXOuE92+cCtaZLsgd2Q9
 vHqz6HIPJ0iVXR3aVsjFVzhDoXPDESwUnytu1VtqmKOzdeqj8to/HMfWG8SwYEFRc3kC
 minkouqdBBusqivhJeR7GzMNItSHRSlnYUXzV+I953LQkCUVrD0dPPH/AyeIL8cKSHJn
 Q5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I8h6IKACxQlXXVq1OeWv2JZIqExd2BXra4rChfH99Xk=;
 b=SeILN8G0kpBT9XtoBf2w0zyOAk86sMPM7o1Dj6/HgCWr35N/1W3CTnX0NVbVlGEivB
 Q+/6II58o8sMNHDv7Q/Cx9XIzs7F1OvNcdPpKactzgQR0k+pbPQ6fPRXRdzK2kE4N34g
 78iNXghcdwX8ANJswz4n6MHBc8tE1vNx3OQ2NCellfKu20udV6zAljQduhiQT0kLuEzD
 UpCbBxTVrpk/QJZIPt4LRd1m1PZXaNKgU0Z4SmrhRKRAV612Mrlu9pG4Yc8xIFGR0SDl
 mD5hCZl9Q9d9aW8Vh3Noen+8rZS+MAa3spEG3An6jAo+v5eaMRc2dm+coKnDa1+I2F4V
 Mgpg==
X-Gm-Message-State: ACgBeo2P0cCIi5GauFMZqsYoczLPlz02QUA83/4TlGG1DVp919/SgQMe
 s2H7pQlgcsXG/YgCH1tdBPj4Wr0I95kXcg==
X-Google-Smtp-Source: AA6agR6KZCWm2WPTqfmyxsXJXyYXPDtajUhuPpJYX5iMpEbTFfpkYbV2J5gKHD8BN9cp+Wh+DQVtCA==
X-Received: by 2002:a2e:a9a9:0:b0:261:bf5a:8ff3 with SMTP id
 x41-20020a2ea9a9000000b00261bf5a8ff3mr6654761ljq.252.1662908256454; 
 Sun, 11 Sep 2022 07:57:36 -0700 (PDT)
Received: from localhost (95-31-185-216.broadband.corbina.ru. [95.31.185.216])
 by smtp.gmail.com with ESMTPSA id
 p39-20020a05651213a700b0048a9e18ae67sm636891lfa.84.2022.09.11.07.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 07:57:35 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU DAI
 component
Date: Sun, 11 Sep 2022 17:57:12 +0300
Message-Id: <20220911145713.55199-2-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911145713.55199-1-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Sep 2022 09:33:31 +0200
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Mikhail Rudenko <mike.rudenko@gmail.com>
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

At present, succesfull probing of H3 Codec results in an error

    debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' already present!

This is caused by a directory name conflict between codec
components. Fix it by setting debugfs_prefix for the CPU DAI
component.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 01b461c64d68..4d118f271e8c 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1253,6 +1253,7 @@ static const struct snd_soc_component_driver sun8i_a23_codec_codec = {
 
 static const struct snd_soc_component_driver sun4i_codec_component = {
 	.name = "sun4i-codec",
+	.debugfs_prefix = "dai",
 };
 
 #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
-- 
2.37.3

