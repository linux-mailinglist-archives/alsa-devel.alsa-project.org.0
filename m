Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EE9287DF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2024 13:24:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D100F55;
	Fri,  5 Jul 2024 13:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D100F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720178667;
	bh=Sp9l5m/P9Guo11w4i83bJQ/a1x04CdQsbq/PcLFy+hs=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iV0tENk6WPvbTRTIihXa0/wXYrPfm4MpBYN6UeZ+OMHG7ujrW1Bi4FqT8w0eeycme
	 zIxWK3nexMCb1HrQmDoGeFdBpa/WpaTxlhJWxxaUbO6GXERaBCb+0DhpTSZepf1nbQ
	 FZ8bp40rUg5mY6kzl/fqzDRbVPyfTa9UDnp42vIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3FBDF805B2; Fri,  5 Jul 2024 13:23:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0FBF805B0;
	Fri,  5 Jul 2024 13:23:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18FFFF8025E; Fri,  5 Jul 2024 13:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 521B2F800FA
	for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2024 13:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521B2F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=pinoabete@gmx.com header.a=rsa-sha256
 header.s=s31663417 header.b=IXzYOZoh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1720178609; x=1720783409; i=pinoabete@gmx.com;
	bh=Sp9l5m/P9Guo11w4i83bJQ/a1x04CdQsbq/PcLFy+hs=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:Date:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IXzYOZohir9fXwZLZeQGg0EyXGqGtd1LjQSPqaPy1pgQlOHGCynN8EOynRVfD0cR
	 u06QuPD6sozy8G5keAFWsqBU73O++U2rt+EkU2qXqcxD3ZdS7ahnog79LCRpPHuyK
	 aZUf8iQHt7ZGScP7pWEcF0e/GEG6cApS90ck9dQr5hL/XZnzVQeU4PFuJgo1CruSi
	 xXB80/qBGsoU2LdCWBZFFLUbi0CsvbzJKLh1odfYG+s4Xd3O4QIX1X/IZ0vs+WwBp
	 3/0o6KCA5UuqH6xUBnnmdddRZIkqHNfo8eqcoSPIm5VLyIs/EkorMB+U1l2eRv3hG
	 klQHhP1TuYjpuDBNuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [95.234.118.174] ([95.234.118.174]) by web-mail.gmx.net
 (3c-app-mailcom-bs14.server.lan [172.19.170.182]) (via HTTP); Fri, 5 Jul
 2024 13:23:29 +0200
MIME-Version: 1.0
Message-ID: 
 <trinity-a0c29dc2-8fe2-41f7-8431-397ddf75e8aa-1720178609383@3c-app-mailcom-bs14>
From: Pino Abete <pinoabete@gmx.com>
To: alsa-devel@alsa-project.org
Subject: Add support for a new DAC
Content-Type: text/plain; charset=UTF-8
Date: Fri, 5 Jul 2024 13:23:29 +0200
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: 
 V03:K1:rujIwOC4nI/byb03Hngw0KMUZ2/zy9nEbDIx0PBf2QqjkJeW/Ve+837TW0ZcXm0zKW2Wi
 b7tUxS5bUfs9yDI08YyvenndrHtJixlwLOK4kK8J2iB+yyvJp8tD8NiwKfiSqyJ45L8PHMKk6xZ9
 WhvOQxoWn9aTTaSdGWMCL5hGHYU7PFSO8ZeSIbXdMa0C9odlNyigqsMtzIWxk8YKnuhbVw422Zfy
 4gVsh+L7PWUQIDp+xeggmvy/15rvQ9XgiS+jm/Sk7BB1G2ymFrhOmS8UtniV9G6Kmy1wWBWaM8Cm
 fA=
UI-OutboundReport: notjunk:1;M01:P0:+gNWLwU1rcA=;MwqCAeFrlfk6Ne7FN+Z69fsbzuT
 dwiWxDqxZ9UBwXCl6/joPhPlzzk7pAGmmlAkeowmRZEnJJS9wfBr/8pvWsFSawL2+JlI9BS35
 m5E9hqwbk9IyjuAdSXbiNn6LG7EbGkiLKe0ZNWznXRy69B1ro2+gTVvjXLKj/SO2AuJ3dIQ6G
 7x1GZtxg1OzxLz5jH1qeM7IWZMQ65r4XN7xKrLPppl6efN0J+FJriqwgJYV46OEK9tzVDQdgC
 VDdr7TY569s+B7GiDlnJz0hc+C1rH/Z9hDoDUtuNYa3wtm1kvgWHwPdD7ealVu4gQhAGfnWoC
 6fFu3zM5P9/RaRX075Hc8aX0NFjJZJ1jMadUbjpEQK4fD4Xdu6wUDY98Y19QOze854gQwrWIP
 JLRNjM6lxWAwKSBv3ypceRkGtL5QhoYHYgerALAKRfjppMcXDgqOqNg69a65WfU6uxi7KJFA8
 e/EHpXzp6vzH9fFcajKzShdLTT7QDhAcXMdOiok51WQJM3Qm9MN4qeuByb4Lhr6y8lcTR7lUq
 ovU1MsfDDWtt3D4EPSJTfYcI0PeP+qceKoy7LZXh/3/qguhNKGkOmJYxwLVLjs26Pbas3aX6f
 GszFEDMvgJo+EQmJwJ6qyOFa754R9TIH0abs4WrqwFdVypgrpIW9RndviXGbdhcRYxL3Vc+JE
 tou2qCPFAVmjCKnHXJ1qSYLHyl9kFqSbu253TEWdO5WFnQInUdmioOM7ktK+ejQ=
Message-ID-Hash: KAQAMEI6UXL4SJFRQXN65H32SYQZFIJB
X-Message-ID-Hash: KAQAMEI6UXL4SJFRQXN65H32SYQZFIJB
X-MailFrom: pinoabete@gmx.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAQAMEI6UXL4SJFRQXN65H32SYQZFIJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi,
I'm not an expert and I'm sorry if this is the wrong place for thsi kind o=
f requests=2E

I'm trying to add native DSD support for this integrated DAC/amplifier:
https://www=2Emission=2Eco=2Euk/778x/

Unfortunately, vendor is not collaborative=2E
It should support up to 384kHz (PCM) and DSD256 and have a XMOS USB chip a=
nd a ESS Sabre32 ES9018K2M DAC chip=2E
=C2=A0
I tried simply to add:
=C2=A0=C2=A0 case USB_ID(0x2622, 0x0011): /* Mission 778X */
in the "switch" section under /* XMOS based USB DACs */
and it works with the DSD_U32_BE=C2=A0format (tried using MPD - Music Play=
er Demo)=2E

Is it possible to officially add this to source or do you need a request f=
rom OEM?

Thanks
--
