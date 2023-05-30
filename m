Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8504716CB1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 20:43:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D681DD;
	Tue, 30 May 2023 20:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D681DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685472207;
	bh=LgSg4owZSvMyFoyGKVeq7DxaMlXRO5RO9pxF1LTTkQY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bkFjVQUsgCJJbUA+KGLVgqRsVwJr5joAodH1esEGEL/rbcnJJaVErDEflfIojdbx7
	 AzBYkDHV/f+ZEVf8r7sgyfIt3Ds4OgtSuyUDg2QMmDD15OAcRCimYWjUNcK1yQm0h6
	 9IH0eXmSmVtyk6GK2RO/9hE2d8NkvyVsvYzER1DI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA50F80544; Tue, 30 May 2023 20:42:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40ED8F8016B;
	Tue, 30 May 2023 20:42:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 921E5F8026A; Tue, 30 May 2023 20:42:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 16990F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 20:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16990F80149
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1685472145595734358-webhooks-bot@alsa-project.org>
References: <1685472145595734358-webhooks-bot@alsa-project.org>
Subject: speaker-test: allow controlling how long the noise is heard by the
 user
Message-Id: <20230530184232.921E5F8026A@alsa1.perex.cz>
Date: Tue, 30 May 2023 20:42:32 +0200 (CEST)
Message-ID-Hash: IGPSVDLISABBGQTQ566WWEDDM5G665N6
X-Message-ID-Hash: IGPSVDLISABBGQTQ566WWEDDM5G665N6
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGPSVDLISABBGQTQ566WWEDDM5G665N6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgaXNzdWUgIzIxOSB3YXMgb3BlbmVkIGZyb20gamlkYW5u
aToKCiQgc3BlYWtlci10ZXN0IC0tbmxvb3BzIDENCm1ha2VzIGEgcGluayBub2lzZSBmb3IgYWJv
dXQgb25lIHNlY29uZC4NCg0KT24gdGhlIG1hbiBwYWdlIG1lbnRpb24gaG93IHRvIG1ha2UgdGhp
cyBpbnRvIHNheSBhIGhhbGYgc2Vjb25kLA0KYXMgc29tZSB1c2VycyB3b3VsZCBsaWtlIHRvIGxp
c3RlbiB0byBzaG9ydGVyIHRlc3Qgc291bmRzLA0KYW5kIG5vIG1hdHRlciBpZiB0aGUgdXNlciBk
b2VzDQpgYGANCiQgc3BlYWtlci10ZXN0IC0tZGV2aWNlIGhkbWk6SERNSSAtYyAyIC0tbmxvb3Bz
IDEgLS1wZXJpb2QgNQ0KJCBzcGVha2VyLXRlc3QgLS1kZXZpY2UgaGRtaTpIRE1JIC1jIDIgLS1u
bG9vcHMgMSAtLXBlcmlvZCA1MA0KJCBzcGVha2VyLXRlc3QgLS1kZXZpY2UgaGRtaTpIRE1JIC1j
IDIgLS1ubG9vcHMgMSAtLXBlcmlvZCA1MDANCiQgc3BlYWtlci10ZXN0IC0tZGV2aWNlIGhkbWk6
SERNSSAtYyAyIC0tbmxvb3BzIDEgLS1wZXJpb2QgNTAwMA0KYGBgDQp3aGF0IHRoZSB1c2VyIGhl
YXJzIGlzIGV4YWN0bHkgdGhlIHNhbWUsIHRoZXJlZm9yZSAtLXBlcmlvZCBpcyBub3Qgd2hhdA0K
Y29udHJvbHMgdGhpcyBpdGVtLg0KDQpJIGFtIHNheWluZyB0aGF0IHNvbWUgdXNlcnMgY2FuIGNv
bmZpcm0gdGhlaXIgc3BlYWtlcnMgd29yayB3aXRob3V0DQpsaXN0aW5nIHRvIGEgZnVsbCBzZWNv
bmQgb2YgcGluayBub2lzZSwgYW5kIHRodXMgd291bGQgbGlrZSBhIHdheSB0bw0KbGlzdGVuIHRv
IGEgc2hvcnRlciBsZW5ndGguDQoNCkFzIGZhciBhcw0KYGBgDQoNCiAgICAgICAtYiB8IC0tYnVm
ZmVyIFRJTUUNCiAgICAgICAgICAgICAgVXNlIGJ1ZmZlciBzaXplIG9mIFRJTUUgbWljcm9zZWNv
bmRzLiAgV2hlbiAwIGlzIGdpdmVuLCB1c2UgIHRoZQ0KICAgICAgICAgICAgICBtYXhpbWFsIGJ1
ZmZlciBzaXplLiAgVGhlIGRlZmF1bHQgdmFsdWUgaXMgMC4NCg0KICAgICAgIC1wIHwgLS1wZXJp
b2QgVElNRQ0KICAgICAgICAgICAgICBVc2UgIHBlcmlvZCBzaXplIG9mIFRJTUUgbWljcm9zZWNv
bmRzLiAgV2hlbiAwIGlzIGdpdmVuLCB0aGUgcGXigJANCiAgICAgICAgICAgICAgcmlvZHMgZ2l2
ZW4gYnkgLVAgb3B0aW9uIGlzIHVzZWQuICBUaGUgZGVmYXVsdCB2YWx1ZSBpcyAwLg0KYGBgDQph
cmUgY29uY2VybmVkLCB0aGV5IG11c3QgYmUgZG9jdW1lbnRpbmcgc29tZXRoaW5nIGNvbXBsZXRl
bHkgZGlmZmVyZW50Lg0KDQpEZWJpYW4NClBhY2thZ2U6IGFsc2EtdXRpbHMgICAgICAgICAgICAg
ICAgICAgICAgDQpWZXJzaW9uOiAxLjIuOC0xCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRo
dWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzL2lzc3Vlcy8yMTkKUmVwb3NpdG9yeSBVUkw6
IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11dGlscwo=
