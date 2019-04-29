Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 236F9E3CF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F8A61675;
	Mon, 29 Apr 2019 15:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F8A61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556544740;
	bh=AHi2KhP0KAjMEbxrV4OljM0EtKe7tCF+B8mOipbFGW0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XkqTZo5ehsplr3SUFxCIGxgfkC/qeNIqvZcct3F/IlA82I87fMlZVmIWgxHkMujRj
	 MeHmmrRF2v2+zUJBAmgpfvKPlqEWqmx6Pq+EqaEGqDu4I6wcU7IUOMBi6DvAq+4JmU
	 9reLGJnBAJ2stBUTVZ9bKzo7zqHi9EO0vT71uOuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D38DEF89721;
	Mon, 29 Apr 2019 15:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC551F89693; Mon, 29 Apr 2019 15:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB356F80C0D
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 15:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB356F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="y1KrOO2X"
Received: by mail-wr1-x431.google.com with SMTP id r6so16084189wrm.4
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMPo0rd7ZXjpiRM4+zIpn+YrRKSVz4ZqI2UlGQZefLc=;
 b=y1KrOO2XKwzw0QbhbT87K2BeeNvx+RN+tOkxY34bnGC0fEhMdcoMNQq/g3j/fai1Ip
 yIwDX6ptAcPntfpkqh5kxruD1yOHc4SNF8VAYYTPkyWjXQfsPvolKCtiMht1gqB77OMr
 kDpXTxPrzS3pgtk6NsFjJNqluthsqfFROO32TJYUQ/VFQzpWOWQaxg/mQvXRodbFn6XH
 XIibnKsCO9J8G+gtRJBA8Iz9UlXM++UYgizAERYQR7s+E+6MIUm9C9xwOiNQ8v7DUokV
 ogyT1HfO3CTcDBDSx73EpUcnoFpB3Hv/SioigduQSTzx6udoOU5kBZwLOnBGtarlHQUv
 HQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMPo0rd7ZXjpiRM4+zIpn+YrRKSVz4ZqI2UlGQZefLc=;
 b=L0K/o3I4itJCeOW/UPscyexd6lF+uTfOp1nzptn+16lX7tx+kMYrU6RqOB6VbgtGbY
 ORYnPxNjmLbiI8akams9IK/DvJdT0nKso0NbK0M8mCvwoyyb66aKGphqgvr7uAKYmCbq
 IpsoLQidIWCHkGIX+8ba9lAzWi+0B+WVI9tElPjQWYs3y13Uj+pvk4Ymf2rG4LdeG2uS
 a4PLR6jjrEp+qGetMF99XqFTOos5jGlUesDpXJlBlQgFE/W3xskb3mFgWA6YPUemhqG9
 TDIPQKDDi1y3mCTKWl3tcJpYuqL7Ce1QiBTs51gXj3xNOe1SLs7DyYIO31wBtkfm5JZP
 QJWw==
X-Gm-Message-State: APjAAAVwSuNo2RRNJpGxr0R6JM9/bXsDHnnmNqOQQoU4FcFwt48rP0k2
 0w/+LM/fQ9tZ5Upro+gBfaMF5w==
X-Google-Smtp-Source: APXvYqxgLutCwa5iw2MV+S09Q8TgGm4NR377EBLqs43h9sjcaCUGdnwG5LVkz1dmERLKeUqev1U6FQ==
X-Received: by 2002:adf:e288:: with SMTP id v8mr5162412wri.7.1556544588440;
 Mon, 29 Apr 2019 06:29:48 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s17sm2857593wra.94.2019.04.29.06.29.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 06:29:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 15:29:37 +0200
Message-Id: <20190429132943.16269-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/6] ASoC: hdmi-codec: fixes and improvements
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

This patchset is a collection of fixes and improvement on the hdmi
codec driver. It should be completely transparent for the current users
of the codec.

The most important change is removal the current_substream pointer which
allows the codec to be used on codec-to-codec links. I plan to use this
for the HDMI sound support of the Amlogic g12a SoC family.

Jerome Brunet (6):
  ASoC: hdmi-codec: remove function name debug traces
  ASoC: hdmi-codec: unlock the device on startup errors
  ASoC: hdmi-codec: stream is already locked in hw_params
  ASoC: hdmi-codec: remove reference to the current substream
  ASoC: hdmi-codec: remove reference to the dai drivers in the private
    data
  ASoC: hdmi-codec: remove ops dependency on the dai id

 sound/soc/codecs/hdmi-codec.c | 259 ++++++++++++++++------------------
 1 file changed, 125 insertions(+), 134 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
