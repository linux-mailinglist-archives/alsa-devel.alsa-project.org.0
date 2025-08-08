Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A5B1EE2E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Aug 2025 20:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 019E860267;
	Fri,  8 Aug 2025 20:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 019E860267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754676382;
	bh=Qodvm1wT/d/fBIjTeZmRyjtQtUeSoBzpQwBsN50hq+I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Yr4UMrj70T2ulyeKp7q7KWq8cLn20rJocBP5nf9xQMXHJ8Ubc6AL9n6/WMfYXHbGp
	 Tawlt+haPQEYQRPMTR/WOKwTRGSboV0O1WvWcFCMmyDZhXn0UcZ+dpHthNiOL/7da7
	 JrOdQfMLBb/nVG6QJjFzbejghmYPz3R1ShRL8A80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 089C4F805CA; Fri,  8 Aug 2025 20:05:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 809E7F800F8;
	Fri,  8 Aug 2025 20:05:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01920F8024C; Fri,  8 Aug 2025 20:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2630FF800F8
	for <alsa-devel@alsa-project.org>; Fri,  8 Aug 2025 20:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2630FF800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1859dcd55c8d4e00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/39@alsa-project.org>
References: <alsa-project/alsa-tools/pr/39@alsa-project.org>
Subject: Update hdajackretask.desktop
Date: Fri,  8 Aug 2025 20:05:41 +0200 (CEST)
Message-ID-Hash: ZDCBJ3EB6JCBME5N5FAL2VMO5UB6XXJN
X-Message-ID-Hash: ZDCBJ3EB6JCBME5N5FAL2VMO5UB6XXJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZDCBJ3EB6JCBME5N5FAL2VMO5UB6XXJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #39 was opened from trebmuh:

- adds a FR comment
- change the "genericname" to "Comment"
- adds a Icon= field (close #38 )

Request URL   : https://github.com/alsa-project/alsa-tools/pull/39
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/39.patch
Repository URL: https://github.com/alsa-project/alsa-tools
