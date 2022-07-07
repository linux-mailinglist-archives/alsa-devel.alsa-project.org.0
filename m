Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA5756AC10
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:47:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242721621;
	Thu,  7 Jul 2022 21:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242721621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223267;
	bh=Z5qGTse89ch3/cMXyC2ciNro8mwkCbia+p7/IkeIZ4g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i+9DdZepDt1gVBPvIObnk34MnGbqSH9ek8qJ6SMwg9sbPlC1JJRwuhnHtyZeLoNk8
	 E5WuJ2khTNM52KkyDUkWHapz3QvF9kiMahilIeVgfAE7pFN5xZwBsv3AtOlU9WflLC
	 3rVsMPOYNbcCyEffUxD6AOMETZaGi1bTf+Bj4QJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119F3F80104;
	Thu,  7 Jul 2022 21:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2F3FF8028D; Thu,  7 Jul 2022 21:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28774F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28774F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="obemIAbu"
Received: by mail-ej1-x62a.google.com with SMTP id j22so7950438ejs.2
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4kRqvDXJLS7GmZtsXFWRLLZtfHq29P8onQ8FdHB/nc=;
 b=obemIAbufVUX0Je/5XsBCs2IbAeoJaqeC0Ye2dg4etoDg4Gx4IJ/GuGRTSEo0/+t1c
 MaVLtDhbQo8kX6EnbsrEOZqQOG0JJJhb82CgRsw5P28sFAsJ6qQdGiKgWqFrlktmgaEY
 6ILuKXzCrONa5M3aGa81w6a8nRBozHzdBFkh0DYQI0EpXYx2v4rCiksmNal2s+TSwp/5
 itz3hUzy8TzLA0SvjzSJSJwqWijO9DjiOpsAxfAq5c0gzU654gzCgKmJgABigIPSejcN
 dMUdPaTvEH5kifwV3HjSYduzHjtCYicNobHEaR1N+m3xkfFXO4Ptiztez8AUgbgZmmaT
 h9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4kRqvDXJLS7GmZtsXFWRLLZtfHq29P8onQ8FdHB/nc=;
 b=r9BK+D/TXtVNjZwZYKXJxGqoWSz60YtGF227tdbFsa1zydgnkLOEmZfyJXW45AvZLy
 AxjeLSdOY5wAV5TzB/ZCxALPTlIRYjEjFTrkaq3qAxm3eN8yzmQDFmMMfnAzSejoVO+a
 8cA1ulS7RJCJ/J9Kq9laXtomHRoXB1dIhG7HmqJII1OKJ/IlmAit9i/gEN7pOvjG+Kzn
 YKPgZ3JwRmZuVzNkLuYaVggoUKjcG1Se8HyrfA0GUWT03V5N+n/It2sAAKZxn7eE34q/
 rOVIWVo5b/UZv00e8lIsI/IrYUdrAffpOH4K1nekRGFFSvYQ51EMTaCo7XrvHD9gtT/o
 5KuA==
X-Gm-Message-State: AJIora/Ee6R2AWpVyL3SUAWf4epC33sL8NpvtUl7B/KfSZPTrOBQmDQ0
 7TWVPpME8nWSOaPplzD8umI=
X-Google-Smtp-Source: AGRyM1tYDIOipNBlPWqFzK1Y0g8kMPF5iQqDRhDwSVrvLwVWbXfp5Rd4m5iNHpkpQS9eh2EXVw6t/A==
X-Received: by 2002:a17:907:2ce8:b0:72a:6315:9412 with SMTP id
 hz8-20020a1709072ce800b0072a63159412mr39942235ejc.47.1657223198907; 
 Thu, 07 Jul 2022 12:46:38 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 lb23-20020a170907785700b0072af0b036f3sm3656613ejc.41.2022.07.07.12.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:38 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 0/11] ASoC: cleanups and improvements for jz4740-i2s
Date: Thu,  7 Jul 2022 20:46:44 +0100
Message-Id: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

This series is a preparatory cleanup of the jz4740-i2s driver before
adding support for a new SoC. The last two patches lift unnecessary
restrictions on sample rates and formats -- the existing ones appear
to be derived from the limitations of the JZ4740's internal codec and
don't reflect the actual capabilities of the I2S controller.

I'm unable to test the series on any JZ47xx SoCs, but I have tested
on an X1000 (which is the SoC I'll be adding in a followup series).

Changes in v2:

* Drop two patches already in sound for-next.
* Squash two removal patches into the regmap fields patch.
* Remove the unused 'mem' resource in the driver private struct.
* Use regmap_set_bits() and regmap_clear_bits() to improve readability.
* Add fix for SoCs with independent FIFO flush bits (ie. most of them).
* Update sample formats patch with a more informative commit message.
* Add two new patches to refactor DAI/component probing.

Aidan MacDonald (11):
  ASoC: jz4740-i2s: Remove unused 'mem' resource
  ASoC: jz4740-i2s: Convert to regmap API
  ASoC: jz4740-i2s: Simplify using regmap fields
  ASoC: jz4740-i2s: Handle independent FIFO flush bits
  ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
  ASoC: jz4740-i2s: Align macro values and sort includes
  ASoC: jz4740-i2s: Make the PLL clock name SoC-specific
  ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
  ASoC: jz4740-i2s: Support continuous sample rate
  ASoC: jz4740-i2s: Move component functions near the component driver
  ASoC: jz4740-i2s: Refactor DAI probe/remove ops as component ops

 sound/soc/jz4740/Kconfig      |   1 +
 sound/soc/jz4740/jz4740-i2s.c | 460 ++++++++++++++++++----------------
 2 files changed, 247 insertions(+), 214 deletions(-)

-- 
2.35.1

