Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09FBA4F24
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 21:08:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0936D601E7;
	Fri, 26 Sep 2025 21:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0936D601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758913693;
	bh=qEXEd1i2IrwsJYbHYiH47LYx0NhvCIAOXe/i1os7n6k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CUTeFIk6t/g5N8QppVdpMjoYoko3q/1BpobiWbUh4bv02xV04wEO5mz2MlNxcrpqU
	 mC1nMQnkLaagy0N/P09RdpNH6uVNoOOdGgD2/Tq5lptuxMU1fsLGLdrYJI+xvyAy8H
	 HoMWk6VEzJtB+hVfbhxEd73wZ28pTtKqV8USTM7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5675F805C6; Fri, 26 Sep 2025 21:07:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4431F805C3;
	Fri, 26 Sep 2025 21:07:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8FA0F804FC; Fri, 26 Sep 2025 21:07:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FCD3F800E3
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 21:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FCD3F800E3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1868eaa425a88e00-webhooks-bot@alsa-project.org>
In-Reply-To: <1868eaa425367800-webhooks-bot@alsa-project.org>
References: <1868eaa425367800-webhooks-bot@alsa-project.org>
Subject: Missing UCM matcher for ASUS Zenbook S 14 UX5406SA (cs42l43/cs35l56,
 Lunar Lake)
Date: Fri, 26 Sep 2025 21:07:29 +0200 (CEST)
Message-ID-Hash: YTNWD6SYLFTAQ2HRYVZW25MICX2O7LVJ
X-Message-ID-Hash: YTNWD6SYLFTAQ2HRYVZW25MICX2O7LVJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YTNWD6SYLFTAQ2HRYVZW25MICX2O7LVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzYxOSB3YXMgb3BlbmVkIGZyb20gc2pv
bG8zMTI6CgpUaGlzIGlzIG5vdCBhIGtlcm5lbCBidWcgYnV0IGEgbWlzc2luZyBVQ00gbWF0Y2hl
ci4KClJlc3VsdDoKV2l0aCB0aGUgbWF0Y2hlciBiZWxvdyBhbmQgdGhlIGxhdGVzdCB1cHN0cmVh
bSBhbHNhLXVjbS1jb25mIGZpbGVzLCBzcGVha2VycyBhbmQgbWljcm9waG9uZSB3b3JrIG9uIHRo
ZSBBU1VTIFplbmJvb2sgUyAxNCBVWDU0MDZTQSAoTHVuYXIgTGFrZSwgY3M0Mmw0MyArIGNzMzVs
NTYpLgoKVGVzdGVkIG9uOgotIFVidW50dSAyNS4xMCBiZXRhICh1cC10by1kYXRlIGxpdmUgc2Vz
c2lvbikKLSBhbHNhLXVjbS1jb25mOiB1cHN0cmVhbSBtYXN0ZXIgZnJvbSBHaXRIdWIgKGFzIG9m
IDIwMjUtMDktMjYpCgpDYXJkTG9uZ05hbWU6CkFTVVNUZUtDT01QVVRFUklOQy4tQVNVU1plbmJv
b2tTMTRVWDU0MDZTQV9VWDU0MDZTQS0xLjAtVVg1NDA2U0EKClJvb3QgY2F1c2U6ClVwc3RyZWFt
IG1hc3RlciBkb2VzIG5vdCBjb250YWluIGEgbWF0Y2hlciBmb3IgdGhpcyBDYXJkTG9uZ05hbWUs
IHNvIG5vIFVDTSBwcm9maWxlIGlzIGxvYWRlZCAoLT4g4oCcRHVtbXkgT3V0cHV04oCdKS4KQWRk
aW5nIHRoZSBtYXRjaGVyIGJlbG93IGVuc3VyZXMgdGhlIGV4aXN0aW5nIHNvZi1zb3VuZHdpcmUg
cHJvZmlsZSAod2hpY2ggYWxyZWFkeSBpbmNsdWRlcyBjczQybDQzL2NzMzVsNTYgcm91dGVzKSBp
cyBsb2FkZWQsIGFuZCBhdWRpbyB3b3Jrcy4KClByb3Bvc2VkIG5ldyBmaWxlOgpQYXRoOiB1Y20y
L2NvbmYuZC9zb2Ytc291bmR3aXJlL0FTVVMtWmVuYm9vay1TMTQtVVg1NDA2U0EuY29uZgoKIyBB
U1VTIFplbmJvb2sgUyAxNCBVWDU0MDZTQSAoTHVuYXIgTGFrZSkKU2VjdGlvbkRlZmF1bHRzLiJz
b2Ytc291bmR3aXJlIiB7CiAgICBDb25kaXRpb24gewogICAgICAgIFR5cGUgUmVnZXgKICAgICAg
ICBDYXJkTG9uZ05hbWUgIkFTVVNUZUtDT01QVVRFUklOQy4tQVNVU1plbmJvb2tTMTRVWDU0MDZT
QS4qIgogICAgfQogICAgSW5jbHVkZS5jb25mICJzb2Ytc291bmR3aXJlL3NvZi1zb3VuZHdpcmUu
Y29uZiIKfQoKVmVyaWZpY2F0aW9uIChmaWxlcyBhY3R1YWxseSBsb2FkZWQpOgpHYXRoZXJlZCB3
aXRoOgpzdHJhY2UgLWYgLWUgdHJhY2U9JWZpbGUgLW8gL3RtcC91Y20udHJhY2UgXAogIGFsc2F1
Y20gLWMgc29mLXNvdW5kd2lyZSBsaXN0IF92ZXJicyA+L2Rldi9udWxsIDI+JjEKZ3JlcCAtb0Ug
Jy91c3Ivc2hhcmUvYWxzYS91Y20yL1teIl0rJyAvdG1wL3VjbS50cmFjZSB8IHNvcnQgLXUKClJl
c3VsdGluZyBmaWxlcyBpbmNsdWRlZDoKL3Vzci9zaGFyZS9hbHNhL3VjbTIvSW50ZWwvc29mLWhk
YS1kc3AvZHNwLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvYmxvYnMvc29mL3Byb2R1Y3RfY29u
Zmlncy9BU1VTVGVLIENPTVBVVEVSIElOQy4vQVNVUyBaZW5ib29rIFMgMTQgVVg1NDA2U0FfVVg1
NDA2U0EuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9ibG9icy9zb2YvdXNlcl9jb25maWdzL0FT
VVNUZUsgQ09NUFVURVIgSU5DLi9BU1VTIFplbmJvb2sgUyAxNCBVWDU0MDZTQV9VWDU0MDZTQS5j
b25mCi91c3Ivc2hhcmUvYWxzYS91Y20yL2NvZGVjcy9jczM1bDU2L2luaXQuY29uZgovdXNyL3No
YXJlL2Fsc2EvdWNtMi9jb2RlY3MvY3M0Mmw0My9pbml0LmNvbmYKL3Vzci9zaGFyZS9hbHNhL3Vj
bTIvY29kZWNzL2hkYS9oZG1pLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvY29tbW9uL2N0bC9s
ZWQuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9jb21tb24vcGNtL2hkbWkuY29uZgovdXNyL3No
YXJlL2Fsc2EvdWNtMi9jb25mLmQvc29mLXNvdW5kd2lyZS9BU1VTVGVLQ09NUFVURVJJTkMuLUFT
VVNaZW5ib29rUzE0VVg1NDA2U0FfVVg1NDA2U0EtMS4wLVVYNTQwNlNBLmNvbmYKL3Vzci9zaGFy
ZS9hbHNhL3VjbTIvY29uZi5kL3NvZi1zb3VuZHdpcmUvc29mLXNvdW5kd2lyZS5jb25mCi91c3Iv
c2hhcmUvYWxzYS91Y20yL2xpYi9jYXJkLWluaXQuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9s
aWIvY3RsLXJlbWFwLmNvbmYKL3Vzci9zaGFyZS9hbHNhL3VjbTIvbGliL2dlbmVyaWMuY29uZgov
dXNyL3NoYXJlL2Fsc2EvdWNtMi9zb2Ytc291bmR3aXJlL0hkbWkuY29uZgovdXNyL3NoYXJlL2Fs
c2EvdWNtMi9zb2Ytc291bmR3aXJlL0hpRmkuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9zb2Yt
c291bmR3aXJlL2NzMzVsNTYuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9zb2Ytc291bmR3aXJl
L2NzNDJsNDMuY29uZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi9zb2Ytc291bmR3aXJlL2RtaWMuY29u
ZgovdXNyL3NoYXJlL2Fsc2EvdWNtMi91Y20uY29uZgoKUmVxdWVzdDoKUGxlYXNlIGFkZCB0aGlz
IG1hdGNoZXIgdG8gYWxzYS11Y20tY29uZiB1cHN0cmVhbSwgc28gdGhhdCB0aGUgQVNVUyBaZW5i
b29rIFMgMTQgVVg1NDA2U0Egd29ya3Mgb3V0LW9mLXRoZS1ib3ggb24gYWxsIExpbnV4IGRpc3Ry
aWJ1dGlvbnMuCgpIYXBweSB0byB0ZXN0IGFueSBwcm9wb3NlZCBwYXRjaCBvciBwcm92aWRlIGZ1
cnRoZXIgbG9ncyBpZiBuZWVkZWQuCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29t
L2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mL2lzc3Vlcy82MTkKUmVwb3NpdG9yeSBVUkw6IGh0
dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZgo=
