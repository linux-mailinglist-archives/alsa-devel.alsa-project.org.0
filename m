Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99870CBC08A
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Dec 2025 22:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE2C60225;
	Sun, 14 Dec 2025 22:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE2C60225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765748694;
	bh=9TeUwyV5US+CVww/49egx1zWB7O3VR7oucRfT0qB/zY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bemdrxzfMDYiO+3VitMTrFW83USYAovBZF4oKhlgm9UsX/I/Gg2fNibbbRVUjEzFG
	 9R6Bzb93GOJ2PIq9SRJRQhcbNF8y7r9O+e1KNkTJL+1I891GfNP05hQLpG1fiqHVmy
	 pqig2SwEmTPTKH953eU1u0HS1y8HGDNJtDId75II=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF2B1F805DA; Sun, 14 Dec 2025 22:44:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACA0EF805C2;
	Sun, 14 Dec 2025 22:44:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3739FF800BA; Sun, 14 Dec 2025 22:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DAE5F800BA
	for <alsa-devel@alsa-project.org>; Sun, 14 Dec 2025 22:41:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DAE5F800BA
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <188132e91b179c00-webhooks-bot@alsa-project.org>
In-Reply-To: <188132e91a6c4700-webhooks-bot@alsa-project.org>
References: <188132e91a6c4700-webhooks-bot@alsa-project.org>
Subject: snd_lib_log_set_handler
Date: Sun, 14 Dec 2025 22:41:53 +0100 (CET)
Message-ID-Hash: JSA62HBMFYBAVIB4WF5XDMDY3AI76U7J
X-Message-ID-Hash: JSA62HBMFYBAVIB4WF5XDMDY3AI76U7J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSA62HBMFYBAVIB4WF5XDMDY3AI76U7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgaXNzdWUgIzMxNCB3YXMgb3BlbmVkIGZyb20gc2lkcmF0
OgoKRnVuY3Rpb24gc25kX2xpYl9sb2dfZmlsdGVyIGlzIHN0aWxsIHNob3dpbmcgdXAgYWZ0ZXIg
aXQgd2FzIHJlbW92ZWQgZnJvbSBhbHNhLWxpYiwKY2FuIHNvbWUgb25lIG1ha2UgYSBwYXRjaCB0
byByZXBsYWNlIHNuZF9saWJfbG9nX2ZpbHRlciB3aXRoIHNuZF9saWJfZXJyb3Jfc2V0X2hhbmRs
ZXIsIHRoYW5rIHlvdQoKYWxzYWN0bC9hbHNhY3RsLmMgCmFsc2FjdGwuYzogSW4gZnVuY3Rpb24g
4oCYbWFpbuKAmToKYWxzYWN0bC5jOjQ2NTo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24g4oCYc25kX2xpYl9sb2dfc2V0X2hhbmRsZXLigJk7IGRpZCB5b3UgbWVhbiDi
gJhzbmRfbGliX2Vycm9yX3NldF9oYW5kbGVy4oCZPyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KICA0NjUgfCAgICAgICAgIHNuZF9saWJfbG9nX3NldF9oYW5kbGVyKGxvZ19oYW5k
bGVyKTsKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgIHwgICAg
ICAgICBzbmRfbGliX2Vycm9yX3NldF9oYW5kbGVyCnV0aWxzLmM6IEluIGZ1bmN0aW9uIOKAmGxv
Z19oYW5kbGVy4oCZOgp1dGlscy5jOjIwMjoxNDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uIOKAmHNuZF9saWJfbG9nX2ZpbHRlcuKAmSBbLVdpbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbl0KICAyMDIgfCAgICAgICAgIGlmICghc25kX2xpYl9sb2dfZmlsdGVyKHBy
aW8sIGludGVyZmFjZSwgTlVMTCkpCiAgICAgIHwgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjYzODogYWxzYWN0bC1hbHNhY3RsLm9dIEVycm9y
IDEKbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KdXRpbHMuYzoy
MDU6MTc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhzbmRfbGli
X2xvZ19wcmlvcml0eeKAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAyMDUg
fCAgICAgICAgIHRleHQxID0gc25kX2xpYl9sb2dfcHJpb3JpdHkocHJpbyk7CiAgICAgIHwgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+CnV0aWxzLmM6MjA1OjE1OiBlcnJvcjog
YXNzaWdubWVudCB0byDigJhjb25zdCBjaGFyICrigJkgZnJvbSDigJhpbnTigJkgbWFrZXMgcG9p
bnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCiAgMjA1
IHwgICAgICAgICB0ZXh0MSA9IHNuZF9saWJfbG9nX3ByaW9yaXR5KHByaW8pOwogICAgICB8ICAg
ICAgICAgICAgICAgXgp1dGlscy5jOjIwNjoxNzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uIOKAmHNuZF9saWJfbG9nX2ludGVyZmFjZeKAmSBbLVdpbXBsaWNpdC1mdW5j
dGlvbi1kZWNsYXJhdGlvbl0KICAyMDYgfCAgICAgICAgIHRleHQyID0gc25kX2xpYl9sb2dfaW50
ZXJmYWNlKGludGVyZmFjZSk7CiAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fgp1dGlscy5jOjIwNjoxNTogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYY29uc3QgY2hh
ciAq4oCZIGZyb20g4oCYaW504oCZIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQg
YSBjYXN0IFstV2ludC1jb252ZXJzaW9uXQogIDIwNiB8ICAgICAgICAgdGV4dDIgPSBzbmRfbGli
X2xvZ19pbnRlcmZhY2UoaW50ZXJmYWNlKTsKCklzc3VlIFVSTCAgICAgOiBodHRwczovL2dpdGh1
Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMvaXNzdWVzLzMxNApSZXBvc2l0b3J5IFVSTDog
aHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzCg==
