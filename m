Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC65758F2C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 09:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64E5B844;
	Wed, 19 Jul 2023 09:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64E5B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689752209;
	bh=X/1ZCuslfAylC6Y0bWPaqrKyGgqVTjSKO5g69PlLyUU=;
	h=Subject:From:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cOppacSqDx2yFDTnpS618zK8qtGkKJsvNWJmRLBmwfDqBxdfI4TkB/cEz7c0ZgFZo
	 XsR+AlK+5pvsp/6kHyxtSS/GyXD26HPQR2dsQ4+NwZYxhe14Id42uO5UlICIZLGhMj
	 QRyKHiagq6gymrLTN93f/s36UIYUSxZqBM2RBuIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 515C3F8057D; Wed, 19 Jul 2023 09:35:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13935F80570;
	Wed, 19 Jul 2023 09:35:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 954CEF8047D; Wed, 19 Jul 2023 09:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FD29F80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 09:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD29F80153
ARC-Seal: i=1; a=rsa-sha256; t=1689750615; cv=none;
	d=zohomail.eu; s=zohoarc;
	b=Igeq9c9KOSyZIthJBMc8P6YtghWo0Kl1+taDH626cbYMOzD9jLig4RQth4RlNwrL3BnDHxTZUO+c0//5s9GPk/ftzv2zQhb2KD3YjrNDscdnxHZNZlC5IGqexEUIb7G/wOBCEI8NhhuReYuo0Yc47ivi/AiuBkraFnUPX40QG0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc;
	t=1689750615;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
	bh=YvDjjLFAyG93iZxzoWrPxDhqqLNn6CjgW1bKwcUdgDc=;
	b=WvKw8NDkrj0eZpxfUOxuZ7O998oeLRs51L3USCQatl34WV3vW3SJhMUqRoZcogcJaBYzXnoG5LCVXSJlY1wApf6ZO9F+2ZQngS07TPlFuVx2wwtvn6pgpJ5LKUW7UuUcmGdLurGYJUiyNn/Ob3O7Bpgo5vFd/o9QSal0DUSglFk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=carl@uvos.xyz;
	dmarc=pass header.from=<carl@uvos.xyz>
Received: from [10.0.0.2] (ip-037-201-241-223.um10.pools.vodafone-ip.de
 [37.201.241.223]) by mx.zoho.eu
	with SMTPS id 1689750613569366.34620689097324;
 Wed, 19 Jul 2023 09:10:13 +0200 (CEST)
Message-ID: <dde0a305793ad7ddbd9e001e463207a84c2afcc9.camel@uvos.xyz>
Subject: [BUG REPORT] sound: pci: ctxfi: htimestamp dose not work on EMU20k
 during recording
From: Carl Klemm <carl@uvos.xyz>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org, alsa-devel@vger.kernel.org,
	linux-sound@vger.kernel.org
Date: Wed, 19 Jul 2023 09:10:12 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-MailFrom: carl@uvos.xyz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TJZSGH6GR4MVWGJFLYLBH4YGJMYZG5ZQ
X-Message-ID-Hash: TJZSGH6GR4MVWGJFLYLBH4YGJMYZG5ZQ
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:35:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJZSGH6GR4MVWGJFLYLBH4YGJMYZG5ZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

see https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3352
htimestamp returns nonesensical values when recording is active on a
EMU20k device


lspci:
03:00.0 Audio device: Creative Labs EMU20k2 [Sound Blaster X-Fi
Titanium Series] (rev 03)
        Subsystem: Creative Labs EMU20k2 [Sound Blaster X-Fi Titanium
Series]
        Flags: bus master, fast devsel, latency 0, IRQ 17
        Memory at d1200000 (64-bit, non-prefetchable) [size=3D64K]
        Memory at d1000000 (64-bit, non-prefetchable) [size=3D2M]
        Memory at d0000000 (64-bit, non-prefetchable) [size=3D16M]
        Capabilities: <access denied>
        Kernel driver in use: snd_ctxfi
        Kernel modules: snd_ctxfi

With regards,
Carl Klemm

