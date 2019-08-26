Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A09D581
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197BD16BD;
	Mon, 26 Aug 2019 20:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197BD16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566842970;
	bh=mkNJbWu5MvL+Zpwdb7maSnlbYVOur9ogkxWXrNYaKGE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TydtnkEulQ0f11FFoNE4x8tT35Ic7LOUFyO9mC2v+TqnltRS/86yUdmevsTbeaPeD
	 JGpoy1OSTrGS3de/dWwb66APhF1mbUiQVHrj11/1tzfrb6/t/nzn4ujugPloGHDS1Q
	 TZNioiU6I4uQt4/UtoAQLw5LuhmxXLD/nZBeM5Rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D686F8038F;
	Mon, 26 Aug 2019 20:07:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DED84F80376; Mon, 26 Aug 2019 20:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79906F80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79906F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jcuZpF/k"
Received: by mail-lf1-x142.google.com with SMTP id o11so3660032lfb.12
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ZhbVTTAhELTpK9khEQbzX5xO6vbVG1SPvOTB99Q+OI=;
 b=jcuZpF/kXVwnEwcdZZ+XnmGDbebmISf1OOdd8xcPrfviFFqjWIK1rsoOScOKksNso9
 bCXRagueJdLy0jSCwO0nqUk8F7/peUhgAaYhfvpOSYer0aXKD6poVhN5EaCWQXLVZNAB
 0L9XZsl31CtoRjoRvw257ge9D2O1b6Tslqp52qCLFSMXLKVK1a4BUyJiMRkZMh6HG/3X
 rinB0UOC6BJtIFqfZgUwgmR0nYGmFA6dbIn2f91U4DIde+H3vl/FP84JxWJbhY6lHJAx
 PA6y6uEXfM0XVjT3CUxLuTNQSxEul3GCMMItjBvyw15MpABL2keyRdErEmj9TsLtqvn5
 Xa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ZhbVTTAhELTpK9khEQbzX5xO6vbVG1SPvOTB99Q+OI=;
 b=JoLjzpdKXLfj2oHueKvZUPT3o+Z/C50lrdhCoAKU1nRF1nAGOoNUXQstr2UpWbAlDl
 11jy7NvDz6aWllxc1JeZgIXXFtHUM/N+FjMv2uH0T4gIWHC9AzqoO4MlWF/PtybKMTR3
 16CeqXp0MOdD+9f6+Zj3qj34TWGRwhI6v/kxG+VJWXyQNzxjc2hsEwDA7HT2EBo7FBFM
 2Fl2ueiKINzXPipMrYLQM7UsCZJfMzx4mEFb2HQJ0y/2tsxjZH8KlybO64205xclgcK+
 8ziCBgoie27DxIRynwDQO6g7wk3E9GF10+jH3Lr5tq5RTtXbdseUid5Ye5ob8xgfWRrq
 g4dg==
X-Gm-Message-State: APjAAAVTl993XbegX9W8MlcAjchiyYwsHRQ3KjRP0wQlb4fKfnJdolsl
 oXqEvlX34z30sJaAEqTTeLY=
X-Google-Smtp-Source: APXvYqwlKQ3vF5aBWkClkQ0SKJJhrLTfbv5xkLecYvruosChOjV23gpdsyMuOCHHHcpFh/3pKBCfEw==
X-Received: by 2002:a19:f007:: with SMTP id p7mr11474484lfc.24.1566842857231; 
 Mon, 26 Aug 2019 11:07:37 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id u3sm2215564lfm.16.2019.08.26.11.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 11:07:36 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Mon, 26 Aug 2019 20:07:31 +0200
Message-Id: <20190826180734.15801-1-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 0/3] ASoC: sun4i-i2s: Updates to the driver
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

From: Marcus Cooper <codekipper@gmail.com>

Hi All,

here is a patch series to add some improvements to the sun4i-i2s driver
which is enough to get HDMI audio working on the A83T, A64, H3 and
H5 platforms.

I've dropped a lot of the functionality that was presented earlier in favour
of getting initial HDMI audio delivered. H6 and multi-channel HDMI will
follow shortly.

My test branch for this can be found at
https://github.com/codekipper/linux-sunxi/commits/upstream-i2s , I've been
using a Pine64 to test with; validating the new SoC block with HDMI audio
and ensuring that I've not broken the old block by making sure that the audio
codec still works.

BR,
CK

---
v6 changes compared to v5 are:
- removed patches for multi-channel and H6 HDMI audio.
- removed patch for 20, 24 and 32 bit (will push support for just 20 and 24bit)
- ditched tdm patches as support has already been added.
- added fix for A83T reg map.

v5 changes compared to v4 are:
- removed delivered patches.
- Added more details to commit messages.
- replaced some reg fields with function calls.
- Added DSP_A and DSP_B support for H3 and later SoCs.
- Added support for the Allwinner H6.

v4 changes compared to v3 are:
- Moved patches around so that the more controversial of patches are
  at the top of the stack.
- Added more details to commit messages.
- Fixed 20bit audio PCM format to use 4 bytes.
- Reduced number of flags used to indicate a new SoC.

v3 changes compared to v2 are:
 - added back slave mode changes
 - added back the use of tdm properties
 - changes to regmap and caching
 - removed loopback functionality
 - fixes to the channel offset mask

v2 changes compared to v1 are:
 - removed slave mode changes which didn't set mclk and bclk div.
 - removed use of tdm and now use a dedicated property.
 - fix commit message to better explain reason for sign extending
 - add divider calculations for newer SoCs.
 - add support for multi-lane i2s data output.
 - add support for 20, 24 and 32 bit samples.
 - add loopback property so blocks can be tested without a codec.

---

Marcus Cooper (3):
  ASoC: sun4i-i2s: incorrect regmap for A83T
  ASoC: sun4i-i2s: Add regmap field to sign extend sample
  ASoC: sun4i-i2s: Adjust LRCLK width

 sound/soc/sunxi/sun4i-i2s.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
