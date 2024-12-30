Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF89FE9D6
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2024 19:28:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B263D60579;
	Mon, 30 Dec 2024 19:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B263D60579
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735583291;
	bh=OvXCSQwx6zxTwCOvO1EbWE0OIacmjbtKJ3+0fkxfHJU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PE/LlHvANpBpmoAl6bXn9siiExBxHHLX64oViD0v8e9QUOhM7id4IWOv513Xcjg+M
	 qvAE0NsF/ILQvybaZkzDpt/tm0xrXSGrffXFHJjkZqQG4iiNZnE8tKUIJFTb3BZoN9
	 eWhHMno8jPp7/nUQ8Qvt1pGLTB9UrjoE2HKX+tUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 882FFF805AC; Mon, 30 Dec 2024 19:27:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F65EF805BD;
	Mon, 30 Dec 2024 19:27:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 413BBF80508; Mon, 30 Dec 2024 19:27:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 90782F800FE
	for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2024 19:27:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90782F800FE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1735583241998181343-webhooks-bot@alsa-project.org>
References: <1735583241998181343-webhooks-bot@alsa-project.org>
Subject: alsa-lib-1.2.13 is breaking dssi-1.1.1 because of missing header
Message-Id: <20241230182728.413BBF80508@alsa1.perex.cz>
Date: Mon, 30 Dec 2024 19:27:28 +0100 (CET)
Message-ID-Hash: AGAHYAX336S57XGIDVTNXLXDKUREJEIE
X-Message-ID-Hash: AGAHYAX336S57XGIDVTNXLXDKUREJEIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGAHYAX336S57XGIDVTNXLXDKUREJEIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtbGliIGlzc3VlICM0MzEgd2FzIG9wZW5lZCBmcm9tIGtvYmJvaToK
CldoYXQgd2FzIHdvcmtpbmcgd2l0aCAxLjIuMTIgbm8gbG9uZ2VyIGlzbid0Og0KDQpgYGANCi91
c3IvaW5jbHVkZS9hbHNhL3VtcF9tc2cuaDoxMTE5OjY1OiBlcnJvcjogdW5rbm93biB0eXBlIG5h
bWUg4oCYc2l6ZV904oCZDQogMTExOSB8IGludCBzbmRfdW1wX21zZ19zeXNleF9leHBhbmQoY29u
c3QgdWludDMyX3QgKnVtcCwgdWludDhfdCAqYnVmLCBzaXplX3QgbWF4bGVuLA0KICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+DQovdXNyL2luY2x1ZGUvYWxzYS91bXBfbXNnLmg6MTM6MTogbm90ZTog4oCY
c2l6ZV904oCZIGlzIGRlZmluZWQgaW4gaGVhZGVyIOKAmDxzdGRkZWYuaD7igJk7IGRpZCB5b3Ug
Zm9yZ2V0IHRvIOKAmCNpbmNsdWRlIDxzdGRkZWYuaD7igJk/DQogICAxMiB8ICNpbmNsdWRlIDxz
dGRpbnQuaD4NCiAgKysrIHwrI2luY2x1ZGUgPHN0ZGRlZi5oPg0KICAgMTMgfA0KL3Vzci9pbmNs
dWRlL2Fsc2EvdW1wX21zZy5oOjExMjA6MzA6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhz
aXplX3TigJkNCiAxMTIwIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgKmZp
bGxlZCk7DQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+DQovdXNy
L2luY2x1ZGUvYWxzYS91bXBfbXNnLmg6MTEyMDozMDogbm90ZTog4oCYc2l6ZV904oCZIGlzIGRl
ZmluZWQgaW4gaGVhZGVyIOKAmDxzdGRkZWYuaD7igJk7IGRpZCB5b3UgZm9yZ2V0IHRvIOKAmCNp
bmNsdWRlIDxzdGRkZWYuaD7igJk/DQpgYGANCg0KQ2FuIHRoaXMgYmUgYWRkcmVzc2VkPyBIYXBw
eSBob2xpZGF5cyEKCklzc3VlIFVSTCAgICAgOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9q
ZWN0L2Fsc2EtbGliL2lzc3Vlcy80MzEKUmVwb3NpdG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHViLmNv
bS9hbHNhLXByb2plY3QvYWxzYS1saWIK
