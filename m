Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D3760A45
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 08:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01D51E9B;
	Tue, 25 Jul 2023 08:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01D51E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690266278;
	bh=DsF6hC+vstU3zxtdq58e7jiVWxKuCetuYRMGaLujHv0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qn7OxR6cCtZ6u2BbTYeFnlTKXa3lZmjuoeVsZjYOJHIs3AJFHrho4dJsYhrCeolX7
	 SnwE98VNI5WfO8OBwuiZFqjYMXXJfDkg2QkFDoEHSqpNhBrBFyUsnZkzHCGQT14WIr
	 IrxJqFMJy6Vb79xkyDG7Xnr5Qjq8VvkaA/YgkH30=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57BEFF8057A; Tue, 25 Jul 2023 08:22:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A10C3F80563;
	Tue, 25 Jul 2023 08:22:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45832F80163; Tue, 25 Jul 2023 08:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AC70F80163
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 08:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC70F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ic5ArVRf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ms3T9/AY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BD8622489;
	Tue, 25 Jul 2023 06:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690266131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=QaBNnA/8gpFgghYhdk/w9mp+r6Zv7/AG4oLP8HE40AM=;
	b=Ic5ArVRfMJt9KorJR2SkOWpNNCrHNKFoYKaScO9d6EfjxaUkX72WbT49kFKNRBR0XRHsMp
	66/It/FuaFUz7L3A3lEChgTyN3Y277znunXyiwzOU5H9syyxzUXjMr4k3kNBQtDD0D61Ef
	5z+TarS7jEU63qeULLNxd5rc9LxLTS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690266131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=QaBNnA/8gpFgghYhdk/w9mp+r6Zv7/AG4oLP8HE40AM=;
	b=ms3T9/AYc+/7B94Yh1vrliH7UzeI2zke2rTBcTkHYIlA9pdVzgapaaK8x+UhR5zy+KpHWm
	5np1l1KXJpyIpSCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4997213342;
	Tue, 25 Jul 2023 06:22:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NiT2EBNqv2S0dQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 06:22:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: alsa-devel@alsa-project.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] usb: Add USB MIDI 2.0 Gadget Function Driver
Date: Tue, 25 Jul 2023 08:21:59 +0200
Message-Id: <20230725062206.9674-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VU2AYGR5LDOYRKD5Y7HWXXNFBOD3PMVH
X-Message-ID-Hash: VU2AYGR5LDOYRKD5Y7HWXXNFBOD3PMVH
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VU2AYGR5LDOYRKD5Y7HWXXNFBOD3PMVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This is a patch set for adding a USB gadget function driver for USB
MIDI 2.0 interface.  The MIDI 2.0 support in the host side was already
enabled since 6.5 kernel in snd-usb-audio driver.  Now, this provides
a similar gadget functionality using the existing ALSA UMP helper
functions.

The gadget driver provides both MIDI 2.0 and MIDI 1.0 fallback
interfaces with one or more loopback UMP rawmidi devices.  The
configfs implementation is flexible enough to allow users to set up
multiple UMP Endpoints and Function Blocks.

The first patch adds the bare f_midi2 driver without configfs support,
followed by the configfs support, MIDI 1.0 interface support and a few
other extensions and documentation.


Takashi

===

Takashi Iwai (7):
  usb: gadget: Add support for USB MIDI 2.0 function driver
  usb: gadget: midi2: Add configfs support
  usb: gadget: midi2: Dynamically create MIDI 1.0 altset descriptors
  usb: gadget: midi2: MIDI 1.0 interface (altset 0) support
  usb: gadget: midi2: Add testing documentation
  usb: gadget: midi2: Add "Operation Mode" control
  usb: gadget: midi2: More flexible MIDI 1.0 configuration

 .../ABI/testing/configfs-usb-gadget-midi2     |   54 +
 Documentation/usb/gadget-testing.rst          |  154 +
 drivers/usb/gadget/Kconfig                    |   18 +
 drivers/usb/gadget/function/Makefile          |    2 +
 drivers/usb/gadget/function/f_midi2.c         | 2883 +++++++++++++++++
 drivers/usb/gadget/function/u_midi2.h         |   81 +
 6 files changed, 3192 insertions(+)
 create mode 100644 Documentation/ABI/testing/configfs-usb-gadget-midi2
 create mode 100644 drivers/usb/gadget/function/f_midi2.c
 create mode 100644 drivers/usb/gadget/function/u_midi2.h

-- 
2.35.3

