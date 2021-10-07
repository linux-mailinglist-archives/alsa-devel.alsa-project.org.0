Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E01424BD7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 04:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8847315F2;
	Thu,  7 Oct 2021 04:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8847315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633574504;
	bh=InGqucc62ZYMr1WtkutA5FBp7KXBlrC8+tssE6HbyFA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m3UeI6CtHV+IZ5OFri4/oa9CGOh3JfBPnruS1UnyxqBW8jmA9d65Ks9W5Ci9gXWdi
	 14vhMzqHKN9tEWcocymVrvS3ftqHjN0q0MbsFy1BCRwDBreTQ0nsSqYskf/UI9E1X2
	 KXCYbwRubf3XnSjnPNmuZB6vbUmWvpAO19GEnVaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F3DF80130;
	Thu,  7 Oct 2021 04:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B56AF8027D; Thu,  7 Oct 2021 04:40:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dnyon.com (unknown [IPv6:2001:ba0:1800:12f::1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C563F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 04:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C563F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="zhwnJWAw"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id B059B3FD71;
 Thu,  7 Oct 2021 02:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1633574393; bh=InGqucc62ZYMr1WtkutA5FBp7KXBlrC8+tssE6HbyFA=;
 h=From:To:Cc:Subject:Date:From;
 b=zhwnJWAw0ou5BaKphNIfrtWm2WGiX8PSehems8NJwg0IeHNblYaTZIuBw99YUwjrW
 loA2+uLXLeC7qyFWxfOscZlgw57HWHZslp4iGKXHFMggm+pBzmk+7XZNpRqjp1lf+g
 ZY5TkYAg/z+6fPQDh0fFFe0RznPa44QAIzA7XMyNcUQCqfAZXiOpvVUcs9d12yc6zC
 2XK8qiTOg0mKz5sQrdumOriaSgEV1eDdvnNSp375FoW/c8H7AdayKqAY/4g2Uc5QXo
 qSVX0L31txEF7u9+UIqdWqgbGHe4lpAkZChuPT0xC+m5E4BS8C+1ZDelfgajVbeQFh
 vWEyLDd5WLkvg==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 ~postmarketos/upstreaming@lists.sr.ht, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add reset-gpios handling for max98927
Date: Thu,  7 Oct 2021 04:38:54 +0200
Message-Id: <cover.1633572679.git.atafalla@dnyon.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Alejandro Tafalla <atafalla@dnyon.com>
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

The max98927 codec on some devices (i.e. Xiaomi Mi A2 Lite phone) requires
hardware-resetting the codec by driving a reset-gpio. This series adds
support for it through an optional reset-gpios property.

v4:
* Correctly assert/deassert the GPIO states
* Wait for the i2c port to be ready after reset
* Reset device when removed

v3:
* Fix indentation on the dev_err_probe line

v2:
* Use dev_err_probe instead of dev_err

Alejandro Tafalla (2):
  ASoC: max98927: Handle reset gpio when probing i2c
  dt-bindings: sound: max98927: Add reset-gpios optional property

 .../devicetree/bindings/sound/max9892x.txt    |  3 +++
 sound/soc/codecs/max98927.c                   | 25 +++++++++++++++++++
 sound/soc/codecs/max98927.h                   |  1 +
 3 files changed, 29 insertions(+)

-- 
2.33.0

