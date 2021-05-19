Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7123E3889E1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 10:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D92A81655;
	Wed, 19 May 2021 10:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D92A81655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621414411;
	bh=Xxq1uGAbMGFgeGY3ywEv0OBhOMcnDBc4Aw7rV293abg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GZkQHHTm0tUhfXI6nM1DHb+cBjDI7MVN2PzRge4Qo8xiujdF7Ghh5Eet7foonW3vh
	 YVrCDbMZp7o91H5rZiEeBQMncykMvExQ+sx/X99BMNC2gQQsxgrCbMUygPDNMDXzv+
	 Vma+q4MAdKWi3qJUPsIVkZCmyHydeftnf9jCp61Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49DDAF80246;
	Wed, 19 May 2021 10:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3EA6F80246; Wed, 19 May 2021 10:51:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44E64F80148
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 10:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44E64F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HDXmH4kO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A3B560C3F;
 Wed, 19 May 2021 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621414311;
 bh=Xxq1uGAbMGFgeGY3ywEv0OBhOMcnDBc4Aw7rV293abg=;
 h=From:To:Cc:Subject:Date:From;
 b=HDXmH4kOj1Ffc8/2cPIVagMkwv75xN8kuE4Rn2GW4zUfWOy+/uoxuQky8Dxr9RDVR
 fVbJMLGgIq+XN+7alWCEcvtKmIWWeiFvOiQyJ9+cMJ+eSmjCj1liIls/T2ERP28sI/
 Mx2fxh/6TMjsCdbJkuDfE+YtP5rjlL4GYJEyhOZQoAdSbeHyiSWV4ePGv7ROh0zXu8
 AjzAbT5IYTV7AdlhASpd63KP0Dt2giApS3oj5J8fG1nIer7c4N9j0aGbYuzwaHItI1
 /kiR1YGrJsdKvu92/Jkc0v9EXHz/fFBf6YBUXpnf+fLICsbgPu9SeBtSBORPjhj95H
 lVUyUg6TpgwrA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ljHvh-007gXv-8w; Wed, 19 May 2021 10:51:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 00/10] Documentation build warning fixes
Date: Wed, 19 May 2021 10:51:37 +0200
Message-Id: <cover.1621413933.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-iio@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 patches@opensource.cirrus.com, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>
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

Hi Jon,

This small series contain a series of fixes for the documentation. it is
against your docs-next branch.

Three of the patches fix duplicated symbols at the ABI documents.
There are still some ABI warnings from IIO, but all but one were
already fixed at linux-next. So, hopefully, after having everything
merged, the ABI warnings will be solved.

Mauro Carvalho Chehab (10):
  docs: update sysfs-platform_profile.rst reference
  docs: vcpu-requests.rst: fix reference for atomic ops
  docs: translations/zh_CN: fix a typo at 8.Conclusion.rst
  docs: sched-bwc.rst: fix a typo on a doc name
  docs: update pin-control.rst references
  docs: virt: api.rst: fix a pointer to SGX documentation
  docs: ABI: iommu: remove duplicated definition for
    sysfs-kernel-iommu_groups
  docs: ABI: sysfs-class-backlight: unify ambient light zone nodes
  docs: ABI: sysfs-class-led-trigger-pattern: remove repeat duplication
  iio: documentation: fix a typo

 Documentation/ABI/testing/sysfs-bus-iio       |   4 +-
 .../ABI/testing/sysfs-class-backlight         | 100 ++++++++++++++++++
 .../ABI/testing/sysfs-class-backlight-adp5520 |  31 ------
 .../ABI/testing/sysfs-class-backlight-adp8860 |  37 -------
 .../sysfs-class-backlight-driver-adp8870      |  32 ------
 .../testing/sysfs-class-led-driver-el15203000 |   9 --
 .../testing/sysfs-class-led-trigger-pattern   |   3 +
 .../ABI/testing/sysfs-kernel-iommu_groups     |  12 +--
 Documentation/scheduler/sched-bwc.rst         |   2 +-
 .../zh_CN/process/8.Conclusion.rst            |   2 +-
 Documentation/virt/kvm/api.rst                |   2 +-
 Documentation/virt/kvm/vcpu-requests.rst      |   2 +-
 include/linux/device.h                        |   2 +-
 include/linux/mfd/madera/pdata.h              |   2 +-
 include/linux/pinctrl/pinconf-generic.h       |   2 +-
 include/linux/platform_profile.h              |   2 +-
 16 files changed, 117 insertions(+), 127 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-adp5520
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-adp8860
 delete mode 100644 Documentation/ABI/testing/sysfs-class-backlight-driver-adp8870
 delete mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000

-- 
2.31.1


