Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3CFCBDCA8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Dec 2025 13:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A64260231;
	Mon, 15 Dec 2025 13:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A64260231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765801645;
	bh=ioudjI0HQC/ni2Q1im+jHjq5VL0TAEC0UEiCfkBAXF4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i15VqOJqMLzqiDf45I/JQ1YJOAYiaQxKsh0V8JAXchXvVqXhGylAKDXD8Mbi6nBsO
	 XHebyw0YSB0lg/GL9n9zDCi38qpn8G8G6F1d9tnult/uD42NdukSCFbWbiN6ltRAR/
	 aI7w/JpcsTDCvMzofJGWIEwpv5YX509dYMBFls5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E895CF805D8; Mon, 15 Dec 2025 13:26:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D78AF805C5;
	Mon, 15 Dec 2025 13:26:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CF04F80169; Mon, 15 Dec 2025 13:25:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6621FF800BA
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 13:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6621FF800BA
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18816328f3a69100-webhooks-bot@alsa-project.org>
In-Reply-To: <18816328f2da4900-webhooks-bot@alsa-project.org>
References: <18816328f2da4900-webhooks-bot@alsa-project.org>
Subject: 
 =?utf-8?q?HP_OMEN_Transcend_14_=28board_8C58=2C_Meteor_Lake=29_=E2=80=93_SoundWire_speakers_not_configured_=28missing_UCM_profile=29?=
Date: Mon, 15 Dec 2025 13:25:59 +0100 (CET)
Message-ID-Hash: KTOA7ZTGYXRRGCKJYC5EYSHKRAE7DXJY
X-Message-ID-Hash: KTOA7ZTGYXRRGCKJYC5EYSHKRAE7DXJY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTOA7ZTGYXRRGCKJYC5EYSHKRAE7DXJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzY2MSB3YXMgb3BlbmVkIGZyb20gRmFy
bmF6MDM6CgojIyMgKipIYXJkd2FyZSoqCgoqIE1vZGVsOiBIUCBPTUVOIFRyYW5zY2VuZCBHYW1p
bmcgTGFwdG9wIDE0LWZiMHh4eAoqIEJvYXJkIElEOiAqKjhDNTgqKgoqIENQVTogSW50ZWwgTWV0
ZW9yIExha2UtUAoqIEF1ZGlvOiBJbnRlbCBTT0YgKyBTb3VuZFdpcmUKKiBDb2RlYyhzKTogcnQ3
MTEtc2RjYSAoaGVhZHNldCksIHJ0MTMxNiAoc3BlYWtlciBhbXApCiogT1M6IFVidW50dSAyNC4w
NCBMVFMKCiMjIyAqKktlcm5lbHMgdGVzdGVkKioKCiogNi44LjAtODgtZ2VuZXJpYwoqIDYuOC4w
LTkwLWdlbmVyaWMKKiA2LjE0LjAtMTAwOC1vZW0KKiA2LjE0LjAtMTAxNC1vZW0KCi0tLQoKIyMj
ICoqRGVzY3JpcHRpb24qKgoKSW50ZXJuYWwgc3BlYWtlcnMgcHJvZHVjZSBubyBzb3VuZCBvbiBM
aW51eC4gU09GIGZpcm13YXJlIGFuZCBTb3VuZFdpcmUgZGV2aWNlcyBhcmUgZGV0ZWN0ZWQgc3Vj
Y2Vzc2Z1bGx5LCBhbmQgYSBTcGVha2VyIFBDTSBleGlzdHMsIGJ1dCBubyBVQ00gcHJvZmlsZSBj
b25maWd1cmVzIG9yIGVuYWJsZXMgdGhlIHNwZWFrZXIgcGF0aC4KCkF1ZGlvIHJlcG9ydGVkbHkg
d29ya2VkIGVhcmxpZXIgKE1heeKAk0p1bHkgMjAyNSkgYW5kIHN0b3BwZWQgYWZ0ZXIgYW4gdXBk
YXRlIGFyb3VuZCBBdWd1c3QgMjAyNS4KCi0tLQoKIyMjICoqRE1JIC8gYm9hcmQgaWRlbnRpZmlj
YXRpb24qKgoKYGBgCnN5c192ZW5kb3IgICA6IEhQCnByb2R1Y3RfbmFtZSA6IE9NRU4gVHJhbnNj
ZW5kIEdhbWluZyBMYXB0b3AgMTQtZmIweHh4CmJvYXJkX25hbWUgICA6IDhDNTgKYm9hcmRfdmVu
ZG9yIDogSFAKYGBgCgotLS0KCiMjIyAqKlNPRiB0b3BvbG9neSBpbiB1c2UqKgoKYGBgCmludGVs
L3NvZi1hY2UtdHBsZy9zb2YtbXRsLXJ0NzExLWwwLXJ0MTMxNi1sMy0yY2gudHBsZwpgYGAKCi0t
LQoKIyMjICoqYXBsYXkgLWwqKgoKYGBgCmNhcmQgMTogc29mc291bmR3aXJlIFtzb2Ytc291bmR3
aXJlXSwgZGV2aWNlIDA6IEphY2sgT3V0CmNhcmQgMTogc29mc291bmR3aXJlIFtzb2Ytc291bmR3
aXJlXSwgZGV2aWNlIDI6IFNwZWFrZXIKY2FyZCAxOiBzb2Zzb3VuZHdpcmUgW3NvZi1zb3VuZHdp
cmVdLCBkZXZpY2UgMzE6IERlZXBidWZmZXIgSmFjayBPdXQKLi4uCmBgYAoKLS0tCgojIyMgKipB
TFNBIGRpcmVjdCB0ZXN0cyAoUGlwZVdpcmUgYnlwYXNzZWQpKioKCmBgYAphcGxheSAtRCBodzox
LDIgL3Vzci9zaGFyZS9zb3VuZHMvYWxzYS9Gcm9udF9DZW50ZXIud2F2CmFwbGF5IC1EIGh3OjEs
MCAvdXNyL3NoYXJlL3NvdW5kcy9hbHNhL0Zyb250X0NlbnRlci53YXYKYXBsYXkgLUQgaHc6MSwz
MSAvdXNyL3NoYXJlL3NvdW5kcy9hbHNhL0Zyb250X0NlbnRlci53YXYKYGBgCgpBbGwgZmFpbCB3
aXRoOgoKYGBgCmFwbGF5OiBzZXRfcGFyYW1zOiBDaGFubmVscyBjb3VudCBub24gYXZhaWxhYmxl
CmBgYAoKLS0tCgojIyMgKipVQ00gc3RhdHVzKioKCmBgYAovdXNyL3NoYXJlL2Fsc2EvdWNtMi9z
b2Ytc291bmR3aXJlLyAgLT4gZW1wdHkgKG5vIHByb2ZpbGVzKQpgYGAKCi0tLQoKIyMjICoqRXhw
ZWN0ZWQgcmVzdWx0KioKCkludGVybmFsIHNwZWFrZXJzIHdvcmsgdmlhIEFMU0EgLyBQaXBlV2ly
ZS4KCiMjIyAqKkFjdHVhbCByZXN1bHQqKgoKU3BlYWtlciBQQ00gZXhpc3RzIGJ1dCBpcyB1bnVz
YWJsZSBkdWUgdG8gbWlzc2luZyBVQ00gY29uZmlndXJhdGlvbi4KCiMjIyAqKlJlcXVlc3QqKgoK
QWRkIGEgVUNNIHByb2ZpbGUgZm9yIEhQIE9NRU4gVHJhbnNjZW5kIDE0IChib2FyZCA4QzU4KSB1
bmRlciBgc29mLXNvdW5kd2lyZWAsIGVuYWJsaW5nIHRoZSBzcGVha2VyIHBhdGggZm9yIHRoZSBl
eGlzdGluZyBTT0YgdG9wb2xvZ3kuCgoKIyMjIE9wdGlvbmFsIG5vdGVzIC8gc3VnZ2VzdGlvbnMK
ClRoaXMgcGxhdGZvcm0gdXNlcyBTT0YgU291bmRXaXJlIHdpdGggcnQxMzE2IHNwZWFrZXIgYW1w
IGFuZCBydDcxMSBoZWFkc2V0IGNvZGVjLCBhbmQgdGhlIGxvYWRlZCB0b3BvbG9neSBhbHJlYWR5
IHN1cHBvcnRzIGEgMi1jaGFubmVsIHNwZWFrZXIgcGF0aDoKCnNvZi1tdGwtcnQ3MTEtbDAtcnQx
MzE2LWwzLTJjaC50cGxnCgoKSXQgbWF5IGJlIHBvc3NpYmxlIHRvIGFkYXB0IG9yIGNsb25lIGFu
IGV4aXN0aW5nIEhQIFNvdW5kV2lyZSBVQ00gcHJvZmlsZSBmb3IgTWV0ZW9yIExha2UgcGxhdGZv
cm1zIHVzaW5nIHJ0MTMxNiAoaWYgYXZhaWxhYmxlKSwgbWF0Y2hpbmcgRE1JIGJvYXJkIElEIGBI
UCAvIDhDNThgLgoKSSBhbSBoYXBweSB0byB0ZXN0IHBhdGNoZXMgb3IgcHJvdmlkZSBhZGRpdGlv
bmFsIGxvZ3MgaWYgbmVlZGVkLgoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9h
bHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9pc3N1ZXMvNjYxClJlcG9zaXRvcnkgVVJMOiBodHRw
czovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYK
