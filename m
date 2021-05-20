Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6838B59B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 19:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9A7169D;
	Thu, 20 May 2021 19:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9A7169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621533376;
	bh=IXb9Eo3tH/Em2H3KKS6ISrPURwZHcnixzMw5Fn2vRLg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mLYbHkqkUNz4PsbrVyXS3Ez2JODjnFWMPf6a1yWwnReci1ctKgpCWFjv/o81zXwZU
	 d+yUPaN4w1ZbtvJWx2wXEbWoyMprtGcrTMe66nN/zAKHm3K7xHPbIm3RvpWSjng4MX
	 AXMJU8zCFhBBW7vDLUYq0sTGq0irDym9klSvYyfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CBD6F8020B;
	Thu, 20 May 2021 19:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09302F80217; Thu, 20 May 2021 19:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17BE0F8020B
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 19:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17BE0F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="drigm3jW"
Received: by mail-lf1-x136.google.com with SMTP id v8so20803534lft.8
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MSeuamGnXAgkNNyC56B/8tNoyLHAJZahhkX5EWuZJAo=;
 b=drigm3jWBw/husIrX7rD1YNqveBwT7xCa6uR5yJowZYmeRz0wH4XGX1ft/dZN2BDWU
 TYMZOkQQ6uGSHWBUHnIWIApKvALY3W1e1EJCRzSmFtvz2sqeVMeUuuMDLFgITIPOth6U
 k4UQl9UkvHCdFr1ONPpqYUXKwCAXjhMtmCGPKoOoaIqeV36VOVrCDGD+/+S9EERVt8sc
 uV98A+1k29+A81Gp3CZRpPBkLLCAY3Vj5pK85SHWPIUP/BR7xX2nb+sk9JjZM4FJizd7
 KQvFlS6/ZjjN5z2RW89Rewzi0xGntGpytqAxhSj65f6MAR7oTaS08CSbdPsd4sO306ZY
 rqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MSeuamGnXAgkNNyC56B/8tNoyLHAJZahhkX5EWuZJAo=;
 b=Txv47pAsGjmN/mv8cq5nkfrXL5M33svMR8QvQGxPg6kY9JIE+6kHkGK0+j3vGhtwfd
 L71A7nC+fRRFyR/l4gogLwxZfHUtSH0uS1K30Mn77UuflA2URXJsuZ+wbXvNOg6jtsTu
 b1doiLRNmgicZxnLK/CMZ8Mm9P9RU/fQ5QMXDa1QKB3PKAAWkwgxC81iNpnTc5ps+EFF
 Xpm1w/kRc9qoH9RmNw+cbYY3DzGzJW4ttC+vjW8iXrR/fg7B6HnZWSWooUcmVQ9uuOHO
 iAY9xgmNx40QtXt8x0pZMeDKkixqxZb+Hd/1FNNCIFHz9tXvizii84yeSatimv9dFAlx
 gqKQ==
X-Gm-Message-State: AOAM533mHDhPk8c/vQccGnIAdj31ogFMeeXJIqEAKn/VXDYZcvQ9Sq2q
 0VCR9pPwuLzL7L53LdZ5/K8=
X-Google-Smtp-Source: ABdhPJxbKMKYuzk8/vJ36ofueZGlvEO2QTJoXhdsP3WRbp3iQCou97D6+YYJIEq8B4DG9UKviipyoQ==
X-Received: by 2002:a05:6512:3d0b:: with SMTP id
 d11mr3816604lfv.405.1621533263322; 
 Thu, 20 May 2021 10:54:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-88.dynamic.spd-mgts.ru.
 [109.252.193.88])
 by smtp.gmail.com with ESMTPSA id h16sm362972ljb.128.2021.05.20.10.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:54:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 0/2] Unify NVIDIA Tegra ASoC machine drivers
Date: Thu, 20 May 2021 20:50:52 +0300
Message-Id: <20210520175054.28308-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
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

During review of the RT5631 machine driver, Jon Hunter suggested that
it will be better to squash all the current ASoC machine drivers into
a single one. This suggestion is implemented by this patchset. The
RT5631 support will come later with the ASUS Transformer changes.

This series needs to be approved by Jaroslav Kysela before it can be
merged.

Changelog:

v2: - Dropped use of of_device_compatible_match(), like it was suggested
      by Rob Herring in a review comment to v1.

    - Added patch that sets card's driver_name of as Tegra ASoC drivers.
      In a comment to v1 Jaroslav Kysela suggested that the Tegra drivers
      don't set the card name properly and he was right.

      I opened pull request with the new Tegra UCMs and updated lookup paths
      for older UCMs [1].

      [1] https://github.com/alsa-project/alsa-ucm-conf/pull/92

Dmitry Osipenko (2):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 732 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  45 ++
 sound/soc/tegra/tegra_max98090.c     | 276 ----------
 sound/soc/tegra/tegra_rt5640.c       | 222 --------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 357 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 ------
 sound/soc/tegra/trimslice.c          | 172 -------
 13 files changed, 862 insertions(+), 2117 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

-- 
2.30.2

