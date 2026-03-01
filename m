Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id R5hRCgGSpGktkwUAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Sun, 01 Mar 2026 20:22:41 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8051D1450
	for <lists+alsa-devel@lfdr.de>; Sun, 01 Mar 2026 20:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827E660226;
	Sun,  1 Mar 2026 20:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827E660226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772392959;
	bh=FDVyy3Cuboy07Oih4ZXXXxbIfw/gEkA5rbAq/cjyqSQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vnLr0IutMOnGac1yYX7m68bhbVcwlzj9qlyWmEMQnsegm/or3ExruGcErYpyK5MFn
	 wSqBwvoWza6nPSNX4+sIuvghljtnw4qq8WM7280Oef4mVvgg2cuNY+xiSLkH/4Bg4j
	 BfzP8m/FZDmj6m84u2uPGezsXDVn8z7ftFCs8Kiw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E88F9F805D9; Sun,  1 Mar 2026 20:22:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F967F805D9;
	Sun,  1 Mar 2026 20:22:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75846F80524; Sun,  1 Mar 2026 20:19:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C9CAF8045D
	for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2026 20:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C9CAF8045D
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1898cdd7a1519900-webhooks-bot@alsa-project.org>
In-Reply-To: <1898cdd79986d200-webhooks-bot@alsa-project.org>
References: <1898cdd79986d200-webhooks-bot@alsa-project.org>
Subject: Intel/sof-hda-dsp/Hdmi.conf: HDMI devices always registered with high
 priority regardless of availability,
 causing Speaker to be ignored as fallback sink
Date: Sun,  1 Mar 2026 20:19:43 +0100 (CET)
Message-ID-Hash: 523OOPVZOEKDSLEI2P4QEFBTGTF4BLWZ
X-Message-ID-Hash: 523OOPVZOEKDSLEI2P4QEFBTGTF4BLWZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/523OOPVZOEKDSLEI2P4QEFBTGTF4BLWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alsa-project.org,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: AC8051D1450
X-Rspamd-Action: no action

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzcxMSB3YXMgb3BlbmVkIGZyb20gYWJl
bGljOgoKIyMgRGVzY3JpcHRpb24KCkluIGB1Y20yL0ludGVsL3NvZi1oZGEtZHNwL0hkbWkuY29u
ZmAsIGFsbCB0aHJlZSBIRE1JIHBvcnRzIGFyZSByZWdpc3RlcmVkCnVuY29uZGl0aW9uYWxseSB1
c2luZyBgQ29uZGl0aW9uIHsgVHlwZSBBbHdheXNUcnVlIH1gIHdpdGggcHJpb3JpdGllcyA1MDAs
IDYwMAphbmQgNzAwLiBUaGUgbGFwdG9wIFNwZWFrZXIgaGFzIHByaW9yaXR5IDEwMCAoZnJvbSBg
SERBL0hpRmktYW5hbG9nLmNvbmZgKS4KClRoaXMgY2F1c2VzIFBpcGVXaXJlL1dpcmVQbHVtYmVy
IHRvIGFsd2F5cyBzZWxlY3QgSERNSTEgYXMgdGhlIGZhbGxiYWNrIHNpbmsKd2hlbiB0aGUgZGVm
YXVsdCBzaW5rIGJlY29tZXMgdW5hdmFpbGFibGUgKGUuZy4gQmx1ZXRvb3RoIHNwZWFrZXIgc3Vz
cGVuZHMpLApldmVuIHdoZW4gbm8gbW9uaXRvciBpcyBjb25uZWN0ZWQuIEF1ZGlvIGlzIHNpbGVu
dGx5IHJvdXRlZCB0byBIRE1JMSAoUlVOTklORwpzdGF0ZSB3aXRoIG5vIG91dHB1dCkgaW5zdGVh
ZCBvZiB0aGUgbGFwdG9wIFNwZWFrZXIuCgojIyBIYXJkd2FyZQoKLSBMYXB0b3A6IEh1YXdlaSBS
TEVGRy1YWCBNMTAxMAotIEF1ZGlvOiBJbnRlbCBSYXB0b3IgTGFrZS1QL1UvSCBjQVZTIChzb2Yt
aGRhLWRzcCkKLSBPUzogRmVkb3JhIDQzCi0gUGlwZVdpcmU6IDEuNC4xMAotIFdpcmVQbHVtYmVy
OiAwLjUuMTMKCiMjIFN0ZXBzIHRvIHJlcHJvZHVjZQoKMS4gQ29ubmVjdCBhIEJsdWV0b290aCBh
dWRpbyBkZXZpY2UKMi4gUGxheSBhdWRpbyDigJQgaXQgcm91dGVzIGNvcnJlY3RseSB0byBCbHVl
dG9vdGgKMy4gRGlzY29ubmVjdCBvciBzdXNwZW5kIHRoZSBCbHVldG9vdGggZGV2aWNlCjQuIEF1
ZGlvIGlzIHJvdXRlZCB0byBIRE1JMSBzaW5rIGluc3RlYWQgb2YgdGhlIGxhcHRvcCBTcGVha2Vy
CgojIyBPYnNlcnZlZCBiZWhhdmlvcgoKYHBhY3RsIGxpc3Qgc2hvcnQgc2lua3NgIHNob3dzIEhE
TUkxIGFzIFJVTk5JTkcgd2hpbGUgU3BlYWtlciBpcyBTVVNQRU5ERUQuCldpcmVQbHVtYmVyIHNl
bGVjdHMgSERNSTEgYXMgZmFsbGJhY2sgYmVjYXVzZSBpdHMgcHJpb3JpdHkgKDUwMCkgaXMgaGln
aGVyCnRoYW4gU3BlYWtlciAoMTAwKSwgZXZlbiB0aG91Z2ggbm8gbW9uaXRvciBpcyBjb25uZWN0
ZWQgYW5kIEhETUkgcG9ydHMgYXJlCnJlcG9ydGVkIGFzICJub3QgYXZhaWxhYmxlIi4KCiMjIEV4
cGVjdGVkIGJlaGF2aW9yCgpXaGVuIEhETUkgcG9ydHMgYXJlIG5vdCBhdmFpbGFibGUgKG5vIG1v
bml0b3IgY29ubmVjdGVkKSwgdGhlIFNwZWFrZXIgc2hvdWxkCmJlIHNlbGVjdGVkIGFzIHRoZSBm
YWxsYmFjayBzaW5rLgoKIyMgUmVsZXZhbnQgY29uZmlnCgpgdWNtMi9JbnRlbC9zb2YtaGRhLWRz
cC9IZG1pLmNvbmZgOgpgYGAKSWYuaGRtaTEgewogICAgICAgIENvbmRpdGlvbiB7IFR5cGUgQWx3
YXlzVHJ1ZSB9ICAgIyA8LS0gbm8gYXZhaWxhYmlsaXR5IGNoZWNrCiAgICAgICAgVHJ1ZS5NYWNy
by5oZG1pMS5IRE1JIHsKICAgICAgICAgICAgICAgIE51bWJlciAxCiAgICAgICAgICAgICAgICBE
ZXZpY2UgMwogICAgICAgICAgICAgICAgUHJpb3JpdHkgNTAwICAgICAgICAgICAgIyBoaWdoZXIg
dGhhbiBTcGVha2VyICgxMDApCiAgICAgICAgfQp9CgpJZi5oZG1pMiB7CiAgICAgICAgQ29uZGl0
aW9uIHsgVHlwZSBBbHdheXNUcnVlIH0KICAgICAgICBUcnVlLk1hY3JvLmhkbWkxLkhETUkgewog
ICAgICAgICAgICAgICAgTnVtYmVyIDIKICAgICAgICAgICAgICAgIERldmljZSA0CiAgICAgICAg
ICAgICAgICBQcmlvcml0eSA2MDAKICAgICAgICB9Cn0KCklmLmhkbWkzIHsKICAgICAgICBDb25k
aXRpb24geyBUeXBlIEFsd2F5c1RydWUgfQogICAgICAgIFRydWUuTWFjcm8uaGRtaTEuSERNSSB7
CiAgICAgICAgICAgICAgICBOdW1iZXIgMwogICAgICAgICAgICAgICAgRGV2aWNlIDUKICAgICAg
ICAgICAgICAgIFByaW9yaXR5IDcwMAogICAgICAgIH0KfQpgYGAKCmB1Y20yL0hEQS9IaUZpLWFu
YWxvZy5jb25mYCAocmVsZXZhbnQgZXhjZXJwdCk6CmBgYApWYWx1ZSB7CiAgICAgICAgUGxheWJh
Y2tQcmlvcml0eSAxMDAgICAgIyBTcGVha2VyIHByaW9yaXR5IOKAlCBsb3dlciB0aGFuIGFsbCBI
RE1JIHBvcnRzCiAgICAgICAgLi4uCn0KYGBgCgojIyBTdWdnZXN0ZWQgZml4CgpBZGQgYXZhaWxh
YmlsaXR5IGRldGVjdGlvbiBmb3IgSERNSSBwb3J0cyBiZWZvcmUgYXNzaWduaW5nIGhpZ2ggcHJp
b3JpdHksCm9yIGxvd2VyIEhETUkgcHJpb3JpdHkgd2hlbiB0aGUgcG9ydCBpcyBub3QgYXZhaWxh
YmxlLCBzaW1pbGFyIHRvIGhvdwpIZWFkcGhvbmVzIHVzZSBgSmFja0NvbnRyb2xgIGZvciBhdmFp
bGFiaWxpdHkgZGV0ZWN0aW9uLgoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9h
bHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9pc3N1ZXMvNzExClJlcG9zaXRvcnkgVVJMOiBodHRw
czovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYK
