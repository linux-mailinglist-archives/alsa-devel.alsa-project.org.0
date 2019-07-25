Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A88975A2A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 00:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616681EFA;
	Fri, 26 Jul 2019 00:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616681EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564092262;
	bh=LYR6hErtiISJkBZQ1sBI4e6/+BNv5gveI54VsmVr7UY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V4wHwZ+V7ZeZRWcKHQ3d1Vr4m3M11KqyDCGLAeu4nVILsd34cizbDreyzhtEuPqK0
	 1szRo2HpjzloOpLkBRVpJSDqUch+t02L5Dqlxu8/9lCBkjT1GRAmkECeOWhC5Ai0ul
	 YStlCIt3kHHP/St0zn2f+EVMcrpij7Bfv2YoG8hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 871EDF80392;
	Fri, 26 Jul 2019 00:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B970F803D0; Fri, 26 Jul 2019 00:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1438AF800F5
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 00:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1438AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="mFrG2QDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564092151; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=heKcREY22PalpQ/9p8Cd9d1zdSepPrb23urjeSbGB5s=;
 b=mFrG2QDIrMMa1N2Z2OVlTuF1yYZ3LchMkFWqDfMspQ9nIQIHt+4ryyS8D1eO043/xYvhbR
 N2FT54nOWkY/RPgX2yiBHDmmzZM/1mmRTn9qpQrY04TflmjGu4/L1JyZ5aAqdEOpvFe+8V
 Dwl76dgF+6zF8aB9BWW/YLBVr0ngLbU=
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Thu, 25 Jul 2019 18:02:04 -0400
Message-Id: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org
Subject: [alsa-devel] [PATCH 00/11] JZ4740 SoC cleanup
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

Hi,

This patchset converts the Qi LB60 MIPS board to devicetree and makes it
use all the shiny new drivers that have been developed or updated
recently.

All the crappy old drivers and custom code can be dropped since they
have been replaced by better alternatives.

Some of these alternatives are not yet in 5.3-rc1 but have already been
accepted by their respective maintainer for inclusion in 5.4-rc1.

To upstream this patchset, I think that as soon as MIPS maintainers
agree to take patches 01-03/11 and 11/11, the other patches can go
through their respective maintainer's tree.

Note for MIPS maintainers:
Patch 11/11 may conflict with the TCU patchset v15, should this one be
accepted upstream, but the conflict is tiny and easy to fix. Should this
case appear, don't hesitate to bother me about it.

Thanks,
-Paul


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
