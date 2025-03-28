Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 548C6A7465D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 10:29:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2850601D4;
	Fri, 28 Mar 2025 10:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2850601D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743154186;
	bh=mhtRUXuezPwSBeZUB00JgDJYABK9kiyMqDdHg7+zHDg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WGDnLffe/9E7anDiSS9txE7ulklF9cYn4MgHnBNr/Bxp0jNsufp+lWmY6k8RwS2ki
	 Z8arH95OBW0ybW7Ud9bIwAnQLUAMnCfTRP+VKR9dvUMuulz6CSsR+7Rznf9oPa+3Lo
	 7eFA8WVy2kG/NxU4lw5w4e6LMNRoOt0DiwiZoU4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A2FF805C2; Fri, 28 Mar 2025 10:29:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4C9F805B4;
	Fri, 28 Mar 2025 10:29:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34D7EF80548; Fri, 28 Mar 2025 10:29:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_05,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F0DEF800E5
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 10:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F0DEF800E5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1830ed763dcf2100-webhooks-bot@alsa-project.org>
In-Reply-To: <1830ed763d626000-webhooks-bot@alsa-project.org>
References: <1830ed763d626000-webhooks-bot@alsa-project.org>
Subject: [ alsa-lib ] OpenHarmony Adaptation Proposal
Date: Fri, 28 Mar 2025 10:29:10 +0100 (CET)
Message-ID-Hash: I5GJ34KLKJGTPAHGVI4WSES4Q7LRBEZM
X-Message-ID-Hash: I5GJ34KLKJGTPAHGVI4WSES4Q7LRBEZM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5GJ34KLKJGTPAHGVI4WSES4Q7LRBEZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtbGliIGlzc3VlICM0NDUgd2FzIG9wZW5lZCBmcm9tIEFzZXJjbjoK
CiMgWyBhbHNhLWxpYiBdIE9wZW5IYXJtb255IEFkYXB0YXRpb24gUHJvcG9zYWwKIyMgQmFja2dy
b3VuZAoKT3Blbkhhcm1vbnkgaXMgYW4gb3Blbi1zb3VyY2UgcHJvamVjdCBpbmN1YmF0ZWQgYW5k
IG9wZXJhdGVkIGJ5IHRoZSBPcGVuQXRvbSBPcGVuIFNvdXJjZSBGb3VuZGF0aW9uLiBJdHMgZ29h
bCBpcyB0byBidWlsZCBhbiBvcGVyYXRpbmcgc3lzdGVtIGZyYW1ld29yayBhbmQgcGxhdGZvcm0g
Zm9yIGludGVsbGlnZW50IHRlcm1pbmFsIGRldmljZXMgaW4gdGhlIGVyYSBvZiBmdWxsIHNjZW5h
cmlvcywgZnVsbCBjb25uZWN0aXZpdHksIGFuZCBmdWxsIGludGVsbGlnZW5jZS4KCkFMU0EsIGFz
IGFuIGltcG9ydGFudCBhdWRpbyBhcmNoaXRlY3R1cmUgaW4gTGludXggc3lzdGVtcywgYWxsb3dz
IGRldmVsb3BlcnMgdG8gdXNlIExpbnV4IHN5c3RlbSBjYWxscyBpbiBwcm9ncmFtcyB0byBjb250
cm9sIGFuZCBtYW5hZ2UgdGhlIHVuZGVybHlpbmcgb3BlcmF0aW5nIHN5c3RlbS4gRHVlIHRvIGl0
cyBlZmZpY2llbnQgYW5kIGVhc3ktdG8tdXNlIGZlYXR1cmVzLCBpdCBpcyBhbHNvIHN1aXRhYmxl
IGZvciBlbWJlZGRlZCBkZXZpY2VzLCB3aGljaCBhbGlnbnMgd2VsbCB3aXRoIE9wZW5IYXJtb255
J3MgY29uY2VwdCBvZiBzdXBwb3J0aW5nIGEgdmFyaWV0eSBvZiBkZXZpY2VzLiBDdXJyZW50bHks
IEFMU0EgaXMgd2lkZWx5IHVzZWQgaW4gdGhlIG1vYmlsZSBhcHBsaWNhdGlvbiBkZXZlbG9wbWVu
dCBmaWVsZCBvZiBPcGVuSGFybW9ueS4KCldlIHdpbGwgc3VibWl0IHRoZSBhZGFwdGF0aW9uIGNv
ZGUgdmlhIGEgcHVsbCByZXF1ZXN0IChQUikgYXMgc29vbiBhcyBwb3NzaWJsZS4gVGhpcyBpc3N1
ZSBpcyBjcmVhdGVkIHRvIGVuZ2FnZSBpbiBpbi1kZXB0aCBkaXNjdXNzaW9ucyB3aXRoIHRoZSBj
b21tdW5pdHkgYWJvdXQgaW50ZWdyYXRpbmcgdGhlIGFkYXB0YXRpb24gY29kZS4gV2Ugc2luY2Vy
ZWx5IHdlbGNvbWUgYW55IHZhbHVhYmxlIHN1Z2dlc3Rpb25zLgojIyBBZGFwdGF0aW9uIFBsYW4K
CjEuIERldGFpbHMgb2YgdGhlIEFMU0EgYWRhcHRhdGlvbiBwbGFuOgoyLiBTdWJtaXQgYmFjayB0
byB0aGUgbWFpbiBjb21tdW5pdHkuCjMuIE9uZ29pbmcgY29tbXVuaXR5IG1haW50ZW5hbmNlLgoK
IyMgVGVzdCBSZXN1bHRzCgpXZSBoYXZlIGNvbXBsZXRlZCBsYXJnZS1zY2FsZSBjb21wYXRpYmls
aXR5IHRlc3RpbmcsIGNvdmVyaW5nIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiBIYXJtb255T1MgYW5k
IHZhcmlvdXMgdHlwZXMgb2YgSGFybW9ueU9TIGRldmljZXMuIFRoZSB0ZXN0IHJlc3VsdHMgc2hv
dyB0aGF0IHRoZSBtb2RpZmllZCB2ZXJzaW9uIGlzIGhpZ2hseSBjb21wYXRpYmxlIHdpdGggdGhl
IEhhcm1vbnlPUyBzeXN0ZW0gYW5kIG5vIHNpZ25pZmljYW50IHN0YWJpbGl0eSBpc3N1ZXMgaGF2
ZSBiZWVuIG9ic2VydmVkLgpCZW5lZml0cyB0byB0aGUgVXBzdHJlYW0gQ29tbXVuaXR5CgoqIENh
biByZWFjaCBPcGVuSGFybW9ueeKAmXMgbGFyZ2UgdXNlciBiYXNlIGFuZCBkZXZlbG9wZXIgY29t
bXVuaXR5LgoqIEJ5IHN1cHBvcnRpbmcgdGhlIGRldmVsb3BtZW50IHRyZW5kcyBvZiB0aGUgb3Bl
cmF0aW5nIHN5c3RlbSwgaXQgZW5zdXJlcyB0aGUgbG9uZy10ZXJtIGRldmVsb3BtZW50IHBvdGVu
dGlhbCBvZiB0aGUgcHJvamVjdC4KKiBFbmhhbmNlcyB0aGUgcHJvamVjdCdzIHByb2Nlc3Npbmcg
Y2FwYWJpbGl0eSBpbiBkaXZlcnNlIG9wZXJhdGluZyBlbnZpcm9ubWVudHMuCgpJc3N1ZSBVUkwg
ICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9pc3N1ZXMvNDQ1
ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtbGli
Cg==
