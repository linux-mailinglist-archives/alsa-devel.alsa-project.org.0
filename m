Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45175502
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47DCA1EE6;
	Thu, 25 Jul 2019 19:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47DCA1EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564074104;
	bh=dqIX9HFMXB0IvwSwx4YXoweRyroqW3G/j8eWmMvpnsI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XRWjipPH3DpRQCLkVNTzjdhT96VVwJexzU4kqCV4GGZDv1zPLAhRMeyxyQyOhez1D
	 c8QFSDFt2NCZyiYSjvwQvFFBveQTpS7FD+Cxm++WXruRCOqlTOnlqxvt4tg8CZsYvT
	 GI8hZ+NreHJ/XDRAAytrLhuYoYq27V78IcWdfWWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47D8FF8044A;
	Thu, 25 Jul 2019 18:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B5EF80447; Thu, 25 Jul 2019 18:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84928F800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 18:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84928F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="vSIN5SQO"
Received: by mail-wm1-x344.google.com with SMTP id l2so45364310wmg.0
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 09:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5T1q+s41fPQD7eof6Tqonl1CLLGxvvozknwhIlqSeIY=;
 b=vSIN5SQO0xC2DiwEc0YeIVtaqLm9xmsTf3t4eAWsBsGaCKiGOK2vgJal9mP8efVMko
 b7K7SHaczX6wzGVIJLowJ89Sig8RGT2vQBqW3UKxd6ok4KM/4XfH2Z1u0WaYmzbvgVka
 e5zhJaCjapKNyqA9aVJLo6T6SStoKByttTvZPPWMNKOQvkMLS/Z3tPyJGSLt7jJp/tqc
 ARjufuz5KjsxoP9SlZp+lrMhoet+SUuKk6IN1bJcohCnML3Z5VOZVa+wVErhZyfKF1C/
 NnjdXCeQAzlByQinXhS1sXYZwHRbaQwyN0r7MpBvmz6N3/lNSs62XIwO3PatT85KPyYa
 I0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5T1q+s41fPQD7eof6Tqonl1CLLGxvvozknwhIlqSeIY=;
 b=B43hW09WzJBUveVnViEv0MP20AvXyq1p9gzLKtm9V9Rw3QaR4BaruESWDpmD/sP+KS
 Ar6SicU321OyV9oV50hoGIkd0kxngjaZZoyNeUppUcbSDvtuYEYUZ7SfyRm6mYEsGaLt
 PbuV9xK6OOUjKbdlKuKznmnwTOFWoBm2Z/L61XwoJkUhRozH0It9Nf9fb9RxfzNSgQ2/
 Wqt1ugtuGTpr5aOcAmMNUvQkyMQPIbUFnk/oXepEVYCr7hEBHA8WgyAU2I/zRn0vVvPn
 nVxZMD+5AirgdHsxjGKegHxyrIRXLmsLL6APU+3O35KSzwHA95vU6rNrSnz6mMkZp545
 IGKQ==
X-Gm-Message-State: APjAAAVGSMHECLNeYNJnEFnX8biXfzb6Qub9RLxONPMdzk50Iwkf1PPw
 mM3/wx8EikFgU1X90O2SD5mK4w==
X-Google-Smtp-Source: APXvYqz87XeGxJ4blumupC5s6LoHjrpUGm7ver3gc6XTezwuwOx9Uc66ViyO7ps4q4zmS4zTE9TXGg==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr82951769wme.177.1564073992368; 
 Thu, 25 Jul 2019 09:59:52 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 25 Jul 2019 18:59:43 +0200
Message-Id: <20190725165949.29699-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 0/6] ASoC: improve codec to codec link
	support
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

As explained in this previous series [0], on Amlogic, we are using codec to
codec links to deal with the glue which is between the i2s backends and the
synopsys hdmi controller.

This worked well until I tried to .get_eld() support in the dw-hdmi-i2s
driver.  Doing so adds channel mapping controls to the codec. This shown
several problem

1) .pcm_new() is not called on codec to codec links.
   struct snd_soc_pcm_runtime do not even have a valid .pcm
2) struct snd_pcm_substream and struct snd_pcm_runtime are ephemeral
   This is a problem if a control needs to access them

The goal of this patchset is to resolve the above issues and improve the
codec to codec link support enough to correctly handle the hdmi-codec

The support of these codec to codec links could probably be improved in the
future to behave like any other link and use soc_pcm_open(),
soc_pcm_hw_params(), etc...

The challenge lies in the dapm mutex. The soc_pcm call dapm function locking
this mutex but the dapm mutex is already held in snd_soc_dai_link_event()

Changes since v1 [1]:
* Fix rebase on Murimoto-san's patches
* Allocate params dynamically again and refactor the pre_pmu code to
  simplify the error handling and rollback a bit

[0]: https://lkml.kernel.org/r/20190515131858.32130-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20190724162405.6574-1-jbrunet@baylibre.com

Jerome Brunet (6):
  ASoC: codec2codec: run callbacks in order
  ASoC: codec2codec: name link using stream direction
  ASoC: codec2codec: deal with params when necessary
  ASoC: create pcm for codec2codec links as well
  ASoC: codec2codec: remove ephemeral variables
  ASoC: codec2codec: fill some of the runtime stream parameters

 sound/soc/soc-core.c |  42 +++------
 sound/soc/soc-dapm.c | 220 +++++++++++++++++++++++++++----------------
 sound/soc/soc-pcm.c  |  35 ++++++-
 3 files changed, 182 insertions(+), 115 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
