Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB09FAC81
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 10:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BF26601C5;
	Mon, 23 Dec 2024 10:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BF26601C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734947208;
	bh=HAu/ZuBvJVE47GW0z+C842PNvU6yZ20me4J35L6tHv0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NvF8wVz4bJpQiIBf4P00pyQYM9llgW8gJUCIhOAJZ2Kcc5yrSk+v3ks11+uedpAg/
	 0lZZopR3QFja5XaZIOyhP8OAjGG742R+YwBVRB+k9GqTlc41zF3zrqmUYaN4K2b4BF
	 3lvmeZjU2AqAO9lkHnLVOy6AsMkFMoq9Snmd6hv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6623DF805BB; Mon, 23 Dec 2024 10:46:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB20F805BE;
	Mon, 23 Dec 2024 10:46:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C2ADF80254; Mon, 23 Dec 2024 10:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BAAFF8012B
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 10:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BAAFF8012B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734947163776054859-webhooks-bot@alsa-project.org>
References: <1734947163776054859-webhooks-bot@alsa-project.org>
Subject: Acer 315-24P Microphone indicator is not working
Message-Id: <20241223094607.3C2ADF80254@alsa1.perex.cz>
Date: Mon, 23 Dec 2024 10:46:07 +0100 (CET)
Message-ID-Hash: CHN2SYCBVOY32P5H6PG2CEJTNVL36Z5Q
X-Message-ID-Hash: CHN2SYCBVOY32P5H6PG2CEJTNVL36Z5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHN2SYCBVOY32P5H6PG2CEJTNVL36Z5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgaXNzdWUgIzI4NCB3YXMgb3BlbmVkIGZyb20gUml2ZXIw
MDAwMDA6CgpbYWxzYS50eHRdKGh0dHBzOi8vZ2l0aHViLmNvbS91c2VyLWF0dGFjaG1lbnRzL2Zp
bGVzLzE4MjI3OTUwL2Fsc2EudHh0KQ0KIVvQuNC30L7QsdGA0LDQttC10L3QuNC1XShodHRwczov
L2dpdGh1Yi5jb20vdXNlci1hdHRhY2htZW50cy9hc3NldHMvZGM4YjBiOWEtZjg3Ny00ZWRjLWE5
ZWItZDFjNGQxZDJmY2I3KQ0KIVvQuNC30L7QsdGA0LDQttC10L3QuNC1XShodHRwczovL2dpdGh1
Yi5jb20vdXNlci1hdHRhY2htZW50cy9hc3NldHMvNWY4ZjFjNjktMjk0Yi00ODMzLThiZGYtOWMy
ZjgwMzNjMzc5KQoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2pl
Y3QvYWxzYS11dGlscy9pc3N1ZXMvMjg0ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5j
b20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMK
