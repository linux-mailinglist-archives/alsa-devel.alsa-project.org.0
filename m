Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAD9FACAA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 10:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA0F601C6;
	Mon, 23 Dec 2024 10:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA0F601C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734947290;
	bh=fCGJ/QJyGAhhQ4DmbYhs4mNemZWfvAgKWXcTTprfI4A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nIYUF/sQmNdWf1D+bxOzaurf7qFk+Kw16BQpCp93AehRX6v1PaYcR2BmCnV15+ck3
	 u2Kq/Bxx05uiMSh0rlcAd+M7lC4jf0PXw40Q4zR3y0ob1vO9bZ9FZu8X2SW297kkEz
	 nS0G2wm8Wv91KkIdbwyVMqq+3XY7EI+6DTmv8ORU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6CEDF805C0; Mon, 23 Dec 2024 10:47:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A88E3F805C0;
	Mon, 23 Dec 2024 10:47:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD4B1F80254; Mon, 23 Dec 2024 10:47:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A8BF800B8
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 10:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A8BF800B8
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734947246699572086-webhooks-bot@alsa-project.org>
References: <1734947246699572086-webhooks-bot@alsa-project.org>
Subject: Acer 315-24P Microphone indicator is not working
Message-Id: <20241223094728.DD4B1F80254@alsa1.perex.cz>
Date: Mon, 23 Dec 2024 10:47:28 +0100 (CET)
Message-ID-Hash: UWGTRLSAI5W3S2NE4BK2PG6WTTL7FCM7
X-Message-ID-Hash: UWGTRLSAI5W3S2NE4BK2PG6WTTL7FCM7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWGTRLSAI5W3S2NE4BK2PG6WTTL7FCM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgaXNzdWUgIzI4NCB3YXMgZWRpdGVkIGZyb20gUml2ZXIw
MDAwMDA6CgohW9C40LfQvtCx0YDQsNC20LXQvdC40LVdKGh0dHBzOi8vZ2l0aHViLmNvbS91c2Vy
LWF0dGFjaG1lbnRzL2Fzc2V0cy9kYzhiMGI5YS1mODc3LTRlZGMtYTllYi1kMWM0ZDFkMmZjYjcp
DQohW9C40LfQvtCx0YDQsNC20LXQvdC40LVdKGh0dHBzOi8vZ2l0aHViLmNvbS91c2VyLWF0dGFj
aG1lbnRzL2Fzc2V0cy81ZjhmMWM2OS0yOTRiLTQ4MzMtOGJkZi05YzJmODAzM2MzNzkpDQoNCmFs
c2EtaW5mbzogW2Fsc2EudHh0XShodHRwczovL2dpdGh1Yi5jb20vdXNlci1hdHRhY2htZW50cy9m
aWxlcy8xODIyNzk1MC9hbHNhLnR4dCkKCklzc3VlIFVSTCAgICAgOiBodHRwczovL2dpdGh1Yi5j
b20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMvaXNzdWVzLzI4NApSZXBvc2l0b3J5IFVSTDogaHR0
cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzCg==
