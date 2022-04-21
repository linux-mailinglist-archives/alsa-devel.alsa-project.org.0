Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F52509FCA
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 14:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B0818AB;
	Thu, 21 Apr 2022 14:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B0818AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650544809;
	bh=mZV6jg/l9v3a4DV8qZCxa9Z/+AAEjmuRRW5FWEfYYuo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lu2Yv3jEN2DVBH7tJ74/C5owA1mCpcv2Hu0BBvpio/PpB43256SRTYiPYTZsWhuT0
	 /LBRF03034tjQzRmYGVqVRsw58SGwGw3uM9XtFmfM3P64r/LGCKB2x8ET6k5oNqS11
	 aTEClX61A+imeQNwM3Wu+ZGc7u0bHN6KTCQf0aOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5027CF80279;
	Thu, 21 Apr 2022 14:38:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1D36F80279; Thu, 21 Apr 2022 14:38:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06AECF80279
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06AECF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m1fxiOYI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A9D161C19;
 Thu, 21 Apr 2022 12:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF961C385A5;
 Thu, 21 Apr 2022 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544707;
 bh=mZV6jg/l9v3a4DV8qZCxa9Z/+AAEjmuRRW5FWEfYYuo=;
 h=From:To:Cc:Subject:Date:From;
 b=m1fxiOYIbqXSg5JhWQRv+nkjjXTs8A8YqaBY8AWR1I7yZIuxUQY3OYDlzCwHIai0B
 wo0Mc21vewiFVEm6g+R5dG4GW4VBGYjo+lr4XN9VLNlSeW3bY3JMDH1z98OoznCafY
 0knIwrKT8xI5Zwt5c2Se3TEowvo+2AOAofr7osuMvcwW9NWySTsP6oHYr22cDxLukZ
 KMk4nA8UBaX4lcG/D1X22+m50jultOsh3uY4t6JHVY8pT5p9W8i9Yjf6DV9CqE2T2H
 RzuVuADjy6aSrFPhAGSMpngksXqDFDU11LhdciSAEa1jP+o1CXvaSvvKOa3pY6HPyK
 cIGYIkJ6Aowzw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Date: Thu, 21 Apr 2022 13:38:00 +0100
Message-Id: <20220421123803.292063-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; h=from:subject;
 bh=mZV6jg/l9v3a4DV8qZCxa9Z/+AAEjmuRRW5FWEfYYuo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVAnEt659yX5Ay9+sUz1/yC8FsbRHmNSuHpg+85+
 4jQbB5qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQJwAKCRAk1otyXVSH0LgtB/
 93r+28bvi6Qui21dUjq6Yq4usblNMvsL7Uc381POf8kjT0nGv+NHBL1ubIRBPJ6YguTap4PZTtXz7s
 mYbWEJmE2wiPXOokdlV3oHSQDFlzDkK4uIw6SEhDkS2o1vLlTWXuVksRSpX1I/RvwmAGc6W9kP3lMT
 ulZeeU+fWPZ1jhO4QhT55wmS0Vga/PGsYKSo3dsCIwffRr9xQrGeBMqM98VOz6YGoHYxDV1jqsY3kQ
 HYdBgt6HzfODUQ2rrxFKifd+xB5NsGRZIk/rFez93BL9vyj8KUZwy9iURogb67hvKkKF9WI8fHYZbB
 OOsb7L66jCnDLOKMoADG/Q9IH1uZGk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

These patches fix event generation issues in the custom controls in the
Meson drivers detected by mixer-test and by inspection once I saw the
pattern in these drivers. I'm also seeing other failures due to these
controls having invalid values, eg:

# # AIU ACODEC SRC.0 value 3 more than item count 3

but without documentation I'm not sure how to interpret/fix these -
either the value should be fixed up on startup or there should be an
extra value there (disconnected possibly?).

Mark Brown (3):
  ASoC: meson: Fix event generation for AUI ACODEC mux
  ASoC: meson: Fix event generation for AUI CODEC mux
  ASoC: meson: Fix event generation for G12A tohdmi mux

 sound/soc/meson/aiu-acodec-ctrl.c | 2 +-
 sound/soc/meson/aiu-codec-ctrl.c  | 2 +-
 sound/soc/meson/g12a-tohdmitx.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)


base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.30.2

