Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768269088B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:20:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC029AE8;
	Thu,  9 Feb 2023 13:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC029AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945258;
	bh=Unuxrons6NJrQ8DcR5RnZB/8+VSzTMReCmwF3gNOM1w=;
	h=Date:Subject:References:From:To:CC:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D1jZIcl3UaB5CDdMwhYK2Uf2Hl3cedxDpk1trwakGlj5NgCeAl8d1yrGV4CruTwvP
	 ATgQoRVeZaJem/Am0UOvg4OUvms0aybyDOf5ZrpX9sWKNfl41ojcSs2AHC2Fve5qho
	 yuNMe1Z8SJIt2NxwJrfXkC6WyvI707sXCBn15sJo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A20F800B8;
	Thu,  9 Feb 2023 13:20:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A637F800E4; Thu,  9 Feb 2023 13:20:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 812CEF80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812CEF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FfkOLBB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1675945191; bh=z8bwNhCUGeo7HQMuGnZOYygW88x7K5ZdXPD502CqYDc=;
	h=X-UI-Sender-Class:Date:Subject:References:From:To:Cc;
	b=FfkOLBB74M9KcmEHAtitkhn8MMpEh9s32SOgl210eXEiWNWNSg4k7FTjGRv3al4Iy
	 R1ToRZClD2ZMu96hi1cg6DX+MNyFtN36ZNVhio34p6fJ46pTkkGJAwr9hS3TrWuSA0
	 4nFXkewZvnig6rTI0qwAcDZyT2IEPFKVXN5+4iOTwqTiiuG1PuzeoLoIiOllKF7zUO
	 6+mF9rDDwwWuvwlZW7xoUS5mtkX0MS0JZKn52RdvL5Eqlu9DFBfFcb8ZMdKR1Qgsp4
	 0jeYLHSFIO+GsuO75QQr4uWrT5WeTN0vn2EkgUR1JcgDSLOiV5G7c1JYpZX2ErSeNT
	 GqQ0obkse6egA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.66] ([77.20.255.105]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ygY-1pTxWT0L38-006BUd; Thu, 09
 Feb 2023 13:19:51 +0100
Date: Thu, 09 Feb 2023 13:19:49 +0100
Subject: Re:Motu 896Mk3Hybrid dump
X-Priority: 3
Message-ID: 
 <dthyo67qd7oj-30ctll-vrg1evnr7efht4ec6d-vumue675livm-arck14-npbh32-o2k9duez9ilsuaqtqxlx8623-kq6ura-pddtnlaydil563o5b0waa3tw-27ybk4y6e3x5-nxupxe-wmtcs3-6w8h10.1675945189061@email.android.com>
References: 
 <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
 <Y9fD0Nzg+bwKsDEZ@workstation>
 <63DF98FE.2060604@gmx.de>
 <Y+BXPeHLp+qoKJcv@workstation>
 <rbih9oyihq4crt3olr-o19zohmq8w36-ipfswlyypvjp5a8src-wcww6tahyaki-q7v6tx-j5yh81-vzf7pq-qn78wo-tww8q3-2h35ww-sk0mu3-7fsog578xr2k-jfqgg5-rvg5aw-mhtapx-pch8v9t7epgq.1675704644475@email.android.com>
 <Y+JDwWHZAI8BRgu9@workstation>
 <-9ql34ax08baa-u8njs4ojzl8k9qj8kusba8u-119dm2-3md8uqbmil7lckunia-ijl9m4n5xuto-76roex-ucqm5h-1c3kdf-5ahx5l1oy29o-no4drk-5wjqfzqre34j-p7he4b9rr95u-3lcrfi-9o14b8.1675872031471@email.android.com>
 <Y+R3Trgr8gM7A1KC@workstation>
From: "M. Armsby" <m.armsby@gmx.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
X-Provags-ID: V03:K1:tqC0duEp183SKDa2vp3o6s0sNH+sq1XDB68Xwe4ZOa/Sb9JVVzg
 jNEqvk9t0c4HjN8f5ZxMqjZwU/1N8/vb6HeKM2CPZa/5+gzPPpT3omaSBRAQ3zOZ6lIP8Dj
 fchIx3CkzUeVxD5ZG4JcooKP5u0SMf0o9BzWokLM/eiMqJrdWGBFSUnI8MxPxeilxwkt888
 K6AxEdUD1aKVbI6qGELIg==
UI-OutboundReport: notjunk:1;M01:P0:DkGrn8aFot8=;17h+/U/qH6G5JR01ew4fccbiD1c
 SPOk7UCJ4zzA+eSU76mqgdZXvSpLzWJwVm5S1uEkhf65aH/G4RJIanaMlJkofWD77yM97+6tu
 Mrh7qpZQJzhu7DIBhAu2tACQ2en0FHW/oEkoA9FqTmoBGTTjWMagS3G2ENP57YWr5tRG1DEPF
 ofL1oi5DHEHHrWYNjnb/WQKXi4GG9zNSLQAkv27C4kBCca3d2Bkw+Ftu7LvGI92oNzUFX56EJ
 C9YN+Sp5VM7CbJ7S/ciVsFiE3rJ7Hao77nyzRLedJtnIqXvt7EkzFtSVir+SpsWupkr3T7zTt
 B3jptQYGJ58F9e0ElqzptkyEmmMsPGSyxOYMDdioazFqJXgYunFxoHAPJdE9Kns6EeZoejZdg
 IYmTcD1pZHj5X8cjJCn5jA4LfbrWCAqiXLdbXiZeSQnOE+6QHEx+G957iG/PODM75LTUWRoW7
 4iOTg1m59Ca0CGg+5ivc9s862YTKPemY616i7Uj9pFEZf8hsD0ltyE+a48oHnMMXnUahsBVcH
 0kw/vQSGrKABLEPsU4+QimUDdCcTMSGydTPFjDL7jqKXIgDyFcMIJ2HzHpLc1nO/ekUh3w8Lh
 /f3BTXmkHkgDAQ2w47oRx9ezi28UrbEeY9GItpAhKcU8Wqvqd7HP6VWKIeAVk/Sz+VzcgVUVy
 TZgPp2EV0ZCPL233aLxV5VNWLazigw1L1gRgMN0t2IeVWBGpLvJ0QVc6a3C9vQMvoaKFYnGmW
 Bxy8TxOnndJX9tpaFk0xpUby5NNDl6ol2XnROc95vk2tnZXqmxta2f7Zo+w5HCUxM7LI7Pxzn
 ldsTvNYAwF88oQWSIqdvNQ2b+G7aUCArjYHd3PGgMC0sBNAUm4VurUEU7DNRI9qmmfDqo3SJP
 tC7E2RfH7ScnP3KVba3TBcfE0Qr24fkMuj9XoldyVoMTLSBLKxneHb/neGn5qTpld7gB3eQR/
 j80GOEeeayFA8L33qVYS40lJPfU=
Message-ID-Hash: SLH7GNMJYW3E5V4BU7JCXDDAPSB6YDAR
X-Message-ID-Hash: SLH7GNMJYW3E5V4BU7JCXDDAPSB6YDAR
X-MailFrom: m.armsby@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: ALSA mail List <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLH7GNMJYW3E5V4BU7JCXDDAPSB6YDAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ICAgT2ssIHNvcnJ5IGZvciBwaWN0dXJlcy4KICAgSSB3aWxsIHRyeSB0aGUgaW5zdHJ1Y3Rpb25z
IHlvdSBnYXZlIG1lIGluIHRoZSBjb21pbmcgZGF5cy4KICAgVGhlIEFyY2ggc3lzdGVtIChtYW5q
YXJvKSBJJ20gdXNpbmcgaXMgdGhlIG9ubHkgb25lIEkga25vdyB0aGF0IHVzZXMgYQogICBjdXJy
ZW50IEtlcm5lbHMgYW5kIG5vdyBydW5zIHZlcnkgd2VsbCB3aXRoIEFMU0EgRmlyZXdpcmUuCiAg
IFNob3VsZCBJIHVzZSBhIGJldHRlciBEaXN0cm8/CiAgIFJlZ2FyZHMsCiAgIE1hcnRpbgoKICAg
ICBJbmRlZWQsIGl0IGlzIGluY29udmVuaWVudCBpbiB0aGUgdmlldyBvZiB1c2VyLiBCdXQgbGV0
IHVzIGZvY3VzIG9uCiAgICAgaG93CiAgICAgdG8gc3VwcG9ydCBNT1RVIDg5NiBtazMgaHlicmlk
IGF0IHByZXNlbnQsIHNpbmNlIHRoZSBpc3N1ZSBpbmNsdWRlcwogICAgIG1hbnkKICAgICB0ZWNo
bmljYWwgdG9waWNzOyBlYWNoIGFwcGxpY2F0aW9uLCBkcml2ZXJzIGluIGtlcm5lbCwgbGlicmFy
aWVzLAogICAgIGFuZAogICAgIGludGVyZmFjZSBiZXR3ZWVuIHRoZW0uCiAgICAgPiBTZWUgUGlj
dHVyZXMgdGFrZW4gZnJvbSBSZWFwZXIgaW4gV2luZG93cyAxMAogICAgIFdvdWxkIEkgYXNrIHlv
dSB0byBhdm9pZCBhdHRhY2hpbmcgcGljdHVyZXMgdG8gb3BlbiBtYWlsaW5nIGxpc3Q/CiAgICAg
VGhlCiAgICAgbWVzc2FnZSB3aXRoIG1hbnkgZmlsZXMgaXMgZWFzaWx5IGp1ZGdlZCBhcyBzcGFt
IG1lc3NhZ2UuCiAgICAgUmVnYXJkcwogICAgIFRha2FzaGkgU2FrYW1vdG8K
