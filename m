Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76B9FAC97
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 10:47:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C0A601CE;
	Mon, 23 Dec 2024 10:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C0A601CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734947251;
	bh=1fcfB971ROB8ORIvyE39GaALLD6+SXRUl6hZcZcPPnE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bXoKo4Tz7b+Yr0ElqEZjs/95yqCtHVrFpJxAgmEfd6A3L5jwH4qbY4EFP6U2yv5yy
	 +kvXrXLYkIhYca8tRok5FIf1C9frijMG4KSvvHt9ndMnrHXo3DjtsP16RCh2A8CmeR
	 rt+stpqisbtp+vrsJTen5ZUjKAtPoRU1M+xWsd3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37637F805BE; Mon, 23 Dec 2024 10:46:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25326F805C0;
	Mon, 23 Dec 2024 10:46:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E24EEF80254; Mon, 23 Dec 2024 10:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_00,DOS_BODY_HIGH_NO_MID,
	MISSING_DATE,MISSING_MID,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D66AF8012B
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 10:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D66AF8012B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734947205211907864-webhooks-bot@alsa-project.org>
References: <1734947205211907864-webhooks-bot@alsa-project.org>
Subject: Acer 315-24P Microphone indicator is not working
Message-Id: <20241223094646.E24EEF80254@alsa1.perex.cz>
Date: Mon, 23 Dec 2024 10:46:46 +0100 (CET)
Message-ID-Hash: JTHSX7XJEDDLCSF3ZRKE6VAXRFFJJD66
X-Message-ID-Hash: JTHSX7XJEDDLCSF3ZRKE6VAXRFFJJD66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JTHSX7XJEDDLCSF3ZRKE6VAXRFFJJD66/>
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
aG1lbnRzL2Fzc2V0cy81ZjhmMWM2OS0yOTRiLTQ4MzMtOGJkZi05YzJmODAzM2MzNzkpDQoNClth
bHNhLnR4dF0oaHR0cHM6Ly9naXRodWIuY29tL3VzZXItYXR0YWNobWVudHMvZmlsZXMvMTgyMjc5
NTAvYWxzYS50eHQpCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJv
amVjdC9hbHNhLXV0aWxzL2lzc3Vlcy8yODQKUmVwb3NpdG9yeSBVUkw6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9hbHNhLXByb2plY3QvYWxzYS11dGlscwo=
