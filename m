Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A2AF925A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jul 2025 14:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0FCF601FF;
	Fri,  4 Jul 2025 14:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0FCF601FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751631424;
	bh=0ce84lBSyheEvUX4QsLNfRpKAGrtfkSAXsl9AFPozYw=;
	h=Date:To:From:Subject:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xv51laehunIKwdakQS07DEztfch6GMs8e4z+dXhMDKbemlErzQY9aKeNNDymkZSZz
	 bXlyP3NLZfrX3SI70sIrIeY01Z9hsYqIygktWqlGeDNo1rNZBMeIQ/5PhgbJVndSyq
	 RFBphbyTDX2SisrhAfRxbZsjX3VPdUO6ZtXweYzg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7897FF805CA; Fri,  4 Jul 2025 14:16:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F596F805C1;
	Fri,  4 Jul 2025 14:16:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B38CF805DA; Fri, 27 Jun 2025 15:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MIME_QP_LONG_LINE,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com
 (mailrelay2-1.pub.mailoutpod3-cph3.one.com [IPv6:2a02:2350:5:421::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4C17F80538
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 15:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C17F80538
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=knutsson.it header.i=@knutsson.it header.a=rsa-sha256
 header.s=rsa1 header.b=BT9w6B+9;
	dkim=pass header.d=knutsson.it header.i=@knutsson.it header.a=ed25519-sha256
 header.s=ed1 header.b=Zo3gfjAT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751030777;
 x=1751635577;
	d=knutsson.it; s=rsa1;
	h=content-type:subject:reply-to:from:to:message-id:mime-version:date:from;
	bh=gz6Ua1h67ofUiFoU3xf1bZHupx2G2YufglGU3QzPvjk=;
	b=BT9w6B+9VxBLj+OdKAUSDrcuNDOZhzYV26381oU9A3x6KF3Cz5ymHtZVbuZWz4E+tjXR7rYD0dVUP
	 5lusKIqtcqEPbFWLfeMYnes3In8m74nKj11S6x+36BsFm+PGmVc4EDR2jQlVEMqzYStVfhzI5u6fC8
	 X0B16LJFdOAtawo57rPuWooNWYHhdXKJGVC1mDcXU5beO6/B/mT2c1Je423KvMMxOcMIZH2wwi4QVt
	 P3XLsJ6zgWyWYVzUgKNmdvAbKkr4Uou+kI8mNbbEDHfCwateVknnXT0IXFp2ZX9IqeomP4qXGYf7jL
	 1PA9lcAd9ImjCIjTmRJvhfRFjZSic9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751030777;
 x=1751635577;
	d=knutsson.it; s=ed1;
	h=content-type:subject:reply-to:from:to:message-id:mime-version:date:from;
	bh=gz6Ua1h67ofUiFoU3xf1bZHupx2G2YufglGU3QzPvjk=;
	b=Zo3gfjATuH9RSoWDi8i9WZIUCebSH9NLe3VeC5U1Ozr6M+jB6LukVwGc3vc14NxqxHvRU5Ng3aic7
	 hfjGEDQBg==
X-HalOne-ID: 4e624bdc-535a-11f0-ac2f-b37c246f863f
Received: from onecom-webmail-backend-production-84fcdc845b-725j6
 (service.pub.live1-k8s-cph3.one.com [46.30.212.67])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 4e624bdc-535a-11f0-ac2f-b37c246f863f;
	Fri, 27 Jun 2025 13:26:17 +0000 (UTC)
X-Originating-IP: 87.62.100.18
User-Agent: One.com webmail 49.0.25
Date: Fri, 27 Jun 2025 15:26:17 +0200
MIME-Version: 1.0
Message-ID: 
 <1751030777207.7.27394@webmail-backend-production-84fcdc845b-7rcsr>
To: <alsa-devel@alsa-project.org>
From: "Brian Knutsson" <maps@knutsson.it>
Subject: [BUG] Mackie DLZ Creator XS =?utf-8?Q?=E2=80=93?= USB Audio: write
 error -77 after accepted hw_params
X-MailFrom: maps@knutsson.it
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KTFTQQODDOMPF4IKSHQJIFO27IPAXDBL
X-Message-ID-Hash: KTFTQQODDOMPF4IKSHQJIFO27IPAXDBL
X-Mailman-Approved-At: Fri, 04 Jul 2025 12:16:26 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: maps@knutsson.it
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTFTQQODDOMPF4IKSHQJIFO27IPAXDBL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpIaSBBTFNBIGRldnMsDQoNCkknbSByZXBvcnRpbmcgYW4gaXNzdWUgd2l0aCB0aGUgTWFja2ll
IERMWiBDcmVhdG9yIFhTIFVTQiBhdWRpbyBkZXZpY2Ugb24gTGludXggKHRlc3RlZCBvbiBVYnVu
dHUgMjQuMDQgYW5kIDI1LjA1IHdpdGgga2VybmVsIDYuOCspLg0KDQpUaGUgZGV2aWNlIGlzIGRl
dGVjdGVkIGNvcnJlY3RseSB2aWEgQUxTQSAoY2FyZCAyOiBYUyksIGJ1dCBhcyBzb29uIGFzIHBs
YXliYWNrIGlzIGluaXRpYXRlZCDigJMgd2hldGhlciB2aWEgYGFwbGF5YCBvciBgc3BlYWtlci10
ZXN0YCDigJMgaXQgZGlzY29ubmVjdHMgd2l0aCBgd3JpdGUgZXJyb3I6IC03NywgRmlsZSBkZXNj
cmlwdG9yIGluIGJhZCBzdGF0ZWAuDQoNClJlbGV2YW50IGtlcm5lbCBsb2dzIHNob3c6DQp1c2Ig
My03OiBQcm9kdWN0OiBETFogQ3JlYXRvciBYUw0KdXNiIDMtNzogTWFudWZhY3R1cmVyOiBMT1VE
IEF1ZGlvLCBMTEMNCnVzYiAzLTc6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIFgNCg0K
VGhpcyBvY2N1cnMgd2l0aCBhbmQgd2l0aG91dCBQaXBlV2lyZS91ZGV2IHJ1bm5pbmcuDQoNCkni
gJl2ZSBjcmVhdGVkIGEgZnVsbCBBTFNBIGxvZyB3aXRoIGBhbHNhLWluZm9gIGFuZCBvcGVuZWQg
YSBLZXJuZWwgQnVnemlsbGEgZW50cnk6IDxodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hv
d19idWcuY2dpP2lkPTIyMDE0Mz4NCg0KSXMgdGhlcmUgYW55IGtub3duIHF1aXJrIG9yIHBhdGNo
IG5lZWRlZCBmb3IgdGhpcyBoYXJkd2FyZT8gT3IgYSB3YXkgdG8gYXNzaXN0IGRlYnVnZ2luZyBm
dXJ0aGVyICh1c2Jtb24gdHJhY2UgZXRjLik/DQoNClRoYW5rcyBpbiBhZHZhbmNlLA0KQnJpYW4g
S251dHNzb24NCg==
