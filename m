Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC070FE1E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 21:00:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F42A1FC;
	Wed, 24 May 2023 20:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F42A1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684954813;
	bh=IbpbE0no+ztuUgEXJ+p55koUWuR7Do8/Hy17tnPRtAI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EpDdSmwlO9mpbJ7/i8oL0nwIkyhvNdRQyFH4bEnyKOogFPn57FW6qMXfaEIErvn/e
	 H/gg8CE0yGUMNEplF00nqYUeJ5OxnA7jUIZ2/hAhGXmCgiMcuyRllQk55UJEeQmU3p
	 3YNfcme+PIbkmoZ1crS4ChqKbzLhrnl6V5nR7rT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1564F80053; Wed, 24 May 2023 20:59:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67962F8016A;
	Wed, 24 May 2023 20:59:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B866FF80249; Wed, 24 May 2023 20:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CF981F80007
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 20:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF981F80007
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684954753489605427-webhooks-bot@alsa-project.org>
References: <1684954753489605427-webhooks-bot@alsa-project.org>
Subject: How fix microphone for ALC4080
Message-Id: <20230524185917.B866FF80249@alsa1.perex.cz>
Date: Wed, 24 May 2023 20:59:17 +0200 (CEST)
Message-ID-Hash: 24A6XYIGLPNT6MK3CHNGK33JN6F4DNLW
X-Message-ID-Hash: 24A6XYIGLPNT6MK3CHNGK33JN6F4DNLW
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24A6XYIGLPNT6MK3CHNGK33JN6F4DNLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzMxNyB3YXMgb3BlbmVkIGZyb20gaDRr
dW5hOgoKSGVsbG8sDQppJ2FtIHJ1bm5pbmcgb24gVWJ1bnR1IDIyLjA0IHdoZXJlIGlzIGBsc2Et
dWNtLWNvbmYgMS4yLjYuMy0xdWJ1bnR1MS41YC4gVGhlIHNvdW5kIGNhcmQgZG9lcyd0IHdvcmsu
IEkgaGF2ZSBtb3RoZXJib2FyZCBbTUFHIFg1NzBTIFRPTUFIQVdLIE1BWCBXSUZJXShodHRwczov
L3d3dy5tc2kuY29tL01vdGhlcmJvYXJkL01BRy1YNTcwUy1UT01BSEFXSy1NQVgtV0lGSS9TcGVj
aWZpY2F0aW9uKSB3aGVyZSBpcyBgUmVhbHRla8KuIEFMQzQwODBgLiBJIHNhdywgaXQgYWRkZWQg
bGF0ZXIuIEkgdHJ5IHRvIHVzZSBsaXZlIENEIHVidW50dSAyMy4wNCwgd2hlcmUgc291bmQgd29y
a3MsIGJ1dCBtaWNyb3Bob25lIHN0aWxsIGRvZXNuJ3Qgd29yay4NCg0KDQojIyMgVWJ1bnR1IDIy
LjA0DQpPdXRwdXQgZnJvbSBbYWxzYS1pbmZvXShodHRwOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/
Zj1kMmU0MDcwNTY2MmZjNmEwZjllNjRhZjhlNjRiZmQwZGVkMzA0YWFlKQ0KDQpgYGANCmxzdXNi
IHwgZ3JlcCAnVVNCIEF1ZGlvJw0KQnVzIDAwMyBEZXZpY2UgMDAyOiBJRCAwZGIwOmEwNzMgTWlj
cm8gU3RhciBJbnRlcm5hdGlvbmFsIFVTQiBBdWRpbw0KYGBgDQoNCldoYXQgY2FuIGkgdG8gZG8g
Zm9yIGZpeCBtaWNyb3Bob25lPyBXaGF0IGRvIHlvdSBuZWVkIGluZm9ybWF0aW9uPwoKSXNzdWUg
VVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9p
c3N1ZXMvMzE3ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0
L2Fsc2EtdWNtLWNvbmYK
