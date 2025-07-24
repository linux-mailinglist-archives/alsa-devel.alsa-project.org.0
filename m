Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3108AB107E4
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jul 2025 12:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0835A60217;
	Thu, 24 Jul 2025 12:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0835A60217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753353553;
	bh=3Pj2SH5FgbIeAmKIiuoplVMkWL3ENE2Pph3bvN8CpPU=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m0d15NWCNmcLfDSTLLbWhAeIGC1GAoP5UeFpoa7KqRBb8nlSbJTogfoVyjYeQyMlV
	 AlT7sfVNaHWNASyz39bhYPAKKNa0eTscY8Pci37gFzIf7RQ5xgOlTNLgvYwTnYqT2g
	 2oubQ/ooGhfh7Ee3bCcDH3em+xk/E3O1iGC860Aw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF515F805C1; Thu, 24 Jul 2025 12:38:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B38AF805C2;
	Thu, 24 Jul 2025 12:38:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55242F80134; Thu, 24 Jul 2025 12:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5791EF80134
	for <alsa-devel@alsa-project.org>; Thu, 24 Jul 2025 12:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5791EF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=m.armsby@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=N209nSGt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753353470; x=1753958270; i=m.armsby@gmx.de;
	bh=3Pj2SH5FgbIeAmKIiuoplVMkWL3ENE2Pph3bvN8CpPU=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=N209nSGt7DgNvI8mZINicMf5YqCpmehfaa4x3ZmX+dhqI/SJRZVYr/J5Gt45O6t1
	 4CfSvJXV15DR0kkMcNedxeX/HhaGesOXw5r2Lpy1RS/6S4fTH2sGjCZYvw7W3kHBk
	 7XnNgynKyg6v0n4vLOmVbTZhrSxr109fQKAL61io4wkds3f1g+RChwBxfhfLULGH0
	 mJ4PhTIRn/AWkl8LzS9qZxgQmcsYmX6NXt5IWBsY/9HJtt/VQ0QiueKoj6xAFfVvP
	 R7FbaOQh+Ro55fJFAva/LgsrZ33cueNJh94NNfaWMk66WDjUB693bL7qWnFoSujJR
	 Wip9TX69F/qO4agAgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([47.64.51.164]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf07E-1uBtIa03ha-00kUK9 for
 <alsa-devel@alsa-project.org>; Thu, 24 Jul 2025 12:37:50 +0200
Date: Thu, 24 Jul 2025 12:37:48 +0200
From: "M. Armsby" <m.armsby@gmx.de>
To: ALSA mail List <alsa-devel@alsa-project.org>
Subject: ALSAfirewire broken
User-Agent: K-9 Mail for Android
Message-ID: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q/zukmq2c2qicjWx9Lc/iRpHSpsKnYYwHf1aDMa84Ezrl2mhQYi
 A6CBtBz9TCnrZYjqQ2A5nOHtUx4Bl9Vh9g1lhecALNTfO0p7rDe/yyxYJBFpezIwVIbQkkv
 RmQ5+mC+QHn7D2e2LXG4eKXqjk1IrLNDBkn2g6BQ4SjkIe4bOjRjDNH6KtoWdZGnVI5IWkJ
 JE5WRE/VqYEfJH96T2pHg==
UI-OutboundReport: notjunk:1;M01:P0:I7NvcGPJIP0=;2RMP+0hcNj6Y9NQe9xtsb8j2lAu
 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
Message-ID-Hash: DB2IU7FQGVCMUEKOJMRKVZXHGK7ZEA7U
X-Message-ID-Hash: DB2IU7FQGVCMUEKOJMRKVZXHGK7ZEA7U
X-MailFrom: m.armsby@gmx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DB2IU7FQGVCMUEKOJMRKVZXHGK7ZEA7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hello everyone=2E=C2=A0


2 Firewire problems with ALSAfirewire=2E=C2=A0

1=2E
Firewire Midi was working fine with kernel 5=2E10 with Reaper=2E Then obvi=
ously a lot changed with the Firewire Stack=2E=C2=A0

The midi output from Reaper has not changed according to it's developer - =
Justin=2E The problem is direct ALSA-Midi=2E

We tested the midi app from=C2=A0www=2Ealsa-project=2Eorg/alsa-doc/alsa-li=
b/_2test_2rawmidi_8c-example=2Ehtml#a0=C2=A0=C2=A0yesterday and it freezes =
Debian and just breaks Arch with kernel 6=2E15


Thread at Reaper Bugs forum:

https://forum=2Ecockos=2Ecom/showthread=2Ephp?t=3D300278=C2=A0

Has low level ALSA-Midi API changed?=C2=A0

2=2E
If using Pipewire-Jack with ALSAfirewire the Reaper midi output works fine=
 but unfortunately Pipewire adds 90ms delay when playing back through any F=
irewire interface compared with an onboard soundcard=2E=C2=A0


The pipewire dev Wim Tayman, says it's ALSAfirewire fault but I proved it =
is not - see thread:=C2=A0

https://gitlab=2Efreedesktop=2Eorg/pipewire/pipewire/-/issues?show=3DeyJpa=
WQiOiI0Nzg1IiwiZnVsbF9wYXRoIjoicGlwZXdpcmUvcGlwZXdpcmUiLCJpZCI6MTM0OTgyfQ%3=
D%3D

The ALSA recording and playback is confirmed by my tests to be working und=
er 10ms RTT with Echo, Motu and Bebop interfaces=2E=20


Is this problem related to first?=C2=A0=C2=A0
Low level communication error?=C2=A0

=C2=A0Cheers - and let me know if I can help in any way, although I'm not =
a programmer=2E=20


P=2E S=2E I hope you can read my post as I loaded up K-9 eMail client so a=
s to deliver text only=2E=20


-- Martin Armsby
