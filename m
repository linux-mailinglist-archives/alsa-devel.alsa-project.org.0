Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AB780F6F
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 17:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF42DE7D;
	Fri, 18 Aug 2023 17:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF42DE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692373315;
	bh=Sza0iKQ79SrdT2ka/ImFhnwgczlzzbMIPQJckqJEnlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VicuOdyfUGEjHh8b//Et0gbfo/F4LihDfwOq/UdAXoH6QyYxZWeGr9es5M0dsNRXE
	 Iie1mMfJ21WGE4EnzX5ddpXKYwDlJ0gYp0ln/y15RxuRNkKjD28hYXaPdY0rk61iGf
	 Lz4+l1elBIs6FolTRQ5rgonMEBhQYDK1rRzndXu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12E50F800EE; Fri, 18 Aug 2023 17:41:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85EE2F8016D;
	Fri, 18 Aug 2023 17:41:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29ADBF801EB; Fri, 18 Aug 2023 17:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 829CEF80027
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 17:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829CEF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OJHylxsX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27FE460EF3;
	Fri, 18 Aug 2023 15:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EB2C433CB;
	Fri, 18 Aug 2023 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692373248;
	bh=Sza0iKQ79SrdT2ka/ImFhnwgczlzzbMIPQJckqJEnlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJHylxsXmbe1O7TRHgPYtHiOQ9+g/EXekAGzeh2ERlsL2Bupn0cr+OLi0AbrpV7d0
	 YNpGNMcqqxYn1v/S/IzQBiKAlW4aOFCnojT2+FZwKbdbHRhsAQq5b3HiNYa86JnsxU
	 txVFGqvzAR/RZk+b9T6l2rThO7XoKkFiQ6ONypgOgntC6iMnZGe/rUzk0eZMXG6CjN
	 rpIKGK7EDt97PiHEiDaleqLPnGQI74L5rsBBq2LKC19XR+E0P8Lzn4LfIRYqMTEX2b
	 usCuAJ34ayhHYTF8rR0IlqUE4nCno3KFRZoMUdhWMk0fYEzZ9uApXTFW6g1HI1KMn/
	 5bcv1WmHriA9w==
Date: Fri, 18 Aug 2023 16:40:42 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Pinctrl and soundwire due
 for the v6.6 merge window
Message-ID: <20230818154042.GX986605@google.com>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
Message-ID-Hash: KJ4KJPNJ4B4356K4EL5SCRBMUC327S6V
X-Message-ID-Hash: KJ4KJPNJ4B4356K4EL5SCRBMUC327S6V
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJ4KJPNJ4B4356K4EL5SCRBMUC327S6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Good afternoon,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-pinctrl-soundwire-v6.6

for you to fetch changes up to d5282a53929791071b17dde3eed52e40f76b101c:

  pinctrl: cs42l43: Add support for the cs42l43 (2023-08-17 12:06:11 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Pinctrl and soundwire due for the v6.6 merge window

----------------------------------------------------------------
Charles Keepax (3):
      dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
      mfd: cs42l43: Add support for cs42l43 core driver
      pinctrl: cs42l43: Add support for the cs42l43

Lucas Tanure (1):
      soundwire: bus: Allow SoundWire peripherals to register IRQ handlers

 .../devicetree/bindings/sound/cirrus,cs42l43.yaml  |  313 ++++++
 MAINTAINERS                                        |    3 +
 drivers/mfd/Kconfig                                |   23 +
 drivers/mfd/Makefile                               |    3 +
 drivers/mfd/cs42l43-i2c.c                          |   98 ++
 drivers/mfd/cs42l43-sdw.c                          |  239 ++++
 drivers/mfd/cs42l43.c                              | 1188 ++++++++++++++++++++
 drivers/mfd/cs42l43.h                              |   28 +
 drivers/pinctrl/cirrus/Kconfig                     |   11 +
 drivers/pinctrl/cirrus/Makefile                    |    2 +
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |  609 ++++++++++
 drivers/soundwire/bus.c                            |   32 +
 drivers/soundwire/bus_type.c                       |   12 +
 include/linux/mfd/cs42l43-regs.h                   | 1184 +++++++++++++++++++
 include/linux/mfd/cs42l43.h                        |  102 ++
 include/linux/soundwire/sdw.h                      |    9 +
 16 files changed, 3856 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
 create mode 100644 drivers/mfd/cs42l43-i2c.c
 create mode 100644 drivers/mfd/cs42l43-sdw.c
 create mode 100644 drivers/mfd/cs42l43.c
 create mode 100644 drivers/mfd/cs42l43.h
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs42l43.c
 create mode 100644 include/linux/mfd/cs42l43-regs.h
 create mode 100644 include/linux/mfd/cs42l43.h

-- 
Lee Jones [李琼斯]
