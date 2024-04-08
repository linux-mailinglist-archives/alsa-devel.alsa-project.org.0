Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9889CEFE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 01:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6251D27A7;
	Tue,  9 Apr 2024 01:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6251D27A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712619329;
	bh=+X+rd8DkdWKUKkJRGKQZhbeiQ48V6RkAcs6xfBxkNqE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NYV3EOVrOdhc1yllYmOO/kMQR7c3Qukix9KmtoaGXFTHWBTtS6uYJN4VcoUFI3U1W
	 2J0dA5SoLiUDFfGczK37WHhrD0L+42/1xDeqm4E+x9lPf7EjJpsB0p+oQyWqVEbErm
	 FDb8Kkg5EO+bx0Fm/4pO/UL6jrTtBRmFSUSgsDHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C17BF8057E; Tue,  9 Apr 2024 01:34:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14447F80423;
	Tue,  9 Apr 2024 01:34:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB6C0F8026D; Tue,  9 Apr 2024 01:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from omr05.pc5.atmailcloud.com (omr015.pc5.atmailcloud.com
 [103.150.252.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18BB6F800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 01:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18BB6F800C9
Received: from CMR-KAKADU01.i-0437fbb4ebe14a692
	 by OMR.i-0d0476ad6b04f9169 with esmtps
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1rtyVY-0002qG-EF;
	Mon, 08 Apr 2024 23:34:36 +0000
Received: from [203.57.212.35] (helo=[127.0.0.1])
	 by CMR-KAKADU01.i-0437fbb4ebe14a692 with esmtpa
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1rtyVX-0007sO-3C;
	Mon, 08 Apr 2024 23:34:36 +0000
Date: Tue, 09 Apr 2024 09:04:31 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
CC: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_00/17=5D_ALSA=3A_emu10k1_=26_em?=
 =?US-ASCII?Q?ux=3A_fixes_related_to_wavetable_playback?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87il0tledy.wl-tiwai@suse.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
 <87il0tledy.wl-tiwai@suse.de>
Message-ID: <3E330682-0A64-40F9-852B-F2333C068175@internode.on.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=Bsebw5X5 c=1 sm=1 tr=0 ts=66147f0c
 a=IEg4KghJP64hjI1/mxYHlA==:117 a=IEg4KghJP64hjI1/mxYHlA==:17
 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=puQWGBksFvoA:10 a=x7bEGLp0ZPQA:10
 a=eBXRSDyVrJSMDjF-2K8A:9 a=QEXdDO2ut3YA:10
X-Cm-Envelope: 
 MS4xfGtgCPvzmSMTB7WxwaeR47VZPH3viW5WCbgIwdkbDcRDTTnsri+ygb0l2i9kMqRbgCn33wj+u1WzXLlNl0CS2sR5+M8LVFRgcUAjd1nT/lv48Z1PhVo7
 fxCZQAEKuY38IsK8MciamHnUDqbXSHU6UW27J7zrCAxClpgRekzjzPZHQrKmiWWFblQ4QuPtLS7Btw==
X-atmailcloud-route: unknown
Message-ID-Hash: Z33NVPZKDTTNJO32QJUVZ4IGNN3M7IXI
X-Message-ID-Hash: Z33NVPZKDTTNJO32QJUVZ4IGNN3M7IXI
X-MailFrom: arthur.marsh@internode.on.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z33NVPZKDTTNJO32QJUVZ4IGNN3M7IXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have applied these patches and the playback of MIDI files appears to be f=
ine=2E

Regards,

Arthur Marsh=2E=20
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
