Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E12E32E9
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:20:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0967616F3;
	Sun, 27 Dec 2020 22:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0967616F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103665;
	bh=zvJ5kNh7SmjrT6WmZeKgA+lo1FzeemJRzVAyyIUSXok=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=grEGt1vHp8XTfvkwnG4/kLsYFYRFa6bSGBt/ZpG6PPDe3s6q5qjj2TZ/CZEx2ralc
	 qxPmbkplyOn1oFDmp0KsyPPonub/3Xor7nqvGJgN83O/uPBZKht72sM54aTwk1+KdL
	 cKChHvk/d2UvR29broj8xeFo/MdfUtlQDpy/ckLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F24F8022D;
	Sun, 27 Dec 2020 22:12:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E37AF8022B; Sun, 27 Dec 2020 22:12:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EC27F800C8
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EC27F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hfVqoT2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=x6mS5fwdK6liDxgjybZtFeenAXjcPuU8dH8q/9rJU64=;
 b=hfVqoT2dUxhq64yBx3mROCRBaZpCYqGxNeNKtdOK7d19qNoMXT/C8KCqLV8rC3kVaYsuo+
 eAkt6l8f6hMSJ1i90cSMwZ797hMivOygAJ2VS96gR8FnyPYq5zNtAu6Ns2z8oZCCCprPMO
 iYF/TGSfkEAmn6Vejd4dthdI0bglbN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-jwqao8p3NgSZNlMDDv8DlQ-1; Sun, 27 Dec 2020 16:12:38 -0500
X-MC-Unique: jwqao8p3NgSZNlMDDv8DlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A1151005504;
 Sun, 27 Dec 2020 21:12:36 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55B54629C0;
 Sun, 27 Dec 2020 21:12:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/14] MFD/extcon/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
Date: Sun, 27 Dec 2020 22:12:18 +0100
Message-Id: <20201227211232.117801-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

Hi All,

This patch series adds support for Intel Bay Trail based device which use
a WM5102 codec for audio output/input. This was developed and tested on a
Lenovo Yoga Tablet 1051L.

This series consists of 3 parts:
1. Arizona MFD drv patches for ACPI bindings, better jack-detect support
   and misc. fixes
2. extcon-arizona driver fixes and improved jack reporting (this depends
   on the MFD changes)
3. ASoC patches in the form of a quirk for BYTCR detecting, a new
   machine driver for BYT + WM5102 and jack-detect support for the new
   machine driver (which again depends on the MFD changes).

Given that 2. and 3. depend on the MFD changes I believe that it is best
if all patches in this series are merged through the MFD tree (once
reviewed and acked) and then Lee can provide a immutable branch for
the ASoC and extcon maintainers to merge into their trees.

I have a patch with matching UCM profile changes available here:
https://github.com/jwrdegoede/alsa-ucm-conf/commit/316109e7814926ba984322c1d9190575fab9021c

This series + the UCM profile has been tested with both the SST and
SOF ASoC drivers for BYT devices.

Regards,

Hans

BugLink: https://github.com/thesofproject/linux/issues/2485

