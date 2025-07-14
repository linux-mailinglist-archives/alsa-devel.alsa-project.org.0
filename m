Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41DEB04808
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jul 2025 21:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC23601FD;
	Mon, 14 Jul 2025 21:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC23601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752522231;
	bh=gtKN3h26GDMJXg8NZ2oB23GbLiwmCYVJunCR/z2w8QE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ISN1drd/UxnvTk8iH2PsNSB2Wmloz42J3fw2VTLI+AnxS8Fs+CH4wSJLe1NgCM29H
	 7gMH5FXLTy2lT1cXxhXQGyZFCcVv2cWLvjUoaI4qu+4GuTUQgRYhoHb8+ewV60jYXg
	 OwozMQ2uHLpwI/UrcGGeuQfr06un6z3IjQd4s2ag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0EB6F805C7; Mon, 14 Jul 2025 21:43:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B64D3F805C5;
	Mon, 14 Jul 2025 21:43:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6A37F804E5; Mon, 14 Jul 2025 21:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 49EF0F800F3
	for <alsa-devel@alsa-project.org>; Mon, 14 Jul 2025 21:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49EF0F800F3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185235a397883400-webhooks-bot@alsa-project.org>
In-Reply-To: <185235a396d59c00-webhooks-bot@alsa-project.org>
References: <185235a396d59c00-webhooks-bot@alsa-project.org>
Subject: Missing analog-stereo profile for Dell Latitude 3420 (ALC3204, SOF,
 Fedora 42)
Date: Mon, 14 Jul 2025 21:43:06 +0200 (CEST)
Message-ID-Hash: 266Q2XUXX2YI5CJLTRJMSNCMR5VV3YYY
X-Message-ID-Hash: 266Q2XUXX2YI5CJLTRJMSNCMR5VV3YYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/266Q2XUXX2YI5CJLTRJMSNCMR5VV3YYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzU5NCB3YXMgb3BlbmVkIGZyb20gS3J6
eXN6dG9mV2lzaWVja2k6CgoqKlN1bW1hcnk6KioKT24gbXkgRGVsbCBMYXRpdHVkZSAzNDIwIChJ
bnRlbCBUaWdlciBMYWtlLCBSZWFsdGVrIEFMQzMyMDQsIHNvZi1oZGEtZHNwKSwgcnVubmluZyBG
ZWRvcmEgNDIgd2l0aCBQaXBlV2lyZSBhbmQgV2lyZVBsdW1iZXIgKG5vIFB1bHNlQXVkaW8pLCBJ
IGFtIHVuYWJsZSB0byBzZWxlY3QgYSBzdGFuZGFyZCAiYW5hbG9nLXN0ZXJlbyIgcHJvZmlsZSBm
b3IgdGhlIGludGVybmFsIHNvdW5kIGNhcmQuIE9ubHkgInByby1hdWRpbyIgYW5kICJvZmYiIHBy
b2ZpbGVzIGFyZSBhdmFpbGFibGUuIFRoaXMgbWFrZXMgaXQgaW1wb3NzaWJsZSB0byB1c2Ugc3Bl
YWtlcnMgYW5kIHRoZSBpbnRlcm5hbCBtaWNyb3Bob25lIHRvZ2V0aGVyIGluIGEgdHlwaWNhbCBk
ZXNrdG9wIHNldHVwLgoKKipTeXN0ZW0gZGV0YWlsczoqKgpMYXB0b3A6IERlbGwgTGF0aXR1ZGUg
MzQyMAoKQ29kZWM6IFJlYWx0ZWsgQUxDMzIwNAoKU291bmQgZHJpdmVyOiBzb2YtaGRhLWRzcCAo
U09GLCBub3Qgc25kX2hkYV9pbnRlbCkKCk9TOiBGZWRvcmEgNDIsIGZ1bGx5IHVwZGF0ZWQKClBp
cGVXaXJlOiBDb21waWxlZCB3aXRoIGxpYnBpcGV3aXJlIDEuNC42CkxpbmtlZCB3aXRoIGxpYnBp
cGV3aXJlIDEuNC42CgpXaXJlUGx1bWJlcjogQ29tcGlsZWQgd2l0aCBsaWJ3aXJlcGx1bWJlciAw
LjUuOApMaW5rZWQgd2l0aCBsaWJ3aXJlcGx1bWJlciAwLjUuOAoKS2VybmVsOiA2LjE0LjAtNjMu
ZmM0Mi54ODZfNjQKCgoqKldoYXQgaXMgdGhlIGlzc3VlPyoqCk5vICJhbmFsb2ctc3RlcmVvIiAo
b3Igb3RoZXIgdHlwaWNhbCBhbmFsb2cpIHByb2ZpbGVzIGFyZSBhdmFpbGFibGUuCgpPbmx5IHRo
ZXNlIHByb2ZpbGVzIGFyZSBsaXN0ZWQ6CgpvZmYKCnByby1hdWRpbwoKClByb2ZpbGU6CiAgICBv
ZmY6IE9mZiAoc2lua3M6IDAsIHNvdXJjZXM6IDAsIHByaW9yaXR5OiAwLCBhdmFpbGFibGU6IHll
cykKICAgIHByby1hdWRpbzogUHJvIEF1ZGlvIChzaW5rczogNSwgc291cmNlczogMywgcHJpb3Jp
dHk6IDEsIGF2YWlsYWJsZTogeWVzKQpBY3RpdmUgUHJvZmlsZTogcHJvLWF1ZGlvCkFMU0EgZGV2
aWNlcyBhcmUgcHJlc2VudDoKCmNhdCAvcHJvYy9hc291bmQvY2FyZHMKIDAgW3NvZmhkYWRzcCAg
ICAgIF06IHNvZi1oZGEtZHNwIC0gc29mLWhkYS1kc3AKICAgICAgICAgICAgICAgICAgICAgIERl
bGxJbmMuLUxhdGl0dWRlMzQyMC0tMDNSVDdQCgphcGxheSAtbApjYXJkIDA6IHNvZmhkYWRzcCBb
c29mLWhkYS1kc3BdLCBkZXZpY2UgMDogSERBIEFuYWxvZyAoKikgW10KLi4uCmNhcmQgMDogc29m
aGRhZHNwIFtzb2YtaGRhLWRzcF0sIGRldmljZSA2OiBETUlDICgqKSBbXQouLi4KVGhlIGFuYWxv
ZyBpbnB1dHMvb3V0cHV0cyBleGlzdCBhdCB0aGUgQUxTQSBsYXllci4KClRoZXJlIGlzIG5vIGZp
bGUgL3Vzci9zaGFyZS9hbHNhLWNhcmQtcHJvZmlsZS9taXhlci9wcm9maWxlLXNldHMvc29mLWhk
YS1kc3AuY29uZiBieSBkZWZhdWx0LgoKQXR0ZW1wdGluZyB0byBjb3B5IG9yIGNyZWF0ZSBhIG1p
bmltYWwgc29mLWhkYS1kc3AuY29uZiB3aXRoIGFuYWxvZy1zdGVyZW8gbWFwcGluZyBkb2VzIG5v
dCBlbmFibGUgdGhlIGFuYWxvZyBwcm9maWxlIOKAkyBvbmx5ICJwcm8tYXVkaW8iIGFwcGVhcnMu
CgpXaGF0IGhhdmUgSSB0cmllZD8KQ3JlYXRlZCBhIGN1c3RvbSAvdXNyL3NoYXJlL2Fsc2EtY2Fy
ZC1wcm9maWxlL21peGVyL3Byb2ZpbGUtc2V0cy9zb2YtaGRhLWRzcC5jb25mIChiYXNlZCBvbiBk
ZWZhdWx0LmNvbmYvYW5hbG9nLW9ubHkuY29uZi9taW5pbWFsIGFuYWxvZy1zdGVyZW8gbWFwcGlu
ZykuCgpTZXQgYXBpLmFjcC5hdXRvLXByb2ZpbGUgYW5kIGFwaS5hY3AuYXV0by1wb3J0IHRvIHRy
dWUgZm9yIHRoaXMgZGV2aWNlIGluIC9ldGMvd2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIuY29uZi5k
Lzk5LWF1dG8tcHJvZmlsZS5jb25mLgoKUmVzdGFydGVkIFBpcGVXaXJlIGFuZCBXaXJlUGx1bWJl
ci4KClJlaW5zdGFsbGVkIGZpcm13YXJlIChhbHNhLXNvZi1maXJtd2FyZSksIGFsc2EtY2FyZC1w
cm9maWxlcywgYWxzYS11Y20tY29uZi4KCkNoZWNrZWQgZm9yIGNvbmZsaWN0aW5nIGJsYWNrbGlz
dCBvciBtb2Rwcm9iZSBvcHRpb25zLgoKVmVyaWZpZWQgdGhhdCBldmVyeXRoaW5nIHdvcmtzIGFz
IGV4cGVjdGVkIHdpdGggc25kX2hkYV9pbnRlbCBsZWdhY3kgZHJpdmVyIChkc3BfZHJpdmVyPTEp
LCBidXQgSSB3YW50IHRvIHVzZSBTT0YKClRyaWVkIHVwZGF0aW5nIHRvIHRoZSBsYXRlc3QgRmVk
b3JhIDQyIGFuZCBjaGVja2VkIGZvciB1cGRhdGVzIGluIGFsc2EtY2FyZC1wcm9maWxlcy91Y20t
Y29uZi4KCkV4cGVjdGVkOgoiYW5hbG9nLXN0ZXJlbyIgKG9yIHNpbWlsYXIpIHByb2ZpbGUgc2hv
dWxkIGJlIGF2YWlsYWJsZSBmb3IgdGhlIGludGVybmFsIHNvdW5kIGNhcmQgKHNvZi1oZGEtZHNw
KSBzbyB0aGF0IGJvdGggc3BlYWtlcnMgYW5kIG1pY3JvcGhvbmVzIGNhbiBiZSB1c2VkIGluIGEg
c3RhbmRhcmQgZGVza3RvcCBjb25maWd1cmF0aW9uLgoKQXV0b21hdGljIHByb2ZpbGUgc3dpdGNo
aW5nIHNob3VsZCB3b3JrIChpLmUuLCBwbHVnZ2luZyBpbiBoZWFkcGhvbmVzL3N3aXRjaGluZyBi
ZXR3ZWVuIHNwZWFrZXJzIGFuZCBoZWFkcGhvbmVzLCB1c2luZyBpbnRlcm5hbCBtaWMpLgoKQWN0
dWFsOgpPbmx5ICJwcm8tYXVkaW8iIGFuZCAib2ZmIiBwcm9maWxlcyBhcmUgYXZhaWxhYmxlLgoK
TWFudWFsIHN3aXRjaGluZyBpcyBwb3NzaWJsZSBpbiAicHJvLWF1ZGlvIiwgYnV0IGxhY2tzIHRo
ZSBjb252ZW5pZW5jZSBhbmQgdXNlciBleHBlcmllbmNlIG9mIHN0YW5kYXJkIHByb2ZpbGVzLgoK
Tm8gImFuYWxvZy1zdGVyZW8iLCAiYW5hbG9nLWR1cGxleCIgb3Igc2ltaWxhciBvcHRpb25zIGFy
ZSBsaXN0ZWQuCgpSZXF1ZXN0IC8gV2hhdCBJJ2QgbGlrZSB0byBzZWU6ClBsZWFzZSBhZGQgb3Ig
ZW5hYmxlIHN0YW5kYXJkIGFuYWxvZyBwcm9maWxlcyAoImFuYWxvZy1zdGVyZW8iLCAiYW5hbG9n
LWR1cGxleCIsIGV0Yy4pIGZvciBEZWxsIExhdGl0dWRlIDM0MjAgd2l0aCBSZWFsdGVrIEFMQzMy
MDQgYW5kIHNvZi1oZGEtZHNwLCBpZiBwb3NzaWJsZS4KCkFueSBndWlkYW5jZSBvbiBtYW51YWxs
eSBlbmFibGluZyBzdWNoIHByb2ZpbGVzIGluIHRoZSBtZWFudGltZSB3b3VsZCBiZSBhcHByZWNp
YXRlZC4KCkxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGZ1bGwgbG9ncywgc3lzdGVtIGluZm8sIG9y
IGFkZGl0aW9uYWwgdGVzdHMhCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fs
c2EtcHJvamVjdC9hbHNhLXVjbS1jb25mL2lzc3Vlcy81OTQKUmVwb3NpdG9yeSBVUkw6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZgo=
