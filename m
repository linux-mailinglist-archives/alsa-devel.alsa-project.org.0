Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5E3514C2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 14:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A6111C;
	Thu,  1 Apr 2021 14:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A6111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617279579;
	bh=9PoexKn9B5sUWryT4Sa8hCkGzVDwIievA60/TyPSyHs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKFSVva5z+xLeQwV2kPKAwMEdLTAtC0ZD/p/6ModhMW7C4rx0nAe7OqRmdby1f50t
	 6lJq3mJ7qCKtetqH6hHL/74UsrHuWpWG+BJqREBG4LGFj2vafkKmgk0ChLns1TGnvN
	 hMVRuDS8qN8qmtYzaWd3RBiQLCQZ4ukqdWJ1f9/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07880F8013C;
	Thu,  1 Apr 2021 14:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76660F8026F; Thu,  1 Apr 2021 14:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F341F80240
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 14:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F341F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iFRlkOcs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C419E6121D;
 Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617279476;
 bh=9PoexKn9B5sUWryT4Sa8hCkGzVDwIievA60/TyPSyHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iFRlkOcszOpL6rWYIXnLOz+v6RhlW0xR5evg1Ll2AA62ktfi/CR1Z40nb9/3TKtyM
 Ij7WycN2aDV9Vte8hYEs2IKLipd7tYAbRADCjP8Z6vVtwZ0AJ07X9qR7Zaso83jQwH
 /lGiwH1uRCD8wPDNkTGZ+Mrx+ndm+ArqMweiUnE5+9AyevgTCc05fvQjhEL5XTLJ0j
 IobUl/1sEL+cdG45cX0iGS7jIff4q243+Cs0tKiMGa3dP3qvS3L9XyHJIRmxDTOj5c
 mKGDsjiQlwnMMIbmmmtIrloOb85ZpfgMyVHQVMbBakxVk40r4CETe1quWzCI7L3ozn
 hyLHuE4zBYZXg==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lRwGo-001c3n-OB; Thu, 01 Apr 2021 14:17:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 32/32] pinctrl: update pin-control.rst references
Date: Thu,  1 Apr 2021 14:17:52 +0200
Message-Id: <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Drew Fustini <drew@beagleboard.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-gpio@vger.kernel.org,
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
index 6aeb711f7cd1..fdcd773adba3 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -88,7 +88,7 @@ struct pinctrl_map;
  * 	it.
  * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
  * 	value on the line. Use argument 1 to indicate high level, argument 0 to
- *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
+ *	indicate low level. (Please see Documentation/driver-api/pin-control.rst,
  *	section "GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
-- 
2.30.2

