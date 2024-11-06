Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA909BF127
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 16:05:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16CD14E0;
	Wed,  6 Nov 2024 16:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16CD14E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730905532;
	bh=gDKlfHKOLXxPSe5vscHyCrxXP8y0tkRmqbyqTjG8r8k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bp805bl2p7jLdgUY844KHK9uxIaRhCmGfXSRyntrCx3pIQE0ORbc+LXT32UlsJ4QR
	 WQKiyh5vX863PQ5xzzNW3dbte+idOCjKf/H+3H0Y+pTphycfv2dc81h+F5ViilzC5y
	 KRJIgfk6CM6f0+QMNF5DWMmvfs6dK70gKO2nfkBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF027F805B4; Wed,  6 Nov 2024 16:05:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 032ACF805B1;
	Wed,  6 Nov 2024 16:05:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36EF7F8013D; Wed,  6 Nov 2024 16:05:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6092EF800BD
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 16:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6092EF800BD
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1730905504856291294-webhooks-bot@alsa-project.org>
References: <1730905504856291294-webhooks-bot@alsa-project.org>
Subject: BridgeCast v2 not working despite V2 module
Message-Id: <20241106150507.36EF7F8013D@alsa1.perex.cz>
Date: Wed,  6 Nov 2024 16:05:07 +0100 (CET)
Message-ID-Hash: WAYKY2TMRAHCW7SWOXYZRYRZGPWITBTI
X-Message-ID-Hash: WAYKY2TMRAHCW7SWOXYZRYRZGPWITBTI
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAYKY2TMRAHCW7SWOXYZRYRZGPWITBTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzQ1OCB3YXMgb3BlbmVkIGZyb20gYWNl
cmFtbW9zOgoKSGkgZXZlcnlib2R5LA0KDQpJIChzYWRseSkgbWFkZSB0aGUgZmlybXdhcmUgdXBk
YXRlIGZvciB0aGUgUm9sYW5kIEJyaWRnZUNhc3QgYW5kIGl0IGNhbWUgb3V0IGJyb2tlbi4NCkl0
IHdhcyB3b3JraW5nIGZsYXdsZXNzbHkgYmVmb3JlIHRoZSB1cGRhdGUsIHRoYW5rcyB0byB5b3Ug
aSBoYWQgYWxsIHRoZSBPdXRwdXQvSW5wdXQgY2hhbm5lbHMgYXZhaWxhYmxlIGFuZCBpIHdhcyBh
YmxlIHRvIGFzc2lnbiBzb3VuZCBzb3VyY2VzIG9uIHRoZW0gaW5kaXZpZHVhbGx5IHRocm91Z2gg
dGhlIHN5c3RlbSBzZXR0aW5ncyBndWkgKEttaXggLSBQbGFzbWEpLg0KDQpUb2RheSwgYXMgYSBu
b3cgIlYyIiwgaXQgaXMgZG9uZS4gVGhlIEJyaWRnZUNhc3Qgc2VlbXMgdG8gYmUgYXNzaWduZWQg
dG8gdGhlIGNvcnJlY3QgY29uZiBmaWxlIHdpdGggaXRzIG5ldyB1c2IgdGFnLCB0byBgQnJpZGdl
Q2FzdFYyLUhpZmkuY29uZmAgYW5kIG5vdCBmb3JtZXIgdGhlIGBCcmlkZ2VDYXN0LUhpZmkuY29u
ZmAuIEl0IHNlZW1zIHRvIGJlIGEgZ29vZCBzdGFydCwgdGhhbmtzIHRvIEZ1bG1lciBmb3IgdGhl
IG1lcmdlIGFuZCBmaXJzdCB0ZXN0aW5nIFJvbGFuZCdzIHVwZGF0ZS4NCg0KQnV0IG5vdywgaSBo
YXZlIGEgd2VpcmQgbWl4IG9mICJhdXhpbGlhcnkgY2hhbm5lbHMiIGluc3RlYWQgb2YgcHJvcGVy
IGF1ZGlvIG91dHB1dHMgbGlrZSBiZWZvcmUgOiANCg0KIVtDb3BpZSBkJ8OpY3Jhbl8yMDI0MTEw
Nl8xNTQ0MjhdKGh0dHBzOi8vZ2l0aHViLmNvbS91c2VyLWF0dGFjaG1lbnRzL2Fzc2V0cy80MjQw
OTI0Yi05NjUwLTQxZjQtYTE2Ny1hYWEwNWY2ZGFhYzkpDQo+IF8oVGVsbCBtZSBpZiB5b3UgbmVl
ZCBGcj5FbiB0cmFuc2xhdGlvbiBvbiB0aGF0IHNjcmVlbnNob3QpXw0KDQpOb3RlIHRoYXQgImNo
cm9taXVtIiAod2ljaCBpcyBpbiBmYWN0IGEgY2xpZW50IGxpa2Ugc3BvdGlmeSwgcGxheWluZyBt
dXNpYykgY2Fubm90IGJlIGFzc2lnbmVkIHRvIGEgc3BlY2lmaWMgb3V0cHV0LCBiZWNhdXNlIEJy
aWRnZUNhc3QgaXMgbm93IGRldGVjdGVkIHRvIGJlICJvbmx5IG9uZSBjaGFubmVsIiBzbyB0aGUg
b3B0aW9uIGlzIG1pc3NpbmcuIEFuIGV4ZW1wbGUgYWZ0ZXIgYWxzbyBlbmFibGluZyBteSBzcGVh
a2VycyA6DQoNCiFbQ29waWUgZCfDqWNyYW5fMjAyNDExMDZfMTU1NzQ1XShodHRwczovL2dpdGh1
Yi5jb20vdXNlci1hdHRhY2htZW50cy9hc3NldHMvZDAxZDFhNjctZjA0MC00NjcyLWExY2MtZjY3
YTE0Yzc5ZDk1KQ0KPiBfT2xkIGJlaGF2aW91ciBhbGxvd2VkIG1lIHRvIGNob29zZSBiZXR3ZWVu
IGFsbCB0aGUgb3V0cHV0IGNoYW5uZWxzIG9mIHRoZSBCcmlkZ2VDYXN0LCBsaWtlICJHYW1lcyIs
ICJBdXgiLCAiTXVzaWMiLCBDaGF0IiBvciAiU3lzdGVtIl8NCg0KU29tZXRoaW5nIGVsc2UgaSd2
ZSAobWF5YmUpIG5vdGljZWQgaXMgdGhlIGRpZmZlcmVuY2VzIGZvciB0aGUgY2hhbm5lbCBtYXBz
LCBiZXR3ZWVuIHRoZSBgY2F0IC9wcm9jL2Fzb3VuZC9jYXJkWC9zdHJlYW0wYCBjaGFubmVscyBv
dXRwdXQgYW5kIHdoYXQgaXMgd3JpdHRlbiBpbiB0aGUgYFJvbGFuZC9CcmlkZ2VDYXN0VjItSGlm
aS5jb25mYC4NCg0KYGNhdCAvcHJvYy9hc291bmQvY2FyZFgvc3RyZWFtMCA6YA0KDQpgYGANClJv
bGFuZCBCUklER0UgQ0FTVCBWMiBhdCB1c2ItMDAwMDowMDoxNC4wLTEsIGhpZ2ggc3BlZWQgOiBV
U0IgQXVkaW8NCg0KUGxheWJhY2s6DQogIFN0YXR1czogUnVubmluZw0KICAgIEludGVyZmFjZSA9
IDENCiAgICBBbHRzZXQgPSAxDQogICAgUGFja2V0IFNpemUgPSAzOTINCiAgICBNb21lbnRhcnkg
ZnJlcSA9IDQ4MDAwIEh6ICgweDYuMDAwMCkNCiAgSW50ZXJmYWNlIDENCiAgICBBbHRzZXQgMQ0K
ICAgIEZvcm1hdDogUzMyX0xFDQogICAgQ2hhbm5lbHM6IDE0DQogICAgRW5kcG9pbnQ6IDB4MGQg
KDEzIE9VVCkgKEFTWU5DKQ0KICAgIFJhdGVzOiA0ODAwMA0KICAgIERhdGEgcGFja2V0IGludGVy
dmFsOiAxMjUgdXMNCiAgICBCaXRzOiAyNA0KICAgIENoYW5uZWwgbWFwOiBGTCBGUiBGQyBMRkUg
UkwgUlIgRkxDIEZSQyBSQyBTTCBTUiBUQyAtLSAtLQ0KICAgIFN5bmMgRW5kcG9pbnQ6IDB4OGUg
KDE0IElOKQ0KICAgIFN5bmMgRVAgSW50ZXJmYWNlOiAyDQogICAgU3luYyBFUCBBbHRzZXQ6IDEN
CiAgICBJbXBsaWNpdCBGZWVkYmFjayBNb2RlOiBZZXMNCg0KQ2FwdHVyZToNCiAgU3RhdHVzOiBT
dG9wDQogIEludGVyZmFjZSAyDQogICAgQWx0c2V0IDENCiAgICBGb3JtYXQ6IFMzMl9MRQ0KICAg
IENoYW5uZWxzOiA2DQogICAgRW5kcG9pbnQ6IDB4OGUgKDE0IElOKSAoQVNZTkMpDQogICAgUmF0
ZXM6IDQ4MDAwDQogICAgRGF0YSBwYWNrZXQgaW50ZXJ2YWw6IDEyNSB1cw0KICAgIEJpdHM6IDI0
DQogICAgQ2hhbm5lbCBtYXA6IEZMIEZSIEZDIExGRSBSTCBSUg0KICAgIFN5bmMgRW5kcG9pbnQ6
IDB4MGQgKDEzIE9VVCkNCiAgICBTeW5jIEVQIEludGVyZmFjZTogMQ0KICAgIFN5bmMgRVAgQWx0
c2V0OiAxDQogICAgSW1wbGljaXQgRmVlZGJhY2sgTW9kZTogWWVzDQpgYGANCg0KYEJyaWRnZUNh
c3RWMi1IaWZpLmNvbmYgOmANCg0KYGBgDQpNYWNybyBbDQoJew0KCQlTcGxpdFBDTSB7DQoJCQlO
YW1lICJiY19zdGVyZW9fb3V0Ig0KCQkJRGlyZWN0aW9uIFBsYXliYWNrDQoJCQlDaGFubmVscyAy
DQoJCQlIV0NoYW5uZWxzIDE0DQoJCQlIV0NoYW5uZWxQb3MwIEZMDQoJCQlIV0NoYW5uZWxQb3Mx
IEZSDQoJCQlIV0NoYW5uZWxQb3MyIEZMDQoJCQlIV0NoYW5uZWxQb3MzIEZSDQoJCQlIV0NoYW5u
ZWxQb3M0IEZMDQoJCQlIV0NoYW5uZWxQb3M1IEZSDQoJCQlIV0NoYW5uZWxQb3M2IEZMDQoJCQlI
V0NoYW5uZWxQb3M3IEZSDQoJCQlIV0NoYW5uZWxQb3M4IEZMDQoJCQlIV0NoYW5uZWxQb3M5IEZS
DQoJCQlIV0NoYW5uZWxQb3MxMCBGTA0KCQkJSFdDaGFubmVsUG9zMTEgRlINCgkJCUhXQ2hhbm5l
bFBvczEyIEZMDQoJCQlIV0NoYW5uZWxQb3MxMyBGUg0KCQl9DQoJfQ0KCXsNCgkJU3BsaXRQQ00g
ew0KCQkJTmFtZSAiYmNfc3RlcmVvX2luIg0KCQkJRGlyZWN0aW9uIENhcHR1cmUNCgkJCUNoYW5u
ZWxzIDINCgkJCUhXQ2hhbm5lbHMgNg0KCQkJSFdDaGFubmVsUG9zMCBGTA0KCQkJSFdDaGFubmVs
UG9zMSBGUg0KCQkJSFdDaGFubmVsUG9zMiBGTA0KCQkJSFdDaGFubmVsUG9zMyBGUg0KCQkJSFdD
aGFubmVsUG9zNCBGTA0KCQkJSFdDaGFubmVsUG9zNSBGUg0KCQl9DQoJfQ0KXQ0KYGBgDQoNCkkn
bSBjb21wbGV0ZWx5IG5ldyB0byB0aGlzIGtpbmQgb2YgY29kZS9saW51eCBkcml2ZXIgd2l6YXJk
cnkgc28gaSBoYXZlbid0IGJlZW4gYWJsZSB0byBnYXRoZXIgbW9yZSBkYXRhLCBidXQgaSdtIG5v
dCBhZnJhaWQgdG8gYmUgbWVzc2luZyBhcm91bmQsIHNvIGlmIGkgY2FuIGJlIG9mIGFueSBoZWxw
LCBzY3JlZW5zaG90LCBjb21tYW5kIG91dHB1dHMsIHJhbmRvbSBmaWxlIHRlc3RpbmcsIGknbGwg
Z2xhZGx5IGhlbHAuDQoNClJlZ2FyZHMsIGFuZCB0aGFuayB5b3UgYWxsICEKCklzc3VlIFVSTCAg
ICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvaXNzdWVz
LzQ1OApSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNh
LXVjbS1jb25mCg==
