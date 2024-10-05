Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA499191D
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2024 19:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD93825;
	Sat,  5 Oct 2024 19:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD93825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728151084;
	bh=LieFVAIbXUN7zbgZjzzq27QI1Ooi2GZd+qcx0u2VLZw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jEQq7Dep2UOrO48UnmmhukFFR7MDI0PVO2UVDvJ4UqIemW/HRCRBKo3LHdILIcwP0
	 axANtOnspKuTzK7bm6GMsMlLM/nABZyNq8huNKObUfZHHR35mA1xT1lvd1LeUmncNK
	 GLs9qz4e2o5qeBIW0jmTCk/uRyJf/Ig7IVUJQEhQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4496EF805A8; Sat,  5 Oct 2024 19:57:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 766F9F805AE;
	Sat,  5 Oct 2024 19:57:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 544F9F80517; Sat,  5 Oct 2024 19:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 975D8F80107
	for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2024 19:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975D8F80107
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1728151044869501591-webhooks-bot@alsa-project.org>
References: <1728151044869501591-webhooks-bot@alsa-project.org>
Subject: Ubuntu 24.04 microphone is not working  USB-Audio: ALC4080  Z-590E
Message-Id: <20241005175727.544F9F80517@alsa1.perex.cz>
Date: Sat,  5 Oct 2024 19:57:27 +0200 (CEST)
Message-ID-Hash: 4TLG2IFKJTI6V5BQ625WUO52WTPPO7PK
X-Message-ID-Hash: 4TLG2IFKJTI6V5BQ625WUO52WTPPO7PK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TLG2IFKJTI6V5BQ625WUO52WTPPO7PK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzQ0NyB3YXMgZWRpdGVkIGZyb20gaml1
dGlhbjEyOgoKTXkgcmVhciBtaWNyb3Bob25lIGlzIG5vdCB3b3JraW5nIG9uIFVidW50dSAyNC4w
NCAobm9yIG9uIFVidW50dSAyMiksIGJ1dCBpdCBjYW4gYmUgdXNlZCBub3JtYWxseSBvbiBXaW5k
b3dzIDEwLiBDYW4gaGVhciBzb3VuZA0KQWZ0ZXIgdXBkYXRpbmcgdGhlIG1hc3RlciBicmFuY2gs
IHRoZSBtaWNyb3Bob25lIHN0aWxsIGRvZXNuJ3Qgd29yaywgYnV0IHRoZSByZXNwb25zZSBpcyB0
aGUgc2FtZSBhcyB0aGUgc291bmQgc3lzdGVtDQpJbml0aWFsIGZlZWRiYWNrIG9uIHRoZSBpc3N1
ZSwgdGhlIGZvbGxvd2luZyBpcyBteSBoYXJkd2FyZSBpbmZvcm1hdGlvbiwgSSBhbSBub3Qgc3Vy
ZSBpZiBpdCBpcyBjb21wbGV0ZQ0KaHR0cDovL2Fsc2EtcHJvamVjdC5vcmcvZGIvP2Y9MjU1OGYw
M2ZmZDhjNTVlMThmODIwOGE4MDZmM2UyMzM2ZDlmYTQ5Yw0KS2VybmVsOiBrNi44LjAtNDUtZ2Vu
ZXJpYw0KVVNCLUF1ZGlvOiBBTEM0MDgwIA0KUk9HIFNUUklYIFo1OTAtRQ0KDQpUaGlzIGNvbW1h
bmQgY2FuIGJlIHJlY29yZGVkLCBidXQgdGhlIHNvdW5kIGlzIHZlcnkgbG9377yaDQphcmVjb3Jk
IC1EIHBsdWdodzoxLDAgLWMgMSAtciAxNjAwMCAtZiBTMTZfTEUgb3V0cHV0LndhdgoKSXNzdWUg
VVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9p
c3N1ZXMvNDQ3ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0
L2Fsc2EtdWNtLWNvbmYK
