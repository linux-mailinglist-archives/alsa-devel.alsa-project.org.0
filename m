Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C79C3C31
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2024 11:40:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C699F53;
	Mon, 11 Nov 2024 11:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C699F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731321643;
	bh=ZxmGI62Y92Ji7rqfem3DHm9eQ3KJsCVMoV7WKV/LtiU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dLRj3F9VLxxGsoLvHatstbrymUXIUPQSwfWUKjU4tewGgCI5LYdpT/6o5k3uyYyua
	 QVE41Rj9LGwd3DE0I0BE8IbgNN4APUvENFuHVmX7IObfOlgLMJXjc9oklIndfmSSc0
	 lFw4f8BVKENWiRu3ibNPMdjXgpnUG3HHOruRuScs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 832FDF80578; Mon, 11 Nov 2024 11:40:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B497EF80578;
	Mon, 11 Nov 2024 11:40:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BA6BF800C9; Mon, 11 Nov 2024 11:40:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2495AF800C9
	for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2024 11:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2495AF800C9
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731321603562063694-webhooks-bot@alsa-project.org>
References: <1731321603562063694-webhooks-bot@alsa-project.org>
Subject: USB-Audio: ALC4080: Add support for MSI MPG X870E CARBON WIFI
 (0db0:0b58)
Message-Id: <20241111104006.6BA6BF800C9@alsa1.perex.cz>
Date: Mon, 11 Nov 2024 11:40:06 +0100 (CET)
Message-ID-Hash: FEM6UDOUZGH3ROSLSHMYQ7DGR5JYH5NU
X-Message-ID-Hash: FEM6UDOUZGH3ROSLSHMYQ7DGR5JYH5NU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEM6UDOUZGH3ROSLSHMYQ7DGR5JYH5NU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgcHVsbCByZXF1ZXN0ICM0NjAgd2FzIG9wZW5lZCBm
cm9tIHhhdGllcjoKClRoaXMgUFIgdXBkYXRlcyB0aGUgcmVnZXggZm9yIE1TSSBNUEcgWDg3MEUg
Q0FSQk9OIFdJRkkgbW90aGVyYm9hcmQuDQoNCmBgYA0KJCBsc3VzYiB8IGFnIGF1ZGlvDQpCdXMg
MDAzIERldmljZSAwMDc6IElEIDBkYjA6MGI1OCBNaWNybyBTdGFyIEludGVybmF0aW9uYWwgVVNC
IEF1ZGlvDQpgYGANCg0KYGBgDQpBdWRpbwlSZWFsdGVrwq4gQUxDNDA4MCBDb2RlYw0KYGBgDQpo
dHRwczovL3d3dy5tc2kuY29tL01vdGhlcmJvYXJkL01QRy1YODcwRS1DQVJCT04tV0lGSS9TcGVj
aWZpY2F0aW9uCgpSZXF1ZXN0IFVSTCAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVj
dC9hbHNhLXVjbS1jb25mL3B1bGwvNDYwClBhdGNoIFVSTCAgICAgOiBodHRwczovL2dpdGh1Yi5j
b20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvcHVsbC80NjAucGF0Y2gKUmVwb3NpdG9yeSBV
Ukw6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZgo=
