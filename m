Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA5B3ADE9
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Aug 2025 00:56:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0122602B2;
	Fri, 29 Aug 2025 00:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0122602B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756421816;
	bh=HPXGiveb+FMAmlD/zSU575zD0C7m/8G9FUKREusQNL0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Jgis31TCHgMZ19eZFwG+ItftJNAtrFiyodqcn76TtBHk6dB7sXkukq9KpH5Uv1kNb
	 Vz/RJagPVNFKqL/gKlIatuGYnLe8b8RnPNIwsLLuOh/RYQQS+B6WNofKpyGhN+Ipnx
	 M+p3LQG85GNsEMeZy+NYneBqRXAPtbePGY/vVq60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1893F805C4; Fri, 29 Aug 2025 00:56:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 678CDF805C3;
	Fri, 29 Aug 2025 00:56:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D90BFF80171; Fri, 29 Aug 2025 00:55:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A61F80149
	for <alsa-devel@alsa-project.org>; Fri, 29 Aug 2025 00:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A61F80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1860104579b6c000-webhooks-bot@alsa-project.org>
In-Reply-To: <1860104576d77300-webhooks-bot@alsa-project.org>
References: <1860104576d77300-webhooks-bot@alsa-project.org>
Subject: when i click apply HDAjackretask is not respoding
Date: Fri, 29 Aug 2025 00:55:47 +0200 (CEST)
Message-ID-Hash: E7JZIYZHIJZWFXTOPWW45GOGMDBRYV2S
X-Message-ID-Hash: E7JZIYZHIJZWFXTOPWW45GOGMDBRYV2S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7JZIYZHIJZWFXTOPWW45GOGMDBRYV2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #40 was opened from m33rxj:

I'm using a hp envy x360 and when i try change and override the pins to allow the front speakers and click apply, it says on the gui 'its not responding' it happened to me on ubuntu and now on cachyos. I'm not sure if my codec is unsupported? its RealTek ALC245  I'm trying to work on but even on the intel codec I get the same error. I forgot to mention I have pipewire but I'm unsure what I used for ubuntu at the time


Any chance I can get some help incase I'm doing something wrong.
<img width="656" height="869" alt="Image" src="https://github.com/user-attachments/assets/dfdd4d42-3979-4e89-9234-b49726d23f4b" />

<img width="808" height="295" alt="Image" src="https://github.com/user-attachments/assets/42f65770-e19d-40d3-8ec7-0521e345abab" />

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/40
Repository URL: https://github.com/alsa-project/alsa-tools
