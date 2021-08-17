Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 554343EF269
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 21:03:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D026E1677;
	Tue, 17 Aug 2021 21:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D026E1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629226980;
	bh=IrRuIErAQWkP9jDhKE9m8hDO4aUU9sREtHiqqbrb5MY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zk7VK1a/nGS4YpD6EmP6cXp3G0lOry9HA88rCv4pPPj+6LD5wj7x9BHgfBUChqke+
	 uQCt3ve3mmVCXyGcNJYltYUROQXu6Z7j6ZCyDA43iUVPBytoRleiFbt+HKmWIQK678
	 TNcvwRbQrWT4/HHs6DVPH7VNHA58eiUWU58Z+1wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A13F802C4;
	Tue, 17 Aug 2021 21:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEDD5F80134; Tue, 17 Aug 2021 21:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB2D9F80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 21:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB2D9F80134
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="215898760"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="215898760"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 12:01:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="488147322"
Received: from aaadelek-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.12.89])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 12:01:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/2] driver core: kick deferred probe from delayed context
Date: Tue, 17 Aug 2021 14:00:55 -0500
Message-Id: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
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

The deferred probe mechanism uses a successful driver probe/attach as
a trigger to revisit the list of deferred probe devices. This works in
most cases, except when the probe success is not a valid indicator of
resources being available.

In that case, a race condition may occur, where the device/driver core
framework will attempt to probe a device that depends on resources
before those resources are available, resulting in a -EPROBE_DEFER
error and a deferred probe device that will never be initialized.

The example provided in this RFC relies on the probe workqueue used
for the HDaudio support where we simultaneously:
a) need to use request_module()
b) cannot use an async probe due to the use of request_module()
c) cannot block the probe of other drivers
In this example, the deferred probe can be kicked when the workqueue
completes.

The use of request_firmware_nowait() is another conceptual example,
where a domain-specific callback can enable resources *after* the
probe returns, for example by downloading the firmware, booting a
processor and waiting for the processor to be ready for interaction
with the Linux host. In this second example, the deferred probe could
be kicked when the 'cont' callback completes.

This patchset suggests a 7-line change to solve race conditions in
these examples with delayed work.

Discussion:

a) During Intel internal reviews, Andy Shevchenko pointed out another
known issue with deferred probe [1]. This patchset is unrelated and
does not claim to solve the problem raised by Andy.

b) one possible objection is that this patchset does not suppress a
possibly unnecessary round of evaluation of deferred probe devices. It
did not feel necessary to any of us to minimize the occurrences of
EPROBE_DEFER but instead to make sure the device waiting for
resources successfully probes in the end.

c) another objection might be that the driver core should know about
such dependencies. It would be desirable but in the cases we've
encountered such dependencies are highly domain-specific and not
necessarily straightforward to describe. There's been multiple
endeavors to improve the description of dependencies, this patchset
only focuses on the deferred probe framework, with an improvement when
the provider of resources makes these resources available after its
probe returns.

[1] https://lore.kernel.org/lkml/20200324175719.62496-1-andriy.shevchenko@linux.intel.com/T/#u

Pierre-Louis Bossart (2):
  driver core: export driver_deferred_probe_trigger()
  ASoC: SOF: trigger re-probing of deferred devices from workqueue

 drivers/base/dd.c             | 3 ++-
 include/linux/device/driver.h | 1 +
 sound/soc/sof/core.c          | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)


base-commit: 8d1998893cd5e3488cd95529f60a187e3009d14b
-- 
2.25.1

