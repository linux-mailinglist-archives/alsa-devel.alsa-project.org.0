Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5719AA15DE8
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jan 2025 17:07:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1486056F;
	Sat, 18 Jan 2025 17:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1486056F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737216471;
	bh=Vl31dOcV4VRW6K40YVzEGGFBs9Tpax0lnzXON/iI+E0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qIq+BQDo39bJYrCmce81nuxsWdc5kbC6hdp/TCjEwFVMYmc6Zljp45AqsUdaU863t
	 ej0Xf8SnYu9LY8sySWaxz3acZv9Tr0MjpXeY+5+l7rtz2c7RY/b4O5FhwEJmaSeWC1
	 7jNa4MCRJWWYNUYsY9n+SuSBXjCXmfzyXZg0u77Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58AEF805B6; Sat, 18 Jan 2025 17:07:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AEE1F805A9;
	Sat, 18 Jan 2025 17:07:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFBD5F80246; Sat, 18 Jan 2025 17:07:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E08EF800C1
	for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2025 17:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E08EF800C1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1737216421801881313-webhooks-bot@alsa-project.org>
References: <1737216421801881313-webhooks-bot@alsa-project.org>
Subject: No audio on Acer Swift SF315-52
Message-Id: <20250118160706.BFBD5F80246@alsa1.perex.cz>
Date: Sat, 18 Jan 2025 17:07:06 +0100 (CET)
Message-ID-Hash: Q2D5CC6ABHJUJMPUCBQ54KH7LNSGRRCX
X-Message-ID-Hash: Q2D5CC6ABHJUJMPUCBQ54KH7LNSGRRCX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2D5CC6ABHJUJMPUCBQ54KH7LNSGRRCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzQ5NyB3YXMgb3BlbmVkIGZyb20gcGF2
ZXRoZW06CgpbQWxzYSBpbmZvXShodHRwOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj04ZTZkYzU5
NTEwZDdhYWE0Mjg5OWY4MWE4ZjI5YTc0MDAzMmU5Y2UwKQoKRXZlciBzaW5jZSBrZXJuZWwgNi4x
MiBkcm9wcGVkIGZvciBGZWRvcmEsIG15IGxhcHRvcCBvbmx5IHNob3dzIGEgZHVtbXkgb3V0cHV0
LiBUaGlzIGlzIHByb2JhYmx5IGR1ZSB0byB0aGUga2VybmVsIHJlbW92aW5nIGxlZ2FjeSBzb3Vu
ZCBkcml2ZXJzIGFuZCByZXBsYWNpbmcgdGhlbSB3aXRoIGF2cywgd2hpY2ggZG9lc27igJl0IHNl
ZW0gd29yayBmb3IgdGhlIGthYnkgbGFrZSBhcmNoaXRlY3R1cmUgcHJlc2VudCBpbiB0aGlzIG1v
ZGVsLiAoW3Bob3Jvbml4XShodHRwczovL3d3dy5waG9yb25peC5jb20vbmV3cy9MaW51eC02LjEy
LVNvdW5kLURyaXZlcnMpKS4KCkkgYW0gdW5zdXJlIHdoZXRoZXIgb3Igbm90IEkgYW0gZmlsaW5n
IHRoaXMgYnVnIGluIHRoZSByaWdodCBwbGFjZS4gU2luY2UgSSBhbSBhYmxlIHRvIGdldCB0aGUg
bWljcm9waG9uZSB0byB3b3JrIGJ5IGNvcHlpbmcgYSBmaWxlOiAKYGNwIC91c3Ivc2hhcmUvYWxz
YS91Y20yL2NvbmYuZC9hdnNfZG1pYy9BY2VyLUxhcnMtMS4wLmNvbmYgL3Vzci9zaGFyZS9hbHNh
L3VjbTIvY29uZi5kL2F2c19kbWljL2F2c19kbWljLmNvbmZgCkkgYW0gZ3Vlc3NpbmcgdGhpcyBp
cyBhIGNhc2Ugb2YgYSBtaXNzaW5nIHVjbSBmaWxlIGZvciB0aGlzIHBhcnRpY3VsYXIgaGFyZHdh
cmUuIElmIHRoaXMgaXMgaW5jb3JyZWN0LCBJIHdvdWxkIGFwcHJlY2lhdGUgaWYgc29tZW9uZSBj
b3VsZCBwb2ludCBtZSBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uIGFuZCB0ZWxsIG1lIGlmIHRoaXMg
aXMgcmF0aGVyIGEgYnVnIHdpdGggYWxzYS1maXJtd2FyZSBvciB0aGUga2VybmVsIGl0c2VsZi4K
Cklzc3VlIFVSTCAgICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNt
LWNvbmYvaXNzdWVzLzQ5NwpSZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2Et
cHJvamVjdC9hbHNhLXVjbS1jb25mCg==
