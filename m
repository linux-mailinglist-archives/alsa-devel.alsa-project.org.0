Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B499D87741F
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 23:49:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 283DAB70;
	Sat,  9 Mar 2024 23:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 283DAB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710024582;
	bh=seAQsChZ/nOLEZ16UcF6qB1tjmOfPV2dZlKDr/ksDWU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=do9qk2O39VEpPh7TAyh3JxO9vnaDSVxJo5Aah6xczOzNI0+oOgeuMcLk1TvJi4v26
	 cyq6YcJVyjIq0zaRMnDIlhTAxV63rQR6SZBG4LX1D4jvJFplrQ2/YVCPJXI7Z+nZIP
	 U05bW42eNqa/rNN78scWZchjg0u2YfMxAszAkJWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B78F805A0; Sat,  9 Mar 2024 23:49:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC2EF805A0;
	Sat,  9 Mar 2024 23:49:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F34F8024E; Sat,  9 Mar 2024 23:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B277CF8014B
	for <alsa-devel@alsa-project.org>; Sat,  9 Mar 2024 23:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B277CF8014B
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710024540107431173-webhooks-bot@alsa-project.org>
References: <1710024540107431173-webhooks-bot@alsa-project.org>
Subject: PinePhone HiFi.conf regresion
Message-Id: <20240309224905.A0F34F8024E@alsa1.perex.cz>
Date: Sat,  9 Mar 2024 23:49:05 +0100 (CET)
Message-ID-Hash: LNQZIIKMC6UHLBRWX4FGJXS32ZRE3K6L
X-Message-ID-Hash: LNQZIIKMC6UHLBRWX4FGJXS32ZRE3K6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNQZIIKMC6UHLBRWX4FGJXS32ZRE3K6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgaXNzdWUgIzM5OSB3YXMgb3BlbmVkIGZyb20gbmVz
bmVyYToKCk5vIEF1ZGlvIFBsYXliYWNrIHdpdGggY3VycmVudCBIaUZpLmNvbmYuIEFzIFtQaGls
aXAgTcO8bGxlcl0oaHR0cHM6Ly9naXRsYWIubWFuamFyby5vcmcvcGhpbG0pIFtjb21tZW50c10o
aHR0cHM6Ly9naXRsYWIubWFuamFyby5vcmcvbWFuamFyby1hcm0vaXNzdWVzL3BpbmVwaG9uZS9w
aG9zaC8tL2lzc3Vlcy8yODIjbm90ZV8yOTg4MCksIGl0IGxvb2tzIGxpa2UgYSByZWdyZXNzaW9u
LiBbVGhpcyB2ZXJzaW9uXShodHRwczovL2dpdGxhYi5tYW5qYXJvLm9yZy9tYW5qYXJvLWFybS9p
c3N1ZXMvcGluZXBob25lL3Bob3NoLy0vaXNzdWVzLzI4MiNub3RlXzI5ODc5KSBpcyBmdW5jdGlv
bmFsLgoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxz
YS11Y20tY29uZi9pc3N1ZXMvMzk5ClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20v
YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYK
