Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E9F26571F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 04:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05B421673;
	Fri, 11 Sep 2020 04:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05B421673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599792643;
	bh=DUCrnnRvTGJakxtg1kqNCoUvlKaoBoyqkG8BZwDVfK8=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tUBAWZvo5SdEUGih5ZltCddVxp/wxxIUKSAJg7FKn6+y+OvI37eYZz2YKmeFgVnId
	 qGteplv/hduEphCr/B9FStE3i4JKDkGnN3k6wWaI3Qq1nf6LSU68iF9k0TYcI5Ar7Y
	 3Ha6HeB/ayT/yA2+PWe1oVTrTvDueCVUIBnUAAzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F370BF8021C;
	Fri, 11 Sep 2020 04:49:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C554DF800E9; Fri, 11 Sep 2020 04:48:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5090CF800E9
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 04:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5090CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="YCPcf4zW"
Received: by mail-pf1-x449.google.com with SMTP id 8so5878007pfx.6
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 19:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=bLNTRYbIes188tpc0mDmg8PeKqWkLkLsLS+cEmRfJ4Q=;
 b=YCPcf4zW9n2xKiuS5+Sk6CHvfpFrQXUtAG/znA41cDBEii323Cv+ykNKyUkB3Q5pbd
 vTxTyvi+ZeQTvz26dBGf43cou2OZ128LsjlxxL1DcuH/Echu1+uSnS3hk45Lg2aahSqM
 mr0yVHhFOM6TWFkxi3QJI7EK/LuguF4NyPg6TKV5wt2gOfNRZKBnHeBymysJileSGytE
 YGCIlyEHvzkc2ZsvBC84VwRA9U/HNNP9XBXIIUqwEA0ck/pg2hJLlhQ/5VPiLkMtvHN5
 P/RAOiKrliU8Nxr1woz73U+1dNizWjUCpLgg+YUgJrZuLQKSFk5uZum+4wv5veQHFdM+
 KB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=bLNTRYbIes188tpc0mDmg8PeKqWkLkLsLS+cEmRfJ4Q=;
 b=uYfQdY1YsdZ6QYio9KxlazdbQH3jPHXYeZnFhEXrbq6sbUmsPeqHzghMk8+fI8JrEW
 dkwC2X3WcUivPmvec8c4yXblBHBCsC23ZRNuwcW8oUkjzTQjnuXRXYlMjkPRS4KuE1yD
 EDma6BRHjUjBAbUd6M1p+MX372EDJHl1pPpkmaK8KaGw76n/N73H9LqDYYuEnKGg4C7S
 qB8oiFh8C41exVNJNw5afdqbR19wanyQxXKf6L4UmC69KeuCmlMruY1Qe5M+8UmuBqsL
 Ym81/XS2N4rJ1euuWKQpLzn6oYeLhgwT6CoTOna42Cr/qt108RKboXWgwEQA4BlaBM8g
 /IOg==
X-Gm-Message-State: AOAM533ygW2Fy4Li680A8CXFwKwzXbcNoRBnEV2gcCWPyeMlzu8cdCmr
 EoDMBBRcIRryF8bW6Qbc1wM+kDiBkqY+
X-Google-Smtp-Source: ABdhPJyIfmz+RgSdsE9dxfSUuq4vYwku/EgyIMRrTQZW+Sp90HxOGM4j3hTDem3RAzXvTIqjnn63jWgqGf2s
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90b:941:: with SMTP id
 dw1mr602456pjb.1.1599792528048; Thu, 10 Sep 2020 19:48:48 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:48:31 +0800
Message-Id: <20200911024833.1673961-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH 0/2] ASoC: mediatek: mt8183-da7219: support machine driver for
 rt1015p
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

The series reuses mt8183-da7219-max98357.c for supporting machine
driver with rt1015p speaker amplifier.

The 1st patch adds document for the new proposed compatible string.

The 2nd patch changes the machine driver to support "RT1015P" codec.

Tzung-Bi Shih (2):
  ASoC: dt-bindings: mt8183-da7219: add compatible string for using
    rt1015p
  ASoC: mediatek: mt8183-da7219: support machine driver with rt1015p

 .../bindings/sound/mt8183-da7219-max98357.txt |  1 +
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
2.28.0.526.ge36021eeef-goog

