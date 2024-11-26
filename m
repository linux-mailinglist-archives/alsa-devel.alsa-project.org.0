Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5A9D96F4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 13:04:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F27F21933;
	Tue, 26 Nov 2024 13:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F27F21933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732622699;
	bh=SPuEUmJUT/F5tsj3wMbGlz+EKLrt/vIK2JMw6EX/vsA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HCQ+ZlX98tlfO+ub7xgaYupLrptg0uqPQxhFb2TrJTaFQbvL1YwxmBQ3dkkZPDKHK
	 3ZuV5XJGrZ34zlPmXafcYp9iHfWCnCMzGGB9UmwYl2DG6tRB/j5Bydd7xDikVNoS3j
	 pzdp0o4xe96uy1dXUwybjsqvZqUFUPYBU01lcSq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EED79F805C6; Tue, 26 Nov 2024 13:04:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D149F80073;
	Tue, 26 Nov 2024 13:04:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA84AF80496; Tue, 26 Nov 2024 13:04:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 04039F800F0
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 13:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04039F800F0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732622662522567749-webhooks-bot@alsa-project.org>
References: <1732622662522567749-webhooks-bot@alsa-project.org>
Subject: Build failures with GCC 15 (-std=gnu23)
Message-Id: <20241126120424.BA84AF80496@alsa1.perex.cz>
Date: Tue, 26 Nov 2024 13:04:24 +0100 (CET)
Message-ID-Hash: DRWRSX3JG6ZDRJMFDNV63HYYMO3N3OTE
X-Message-ID-Hash: DRWRSX3JG6ZDRJMFDNV63HYYMO3N3OTE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRWRSX3JG6ZDRJMFDNV63HYYMO3N3OTE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdG9vbHMgaXNzdWUgIzI1IHdhcyBvcGVuZWQgZnJvbSBrb3N0YWRp
bnNoOgoKU29tZSBvZiB0aGUgcHJvZ3JhbXMgaW4gYWxzYS10b29scyBmYWlsIHRvIGJ1aWxkIHdp
dGggdXBjb21pbmcgR0NDIDE1IHdoaWNoIHVzZXMgYC1zdGQ9Z251MjNgIGJ5IGRlZmF1bHQuIFRo
aXMgY2FuIGJlIHJlcHJvZHVjZWQgb24gb2xkZXIgR0NDIGFuZCBDbGFuZyB2ZXJzaW9ucyBieSBh
ZGRpbmcgYC1zdGQ9Z251MjNgIHRvIENGTEFHUy4NCg0KRG93bnN0cmVhbSBHZW50b28gYnVnIHJl
cG9ydDogaHR0cHM6Ly9idWdzLmdlbnRvby5vcmcvOTQzOTQ2DQoNCg0KaGRhamFja3JldGFzazoN
CmBgYA0KbWFpbi1ndGsuYzogSW4gZnVuY3Rpb24g4oCYcmVzZXRfYm9vdF9jbGlja2Vk4oCZOg0K
bWFpbi1ndGsuYzozNzU6NTogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDi
gJhyZXNldF9jaGFuZ2VzX2Jvb3TigJkNCiAgMzc1IHwgICAgIHJlc2V0X2NoYW5nZXNfYm9vdCgm
ZXJyKTsNCiAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIG1haW4tZ3RrLmM6MTE6DQphcHBseS1jaGFuZ2VzLmg6MTI6MTA6IG5vdGU6IGRlY2xhcmVk
IGhlcmUNCiAgIDEyIHwgZ2Jvb2xlYW4gcmVzZXRfY2hhbmdlc19ib290KCk7DQogICAgICB8ICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KYGBgDQoNCmVudnkyNGNvbnRyb2w6DQpgYGANCm5l
d19wcm9jZXNzLmM6IEluIGZ1bmN0aW9uIOKAmG5ld19wcm9jZXNz4oCZOg0KbmV3X3Byb2Nlc3Mu
Yzo2NzoxODogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYdm9pZCAoKikodm9pZCnigJkgZnJvbSBp
bmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIOKAmF9fc2lnaGFuZGxlcl904oCZIHtha2Eg4oCYdm9p
ZCAoKikoaW50KeKAmX0gWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdDQogICA2NyB8ICAg
ICAgICAgaW50X3N0YXQgPSBzaWduYWwoU0lHSU5ULCBTSUdfSUdOKTsNCiAgICAgIHwgICAgICAg
ICAgICAgICAgICBeDQpuZXdfcHJvY2Vzcy5jOjY4OjE5OiBlcnJvcjogYXNzaWdubWVudCB0byDi
gJh2b2lkICgqKSh2b2lkKeKAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg4oCYX19z
aWdoYW5kbGVyX3TigJkge2FrYSDigJh2b2lkICgqKShpbnQp4oCZfSBbLVdpbmNvbXBhdGlibGUt
cG9pbnRlci10eXBlc10NCiAgIDY4IHwgICAgICAgICBxdWl0X3N0YXQgPSBzaWduYWwoU0lHUVVJ
VCwgU0lHX0lHTik7DQogICAgICB8ICAgICAgICAgICAgICAgICAgIF4NCm5ld19wcm9jZXNzLmM6
Njk6MTk6IGVycm9yOiBhc3NpZ25tZW50IHRvIOKAmHZvaWQgKCopKHZvaWQp4oCZIGZyb20gaW5j
b21wYXRpYmxlIHBvaW50ZXIgdHlwZSDigJhfX3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQg
KCopKGludCnigJl9IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0KICAgNjkgfCAgICAg
ICAgIHVzcjJfc3RhdCA9IHNpZ25hbChTSUdVU1IyLCBTSUdfSUdOKTsNCiAgICAgIHwgICAgICAg
ICAgICAgICAgICAgXg0KbmV3X3Byb2Nlc3MuYzo4MToyNDogZXJyb3I6IHBhc3NpbmcgYXJndW1l
bnQgMiBvZiDigJhzaWduYWzigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2lu
Y29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0KICAgODEgfCAgICAgICAgIHNpZ25hbChTSUdJTlQs
IGludF9zdGF0KTsNCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fg0KICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHwNCiAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICB2b2lkICgqKSh2b2lkKQ0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGVudnkyNGNvbnRyb2wu
aDo0Og0KL3Vzci9pbmNsdWRlL3NpZ25hbC5oOjg4OjU3OiBub3RlOiBleHBlY3RlZCDigJhfX3Np
Z2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQgKCopKGludCnigJl9IGJ1dCBhcmd1bWVudCBpcyBv
ZiB0eXBlIOKAmHZvaWQgKCopKHZvaWQp4oCZDQogICA4OCB8IGV4dGVybiBfX3NpZ2hhbmRsZXJf
dCBzaWduYWwgKGludCBfX3NpZywgX19zaWdoYW5kbGVyX3QgX19oYW5kbGVyKQ0KICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fl5+
fn5+fn5+fg0KbmV3X3Byb2Nlc3MuYzo4MjoyNTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBv
ZiDigJhzaWduYWzigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0
aWJsZS1wb2ludGVyLXR5cGVzXQ0KICAgODIgfCAgICAgICAgIHNpZ25hbChTSUdRVUlULCBxdWl0
X3N0YXQpOw0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4NCiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgfA0KICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICB2b2lkICgqKSh2b2lkKQ0KL3Vzci9pbmNsdWRlL3NpZ25hbC5oOjg4OjU3OiBub3RlOiBl
eHBlY3RlZCDigJhfX3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQgKCopKGludCnigJl9IGJ1
dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmHZvaWQgKCopKHZvaWQp4oCZDQogICA4OCB8IGV4dGVy
biBfX3NpZ2hhbmRsZXJfdCBzaWduYWwgKGludCBfX3NpZywgX19zaWdoYW5kbGVyX3QgX19oYW5k
bGVyKQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+
fn5+fn5+fn5+fn5+fl5+fn5+fn5+fg0KbmV3X3Byb2Nlc3MuYzo4MzoyNTogZXJyb3I6IHBhc3Np
bmcgYXJndW1lbnQgMiBvZiDigJhzaWduYWzigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0
eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0KICAgODMgfCAgICAgICAgIHNpZ25h
bChTSUdVU1IyLCB1c3IyX3N0YXQpOw0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn4NCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgfA0KICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICgqKSh2b2lkKQ0KL3Vzci9pbmNsdWRlL3NpZ25hbC5o
Ojg4OjU3OiBub3RlOiBleHBlY3RlZCDigJhfX3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQg
KCopKGludCnigJl9IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmHZvaWQgKCopKHZvaWQp4oCZ
DQogICA4OCB8IGV4dGVybiBfX3NpZ2hhbmRsZXJfdCBzaWduYWwgKGludCBfX3NpZywgX19zaWdo
YW5kbGVyX3QgX19oYW5kbGVyKQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fg0KYGBgCgpJc3N1ZSBVUkwgICAg
IDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXRvb2xzL2lzc3Vlcy8yNQpS
ZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXRvb2xz
Cg==
