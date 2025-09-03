Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75EB411B2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 03:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56EA1601C5;
	Wed,  3 Sep 2025 03:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56EA1601C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756861968;
	bh=8iHZWhjKqtsAQCWsaJFflveSb+tlcB3MDe5yMNLh75A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q2OBvEMH/X4QE7vR+/EFe+bOGHH5oZmF4FSSVOjFzOLXZSs6RExHvFYTG7UX0De1v
	 oLo95tQPiLT0wd+X7uaYlwcocXAiq/qHtONMZvKEZtz6siouvZBCNQHwXl7f0ct8EQ
	 02n9xFhfzXAMczVXxjz+GXDvGHx/gNdOh7IQIy+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 173F3F805D2; Wed,  3 Sep 2025 03:12:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E59D8F805C7;
	Wed,  3 Sep 2025 03:12:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AABCF804D6; Wed,  3 Sep 2025 03:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5606F8011B
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 03:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5606F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=m.armsby@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=C84DXPZj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756861917; x=1757466717; i=m.armsby@gmx.de;
	bh=IwqHaAX3TVhqzPsH230A0J/qq6sOw1ya9hTkeUbtLVI=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=C84DXPZjqAvzALLIHVa/6OYhxxSUs4c3OI9YckEEfMu8ieL9QjPkl1bysmNrNIkQ
	 h4uD2KPHvLRgJGU18dEjz2LvdGa3bT1+HI04Z9CLsWgdgoBJo9TrYYjTaGr6EmuqU
	 d8sbb6lYISgJ78KZAq2fY6yD1a3dHidNJrV/gk6AFp+5C7KAny8RByOGWIobYYWqp
	 ZQunRL0ujF35h0pNk34pvY2LRlEas1eOCtEZf5xnZqMUi/+D0dhNURxO/viUVECBi
	 ouk783Sh8sggS19t2fi2CFg80qJPeaS+CAgeCMjESDaTy14w0ZPM1WQz3xeGX5X/k
	 XZaR6HxBCBnvnOnxTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([77.20.253.70]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1vASKt34U7-00WIQC; Wed, 03
 Sep 2025 03:11:56 +0200
Date: Wed, 03 Sep 2025 03:11:55 +0200
From: "M. Armsby" <m.armsby@gmx.de>
To: alsa-devel@alsa-project.org
CC: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
User-Agent: K-9 Mail for Android
In-Reply-To: <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
 <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
Message-ID: <1B53DD0F-1D85-49EC-BA7F-970BE9AEF457@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OiZt17CAv5kPXvyC6HANWeHaRTICo2IgA4fFphCZszUkMNLUTi3
 cH9X48XcLcAl6RiKi98/agAr/h+G1NVWqIEqhlhgUEo2o4nPCC1lh1u/F8VJbxq0oR/nogj
 x5oYDqlv80crp/9gLVg3j+DIXjcAywxm5VDGw+ICSFEad0Nnf9wCvMa+qCQP49EQAaYgH/q
 p8RDKMexnjsIqWToYZDNA==
UI-OutboundReport: notjunk:1;M01:P0:Yz/iDi+Fv0k=;Zn/gz1EiXXdeVCL3rf5PSiacINd
 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
 Ycw5DQrFbg7+BPoBpzD
Message-ID-Hash: EVCTULBFKKADS7GA3RBEJCLX4OH7L3MO
X-Message-ID-Hash: EVCTULBFKKADS7GA3RBEJCLX4OH7L3MO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVCTULBFKKADS7GA3RBEJCLX4OH7L3MO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2 September 2025 09:59:58 CEST, "M=2E Armsby" <m=2Earmsby@gmx=2Ede> wrot=
e:
>On 30 July 2025 21:36:00 CEST, "M=2E Armsby" <m=2Earmsby@gmx=2Ede> wrote:
>>The new ALSAfirewire drivers are very good=2E Well done to everyone who =
worked on them!=20
>>
>>Today I tested brand new CachyOS with xfce desktop kernel 6=2E15=20
>>Initial Pipewire test showed RTT 98ms at 64/44100 so I uninstalled all t=
races of Pipewire and installed PulseAudio and Jack2 instead=2E
>>I first tested ALSA direct from Reaper with Echo Audiofire4, Pianoteq an=
d the RTT was as expected around 8ms (no 90ms)
>>Then Jack2 with ALSAfirewire=2E
>>The result was very similar and around 2% less rtCPU usage but a few X-r=
uns on page refresh=2E
>>I then set CPU to balanced and Jack failed with hundreds of X-runs where=
as your wonderful ALSAfirewire alone continued with no X-runs  :)=20
>>
>>
>>So you don't need to re-invent anything and there is nothing reasonable =
about 90ms delay=2E=20
>>ALSAfirewire is working fine as long Pipewire isn't involved=2E
>>
>>Please fix the Pipewire problem as now nearly all distros are issued wit=
h it and everyone is blaming ALSAfirewire stack!
>>This madness should be stopped don't you agree?=20
>>
>>Please=2E
>>
>>Thanks Martin Armsby=20
>>
>>
>>-------- Original Message --------
>>From: Takashi Sakamoto <o-takashi@sakamocchi=2Ejp>
>>Sent: 24 July 2025 16:38:13 CEST
>>To: m=2Earmsby@gmx=2Ede
>>Cc: alsa-devel@alsa-project=2Eorg
>>Subject: Re: ALSAfirewire broken
>>
>>
>>
>>The 90ms delay is reasonable=2E=2E=2E, depending on the PCM buffer
>>configuration=2E
>>
>>At present, all of drivers in ALSA firewire stack works with such delay
>>due to queued initial packet=2E Therefore PipeWire computes the delay
>>as expected=2E We would need to reeinvent the packet streaming engine if
>>reducing the delay=2E
>>
>
>@wtaymans =20
>Wim Taymans and some guest programmers found a simple workaround to bypas=
s the 90ms delay:
>
>monitor=2Ealsa=2Erules =3D [
>  {
>    matches =3D [ { node=2Ename =3D "alsa_output=2Efirewire-0x000a3500392=
6b6db=2Epro-output-0" } ]
>    actions =3D { update-props =3D {
>       api=2Ealsa=2Eperiod-num =3D 3
>    } }
>  }=20
>]
>
>The communication from DAW to pure ALSAfirewire is not burdened with 90ms=
 so please change the pins or whatever pipewire is using, so that it can av=
oid the 90ms like a DAW does when communicating directly to ALSAfirewire dr=
iver=2E=20
>It must be obvious and easy to see in comparison and thus fix=2E=20
>
>ALSAfirewire RTT =3D 10ms
>Pipewire-Firewire RTT =3D 10 + 90ms
>
>Please, many professionals are waiting for this fix which will boost Linu=
x up to professional level=2E=20
>
>Thanks
>
>
>
>
>
>-- Martin Armsby



It's a great shame - that such issues are just ignored=2E

Lucky for us, Wim Taymans ist creating a workaround for Pipewire to bypass=
 the  ALSAfirewire 90ms buffer problemcwith help from some great reaper use=
rs and programmers=2E
Soon to be released=2E

Regards
Martin A -maa
-- Martin Armsby
