Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B865B2A558
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 18:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E6D91758;
	Sat, 25 May 2019 18:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E6D91758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558801810;
	bh=xJqYeRUU9H/PmcOU8zsmICmqfOIfKNCmfmd+aDTTsqE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aXBARzKDhLWMD6CmcVJZKXQ9Ds4oQBopCFzBwoZmoNsvarOumEE+LyKEtAWX6QP1Z
	 rM2be34cML+JuDQXMmX+9hVS4GPyWmPraUL1zhNoMaqzJwTNZgsQCXHLUHwyz5eQQa
	 axeZpCJBw0lV2zilSK7Vwc8mifrdY5G/6gT1z13Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 036E1F8974C;
	Sat, 25 May 2019 18:23:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6175F89715; Sat, 25 May 2019 18:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2B8BF806F7
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 18:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B8BF806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jUrGqIVc"
Received: by mail-wr1-x441.google.com with SMTP id m3so12812560wrv.2
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mz71BHS9e6D0Hy+3p0/CgKuWt1VgJzq7zAM5T7mHY2o=;
 b=jUrGqIVcaMBSQcLPCUQrRz5m5HvJXlyQ468xiszvGOrzlbZiJta79v1MI4OHS9BrJw
 slJRfaQIZKHfawdD+VE64WDHAPRL8caZPMvUxY+fajXRhXJTwKAflma5EW4AsMaWbWy/
 cpt652xyVNGp12XtgtneQfp0kk6rTic5HQrz5e4nzEcg6RBBUSY+ml1QHvBDYRVmC0wT
 3GdZg17rdLHujZf4MJlVc2IGS1SceA3Aibdddsw19d5+Dd70wtQAOCVOteyeTCOaxbpg
 J+mjNfS1QZ5ksoqvUxq++X25DwHkdiBEra11GEMmjPQWPi8wHwQOPRuz9TWYguyOY4sE
 DNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mz71BHS9e6D0Hy+3p0/CgKuWt1VgJzq7zAM5T7mHY2o=;
 b=hNRdYbL/WuHqMFWsgjDNQN8Ad7EOnJc/7HRFaXwS4C4dHXhW2WcHwEdTqRGqyEZz9t
 jtSrgNDa59FvT5R+QGdYsY9uoSYq7lz3bJ88rJ82t2iFd8MUIW5/fPXynMFZgUmyWgv7
 jGajRJDnBTU3IBGKsvMxQq6VTIivZPPz6bOe4fxCdu3NzJ+Id+GyE0WuvVIqdd6Zgtfa
 lVJ3BYH3oTI2QNjJZNBV0z6g2q5v5qqr6Aci4Ga9K+dswr4ylYVlpa1HTQ7FNoANi+eb
 as80+/VKtGKnBW9cpqUsAS1ZQ3oYaoR+0Gt6zp/fR4Wqtwg6ibKh4whwuhhL6ToXZb9y
 ePNQ==
X-Gm-Message-State: APjAAAXQgrGJKfAKWUgIgA399R+tnIbipOUHLJbvme6BLcGknxrbyKP+
 +RNmFnNNrAEXXWvYK7Pah8U=
X-Google-Smtp-Source: APXvYqwOH/zwDPb6sFjgA3noRqLyg0IS8DDT4t4lmVfw9uSbTr3HjpeHNuNaUkAdH15jvnlEPnlHJA==
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr37265578wrr.26.1558801419314; 
 Sat, 25 May 2019 09:23:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id k184sm13194409wmk.0.2019.05.25.09.23.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 25 May 2019 09:23:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 25 May 2019 18:23:23 +0200
Message-Id: <20190525162323.20216-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525162323.20216-1-peron.clem@gmail.com>
References: <20190525162323.20216-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 7/7] arm64: defconfig: Enable Sun4i SPDIF
	module
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

QWxsd2lubmVyIEE2NCBhbmQgSDYgdXNlIHRoZSBTdW40aSBTUERJRiBkcml2ZXIuCgpFbmFibGUg
dGhpcyB0byBhbGxvdyBhIHByb3BlciBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
UMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVm
Y29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZwppbmRleCBiNTM1ZjBmNDEyY2MuLmRlNWI2NWQ0NTMxMSAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9jb25maWdzL2RlZmNvbmZpZworKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
CkBAIC01MjYsNiArNTI2LDcgQEAgQ09ORklHX1NORF9TT0NfUk9DS0NISVBfUlQ1NjQ1PW0KIENP
TkZJR19TTkRfU09DX1JLMzM5OV9HUlVfU09VTkQ9bQogQ09ORklHX1NORF9TT0NfU0FNU1VORz15
CiBDT05GSUdfU05EX1NPQ19SQ0FSPW0KK0NPTkZJR19TTkRfU1VONElfU1BESUY9bQogQ09ORklH
X1NORF9TT0NfQUs0NjEzPW0KIENPTkZJR19TTkRfU09DX0VTNzEzND1tCiBDT05GSUdfU05EX1NP
Q19FUzcyNDE9bQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
