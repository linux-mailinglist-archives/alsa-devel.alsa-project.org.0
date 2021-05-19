Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F263889E3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 10:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55FB5166C;
	Wed, 19 May 2021 10:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55FB5166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621414425;
	bh=w2H34Ul+rMw0fI1d8Sc4VX5Vfwor0KfoWMGu1OVxZis=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/FWlYFfqQNFRvCRW/R++QWXJb9MR3RCoX6MHqY9arRa/6aN4g6I9ptFE1CeM9WZV
	 bi7t3d7w75eA158W0FcjF7ZKVSfVLJ1bvkM2F5OF4AcWgdUXXtr6mKqFtlegbg4w1w
	 RSllSwmXyzHPsg8Wv7MG4r2OkEqUUJpRHm9IqUCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F52F8025D;
	Wed, 19 May 2021 10:52:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC0EF8016E; Wed, 19 May 2021 10:52:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4264BF8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 10:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4264BF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bVb+kYmy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64E686139A;
 Wed, 19 May 2021 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621414311;
 bh=w2H34Ul+rMw0fI1d8Sc4VX5Vfwor0KfoWMGu1OVxZis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bVb+kYmy+lqucHGGSZ+qaOMYW2zBZ73zrAkh+ChtHiZjeSJj4mULIaGR5pPNrU2Uw
 g6/Oog4h7qMRAs/2/zXYEYOWl9S9n2RWJP+7Ve54Gf5gTKj3yX3aTQ6TPOqz+Y5d3N
 QCgb1DZJdBdQ6KjjsAsIuCJe+9kpdWvExcrSRidi0EqGidMPWZ8JH8hDvWgo24dg1J
 BVnfjsDMUnaO+CqE3pA2TF8v6NyfMsSglAjInO3sIYVZZKR94DWrWhptdhAq221UZ0
 K2M/5FaZ7Osdi1mGVTvSx8Ms9skOtXI37q8oIu/lNnP6RRVvNfMgVaHLesBzeKQah9
 ISzHMrHeLiIBg==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ljHvh-007gYE-I4; Wed, 19 May 2021 10:51:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 05/10] docs: update pin-control.rst references
Date: Wed, 19 May 2021 10:51:42 +0200
Message-Id: <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621413933.git.mchehab+huawei@kernel.org>
References: <cover.1621413933.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Drew Fustini <drew@beagleboard.org>, alsa-devel@alsa-project.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Randy Dunlap <rdunlap@infradead.org>, patches@opensource.cirrus.com,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
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

Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
renamed: Documentation/driver-api/pinctl.rst
to: Documentation/driver-api/pin-control.rst.

Update the cross-references accordingly.

Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/device.h                  | 2 +-
 include/linux/mfd/madera/pdata.h        | 2 +-
 include/linux/pinctrl/pinconf-generic.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 38a2071cf776..d1183cfdc8fb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -399,7 +399,7 @@ struct dev_links_info {
  * 		along with subsystem-level and driver-level callbacks.
  * @em_pd:	device's energy model performance domain
  * @pins:	For device pin management.
- *		See Documentation/driver-api/pinctl.rst for details.
+ *		See Documentation/driver-api/pin-control.rst for details.
  * @msi_list:	Hosts MSI descriptors
  * @msi_domain: The generic MSI domain this device is using.
  * @numa_node:	NUMA node this device is close to.
diff --git a/include/linux/mfd/madera/pdata.h b/include/linux/mfd/madera/pdata.h
index 601cbbc10370..32e3470708ed 100644
--- a/include/linux/mfd/madera/pdata.h
+++ b/include/linux/mfd/madera/pdata.h
@@ -31,7 +31,7 @@ struct pinctrl_map;
  * @irq_flags:	    Mode for primary IRQ (defaults to active low)
  * @gpio_base:	    Base GPIO number
  * @gpio_configs:   Array of GPIO configurations (See
- *		    Documentation/driver-api/pinctl.rst)
+ *		    Documentation/driver-api/pin-control.rst)
  * @n_gpio_configs: Number of entries in gpio_configs
  * @gpsw:	    General purpose switch mode setting. Depends on the external
  *		    hardware connected to the switch. (See the SW1_MODE field
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index e18ab3d5908f..5a96602a3316 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -89,7 +89,7 @@ struct pinctrl_map;
  * 	it.
  * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
  * 	value on the line. Use argument 1 to indicate high level, argument 0 to
- *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
+ *	indicate low level. (Please see Documentation/driver-api/pin-control.rst,
  *	section "GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_PERSIST_STATE: retain pin state across sleep or controller reset
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
-- 
2.31.1

