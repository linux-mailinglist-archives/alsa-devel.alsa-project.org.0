Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904831EBCBE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9CA4166F;
	Tue,  2 Jun 2020 15:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9CA4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103595;
	bh=GqT7Vn3LWz2c9tDzuA1lBlBDDwsFYmXJW+mZ4lrvghc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dygEY3K4NJeYlFhPkzTYB1aibqeQvnFmeTha6gHUCtWE99hFpC10p3licv7N5+weI
	 ECPg1QxwFRO8ppoZUOUyEElXfaimRPNeY5RLvLa8VvnvuaSZ6Ee8CNQE5Y//3WVt4n
	 v0Pax6XH6XxIC2CtzUPfpTfqRnTM1i68mSZI0z/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B002F8028B;
	Tue,  2 Jun 2020 15:10:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C9A1F8026F; Tue,  2 Jun 2020 07:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADCF2F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 07:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADCF2F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yx8Rvc6H"
Received: by mail-pf1-x444.google.com with SMTP id b201so418235pfb.0
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 22:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kdz9W6x1z78WJYfw94insK8Fd4+Xm8e4ZRVXoKUzvSY=;
 b=Yx8Rvc6H/3eq0UMPJ+mBWxx2n3X10X8TZ2xCt3ufzj/oMJA7EYddKDNEN+xrIbdNa0
 Goz1ThwnFqW6BZ0cbDh6AxaRW2U/x7/gxlvhbuaLQauNhxS8qNACiIEO5vHv7atuJVoL
 O3DrPnA/jIz+lZhpwzYhsApqbKTm9HdcGjpMmMU8MkLYvOug4bJn+YbIzUOTWf9kJFa8
 wjvz2P6TmTF+3qSnePRd3T7ua3QpMtqPXM+4+J714n7EsgcAQ6Gj5jYSRlkEC9OgHqQ9
 zBm/55JpUSdAK0I7I70drBpztTLmlOgYROSDj1DoXLuIJMRb1AWI9o6Lu6cb63yBnFZY
 g2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kdz9W6x1z78WJYfw94insK8Fd4+Xm8e4ZRVXoKUzvSY=;
 b=Ah8KxQtCdUPCcdiXgL3aaIv6hRR8X9hBekJxi/KyAzJWz+SMZu/Kig99eMw6smAIVN
 LMZySL45HDVQXHstW+C+AT6YLaPM/DGOlsQtKy049sFzroxIKlknx+F38mM6TlOUrUar
 VL7nahydF1Ib7vdEFMvJqNNsQRp7UNkKPa17FusjUOti146l9xxSAVrh9canX6zaXSVl
 d4oR+2VGH4XH/ZSQBcunOw/Heqy4WVyGoQEOVGNa+J4PhyU2aNRXYr49h67KDXaDB2zP
 VFz8b7FLW+0sJC3rlv0sJWWw2u116H3qwa85t1zS1ig8wEGXEhi/rC1ZH1phLEBGi4bN
 e9bA==
X-Gm-Message-State: AOAM533G/lc0Fp8KdO2LUaOwZ+SOgLC+JY+JS8iTnDHxn19l2+wVodHE
 YE0j/8UQXnqIiqMZASjjdkg=
X-Google-Smtp-Source: ABdhPJzyy+fKy3+80OPPYMUOh8KsX3+BuN5V6lT7FHP1F8AKIMrKUKcYMuv0+jcSMkuxde+7Z2c9SQ==
X-Received: by 2002:a63:9319:: with SMTP id b25mr23287242pge.374.1591075296239; 
 Mon, 01 Jun 2020 22:21:36 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.21.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:21:35 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [RESEND PATCH v1 0/6] Enable Greybus Audio codec driver
Date: Tue,  2 Jun 2020 10:51:09 +0530
Message-Id: <cover.1591040859.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Jun 2020 15:10:43 +0200
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
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

[REQUEST]

This patch series intends to "Enable Greybus Audio codec driver"
existing in the staging tree. I have shared the original patch series with
Greybus-Dev mailing list and as per the suggestion from Alexandre, I'm
also interested to push Greybus Audio to sound soc tree. Thus, now I'm
resending it to ASoc maintainers for review.

Following is the top level SW design for GB Codec driver and GB Audio
modules.

                                            +--------------+
                            +-------------->+GBA Module 1  |
                            |               +--------------+
    +-----------------------+
    |            |          |
    |            | Greybus  |               +--------------+
    | SND SOC    | Audio    +-------------->+GBA Module 2  |
    | Framework  | Codec    |               +--------------+
    |            | Driver   |
    |            |          |
    +-----------------------+               +--------------+
                            +-------------->+GBA Module N  |
                                            +--------------+

Patch 5 contains the changes to provide helper APIs to link DAPM DAI widgets
for the module added and remove/free component controls for the module removed
dynamically. Eventually, I propose to extend snd_soc_xxx APIs for this
purpose.

Kindly share your inputs.

[COVER LETTER]

The existing GB Audio codec driver is dependent on MSM8994 Audio driver.
During the development stage, this depdency was configured due to
various changes involved in MSM Audio driver to enable addtional codec
card and some of the changes proposed in mainline ASoC framework.
However, these are not the real dependencies and some of them can be
easily removed.

The folowing patch series includes the changes to resolve unnecessary
depedencies and make the codec driver functional with the latest kernel.

Patch 1,2: Incudes jack framework related changes.
Patch 3,4,5: Resolves compilation error observed with the latest kernel and
also provides helper APIs required to allow dynamic addition/removal of
modules.
Patch 6: Finally provides config options and related Makefile changes to
enable GB Codec driver.

Thanks to Alexandre for raising the headsup [1] and motivating me to provide
the necessary changes.

[1] https://lore.kernel.org/lkml/20200507212912.599433-1-alexandre.belloni@bootlin.com/


Vaibhav Agarwal (6):
  staging: greybus: audio: Update snd_jack FW usage as per new APIs
  staging: greybus: audio: Maintain jack list within GB Audio module
  staging: greybus: audio: Resolve compilation errors for GB codec
    module
  staging: greybus: audio: Resolve compilation error in topology parser
  staging: greybus: audio: Add helper APIs for dynamic audio modules
  staging: greybus: audio: Enable GB codec, audio module compilation.

 drivers/staging/greybus/Kconfig          |  14 +-
 drivers/staging/greybus/Makefile         |   6 +-
 drivers/staging/greybus/audio_codec.c    | 187 +++++++++++++--------
 drivers/staging/greybus/audio_codec.h    |  12 +-
 drivers/staging/greybus/audio_helper.c   | 197 +++++++++++++++++++++++
 drivers/staging/greybus/audio_helper.h   |  17 ++
 drivers/staging/greybus/audio_module.c   |  20 +--
 drivers/staging/greybus/audio_topology.c | 130 +++++++--------
 8 files changed, 427 insertions(+), 156 deletions(-)
 create mode 100644 drivers/staging/greybus/audio_helper.c
 create mode 100644 drivers/staging/greybus/audio_helper.h


base-commit: ae73e7784871ebe2c43da619b4a1e2c9ff81508d
-- 
2.26.2

