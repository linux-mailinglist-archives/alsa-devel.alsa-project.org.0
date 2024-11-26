Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF189D96F9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 13:07:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2DC5210F;
	Tue, 26 Nov 2024 13:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2DC5210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732622825;
	bh=tP6MIBBogle4SBC6BPnYovLfN26AomAcz3iNGdmK0e8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WdjOMjbne1N6+6NicYVgaJBahx1+sMwHmLn5uNlsehtwLlG/AZgtxlTBZrtWoH0wP
	 GFsyc32nb7MQgCB8LF1Jl/ctE45FTYGFJ5zZLn60143GDI59Gw2FeoqoNkIYCKp2ga
	 Y5DXHBjiYDygUKuEGusv6zCRY4TZFigFL9uM6zs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D4C7F805C7; Tue, 26 Nov 2024 13:06:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB0CF805B1;
	Tue, 26 Nov 2024 13:06:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A49D5F80496; Tue, 26 Nov 2024 13:06:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id F2F90F800F0
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 13:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F90F800F0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732622789387276649-webhooks-bot@alsa-project.org>
References: <1732622789387276649-webhooks-bot@alsa-project.org>
Subject: Build failures with GCC 15 (-std=gnu23)
Message-Id: <20241126120631.A49D5F80496@alsa1.perex.cz>
Date: Tue, 26 Nov 2024 13:06:31 +0100 (CET)
Message-ID-Hash: NBODVBNYFJUSCTKVVSDLANWTIM77E6QA
X-Message-ID-Hash: NBODVBNYFJUSCTKVVSDLANWTIM77E6QA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBODVBNYFJUSCTKVVSDLANWTIM77E6QA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdG9vbHMgaXNzdWUgIzI1IHdhcyBlZGl0ZWQgZnJvbSBrb3N0YWRp
bnNoOgoKU29tZSBvZiB0aGUgcHJvZ3JhbXMgaW4gYWxzYS10b29scyBmYWlsIHRvIGJ1aWxkIHdp
dGggdXBjb21pbmcgR0NDIDE1IHdoaWNoIHVzZXMgYC1zdGQ9Z251MjNgIGJ5IGRlZmF1bHQuIFRo
aXMgY2FuIGJlIHJlcHJvZHVjZWQgb24gb2xkZXIgR0NDIGFuZCBDbGFuZyB2ZXJzaW9ucyBieSBh
ZGRpbmcgYC1zdGQ9Z251MjNgIHRvIENGTEFHUy4NCg0KRG93bnN0cmVhbSBHZW50b28gYnVnIHJl
cG9ydDogaHR0cHM6Ly9idWdzLmdlbnRvby5vcmcvOTQzOTQ2DQoNCg0KaGRhamFja3JldGFzazoN
CmBgYA0KYXBwbHktY2hhbmdlcy5jOjM1ODoxMDogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZv
ciDigJhyZXNldF9jaGFuZ2VzX2Jvb3TigJk7IGhhdmUg4oCYZ2Jvb2xlYW4oR0Vycm9yICoqKeKA
mSB7YWthIOKAmGludChzdHJ1Y3QgX0dFcnJvciAqKinigJl9DQogIDM1OCB8IGdib29sZWFuIHJl
c2V0X2NoYW5nZXNfYm9vdChHRXJyb3IqKiBlcnIpDQogICAgICB8ICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFwcGx5LWNoYW5nZXMuYzoxMjoNCmFw
cGx5LWNoYW5nZXMuaDoxMjoxMDogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYcmVz
ZXRfY2hhbmdlc19ib2904oCZIHdpdGggdHlwZSDigJhnYm9vbGVhbih2b2lkKeKAmSB7YWthIOKA
mGludCh2b2lkKeKAmX0NCiAgIDEyIHwgZ2Jvb2xlYW4gcmVzZXRfY2hhbmdlc19ib290KCk7DQog
ICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KbWFpbi1ndGsuYzogSW4gZnVuY3Rp
b24g4oCYcmVzZXRfYm9vdF9jbGlja2Vk4oCZOg0KbWFpbi1ndGsuYzozNzU6NTogZXJyb3I6IHRv
byBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhyZXNldF9jaGFuZ2VzX2Jvb3TigJkNCiAg
Mzc1IHwgICAgIHJlc2V0X2NoYW5nZXNfYm9vdCgmZXJyKTsNCiAgICAgIHwgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIG1haW4tZ3RrLmM6MTE6DQphcHBseS1j
aGFuZ2VzLmg6MTI6MTA6IG5vdGU6IGRlY2xhcmVkIGhlcmUNCiAgIDEyIHwgZ2Jvb2xlYW4gcmVz
ZXRfY2hhbmdlc19ib290KCk7DQogICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0K
YGBgDQoNCmVudnkyNGNvbnRyb2w6DQpgYGANCm5ld19wcm9jZXNzLmM6IEluIGZ1bmN0aW9uIOKA
mG5ld19wcm9jZXNz4oCZOg0KbmV3X3Byb2Nlc3MuYzo2NzoxODogZXJyb3I6IGFzc2lnbm1lbnQg
dG8g4oCYdm9pZCAoKikodm9pZCnigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIOKA
mF9fc2lnaGFuZGxlcl904oCZIHtha2Eg4oCYdm9pZCAoKikoaW50KeKAmX0gWy1XaW5jb21wYXRp
YmxlLXBvaW50ZXItdHlwZXNdDQogICA2NyB8ICAgICAgICAgaW50X3N0YXQgPSBzaWduYWwoU0lH
SU5ULCBTSUdfSUdOKTsNCiAgICAgIHwgICAgICAgICAgICAgICAgICBeDQpuZXdfcHJvY2Vzcy5j
OjY4OjE5OiBlcnJvcjogYXNzaWdubWVudCB0byDigJh2b2lkICgqKSh2b2lkKeKAmSBmcm9tIGlu
Y29tcGF0aWJsZSBwb2ludGVyIHR5cGUg4oCYX19zaWdoYW5kbGVyX3TigJkge2FrYSDigJh2b2lk
ICgqKShpbnQp4oCZfSBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10NCiAgIDY4IHwgICAg
ICAgICBxdWl0X3N0YXQgPSBzaWduYWwoU0lHUVVJVCwgU0lHX0lHTik7DQogICAgICB8ICAgICAg
ICAgICAgICAgICAgIF4NCm5ld19wcm9jZXNzLmM6Njk6MTk6IGVycm9yOiBhc3NpZ25tZW50IHRv
IOKAmHZvaWQgKCopKHZvaWQp4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSDigJhf
X3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQgKCopKGludCnigJl9IFstV2luY29tcGF0aWJs
ZS1wb2ludGVyLXR5cGVzXQ0KICAgNjkgfCAgICAgICAgIHVzcjJfc3RhdCA9IHNpZ25hbChTSUdV
U1IyLCBTSUdfSUdOKTsNCiAgICAgIHwgICAgICAgICAgICAgICAgICAgXg0KbmV3X3Byb2Nlc3Mu
Yzo4MToyNDogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiDigJhzaWduYWzigJkgZnJvbSBp
bmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0K
ICAgODEgfCAgICAgICAgIHNpZ25hbChTSUdJTlQsIGludF9zdGF0KTsNCiAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fg0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
IHwNCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICgqKSh2b2lkKQ0KSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGVudnkyNGNvbnRyb2wuaDo0Og0KL3Vzci9pbmNsdWRlL3NpZ25hbC5o
Ojg4OjU3OiBub3RlOiBleHBlY3RlZCDigJhfX3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQg
KCopKGludCnigJl9IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmHZvaWQgKCopKHZvaWQp4oCZ
DQogICA4OCB8IGV4dGVybiBfX3NpZ2hhbmRsZXJfdCBzaWduYWwgKGludCBfX3NpZywgX19zaWdo
YW5kbGVyX3QgX19oYW5kbGVyKQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fg0KbmV3X3Byb2Nlc3MuYzo4Mjoy
NTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiDigJhzaWduYWzigJkgZnJvbSBpbmNvbXBh
dGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0KICAgODIg
fCAgICAgICAgIHNpZ25hbChTSUdRVUlULCBxdWl0X3N0YXQpOw0KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn4NCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
fA0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICgqKSh2b2lkKQ0KL3Vzci9p
bmNsdWRlL3NpZ25hbC5oOjg4OjU3OiBub3RlOiBleHBlY3RlZCDigJhfX3NpZ2hhbmRsZXJfdOKA
mSB7YWthIOKAmHZvaWQgKCopKGludCnigJl9IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmHZv
aWQgKCopKHZvaWQp4oCZDQogICA4OCB8IGV4dGVybiBfX3NpZ2hhbmRsZXJfdCBzaWduYWwgKGlu
dCBfX3NpZywgX19zaWdoYW5kbGVyX3QgX19oYW5kbGVyKQ0KICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fg0KbmV3
X3Byb2Nlc3MuYzo4MzoyNTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiDigJhzaWduYWzi
gJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVy
LXR5cGVzXQ0KICAgODMgfCAgICAgICAgIHNpZ25hbChTSUdVU1IyLCB1c3IyX3N0YXQpOw0KICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4NCiAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgfA0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICgq
KSh2b2lkKQ0KL3Vzci9pbmNsdWRlL3NpZ25hbC5oOjg4OjU3OiBub3RlOiBleHBlY3RlZCDigJhf
X3NpZ2hhbmRsZXJfdOKAmSB7YWthIOKAmHZvaWQgKCopKGludCnigJl9IGJ1dCBhcmd1bWVudCBp
cyBvZiB0eXBlIOKAmHZvaWQgKCopKHZvaWQp4oCZDQogICA4OCB8IGV4dGVybiBfX3NpZ2hhbmRs
ZXJfdCBzaWduYWwgKGludCBfX3NpZywgX19zaWdoYW5kbGVyX3QgX19oYW5kbGVyKQ0KICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+
fl5+fn5+fn5+fg0KYGBgCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2Et
cHJvamVjdC9hbHNhLXRvb2xzL2lzc3Vlcy8yNQpSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRo
dWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXRvb2xzCg==
