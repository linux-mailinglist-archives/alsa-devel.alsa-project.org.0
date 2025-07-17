Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9097AB08FA7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jul 2025 16:38:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 334BB601EC;
	Thu, 17 Jul 2025 16:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 334BB601EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752763132;
	bh=b8LqU2RYzTXfbShhzjcijyYq94bb+NhoDzFyqLstqXs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Izj8WgFlM/UNE4Oq2r17184iTqhPF5yyU9wfe48PuXRYL8XhJha24osciEOH/AER2
	 uLe/Fx+wvQ6UEWG63OnVXjEIhDUJqh8cgJYzaGqzudp9Y3SvTQPrWU25yPHDOgZyFn
	 gAnzl/GmJ+QLDaz3/Dg1ZitiDvfyN4GRQ2ulIlxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CD7BF805B5; Thu, 17 Jul 2025 16:38:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C0CF805C3;
	Thu, 17 Jul 2025 16:38:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C6D4F80217; Thu, 17 Jul 2025 16:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 42313F80100
	for <alsa-devel@alsa-project.org>; Thu, 17 Jul 2025 16:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42313F80100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185310bfbe7d7e00-webhooks-bot@alsa-project.org>
In-Reply-To: <185310bfbdf53900-webhooks-bot@alsa-project.org>
References: <185310bfbdf53900-webhooks-bot@alsa-project.org>
Subject: speaker-test 1.2.13 dose not produce 20kHz sine wav
Date: Thu, 17 Jul 2025 16:38:20 +0200 (CEST)
Message-ID-Hash: TGBS532P3WFI45UNLVIAVY4PASNHSST6
X-Message-ID-Hash: TGBS532P3WFI45UNLVIAVY4PASNHSST6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGBS532P3WFI45UNLVIAVY4PASNHSST6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgaXNzdWUgIzMwNCB3YXMgb3BlbmVkIGZyb20gZ2hhcmln
OgoKSGVsbG8gQWxzYS1EZXYsCiAKSSBob3BlIHRoYXQgSeKAmW0gd3JpdGluZyB0byB0aGUgcHJv
cGVyIHBsYWNlIHRvIHJlcG9ydCBhIHByb2JsZW0sIHBsZWFzZSBhZHZpc2UgaWYgbm904oCmCiAK
SeKAmW0gbm90IGFibGUgdG8gcHJvZHVjZSAyMGtIeiBzaW5lIHdhdiB3aXRoIHNwZWFrZXItdGVz
dCAxLjIuMTMgUnVubmluZyBvbiBUaW55Y29yZSAxNi4wIC4gICAKIApCZWxvdyBpcyB3aGF0IEkg
c3VibWl0dGVkIHRvIFRpbnljb3JlIFRlYW0sIGFuZCB0aGV5IHN1Z2dlc3RlZCB0aGF0IEkgY29u
dGFjdCB5b3Ugd2l0aCBteSBmaW5kaW5ncy4KIApUaGUgaGFyZHdhcmUgSeKAmW0gdXNpbmcgaXMg
V2luc3lzdGVtcyAgCkUzODI1IGR1YWwtY29yZSwgMS4zM0dIegpTQVRBIDIuMCBjaGFubmVsIG1T
QVRBIHNvY2tldCAoc2hhcmVkIHdpdGggbWluaVBDSWUpCjIgR0Igb2YgU29sZGVyZWQgRG93biBE
RFIzCiBbaHR0cHM6Ly93aW5zeXN0ZW1zLmNvbS9wcm9kdWN0L3BwbS1jNDA3L10odXJsKQoKVGlu
eWNvcmUgVGVhbTsKIApNeSBwcm9ibGVtIHRvZGF5IGlzIHRoYXQgc3BlYWtlci10ZXN0IGRvZXMg
bm90IHByb2R1Y2UgYSAyMGtIeiBzaW5lIHdhdmUgb24gVGlueWNvcmUgMTYuMCB0byB0aGUgbGlu
ZSBvdXQuICBzcGVha2VyLXRlc3QgZG9lcyBwcm9kdWNlIHNvbWV0aGluZyBqdXN0IG5vdCBhIDIw
a0h6IHNpbmUgd2F2ZS4KIApDb2RlOgpgICAgICBzcGVha2VyLXRlc3QgLXQgc2luZSAtZiAyMDAw
MCAtWCAtbCAwYAogCkhvd2V2ZXIsIHVzaW5nIHRoZSBleGFjdCBzYW1lIGhhcmR3YXJlIHJ1bm5p
bmcgVWJ1bnR1IDIwLjI0IG9yIDIyLjA0IHRoZSBmb2xsb3dpbmcgY29kZSB3b3JrcyBhbmQgYSAy
MGtIeiBzaW5lIHdhdmUgaXMgcHJvZHVjZWQuClRoZSBkaWZmZXJlbmNlIGJlaW5nIHRoYXQgdGhl
IGFsc2EgdmVyc2lvbnMgYXJlIGRpZmZlcmVudCBiZXR3ZWVuIHRoZSAzIE9wZXJhdGluZyBTeXN0
ZW1zLgogClRpbnljb3JlIDE2LjAgQWxzYSB2ZXJzaW9uIGlzIDEuMi4xMyAtIGZhaWx1cmUKVWJ1
bnR1IDIwLjA0IEFsc2EgdmVyc2lvbiBpcyAxLjIuMiAgLSBzdWNjZXNzClVidW50dSAyMi4wNCBB
bHNhIHZlcnNpb24gaXMgMS4yLjYgLSBzdWNjZXNzCiAKIApUaHJvdWdoIG15IHRlc3RpbmcsIHN0
YXJ0aW5nIGF0IDgwMDAgSHosIGFuZCBpbmNyZW1lbnRpbmcgYnkgMTAwMCBIeiwgc3BlYWtlci10
ZXN0IGRvZXMgcHJvZHVjZSBhIHNpbmUgd2F2ZSwgdW50aWwgSSB3ZW50IG92ZXIgMTUwMDAgSHog
dGhlbiBubyBtb3JlIHNpbmUgd2F2ZS4gIDopCjopCkNvZGU6CmBgYAogICAgIHNwZWFrZXItdGVz
dCAtdCBzaW5lIC1mIDgwMDAgLVggLWwgMAogICAgIHNwZWFrZXItdGVzdCAtdCBzaW5lIC1mIDE1
MDAwIC1YIC1sIDAKYGBgCiAKOigKQ29kZTogCmAgICAgc3BlYWtlci10ZXN0IC10IHNpbmUgLWYg
MTYwMDAgLVggLWwgMGAKIAogClRoZSB3b3JrIGFyb3VuZCBmb3IgdGhlIHRpbWUgYmVpbmcgaXMg
dG8gY29uZmlndXJlIHNwZWFrZXItdGVzdCAgdG8gcGxheSBhIDIwa0h6IHdhdiBmaWxlLCAgdGhp
cyBkb3NlIHdvcmsgYW5kIHByb2R1Y2VzIGEgYmVhdXRpZnVsIHNpbmUgd2F2IDopCiAKQ29kZTog
CmAgICAgc3BlYWtlci10ZXN0IC10IHdhdiAtZiAvb3B0LzIwa0h6LndhdiAtbCAwYAogCk5vdyBm
b3IgdGhlIHBlb3BsZSB3aG8gd2lsbCBzYXkgd2h5IG9uIGVhcnRoIGRvIHlvdSB3YW50IHRvIHBy
b2R1Y2UgYSBzb3VuZCB0aGF0IG5vIG9uZSBjYW4gaGVhciwgYW5kIG15IHJlcGx5IGlzICJFeGFj
dGx5Ii4KSSBzZW5kIHRoZSAyMGtIeiBzaW5lIHdhdiBhY3Jvc3MgdGhlIGF1ZGlvIGxpbmUgYXMg
YSB3YXkgdG8gc3VwZXJ2aXNlIHRoYXQgdGhlIGF1ZGlvIGxpbmUgaXMgZnVsbHkgZnVuY3Rpb25p
bmcuIFRoZSBzZWNvbmQgdGhlIDIwa0h6IHRvbmUgc3RvcHMgd2UgYXJlIG5vdGlmaWVkIGFuZCBz
ZW5kIHNvbWVvbmUgb3V0IHRvIGZpeCB0aGUgcHJvYmxlbSwgd2hldGhlciBpdCBiZSBoYXJkd2Fy
ZSBvciBzb21lb25lIGFjY2lkZW50YWxpdHkgY3V0cyB0aGUgd2lyZSwgd2Ugd2FudCB0byBrbm93
LiAgQmFzaWNhbGx5IHRoZSAyMCBrSHogc2luZSB3YXZlIGRvZXMgbm90IGludGVyZmVyZXIgd2l0
aCBwYWdpbmcgaW4gdGhlIHN5c3RlbS4KIApNeSBmaXJzdCB0aG91Z2h0cyBvbiB3aHkgdGhlIDIw
IGtIeiBzaW5lIGlzIG5vdCBwcm9kdWNlZCwgaXMgYmVjYXVzZSBvZiBtaXNzaW5nIGRyaXZlci4g
IEJ1dCBJIG1hZGUgc3VyZSB0aGF0IGV2ZXJ5IHNvdW5kIGRyaXZlciB0aGF0IHdhcyBsb2FkZWQg
b24gVWJ1bnR1IHdhcyBsb2FkZWQgb24gVGlueWNvcmUuCiAKQ29kZTogCiAgICBgIHN1ZG8gbW9k
cHJvYmUgc25kX3NlcV9taWRpIHNuZF9zZXFfbWlkaV9ldmVudCBzbmRfaW50ZWxfZHNwY2ZnYAog
CkkgYWxzbyBsb2FkZWQgQWxzYVBsdWdpbnMudGN6IGp1c3QgaW5jYXNlLCBidXQgdGhhdCBkaWQg
bm90IG1ha2UgYSBkaWZmZXJlbmNlLiAKIApDb2RlOiAKYCAgICAgdGNlbG9hZCAtaSBhbHNhLXBs
dWdpbnMudGN6YAogClRoZSBsYXN0IHRoaW5nIEkgdHJpZWQgYWZ0ZXIgd2FzIHRvIHNldCB0aGUg
Zm9ybWF0IHNhbXBsZSAtRiBwYXJhbWV0ZXIgdG8gOTYwMDAKIApDb2RlOgogICAgIGBzcGVha2Vy
LXRlc3QgLXQgc2luZSAtZiAyMDAwMCAtWCAtbCAwIC1GIDk2MDAwYAogCkF0IGZpcnN0IHdoZW4g
SSBkaWQgdGhpcyBJIHRob3VnaHQgSSB3YXMgc28gc21hcnQuICBBIHNpbmUgd2F2ZSBhcHBlYXJl
ZCwgaG93ZXZlciBJIGRpZCBub3QgaGF2ZSBhIHNwZWFrZXIgaG9va2VkIHVwLCBidXQgd2hlbiB0
aGUgc3BlYWtlciBnb3QgcGx1Z2dlZCBpbiBJIGhlYXJkIGEgaGlnaCBwaXRjaGVkIG5vaXNlLiBT
byB0aGUgcGFyYW1ldGVyIGFmZmVjdGVkIHRoZSBvdXRwdXQgYnV0IG5vdCB0aGUgZGVzaXJlZCBv
dXRwdXQgdGhhdCAgSSBuZWVkLgogCiAKQW5vdGhlciB0aG91Z2h0IHRoYXQgcGFzcyB0aHJvdWdo
IG15IG1pbmQgaXMgY291bGQgdGhpcyBiZSBhIGNvbmZpZ3VyYXRpb24gc2V0dGluZyBkdXJpbmcg
dGhlIGJ1aWxkIG9mIGFsc2EgdGhhdCBuZWVkIHRvIGJlIHR1cm5lZCBvbi4KQWZ0ZXIgYWxsIDE1
MDAwIEh6IGRvZXMgd29yay4gCiAKIAogCiAKVGhpcyBpcyBzbGlnaHRseSByZWxhdGVkIHRvIGEg
cHJldmlvdXMgcG9zdCBsaW5rZWQgYmVsb3cuCltodHRwczovL2ZvcnVtLnRpbnljb3JlbGludXgu
bmV0L2luZGV4LnBocC90b3BpYywyNzY3My4wLmh0bWxdKHVybCkKIAogClRoYW5rIHlvdQpBbnkg
aGVscCBpcyBncmVhdGx5IGFwcHJlY2lhdGVkCmdoYXJpZwoKSXNzdWUgVVJMICAgICA6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11dGlscy9pc3N1ZXMvMzA0ClJlcG9zaXRv
cnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMK
