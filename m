Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB1B166F9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jul 2025 21:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20BCC60239;
	Wed, 30 Jul 2025 21:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20BCC60239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753904214;
	bh=t5Dy3MyaHy+G6GVBmMUwGtsH5U+/WaJ7Y89TShjN0S0=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UhyBU/i4eSOPu8KKU899HjqyvQafUSFGq433SIynm6zFPBHJRhXeKMkbI899fq841
	 QDWbQroaUx+tPSoJz5Iuq/pvi+Hh+X0LRnSzOBNshPJX2AGQTBLkgToYxPsyjmlhkN
	 rED+ahKC6ya2VIa++NdQ7PKTwqrqtPq4h9W3JJ2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A9B9F805B6; Wed, 30 Jul 2025 21:36:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7912F805C7;
	Wed, 30 Jul 2025 21:36:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B78CAF80254; Wed, 30 Jul 2025 21:36:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5754AF80152
	for <alsa-devel@alsa-project.org>; Wed, 30 Jul 2025 21:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5754AF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=m.armsby@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=oHYfGctK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753904161; x=1754508961; i=m.armsby@gmx.de;
	bh=ZFQQNlmWc+lDPt/AlA9BPPBo17BS8a9ZqbM4ObQZRa4=;
	h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oHYfGctKDNFrMDDw55RABgqY8rNB9DECsD1q0dCqGCZGi1XvSmgu9SCTysDBdZh2
	 QsPr/Zu5OzSJIu1uD2gUBd8sDIqy98u96JQfaIkADW+zXQ9eW8QKT1GW8mF5NyfrX
	 q3MJgF/AVuCRTAuDlguNkFbyUeg7ltqwOFj2WdyqbZQL3abSXbdDTerX0Kh+McKka
	 hXhMmbuwv/N4J1BwO5rZm6oxOBTmtUMT6q6fNB98TmnbA4f+o27hN7wVqSPVtuAiz
	 BfSJaH5QYwnxz7vav9aXoGjizyZmfoC6Mp9/VT8SYx3LYAgwxZs0fpwHfKDUeFXu2
	 O14q/9aApP9ZTb6kZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([77.20.253.70]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1v7m1A16Dh-00V1ec; Wed, 30
 Jul 2025 21:36:01 +0200
Date: Wed, 30 Jul 2025 21:36:00 +0200
From: "M. Armsby" <m.armsby@gmx.de>
To: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
User-Agent: K-9 Mail for Android
In-Reply-To: <20250724143813.GA23616@workstation.local>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
Message-ID: <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kDrKwqf7e9J/lK57rXzCys8bW+thdVeFO07yTDdDf2xbRGf7dfN
 zxukyBz8GymNe/tQa+fU/3q9xhuGE+q+ZPpO1rauDqDT8+MEJK3SkgydVfCYSDv2s9gRDnT
 nf92FSuE52xxkujlIBAdGmevhnTu4awRwr8k3176NmGU2sg1CRjYBC6blwwQGgEIbcyjiqB
 juEnAYiRRV+h80p+7D81Q==
UI-OutboundReport: notjunk:1;M01:P0:/BWP5z/A1YA=;58abedQBFgqKFBAp+iKyH4E5Tac
 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
 2Ur2pC4nk0Ad7qH5KYS6r6PwTZjartoQ=
Message-ID-Hash: NKXC6FSW2GP7EUOEXUNSTN7LBYCQ4L4W
X-Message-ID-Hash: NKXC6FSW2GP7EUOEXUNSTN7LBYCQ4L4W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKXC6FSW2GP7EUOEXUNSTN7LBYCQ4L4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The new ALSAfirewire drivers are very good=2E Well done to everyone who wor=
ked on them!=20

Today I tested brand new CachyOS with xfce desktop kernel 6=2E15=20
Initial Pipewire test showed RTT 98ms at 64/44100 so I uninstalled all tra=
ces of Pipewire and installed PulseAudio and Jack2 instead=2E
I first tested ALSA direct from Reaper with Echo Audiofire4, Pianoteq and =
the RTT was as expected around 8ms (no 90ms)
Then Jack2 with ALSAfirewire=2E
The result was very similar and around 2% less rtCPU usage but a few X-run=
s on page refresh=2E
I then set CPU to balanced and Jack failed with hundreds of X-runs whereas=
 your wonderful ALSAfirewire alone continued with no X-runs  :)=20


So you don't need to re-invent anything and there is nothing reasonable ab=
out 90ms delay=2E=20
ALSAfirewire is working fine as long Pipewire isn't involved=2E

Please fix the Pipewire problem as now nearly all distros are issued with =
it and everyone is blaming ALSAfirewire stack!
This madness should be stopped don't you agree?=20

Please=2E

Thanks Martin Armsby=20


-------- Original Message --------
From: Takashi Sakamoto <o-takashi@sakamocchi=2Ejp>
Sent: 24 July 2025 16:38:13 CEST
To: m=2Earmsby@gmx=2Ede
Cc: alsa-devel@alsa-project=2Eorg
Subject: Re: ALSAfirewire broken



The 90ms delay is reasonable=2E=2E=2E, depending on the PCM buffer
configuration=2E

At present, all of drivers in ALSA firewire stack works with such delay
due to queued initial packet=2E Therefore PipeWire computes the delay
as expected=2E We would need to reeinvent the packet streaming engine if
reducing the delay=2E


Thanks

Takashi Sakamoto

-- Martin Armsby
