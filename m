Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A478AD372
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 19:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67828843;
	Mon, 22 Apr 2024 19:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67828843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713807947;
	bh=TDhSbVRIz/5Jidd8zWQDlom5s64vQIQvcV0v5Ljgub8=;
	h=Date:From:To:In-Reply-To:Subject:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CgLhQco+IGHb5NnyPU+5fYr3tdIQTEmIwMx/ZJV8T4DVpOsD5wNKUsdo79W3BETK/
	 06gwB4ctOpjhxV8e9UKFeSFsEUHIhl1okCdIE82+yB/Sr6MtlGtKz7yYqnxOQb4JPh
	 ofcQGIG+0hpgnwnqBhFwRrOaiB0ySeyjxA1r6Xb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67AD1F805A1; Mon, 22 Apr 2024 19:45:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2186F805A0;
	Mon, 22 Apr 2024 19:45:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B7FF80423; Mon, 22 Apr 2024 19:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	SUBJ_ALL_CAPS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3BEBF8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 19:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3BEBF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=akrobiz.com header.i=james@akrobiz.com
 header.a=rsa-sha256 header.s=zoho header.b=PxWKD2zS
ARC-Seal: i=1; a=rsa-sha256; t=1713807664; cv=none;
	d=zohomail.com; s=zohoarc;
	b=OHtSTY2D9lEhQ8K8qIV36vH85zu8tVY2YYP9+eh9FV4DEmYZJ1K9ivmcJHDhlXKlvFbPpGLxFHI9znjAa9xweDe5jnwKozynKku/xRKNSQ9YKAm1SgKfHnF6P9qMTiP77rPiBsELa5FlMO2QlrBS0yhU4vUZyV+rixElDGgfPFc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1713807664;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=ieL6gp1vR+idsGpPoj6Y9rHCMzkhNX7J2+wsgpgIWp4=;
	b=T66ju5aMP4g1zFYXdJJ/Fcyql6rjQhcMTYTK0Mdcx/rdw3HWFh1vSne4DbnKi36UpYqOMAe1Inb5RK9pGyrrd3PeywHQVJTnD+f22rzj2VzWLFpSHnSxZa0qJHTjJsX0Et/gm/W5Gbr3MA3Yqd+yMjhU5bY3B3gkHdikZ5weQAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=akrobiz.com;
	spf=pass  smtp.mailfrom=james@akrobiz.com;
	dmarc=pass header.from=<james@akrobiz.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713807664;
	s=zoho; d=akrobiz.com; i=james@akrobiz.com;
	h=Date:Date:From:From:To:To:Message-Id:Message-Id:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Reply-To:Cc;
	bh=ieL6gp1vR+idsGpPoj6Y9rHCMzkhNX7J2+wsgpgIWp4=;
	b=PxWKD2zSakbk+KSHmkmxvltHpU2cgukdAMuCcZf7P+Hoh9wFNORypOKlMgpr+oXK
	h1NCnY92fXXl8h9/N2Vw5vKLPVqWaG3E3xvWDftBYJxYE7lyYtrJzTQ/oRxg2SrCcN7
	37KvJybsllDHIsxY7Vtrv8uNtr7uf0q/4d9ikp+U=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1713807662292797.8507008275088;
 Mon, 22 Apr 2024 10:41:02 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:41:02 -0400
From: James Lehman <james@akrobiz.com>
To: "alsa-devel" <alsa-devel@alsa-project.org>
Message-Id: <18f06e59cb2.d58839031301481.5029384157786550072@akrobiz.com>
In-Reply-To: 
Subject: CM106L, CM6206, CM6206-LX
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Message-ID-Hash: 7TP7QPJFZ5LVHDCUM5AVZBVOE5UUBM4L
X-Message-ID-Hash: 7TP7QPJFZ5LVHDCUM5AVZBVOE5UUBM4L
X-MailFrom: james@akrobiz.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TP7QPJFZ5LVHDCUM5AVZBVOE5UUBM4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8gZXZlcnlvbmUuDQoNCg0KDQpJIGhhdmUgYmVlbiB1c2luZyBDTWVkaWEgVVNCIHNvdW5k
IGRldmljZXMgdG8gbWFrZSBsYXNlciBjb250cm9sIHNpZ25hbHMgZm9yIG1hbnkgeWVhcnMuDQoN
Cg0KDQpJIGhhdmUgc291bmQgZGV2aWNlcyB3aXRoIENNMTA2TCwgQ002MjA2IGFuZCBDTTYyMDYt
TFguIFNvbWUgYXJlIHBvcHVsYXRlZCBmb3IgNiBjaGFubmVscyBhbmQgc29tZSBmb3IgOC4NCg0K
DQoNClRoZQ0KIENNMTA2TCBjaGlwIHdvcmtzIHBlcmZlY3RseS4gSSBjYW4gc2VuZCBpdCBhIHN0
cmVhbSBvZiAxNi1iaXQgZGF0YSB0aGF0DQogdXNlcyB0aGUgZnVsbCByYW5nZSBvZiAtMzI3Njcg
dG8gKzMyNzY3IGFuZCBhdCAxMDAlIHZvbHVtZSBpbiBlaXRoZXIgDQphbHNhbWl4ZXIgb3IgUHVs
c2VhdWRpbyBWb2x1bWUgQ29udHJvbCwgSSBnZXQgYSBwZXJmZWN0IGltYWdlLg0KDQoNCg0KaHR0
cHM6Ly9sYXNlcmJveS5vcmcvcGlEQUMvcGVyZmVjdF9jaXJjbGUuanBnDQoNCg0KDQpJZiBJIHVz
ZSBhIGRldmljZSB3aXRoIGEgQ002MjA2LCBJIGdldCBhIHZlcnkgbmVhciBwZXJmZWN0IGltYWdl
IChvbmx5IGNsaXBwZWQgYSB0aW55IGJpdCkuDQoNCg0KDQpCdXQgSWYgSSB1c2UgYSBDTTYyMDYt
TFggY2hpcCwgaXQgY2xpcHMgaGFyZC4NCg0KDQoNCmh0dHBzOi8vbGFzZXJib3kub3JnL3BpREFD
L0NNNjIwNi1MWF8xMDAuanBnDQoNCg0KDQpFdmVuIGlmIEkgcmVkdWNlIHRoZSB2b2x1bWUgdG8g
NTAlLCBpdCBqdXN0IHNlZW1zIHRvIHJlZHVjZSB0aGUgY2xpcHBlZCBzaWduYWxzLg0KDQoNCg0K
aHR0cHM6Ly9sYXNlcmJveS5vcmcvcGlEQUMvQ002MjA2LUxYXzUwLmpwZw0KDQoNCg0KSSdtIG5v
dCBzdXJlIHdoYXQgaXMgZ29pbmcgb24gaGVyZSwgYnV0IGl0IHNlZW1zIGxpa2UgdGhlcmUgaXMg
c29tZSBraW5kIG9mIGludGVybmFsIGRpZ2l0YWwgZ2FpbiBvZiBtb3JlIHRoYW4gMS4wLg0KDQoN
Cg0KSSBhbHNvIG5vdGljZSB0aGF0IGxzdXNiIHNob3dzIGV4YWN0bHkgdGhlIHNhbWUgZGV2aWNl
IElEIGZvciBib3RoIHRoZSBDTTYyMDYgYW5kIHRoZSBDTTYyMDYtTFguDQoNCg0KDQouLi4uIDBk
OGM6MDEwMiBDLU1lZGlhIEVsZWN0cm9uaWNzLCBJbmMuIENNMTA2IExpa2UgU291bmQgRGV2aWNl
DQoNCg0KDQpBbmQgd2hhdCdzIHJlYWxseSB3ZWlyZCBpcyB0aGF0IGEgZ2VudWluZSBDTTEwNkwg
c2hvd3MgdXAgYXMgc29tZXRoaW5nIGVsc2UhDQoNCg0KDQouLi4uIDBkOGM6MDAwNiBDLU1lZGlh
IEVsZWN0cm9uaWNzLCBJbmMuIFN0b3JtIEhQLVVTQjUwMCA1LjEgSGVhZHNldA0KDQoNCg0KSXMg
dGhlcmUgc29tZXRoaW5nIEkgY2FuIGRvIGluIGFsc2EgY29uZmlnIHRvIGZpeCB0aGlzIGlzc3Vl
Pw0KDQoNCg0KVGhlDQogQ00xMDZMIGlzIGxvbmcgc2luY2Ugb3V0IG9mIHByb2R1Y3Rpb24gYW5k
IGl0IHNlZW1zIGxpa2UgYW55IGRldmljZSANCnRoYXQgdXNlcyB0aGUgQ002MjA2IG1pZ2h0IGhh
dmUgdGhlIExYIHZlcnNpb24gKG9yIG5vdCkuIFRoZXJlJ3Mgbm8gd2F5IHRvDQoga25vdyB1bnRp
bCBJIGdldCB0aGVtIGFuZCBvcGVuIHRoZW0gdXAuDQoNCg0KDQpJJ20NCiB1c2luZyB0aGlzIG9u
IGFuIE9yYW5nZSBQaSBaZXJvIDMgNGdiIHJ1bm5pbmcgZGlldHBpIHdpdGggdGhlIA0KNi42LjE2
LWN1cnJlbnQtc3VueGk2NCBrZXJuZWwsIGJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSB0byBtYXR0ZXIu
IEkgZ2V0IA0KdGhlIHNhbWUgcmVzdWx0cyBhbnkgb3RoZXIgd2F5IEkgdHJ5IGl0LiBUaGUgTFgg
dmVyc2lvbiBvZiB0aGlzIGNoaXAgDQpjbGlwcyB0aGUgc2FtZSB3YXkgaW4gV2luZG93cyB0b28h
DQoNCg0KDQpUaGFua3MgZm9yIHlvdXIgdGltZS4NCg0KDQoNCkphbWVzLg==
