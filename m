Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4987794D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 01:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC2DFB70;
	Mon, 11 Mar 2024 01:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC2DFB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710116822;
	bh=EDB0msgCEStsTXtknVcjZrvZt+k0nBM5GBRIl8Q4G90=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NW5naByNEwDp0fKQG9A754UhIeLVWM8xAJGx7p7YCoNE0zoha7+Qbng5qOXsqDfrv
	 dqrh1+oo/QtrAksr9OC8vzDnQT/iJYHoO3s7nwzCkk0167oDPbt1gL7Sq0znlgd8Be
	 04ICVy44bZwgVlvgWhDM1kbe01qMEMsqixFGV9s8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 643FCF8057C; Mon, 11 Mar 2024 01:26:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A78F805A0;
	Mon, 11 Mar 2024 01:26:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28624F8028D; Mon, 11 Mar 2024 01:26:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CE2D9F800E4
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 01:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE2D9F800E4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710116774344735861-webhooks-bot@alsa-project.org>
References: <1710116774344735861-webhooks-bot@alsa-project.org>
Subject: Incompatible syntax 6 in Valve-Jupiter-1.conf
Message-Id: <20240311002623.28624F8028D@alsa1.perex.cz>
Date: Mon, 11 Mar 2024 01:26:23 +0100 (CET)
Message-ID-Hash: W3NOCEJAKA7ELX5F64U23X2BU2MASIRK
X-Message-ID-Hash: W3NOCEJAKA7ELX5F64U23X2BU2MASIRK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3NOCEJAKA7ELX5F64U23X2BU2MASIRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzQwMSB3YXMgb3BlbmVkIGZyb20gUmlj
aGFyZC1IYWVzLUVsbGlzOgoKV2hlbiBpbnN0YWxsaW5nIHRoZSBtaXNzaW5nIHVjbTIgZmlsZXMg
Zm9yIHRoZSBTdGVhbSBEZWNrIEkgZ2V0IHRoaXMgZXJyb3Igb24gc3lzdGVtY3RsIHN0YXR1cyBh
bHNhLXJlc3RvcmU6DQoNCiBgYGANCnN5c3RlbWN0bCBzdGF0dXMgYWxzYS1yZXN0b3JlICAgICAg
ICAgICAgICAgICAgICAgICAgDQril48gYWxzYS1yZXN0b3JlLnNlcnZpY2UgLSBTYXZlL1Jlc3Rv
cmUgU291bmQgQ2FyZCBTdGF0ZQ0KICAgICBMb2FkZWQ6IGxvYWRlZCAoL2xpYi9zeXN0ZW1kL3N5
c3RlbS9hbHNhLXJlc3RvcmUuc2VydmljZTsgc3RhdGljKQ0KICAgICBBY3RpdmU6IGFjdGl2ZSAo
ZXhpdGVkKSBzaW5jZSBNb24gMjAyNC0wMy0xMSAwMTowNjoxOCBDRVQ7IDE1bWluIGFnbw0KICAg
ICAgIERvY3M6IG1hbjphbHNhY3RsKDEpDQogICBNYWluIFBJRDogNjA4IChjb2RlPWV4aXRlZCwg
c3RhdHVzPTk5KQ0KICAgICAgICBDUFU6IDEzbXMNCg0KbWFyIDExIDAxOjA2OjE4IHN0ZWFtLWRl
Y2FkbyBhbHNhY3RsWzYwOF06IC91c3Ivc2Jpbi9hbHNhY3RsOiBsb2FkX3N0YXRlOjE2ODk6IENh
bm5vdCBvcGVuIC92YXIvbGliL2Fsc2EvYXNvdW5kLnN0YXRlIGZvciByZWFkaW5nOiA+DQptYXIg
MTEgMDE6MDY6MTggc3RlYW0tZGVjYWRvIGFsc2FjdGxbNjA4XTogYWxzYS1saWIgcGFyc2VyLmM6
MjAyMToocGFyc2VfbWFzdGVyX2ZpbGUpIEluY29tcGF0aWJsZSBzeW50YXggNiBpbiBIREEtSW50
ZWwuY29uZg0KbWFyIDExIDAxOjA2OjE4IHN0ZWFtLWRlY2FkbyBhbHNhY3RsWzYwOF06IGFsc2Et
bGliIG1haW4uYzoxNDEyOihzbmRfdXNlX2Nhc2VfbWdyX29wZW4pIGVycm9yOiBmYWlsZWQgdG8g
aW1wb3J0IGh3OjAgdXNlIGNhc2UgY29uZmk+DQptYXIgMTEgMDE6MDY6MTggc3RlYW0tZGVjYWRv
IGFsc2FjdGxbNjA4XTogRm91bmQgaGFyZHdhcmU6ICJIREEtSW50ZWwiICJBVEkgUjZ4eCBIRE1J
IiAiSERBOjEwMDJhYTAxLDAwYWEwMTAwLDAwMTAwODAwIiAiMHgxZTQ0IiAiMD4NCm1hciAxMSAw
MTowNjoxOCBzdGVhbS1kZWNhZG8gYWxzYWN0bFs2MDhdOiBIYXJkd2FyZSBpcyBpbml0aWFsaXpl
ZCB1c2luZyBhIGdlbmVyaWMgbWV0aG9kDQptYXIgMTEgMDE6MDY6MTggc3RlYW0tZGVjYWRvIGFs
c2FjdGxbNjA4XTogYWxzYS1saWIgcGFyc2VyLmM6MjAyMToocGFyc2VfbWFzdGVyX2ZpbGUpIElu
Y29tcGF0aWJsZSBzeW50YXggNiBpbiBWYWx2ZS1KdXBpdGVyLTEuY29uZg0KbWFyIDExIDAxOjA2
OjE4IHN0ZWFtLWRlY2FkbyBhbHNhY3RsWzYwOF06IGFsc2EtbGliIG1haW4uYzoxNDEyOihzbmRf
dXNlX2Nhc2VfbWdyX29wZW4pIGVycm9yOiBmYWlsZWQgdG8gaW1wb3J0IGh3OjEgdXNlIGNhc2Ug
Y29uZmk+DQptYXIgMTEgMDE6MDY6MTggc3RlYW0tZGVjYWRvIGFsc2FjdGxbNjA4XTogRm91bmQg
aGFyZHdhcmU6ICJhY3A1eCIgIiIgIiIgIiIgIiINCm1hciAxMSAwMTowNjoxOCBzdGVhbS1kZWNh
ZG8gYWxzYWN0bFs2MDhdOiBIYXJkd2FyZSBpcyBpbml0aWFsaXplZCB1c2luZyBhIGdlbmVyaWMg
bWV0aG9kDQptYXIgMTEgMDE6MDY6MTggc3RlYW0tZGVjYWRvIHN5c3RlbWRbMV06IEZpbmlzaGVk
IFNhdmUvUmVzdG9yZSBTb3VuZCBDYXJkIFN0YXRlLg0KYGBgDQpsb29raW5nIGF0IG15IGFsc2Eg
cGFja2FnZXMgdGhlc2UgYXJlIHRoZSB2ZXJzaW9ucyBpbnN0YWxsZWQ6IA0KDQpgYGANCmRwa2cg
LWwgfCBncmVwIGFsc2ENCmlpICBhbHNhLWJhc2UgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDEuMC4yNStkZnNnLTB1YnVudHU3ICAgICAgICAgICAgICAgICAgICBhbGwg
ICAgICAgICAgQUxTQSBkcml2ZXIgY29uZmlndXJhdGlvbiBmaWxlcw0KaWkgIGFsc2EtdG9wb2xv
Z3ktY29uZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMS4yLjUuMS0yICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFsbCAgICAgICAgICBBTFNBIHRvcG9sb2d5IGNvbmZpZ3Vy
YXRpb24gZmlsZXMNCmlpICBhbHNhLXVjbS1jb25mICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDEuMi42LjMtMXVidW50dTEuMTEgICAgICAgICAgICAgICAgICAgICBhbGwgICAg
ICAgICAgQUxTQSBVc2UgQ2FzZSBNYW5hZ2VyIGNvbmZpZ3VyYXRpb24gZmlsZXMNCmlpICBhbHNh
LXV0aWxzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEuMi42LTF1YnVu
dHUxICAgICAgICAgICAgICAgICAgICAgICAgICBhbWQ2NCAgICAgICAgVXRpbGl0aWVzIGZvciBj
b25maWd1cmluZyBhbmQgdXNpbmcgQUxTQQ0KaWkgIGdzdHJlYW1lcjEuMC1hbHNhOmFtZDY0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMS4yMC4xLTF1YnVudHUwLjEgICAgICAgICAgICAgICAg
ICAgICAgIGFtZDY0ICAgICAgICBHU3RyZWFtZXIgcGx1Z2luIGZvciBBTFNBDQppaSAgcGlwZXdp
cmUtYWxzYTphbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxLjAuMy0yfnVidW50
dTIyLjA0ICAgICAgICAgICAgICAgICAgICAgYW1kNjQgICAgICAgIFBpcGVXaXJlIEFMU0EgcGx1
Z2luDQppaSAgcGlwZXdpcmUtYXVkaW8tY2xpZW50LWxpYnJhcmllcyAgICAgICAgICAgICAgICAg
ICAxLjAuMy0yfnVidW50dTIyLjA0ICAgICAgICAgICAgICAgICAgICAgYWxsICAgICAgICAgIHRy
YW5zaXRpb25hbCBwYWNrYWdlIGZvciBwaXBld2lyZS1hbHNhIGFuZCBwaXBld2lyZS1qYWNrDQpg
YGANCkknbSBydW5uaW5nIFVidW50dSAyMi4wNC40IExUUyBvbiBTdGVhbSBEZWNrIGhhcmR3YXJl
IFZhbHZlIEp1cGl0ZXIgDQpBbnkgaWRlYXMgd2h5IGl0IHdvdWxkJ3Qgd29yaz8NCg0KVGhhbmtz
IGluIGFkdmFuY2VkLgoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXBy
b2plY3QvYWxzYS11Y20tY29uZi9pc3N1ZXMvNDAxClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dp
dGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYK
