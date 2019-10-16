Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48FD8902
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 09:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C584166E;
	Wed, 16 Oct 2019 09:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C584166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571209779;
	bh=qNs66JWmgMJchGrTRnYqeA0YSdl00HCbc07dAW7ZkDk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LfHHpnNeFzZ0cPLcjOlPYeTyinYsBZj+L8cQPgv5Rg8p9JG4LMGLwTKlF/VzCphEE
	 +zelNox3NrM6tzaBjP2j6O50nwJ1sI1KhV1Ejhcwd4aqj+mNEh5Ov2KRU3pvA90hcD
	 RNYfxVZ/z3//L4QEHSNarF3Wunwj3FeqciGqRkpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A5BAF80376;
	Wed, 16 Oct 2019 09:07:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA5E7F80369; Wed, 16 Oct 2019 09:07:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D0AF80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 09:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D0AF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Do+e/YaG"
Received: by mail-lj1-x241.google.com with SMTP id 7so22809319ljw.7
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhTgNjpKNQusZyPVoOQIc1FXI/m0QRLJulVFef76XX8=;
 b=Do+e/YaGZ/1kWMOZw1D1T1VnuBALKM+/iodChqull8q+46Lag2kJ3nIo7vEhP38y5z
 Yx/BSyBkRCVuh2n96BV0wQa7eiQhZ5cUKWivQV2hY6S4HKkKx/H/d/PUMMWgG3ijMTkd
 FYzGq1f2k8UALpZUFtbNZnLTwxCcUN7lHYIXoZNUxbO8KeQaEDMPbhl+j0zXHFiR6+rE
 7uH3DeWFbEeiHiVkSfzGwUCsOhj4OVpiJIsw+y6VTfTeBUUl9E3FK8ZI3X8d0ynXfjnA
 3ieluyI+90fOxZE3q2V+qrlN/M0gdWB2+7TCVXM8WXSwLy8VbfZTLXMEAVgGe7ZaYvii
 SU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhTgNjpKNQusZyPVoOQIc1FXI/m0QRLJulVFef76XX8=;
 b=SbEg2QtLRI5qR3J8Cd7wnsw6QZVo+bIdi3kmkbNBl2yccJOlxBltHzpjM489VPx/lu
 UPHSXYCd9KVDnEM6JfDSSGDpVLNVNNHkeUKczpBCmNXX1NB6HfideM0kxAMcmO136fXq
 vOZ0TwgWK1e3iMGmPI3j2JYm+qA3tRhuiraAtXQQw8dGlIL6ygBKMliwj1ZNw8CLQZGq
 5rTZ8gxKQC9YwgzblHLuSSxnY4rD7RLrn8eHlIezKRDakBB+sD0yIvhbAvPqsQjKUVnk
 TQMBYhOo2jfVNT8E6+Wxvm0WA3q12n9EkNE4l6uo4pp/k5tF35FodU0iXP715mllDvMy
 pa9w==
X-Gm-Message-State: APjAAAVV2IbELcCB5OjIW6ZrYbxAdbOA/Z93WRoQ0F0+gGCy3zKLadbY
 MINtfWervpIV6VRG34sS3g0=
X-Google-Smtp-Source: APXvYqwClC2cQSENX+/5tnSvwIw58bgtoluNV+WC1Z1QqCdducKDlTv9sD/34p2DOfggOz109aI5SQ==
X-Received: by 2002:a2e:957:: with SMTP id 84mr25058609ljj.23.1571209662571;
 Wed, 16 Oct 2019 00:07:42 -0700 (PDT)
Received: from localhost.localdomain (c213-102-65-51.bredband.comhem.se.
 [213.102.65.51])
 by smtp.gmail.com with ESMTPSA id j191sm1361493lfj.49.2019.10.16.00.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:07:41 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Wed, 16 Oct 2019 09:07:33 +0200
Message-Id: <20191016070740.121435-1-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 0/7] ASoC: sun4i-i2s: Updates to the driver
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
To be able to add support for the Allwinner H6 I've changed some of the
original reg fields into function calls as this made it easier to setup
for multi-channel audio especially across different SoCs. I've also
stripped out all the other patches unrelated to this which I will deliver
after support for the H6 has gone in.

These other patches are required for HDMI audio which is driving this
patchset and they can be found here
https://github.com/codekipper/linux-sunxi/commits/upstream-i2s
BR,
CK

---
v6 changes compared to v5 are:
- rebased onto the recent tdm delivery
- stripped out patches not required for the H6 delivery

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
Jernej Skrabec (2):
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  ASoC: sun4i-i2s: Add support for H6 I2S

Marcus Cooper (5):
  ASoC: sun4i-i2s: Move channel select offset
  ASoC: sun4i-i2s: Add functions for RX and TX channel offsets
  ASoC: sun4i-i2s: Add functions for RX and TX channel enables
  ASoC: sun4i-i2s: Add functions for RX and TX channel selects
  ASoC: sun4i-i2s: Add functions for RX and TX channel mapping

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   2 +
 sound/soc/sunxi/sun4i-i2s.c                   | 337 ++++++++++++++++--
 2 files changed, 305 insertions(+), 34 deletions(-)

-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
