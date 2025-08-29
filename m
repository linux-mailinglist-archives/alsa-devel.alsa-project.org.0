Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB55B3B78E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Aug 2025 11:34:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1AE602D7;
	Fri, 29 Aug 2025 11:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1AE602D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756460076;
	bh=mG9f99BsaB0FVpPtfeDeZfZwi7B12maif0YGeCeHMYU=;
	h=Date:From:To:CC:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=li4Q9E2ADnL+YizJhJTH865wdXzYubEz5JqG2hcpZc2cOOUR0VPc9b9ihiFrNOhYj
	 A5mkg5en0sfnNWf5DtY0X+nA3bCDne3nuOAsO1fNDvwLIS7l8fqiZl76JO187McJWE
	 SRcl6b3/NXXHx6kfGsETxKlNXsvEY9vtbyEq2q9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 508F1F805C3; Fri, 29 Aug 2025 11:34:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57798F805CA;
	Fri, 29 Aug 2025 11:34:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC723F80171; Fri, 29 Aug 2025 11:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13982F80149
	for <alsa-devel@alsa-project.org>; Fri, 29 Aug 2025 11:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13982F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=m.armsby@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=sO1pJv3u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756460015; x=1757064815; i=m.armsby@gmx.de;
	bh=jK4umm40cf5sBM5yi0qJamrDPuENmU88NbXQZYGpZL4=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sO1pJv3uVlBnpULpMg5MtExurVJSJKaurV3uRKb7CAG6UOSPFn+QoG3UaXKc8VhH
	 3ObI+N9n9Oe/33xzewIZSXxmqTuumZC9FUh+QwvEIzE+L4WQ8Sf/zf6qpepW40kr1
	 u02ViT9IEivTo42GQlJgs/nw+QOGYQyDULM0GYXt+6fnF0GZz5+rTxPWJbTdOS9oZ
	 e5eWxgz3e9Q5JxfimYnBNQ/0iH9YlZ5qLaRKG03wLTH/xwRcNJsxL1tmWk2plxqee
	 ot/RdcKzkpmRMF20c4/8ehV7RlQiiykP+1yPBsQDRdq5b3tzvEYf/i21ApSfvTRX9
	 trGtdgUlbvKZeFHKxw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([77.20.253.70]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mirng-1uFYKo2QoW-00ikPE; Fri, 29
 Aug 2025 11:33:34 +0200
Date: Fri, 29 Aug 2025 11:33:33 +0200
From: "M. Armsby" <m.armsby@gmx.de>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
CC: tiwai@suse.de, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: =?US-ASCII?Q?URGENT=3A_ALSAfirewire_Drivers_Introduce_90?=
 =?US-ASCII?Q?ms_delay_-_Linux_is_Unusable_for_Pro_Audio?=
User-Agent: K-9 Mail for Android
Message-ID: <E7BF63E9-3CDF-4BD1-89BA-593215892369@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1DU+uJGiAUFFkMzrhz/0egenyJ4CjoC3R7l6qEL2kHhHO5opcDC
 sSKGCFsHeJYecwIjBMehEgKUIlFH6MV2Gw5Ni15CA2Nz9wS7mhF6x42YXKtRgWdX8ylgcWH
 ttCU5v5W8nR2Tzv3Sed0vBApVxQJwo45A7FO97oKtOFYQLBrUxVxtRtjYlT/zC3T2eJweKH
 RohQx56QErlmf2ZswlQPQ==
UI-OutboundReport: notjunk:1;M01:P0:6yrLFXW0XDA=;lVNkIDUEdSPNmmv0Ng9REGtQaA0
 2lfTBFYsVillvcCj4KgUMMuLdl9aP/Lb90E25SkgV078xATzBIME44+V0vuEPgUiSZkSdjUAg
 ASizgaEKKCYC0jcDN+JWOvcrmsRmdhPGGtPJs/uEPOWJg2jhnqwo0aVcvxbiBIe77SYdYgY9H
 YowvvlWwgX6bek0AN4OLCOu7OipgSLIh8MkSKSAkb32iK32UPkGBCxXYJsu8yvXdoMUAcjQHp
 vdqcOTVt51m7gdEP5vKQK5VW4IvvwanlE0DTqLPX/+up+5cQQ3f7ma2LDOPL5fisvHakYO13g
 eYy0Nv5EiqJCCIcCjLz5xtim1dKtQ9pbZQlxKQh/eu0f554Bju6orKDq1tJcGuYbeh0+SfmVr
 exeOAF6Fn93QVAHI693rf12/N4j1wPPZXK+sEFWspLoW8GVPsmgTQ/dQEPoYGfuEoDddQMaGA
 DbfJoX5TTd+gpwowhD05VA6S5VdyGA9tADRY6/HRgomb1sKYXbmCdoqg7AXx4ANt7qe3OPBxf
 inUeYS2l/8RT2rw1kpHkjxZnlJRkXad270Zle4nYn/3aBIdztExpkTuwniUkd6IiGonatEtTz
 hWQhyUoZ1fpMiL+QWD7HMNXMJrMNt7+cByZkd6R07v8Lf0wxmCdEMBcDJpLKlOsskb1iegUTC
 /ybyepfRjRI4UcDAFcyKo34loWLtWXL/MCDlOClDWWCKotzxRm8JizqlfCLOcclyUSdSYfrp/
 rmUfUU58fEW6Q1xcLXI2QbDzorNqDYHcNgKZxkaUmlMGt8ozzmrltc6PvtFIHL3N9WRm2pQ/k
 D+F3BTJUqXHOwtJevqbquGVpelQve9aIDr330vdP4D/uxe0uEbHguSKDFxr1IGw9MlQ+DgUmz
 KBupoddNin3RkEiuObO+taQw0fno7YZXUniEQKNMEk/bv6h9haKcGCvHv/YUTsOVMoVxOSgp3
 RZxsxVAcT20fcpzRzb63dWM4xpA6EXye2WlWygJMoK6bN8eRUSgrJ2h8sv5g0ZTNDLMY15opX
 eilp2bV0YIDYkPsmIBw+fBroVvU1Rw6WjpXRGhTkhCsraj9nwpZ2x3Ojksg6qf+yRxOoq7ZL2
 UmPanwBDnU89D5wi0ITQPBKKio4DfNZwsA5Y3E/1J/Lf0xoAciLEqGNdUPeU7Dmrwal+ZB+Rf
 ytqJtza2MBEoCKqO9voGQ33llkK+QoA0G/6Mp5+Y6GCuuHJA++eAH34AIIWWIbdp6u45Lb592
 ix95lIxlgsdsqXLKx65B2rAfU2jKCChZWdZJhCsPUW2dFkvPKo7qWNAKJAbm/5oqQdvWOD7gR
 08b5vbOTWBnjMdSh8NFqZg78+YWQhagbl6hJEYB11phzKCXyeknTf8LiZ+GJjNOyN8LLbaznB
 blAvt7il6kVngllspZSLLN870G4CNeU5J2VCOQ8E4LDa5e3MnWrUyuyqQVUydPOVeJ28qFULn
 7041PQvAtuWTYemkRlNkO3+zG45loo2LL+qvV0jO9xaM9pyY1XCrTQw+wXzYAoP8NmKpWQE2Y
 ULlAuXksuyc/LUuXW1u/pB2fUzaxC1fKCfEL//SeQi8ZCJ3gq0LhqIjk1YZLejy9/xvd8QdbZ
 +9FEWzPLh8DNMhVoPnUHwkFLdsDSiNRaHvD/X+OZdVrnPZkNbxL8DPykKZVNYbzEccX7Fv1xI
 FXn4QH6FK+xJOXlN8RxelwLRWY8NK3BRDupokqmiOdqcRKAtRw6RMWHazjPxMUL5eGcM+PWWb
 2IVF9sfckFVPsH7zSxjS1drs7pjQ6WYfQmzawrnKVBewUIFGcfsxXUIIEySiMQYNJBhy+iC+0
 Q6UoMZQ3XVDkLfYPLzLEwZuwss2vs0TN+NQ4j1Khbz03/ib1Kndy+1KmeteQVNqR8Ira+Ij9L
 IUNcj0q226H11pkQ7jzhK78TqytEDU0FnYwfkYV2UL0PIJchHTQ0PPbFiHW5ZLvWFzu6KFk5v
 GHMyuxLpBgWZw6t1adhxFmr/YRMTa12nj21qAV1eCcbx9YyDmuFemIE+T5soLrSz7HtUG6qWq
 g7NCxMrGl2WGzUWZcyxUCScHgpoeHb9Dr8VwLAVsyzK1jjAfzBPdwN7A2yW1+2AKUWV0anp0U
 6jXixbiMV3NnKjVEDu8M5ye1cbaZX5GIfjYCpL3b8lFlgbQpADYisMbxAPTiYWiSmHoM4t37a
 meudILbGumUY3BxysHq4e8uPSWqurp11j6jRrJarmqPmiZPPdCghOuT61CpBkIIYrQfbakUTA
 LVLsHD2r8YyYTvY7thPlLC/aZmfyjmqpjgNGbTuQWgPliZ00zrpUC+HFNDbteeeYSNoYqqYXV
 xymmmqwWChoHwVZ3Und3TTGGL7gvNWIxahq8zh9ydatKOCPTK9a7KN5CxLb12Ucfx/5qezIGq
 8VrDsI4fZ0Csf7IQ3gxlDNKH2/kqnGt0+xV5mbrc5IR9euxUrpRcgoDBB8gP5xkS69fb34vOU
 ADFX+6PfV5NJC6eHFxKTB9qpvWUMfbqF5TtgyC8+uOWBH7prDI3kTAE8LLihLf9p7oJcI6w+J
 p61oLA0/+Hc3luKqsaROQWgxVBJpT0+FoYBFpmhIDys0LqXF5bB3/1WBLJy4ZvntABRmPxpUj
 2sH6epXvDNQIcl5JGZSBLcYHpQFc00vit3BjWmZfWJy+TsNu3iAv7clDJz34ne4fQjwEil1hM
 c//ZRsOaNCea4kCyvkh29Bu1NTMqjIBsWe7HD2F6dyAop78t7WTB6XvdFdHm4BpU6anPCPfVg
 kqlIeWSfDAV50TXnRlCNWWh/KbtcB96aGeNJlLNlqg+v0VA5Qi2PDRKL91lIvjpftvZxfRID4
 YTcFiaeSDXX1CxM1+0nT3oZRcx9d70ay+qKpjm6Cc9U0ICFaeF8H8ZdBYI6IPcR1dAB8irBR9
 ISrTKAy8p4ZPZ0e2V4W/raDoxWpYmaC4JHZSM7IgBSs84sZ3T7fxqB130wtzryCRT7L81lzsu
 /bpAPbAdIey/hwCoe8Bu44qC5tbBfIFFblG0j73RFwRcJLUT1ulif/bCnFCImEPZYYrZmC98C
 5nYuVGQa5EIgF+/O5+ltmExN1nV3MfOsOlOr6rx1sNn0BEOG7STyJfPIjUow9zvTBYCLSyagF
 hRMEw2cvbYqCkJgf9jH2nbAev2+p5xy7quTxrIxs6C7sokzKUl977De9uEMQC4D82Li/m5w0S
 GXdjjvke9/+OMkGIQxhL6YcdQ4+PdCYTQXErXHZpj1+d+eBtxsaeCkSGrU3ilUffXlsZ3CFDd
 frNdGBr7yXYmaDTbgrJ/9OPUgwxBH6x9Gqcnsh2/OMxxEFN9EFKbrtMmLc+q5U5UiPm/YfOmm
 Cxwdl9uMOpVwXDEVL01fRSm7XaoO2hKVPLT6mKUJI8+GLsPqk/IWWecVW6eQbJO9N4OkGmmVY
 b767NG79pRZnGYZYIBbT6AF0dpaJb9tgOO6cj2/DjpqAWl8ELlZlWSGeIJ52pPOC2ID2Ve4SP
 ueMR+XLLYjcnguL5S6HnxQycY4xqwQlgxo8nz5qvHjhXMEoQfazPYpLf2AZeJl2QxuwVW2x96
 veAuJ/peB0RyX/vHJew6by4re/WfQtpDQVvqVcrRmrF4cUEp+PeQXyjbyWB75bZiKDSWBT6r6
 58iTTB98IrKdL4M9bAvICe0ClJgk71fUuivjJMYsGwAs0EadoADCzmSmEaIruuEOgb6NBEn5z
 lv80wBsOjd2LY9GMd/oov3gEZ9nweF0wiReZ2jLM8rNYYX9B8ysLezRd3ydTaAh8dsNskDZMD
 ymHjCdMWuJcZD5s7PE4U5XQQAsk8ZyEhoowDSB6xaCqLn31vCEBjHke5yxh6RALDfXjk9co+n
 m9TlnvQJwlwpgGkEf6AJq0QjH73nyHPXOIJIEClPR63Gf1cmmr/MX4IxlJJu25teujQe/Tbfx
 czEEOfR/D5mD+MtKctwHYiOyQfB66XG2mhZ1ZHgS+qmVbVq3AJzuehwfD2eio3Ui64Z3RQ0t7
 P0nD9IGcTnaujY0Z+fbSay0T+HYJioM0uaVqPigcZaliiqot7HYikNpgaPqMd+liyJyfG4sOC
 dNTZ9T4WeDq/zMVexNA+t7RG6QRAYv3b2PXsN8dEfNsvJIbqKWIqQy7qH60jIHCauPNYkJvip
 4+LFgi518R+dqKiVzrZAv0jHCXc/HCrC/j3Mq004+ez0fvtp5WBA878TVmzU6M99Xcp9//tKX
 cujv3B0TkKyu96nx7Hq/0LrrnYAV1wmcdcKAA5NClzCrPb3b3vwm949PQfdwNKEAtJFLCb4Pr
 8+mbIOBoP4fX8DWXFZyti56xrQSPbsAVcaq3Etdo5XUL4e4mg8iDbTxDz9BMt1PJa9RzhrO8O
 t0MNAGLLzX16PXXPUKvJWpC488aVBTMU25b3hUGhiV0zLGFJzB4stIfctLay3Zevd65r/f+K4
 zRvtzx8doDUhekiUvFaTbzi9i9WbNEOHruwHvygGaUSPANG++p2CYKggEUcnQEJGYrk/S5Hru
 yOanVFdIsQBwBq7uXWGAdpt+uhZVC7KcpM4QbBdGxdU8+8nYcJZyiJUvpY2d2TjiZUZOBMyfU
 u7F5gBbYC7mU5vQC+HRn5fKKiFvpWkkAwWuxk+a0Ls4njZI16355be7vadwv0B/GvNHHqZyeq
 4+5q+Y9VLcMAuHil9AGDzT9FNhQAankjCCci6C0Me99Yp4T1biinX6LNnOafTHa3UOnq+O2X8
 TAAY0ogZWB47eKhtZLC0NU5dtmRZgq+sNAoW4Hvh9oPg/gaZu871hZUKNo9VJGR4NX9SMvExZ
 tOHXtF7/4xN0rJpkel80IGdWy3KoeXatXbcaeJDiFxpnx+edl+iBz65KywISPbHdmnjQjw1cs
 3YGkE1lz+R
Message-ID-Hash: XYYF7SZUC6L6DZEPWNEVOPLTIGQMGJSA
X-Message-ID-Hash: XYYF7SZUC6L6DZEPWNEVOPLTIGQMGJSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYYF7SZUC6L6DZEPWNEVOPLTIGQMGJSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



Dear maintainers,

Linux is being ridiculed in the professional audio community =E2=80=94 not=
 because it can't do low-latency audio, but because the ALSA FireWire stack=
  actively breaks it=2E Professional gear costing thousands of dollars like=
 Motu RME Focusrite etc=2E etc=2E=20

Since kernel 5=2E16+, FireWire audio devices are correctly detected and fu=
nctional =E2=80=94 but they are burdened with an artificial +90ms latency o=
ffset due to missing timing metadata (e=2Eg=2E, cycle-match delay, transmis=
sion latency) in the driver's interface to userspace=2E

PipeWire and WirePlumber rely on accurate latency reporting=2E When it's m=
issing, they fall back to worst-case assumptions =E2=80=94 adding ~90ms of =
delay=2E This is NOT a PipeWire bug=2E It is a FAILURE of the ALSA FireWire=
 drivers to expose timing data that the hardware and firmware already provi=
de=2E

This bug:
- Renders high-end interfaces (RME, Focusrite, Tascam, Motu, Terratec) unu=
sable for real-time monitoring
- Forces users to hack WirePlumber with hardcoded quantum rules
- Damages Linux's credibility in music production
- Makes Linux a JOKE in studios worldwide

There is NO excuse for this in 2025=2E

We have workarounds (see: https://forum=2Ecockos=2Ecom/showthread=2Ephp?t=
=3D274978), but they are fragile, device-specific, and do not scale=2E

We demand:
1=2E Immediate exposure of accurate device latency via ALSA control or hwd=
ep interface
2=2E Proper reporting of transmission/cycle delay to userspace
3=2E A timeline for fixing this in mainline

This is not a "nice-to-have"=2E It is a **critical defect** in a core mult=
imedia subsystem now using pipewire as standard=2E=20

Linux can and must do better=2E
Many are waiting to move to Linux, finally leaving windows=2E=20

=E2=80=94 Martin Armsby (Martin A - maa)=20
Professional Audio Producer / Linux Advocate

Please see:
Imagine if Linux Audio just worked - Firewire  <https://forum=2Ecockos=2Ec=
om/showthread=2Ephp?t=3D302305>
and
<https://gitlab=2Efreedesktop=2Eorg/pipewire/pipewire/-/issues/4785>
Thank you for reading=2E
-- Martin Armsby
-- Martin Armsby
