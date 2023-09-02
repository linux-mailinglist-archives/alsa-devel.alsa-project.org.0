Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2072D7909CA
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 23:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34837209;
	Sat,  2 Sep 2023 23:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34837209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693690091;
	bh=waQGmn+fBG8J654gFvQvCtZe5qK9USQAuR6Vh9rwUfw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bMfJ0gbJ89fhlboQcC6pkhtVhIYZstjPAMkJP6hjf4vhk3lYSkLEoW4UDpWw1vTQ+
	 tNyTDVdUU7VZsIqo11VIwiwq3dmt6sQxPxn05mbFPONQwkPiQ4KiB5A+kRe27mhqWk
	 dh3tfy23NuiLsFM3Q9EwbCJdjz9ffjSlUCAZkLXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E3BFF80537; Sat,  2 Sep 2023 23:26:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F14E2F8025F;
	Sat,  2 Sep 2023 23:26:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B25F8032D; Sat,  2 Sep 2023 23:26:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URI_HEX shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 276EBF800F5
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 23:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 276EBF800F5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693690007208548069-webhooks-bot@alsa-project.org>
References: <1693690007208548069-webhooks-bot@alsa-project.org>
Subject: 1.2.10: control.h missing definitions for snd_ump_endpoint_info_t and
 snd_ump_block_info_t
Message-Id: <20230902212651.E8B25F8032D@alsa1.perex.cz>
Date: Sat,  2 Sep 2023 23:26:51 +0200 (CEST)
Message-ID-Hash: OP2WNRYJC23LNV3BKWVSPCGDDOLZ6M2J
X-Message-ID-Hash: OP2WNRYJC23LNV3BKWVSPCGDDOLZ6M2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OP2WNRYJC23LNV3BKWVSPCGDDOLZ6M2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtbGliIGlzc3VlICMzNDggd2FzIG9wZW5lZCBmcm9tIGFqYWtrOgoK
V2hlbiBjb25maWd1cmVkIHdpdGggcmF3IE1JREkgc3VwcG9ydCwgYGNvbnRyb2wuaGAgZGVjbGFy
ZXM6DQoNCmBgYA0KaW50IHNuZF9jdGxfdW1wX2VuZHBvaW50X2luZm8oc25kX2N0bF90ICpjdGws
IHNuZF91bXBfZW5kcG9pbnRfaW5mb190ICppbmZvKTsNCmludCBzbmRfY3RsX3VtcF9ibG9ja19p
bmZvKHNuZF9jdGxfdCAqY3RsLCBzbmRfdW1wX2Jsb2NrX2luZm9fdCAqaW5mbyk7DQpgYGANCg0K
SG93ZXZlciwgaXQgZG9lc24ndCBzZWVtIHRoYXQgdGhlIGBzbmRfdW1wKmAgdHlwZXMgYXJlIGRl
ZmluZWQgaGVyZSwgYW5kIHRoaXMgcmVzdWx0cyBpbiBidWlsZCBmYWlsdXJlcyBpbiBhcHBsaWNh
dGlvbnMgY29tcGlsaW5nIGFnYWluc3QgYWxzYS1saWItMS4yLjEwLiBbRm9yIGV4YW1wbGVdKGh0
dHBzOi8vYnVncy5nZW50b28ub3JnLzkxMzUyMSkgKFtidWlsZCBsb2ddKGh0dHBzOi8vOTEzNTIx
LmJ1Z3MuZ2VudG9vLm9yZy9hdHRhY2htZW50LmNnaT9pZD04NjkyNDUpKToNCg0KYGBgDQpbNzcv
OTBdIC91c3IvYmluL3g4Nl82NC1wYy1saW51eC1nbnUtZysrICAtSS92YXIvdG1wL3BvcnRhZ2Uv
eDExLW1pc2MvcG9seWJhci0zLjYuMy1yMy93b3JrL3BvbHliYXItMy42LjMvaW5jbHVkZSAtSS92
YXIvdG1wL3BvcnRhZ2UveDExLW1pc2MvcG9seWJhci0zLjYuMy1yMy93b3JrL3BvbHliYXItMy42
LjNfYnVpbGQvZ2VuZXJhdGVkLXNvdXJjZXMgLWlzeXN0ZW0gL3Vzci9pbmNsdWRlL2NhaXJvIC1p
c3lzdGVtIC91c3IvaW5jbHVkZS9saWJwbmcxNiAtaXN5c3RlbSAvdXNyL2luY2x1ZGUvZnJlZXR5
cGUyIC1pc3lzdGVtIC91c3IvaW5jbHVkZS9waXhtYW4tMSAtaXN5c3RlbSAvdmFyL3RtcC9wb3J0
YWdlL3gxMS1taXNjL3BvbHliYXItMy42LjMtcjMvd29yay9wb2x5YmFyLTMuNi4zL2xpYi94cHAv
aW5jbHVkZSAtaXN5c3RlbSAvdmFyL3RtcC9wb3J0YWdlL3gxMS1taXNjL3BvbHliYXItMy42LjMt
cjMvd29yay9wb2x5YmFyLTMuNi4zX2J1aWxkL2xpYi94cHAvZ2VuZXJhdGVkLXNvdXJjZXMvaW5j
bHVkZSAgLU8yIC1waXBlIC1tYXJjaD1uYXRpdmUgLWZuby1kaWFnbm9zdGljcy1jb2xvciAtc3Rk
PWMrKzE0IC1mbm8tZGlhZ25vc3RpY3MtY29sb3IgLVdhbGwgLVdleHRyYSAtV3BlZGFudGljIC1X
c3VnZ2VzdC1vdmVycmlkZSAtTUQgLU1UIGJpbi9DTWFrZUZpbGVzL3BvbHkuZGlyL2FkYXB0ZXJz
L2Fsc2EvY29udHJvbC5jcHAubyAtTUYgYmluL0NNYWtlRmlsZXMvcG9seS5kaXIvYWRhcHRlcnMv
YWxzYS9jb250cm9sLmNwcC5vLmQgLW8gYmluL0NNYWtlRmlsZXMvcG9seS5kaXIvYWRhcHRlcnMv
YWxzYS9jb250cm9sLmNwcC5vIC1jIC92YXIvdG1wL3BvcnRhZ2UveDExLW1pc2MvcG9seWJhci0z
LjYuMy1yMy93b3JrL3BvbHliYXItMy42LjMvc3JjL2FkYXB0ZXJzL2Fsc2EvY29udHJvbC5jcHAN
CkZBSUxFRDogYmluL0NNYWtlRmlsZXMvcG9seS5kaXIvYWRhcHRlcnMvYWxzYS9jb250cm9sLmNw
cC5vIA0KL3Vzci9iaW4veDg2XzY0LXBjLWxpbnV4LWdudS1nKysgIC1JL3Zhci90bXAvcG9ydGFn
ZS94MTEtbWlzYy9wb2x5YmFyLTMuNi4zLXIzL3dvcmsvcG9seWJhci0zLjYuMy9pbmNsdWRlIC1J
L3Zhci90bXAvcG9ydGFnZS94MTEtbWlzYy9wb2x5YmFyLTMuNi4zLXIzL3dvcmsvcG9seWJhci0z
LjYuM19idWlsZC9nZW5lcmF0ZWQtc291cmNlcyAtaXN5c3RlbSAvdXNyL2luY2x1ZGUvY2Fpcm8g
LWlzeXN0ZW0gL3Vzci9pbmNsdWRlL2xpYnBuZzE2IC1pc3lzdGVtIC91c3IvaW5jbHVkZS9mcmVl
dHlwZTIgLWlzeXN0ZW0gL3Vzci9pbmNsdWRlL3BpeG1hbi0xIC1pc3lzdGVtIC92YXIvdG1wL3Bv
cnRhZ2UveDExLW1pc2MvcG9seWJhci0zLjYuMy1yMy93b3JrL3BvbHliYXItMy42LjMvbGliL3hw
cC9pbmNsdWRlIC1pc3lzdGVtIC92YXIvdG1wL3BvcnRhZ2UveDExLW1pc2MvcG9seWJhci0zLjYu
My1yMy93b3JrL3BvbHliYXItMy42LjNfYnVpbGQvbGliL3hwcC9nZW5lcmF0ZWQtc291cmNlcy9p
bmNsdWRlICAtTzIgLXBpcGUgLW1hcmNoPW5hdGl2ZSAtZm5vLWRpYWdub3N0aWNzLWNvbG9yIC1z
dGQ9YysrMTQgLWZuby1kaWFnbm9zdGljcy1jb2xvciAtV2FsbCAtV2V4dHJhIC1XcGVkYW50aWMg
LVdzdWdnZXN0LW92ZXJyaWRlIC1NRCAtTVQgYmluL0NNYWtlRmlsZXMvcG9seS5kaXIvYWRhcHRl
cnMvYWxzYS9jb250cm9sLmNwcC5vIC1NRiBiaW4vQ01ha2VGaWxlcy9wb2x5LmRpci9hZGFwdGVy
cy9hbHNhL2NvbnRyb2wuY3BwLm8uZCAtbyBiaW4vQ01ha2VGaWxlcy9wb2x5LmRpci9hZGFwdGVy
cy9hbHNhL2NvbnRyb2wuY3BwLm8gLWMgL3Zhci90bXAvcG9ydGFnZS94MTEtbWlzYy9wb2x5YmFy
LTMuNi4zLXIzL3dvcmsvcG9seWJhci0zLjYuMy9zcmMvYWRhcHRlcnMvYWxzYS9jb250cm9sLmNw
cA0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC92YXIvdG1wL3BvcnRhZ2UveDExLW1pc2MvcG9seWJh
ci0zLjYuMy1yMy93b3JrL3BvbHliYXItMy42LjMvaW5jbHVkZS9hZGFwdGVycy9hbHNhL2dlbmVy
aWMuaHBwOjM3LA0KICAgICAgICAgICAgICAgICBmcm9tIC92YXIvdG1wL3BvcnRhZ2UveDExLW1p
c2MvcG9seWJhci0zLjYuMy1yMy93b3JrL3BvbHliYXItMy42LjMvc3JjL2FkYXB0ZXJzL2Fsc2Ev
Y29udHJvbC5jcHA6MjoNCi91c3IvaW5jbHVkZS9hbHNhL2NvbnRyb2wuaDo0MTc6NDc6IGVycm9y
OiDigJhzbmRfdW1wX2VuZHBvaW50X2luZm9fdOKAmSBoYXMgbm90IGJlZW4gZGVjbGFyZWQNCiAg
NDE3IHwgaW50IHNuZF9jdGxfdW1wX2VuZHBvaW50X2luZm8oc25kX2N0bF90ICpjdGwsIHNuZF91
bXBfZW5kcG9pbnRfaW5mb190ICppbmZvKTsNCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQovdXNyL2lu
Y2x1ZGUvYWxzYS9jb250cm9sLmg6NDE4OjQ0OiBlcnJvcjog4oCYc25kX3VtcF9ibG9ja19pbmZv
X3TigJkgaGFzIG5vdCBiZWVuIGRlY2xhcmVkDQogIDQxOCB8IGludCBzbmRfY3RsX3VtcF9ibG9j
a19pbmZvKHNuZF9jdGxfdCAqY3RsLCBzbmRfdW1wX2Jsb2NrX2luZm9fdCAqaW5mbyk7DQogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fg0KYGBgCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2Et
cHJvamVjdC9hbHNhLWxpYi9pc3N1ZXMvMzQ4ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1
Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtbGliCg==
