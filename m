Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181041FECD
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 01:45:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 840921686;
	Sun,  3 Oct 2021 01:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 840921686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633218299;
	bh=HTEzdK/e45eupM2F8gIo4bbfkKXNqjI5cWKrVCsxyfw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tvai01Y5Pn/Tw+Ji2+z0Dn8GfrGAXTe4n/YYI5n14oVsGNZMMGkSew2i93Se7FY0q
	 86o+wn7EqZJ/bo9CbKy2F2kbj5LR23ZTvJloJrrjVMizPOET2t32x0BwfgKgIZh5yj
	 6pI5C/k8BkCa3eiu4HtVTRNp04ENrvcx+Bupuv5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF34F80227;
	Sun,  3 Oct 2021 01:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41E43F804C1; Sun,  3 Oct 2021 01:43:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09626F800D8
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 01:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09626F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="EUhZfVpG"
Received: by mail-wm1-x336.google.com with SMTP id
 b136-20020a1c808e000000b0030d60716239so963839wmd.4
 for <alsa-devel@alsa-project.org>; Sat, 02 Oct 2021 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/T6wA479aMjXiGVQMPU8TC7VB5tEcMArPpG5ub2OJHk=;
 b=EUhZfVpGDD6qg834LaUvUxb9ZhDqAco06iXtwjwHY0t+P8zjiqQea4m2vej+OHxL/l
 Y9mM1kUwszAQ25fM1xo1dLgXBC/nFzrAFFqUEvI/5eVVKy5RL8SSeenVB5i7Nv6dYGl9
 BZFV9xkLNKKFml88jtYV9xgbx0khTQug76YELXAQeCyWcQHfeaU1f4scvMlhAGKsj3b3
 C+Q+XSD1TRfSItSDklV22WZKxvf6Jw2radWrncD7geXukbtzwAjmq+4s9ZrXFRmbvXEU
 WPboa8oE9uQd9eDA39TWhg9PjdTjpW3EGvdA56dQFQ6vdJpr+EUtgqBoVvgxImd/mWDY
 b1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/T6wA479aMjXiGVQMPU8TC7VB5tEcMArPpG5ub2OJHk=;
 b=FIlGFtI9EjX2tsPxTA0i/1Z5PGil3/oaKLP9lT0v62wfcQE6F3SFR+bnov3jWMxVVH
 Iz3JuxF7JWlPHewfWeJT4ZpjZDeOjGCEJBmxqxXrTneLxo+n+Sl1NWFcj3PGxNddUZ+A
 sBNpLifyqVldqmManPWvrInTWNd6XRlEXKxkt1TMHuzlUQcKygoBvlC4bJ3pNf3lUUcS
 1IIKMOS8H+cdOE13T9iqRc66Nb25ryzfA77KJIddhyMdtlaPwahO83ytjX5+A3jYtpkE
 YFJ+c2gfQf4ogiJOwGCMtMMuhrORbFvaqwaExFY9DnrRG2XDrncbVKDf3hDGS+EVUJjs
 zsHQ==
X-Gm-Message-State: AOAM533ogTCkBuqjIyo/SR2/6Mj8R/sV6zaRtOXV+UE/uSWoOiDkFy7J
 /i34WrPzDwRV4rDzAQCHhtU=
X-Google-Smtp-Source: ABdhPJz/j7AnQVPkNfWnlxPyZBz5ITWoO6U2bBx+6+JZMWi8y1ZoDmE4l6z7g9WKHWWnom6z6VtlwA==
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr11197754wmc.14.1633218211603; 
 Sat, 02 Oct 2021 16:43:31 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7bbe-df00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7bbe:df00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id z6sm13999463wmp.1.2021.10.02.16.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:43:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org
Subject: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions and
 issues
Date: Sun,  3 Oct 2021 01:43:12 +0200
Message-Id: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
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

Hello Jerome et al.,

on Amlogic Meson SoCs which use the AIU audio controller we have the
so-called "machine gun noise" (MGN) issue, reproducible for example in
Kodi. So far nobody was able to identify the cause of this issue. My
idea was to at least narrow down the issue so we can categorize it. For
that I wanted to get the SPDIF output from AIU to the HDMI controller
working.

On Amlogic Meson GXBB/GXL/GXM SoCs a DesignWare HDMI TX controller is
used. This has an SPDIF input but there's currently not driver for it.
On Meson8/8b/8m2 SoCs I am working on a HDMI driver for the TransSwitch
HDMI controller which - just like DesignWare HDMI TX - supports SPDIF
and I2S inputs.
I decided to add SPDIF support to the latter since the code from the
vendor driver is much easier.

It took me a while to figure out why I would not get any audio output
from AIU SPDIF to the HDMI controller - or from there to the sink.
The "fix" for this issue is the RFC patch which is part of this series.
Any feedback would be great as I am still new to the ASoC subsystem.

Another part I am still struggling with is the audio "routing" (due to
lack of a better term - please correct me if this is not the right word
to use for this case). I have the following description in my .dts:
	sound {
		compatible = "amlogic,gx-sound-card";
		model = "M8B-ODROID-C1";

		assigned-clocks = <&clkc CLKID_MPLL0>,
				  <&clkc CLKID_MPLL1>;
		assigned-clock-rates = <294912000>,
				       <270950400>;
		dai-link-0 {
			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
		};

		dai-link-1 {
			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
		};

		dai-link-2 {
			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
			dai-format = "i2s";
			mclk-fs = <256>;

			codec-0 {
				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
			};
		};

		dai-link-3 {
			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;

			codec-0 {
				sound-dai = <&aiu AIU_HDMI CTRL_PCM>;
			};
		};

		dai-link-4 {
			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;

			codec-0 {
				sound-dai = <&hdmi_tx>;
			};
		};
	};
The driver for &hdmi_tx defines:
	struct hdmi_codec_pdata pdata = {
		.ops			= &txc_48352_hdmi_codec_ops,
		.i2s			= 1,
		.spdif			= 1,
		.max_i2s_channels	= 8,
		.data			= priv,
	};
In hdmi_codec_ops.hw_params I always get fmt->fmt HDMI_I2S unless I
remove all I2S references from the .dts snipped above (only then
HDMI_SPDIF is detected). Based on the selection of the "HDMI Source"
enum in aiu-codec-ctrl I was expecting the format to update as well.
That unfortunately doesn't happen and I don't know how that can be
achieved.


Best regards,
Martin


Martin Blumenstingl (1):
  ASoC: meson: aiu: Fix HDMI codec control selection

 sound/soc/meson/aiu-codec-ctrl.c  | 108 ++++++++++++++++++++++--------
 sound/soc/meson/aiu-encoder-i2s.c |   6 --
 2 files changed, 80 insertions(+), 34 deletions(-)

-- 
2.33.0

