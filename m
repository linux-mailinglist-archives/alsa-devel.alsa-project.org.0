Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED09147FE
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 12:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C8A1872;
	Mon,  6 May 2019 11:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C8A1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557136812;
	bh=d3j1jDqfjQh7DFdXqoJ7UOkvYXp8RBI7lpKMS7LKSC0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OBVjYKsIpd9DbkXPjOw8SU+fTDIImhTqNwEhinN6BmrnCZ77HRODnRkeM05smbJGm
	 Kh1KZ3SjRG/qHn/WTvz9U3cYy4lisRI+Sm6WxfqmSHPKsUUq3kYjQ5pnH0rMrV0q0B
	 kb5aB6dHzR3SvxifduT2RnP5HS9NsRSt59atIUD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6644AF896F0;
	Mon,  6 May 2019 11:58:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A72ABF896E6; Mon,  6 May 2019 11:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7776DF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7776DF80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Pck2O9ce"
Received: by mail-wm1-x344.google.com with SMTP id f2so9486587wmj.3
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9jEvZjc2+umi5MvYcNLZKb83bYswxMWT40Sgskk8a0=;
 b=Pck2O9ceC4Nncwi5pyCGV9hFb8Bp38Ivr0tb4n4clKpvOCdhipVZqz6sfOMHgMIIt+
 CaSg7FiXYx8KXsbEOpBJhHo+qFlGyy0XC9TvLD2XxgUszj3wGI+lhWO0vbg9EGfFlSCq
 e7d4GkFiHDB++qk4/g9ypeiXgyaraNi+jNYFU9pli/VJMEb96gkLBEZobauv9okX8h38
 cYpFKtxDv9S1umpDjAE6LxVaeEvyIl365uo3PbG4jq7z2X62Khc3jSE0ajixSrTx9GVC
 aWPAtWITMz5i0fDzcjULjoOzdn27FF66Jw4Xg5BCDkWJXfmJD9Ji/rJBCOF6q2pxHt7y
 L7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9jEvZjc2+umi5MvYcNLZKb83bYswxMWT40Sgskk8a0=;
 b=a784CENboCT90VNX9xks/yYIfdBEtiBf8snqbTUURHjGzbVzQo6CrEYpIA3iOKqg4G
 CMBIau9aSEhuTctuLah2k7LsFzGDSxX9HrPPp/4uGVx+c55Rt1ProPMNzuC6MdAVGiK/
 CrX03+PAFCiMIlxgZeWdIe/tb9/KecvDsL2TqIXPR5bDDXbm9tv2s6JUADRrzjxa245F
 khclP5TE818OlBqp+O7UzJ0r5GQnNOWBBd+KjKGtVuxQzplDb12l/oExJKpmykwzaEdc
 inLRC7ysvbtalWz7gdps+9ShPzmwnUrr6Gpb06UljzxESEZoXHLHNAI3Oy8/SiI88MyN
 COPw==
X-Gm-Message-State: APjAAAWP1kbme5BJJyLHtHkivYdWLBX0HDr8X6jiHdba2YGPHaaoCh2C
 lXrOXeRw3TLG/jTtdrZPHSlD1g==
X-Google-Smtp-Source: APXvYqwibJMkjX4WpvOLZ+fmynsQiAFeWPLepic+Pu+LFXREzkXRg8kZCwEWJPVPmKqzBQGB3S3i+w==
X-Received: by 2002:a1c:eb03:: with SMTP id j3mr16172394wmh.15.1557136702640; 
 Mon, 06 May 2019 02:58:22 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c10sm23409791wrd.69.2019.05.06.02.58.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 02:58:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon,  6 May 2019 11:58:11 +0200
Message-Id: <20190506095815.24578-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 0/4] ASoC: hdmi-codec: fixes and improvements
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

Changes since v1:
* Drop already applied patches
* Rebase patchset on sound/for-next

Jerome Brunet (4):
  ASoC: hdmi-codec: remove function name debug traces
  ASoC: hdmi-codec: remove reference to the current substream
  ASoC: hdmi-codec: remove reference to the dai drivers in the private
    data
  ASoC: hdmi-codec: remove ops dependency on the dai id

 sound/soc/codecs/hdmi-codec.c | 188 ++++++++++++++++------------------
 1 file changed, 91 insertions(+), 97 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
