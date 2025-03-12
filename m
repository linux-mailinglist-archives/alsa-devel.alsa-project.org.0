Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E0A5E2D7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Mar 2025 18:34:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3AC360281;
	Wed, 12 Mar 2025 18:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3AC360281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741800840;
	bh=+VAdVO+pnjkPuAI58PTf9mJmRp+M+UlP8G7odW7yLA4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Z4ySUEKYKT9AE1PJEVw0kCbEXo9OqDw2KTU1d8tqplPSOyeRI51D9OiS6CiKDXNFQ
	 ZekeKusNCsOj5VmH1cETzJFPrWZ1A7h8eIiomcPnLszoeEXIyun4GRrHqPzcOJTF+4
	 3nNJyuNKpOKWVgupD0SGzMZkkmMXMCcUnKv+8pdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F2DF805AF; Wed, 12 Mar 2025 18:33:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50E87F80552;
	Wed, 12 Mar 2025 18:33:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85EEDF80301; Wed, 12 Mar 2025 18:33:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D436EF80095
	for <alsa-devel@alsa-project.org>; Wed, 12 Mar 2025 18:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D436EF80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182c1e993f0f8c00-webhooks-bot@alsa-project.org>
In-Reply-To: <182c1e993e29ac00-webhooks-bot@alsa-project.org>
References: <182c1e993e29ac00-webhooks-bot@alsa-project.org>
Subject: Channel count in GoXLR SplitPCM configuration
Date: Wed, 12 Mar 2025 18:33:21 +0100 (CET)
Message-ID-Hash: NZFY5ATLZFIMWK53MSU3KCENNKWE23OE
X-Message-ID-Hash: NZFY5ATLZFIMWK53MSU3KCENNKWE23OE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZFY5ATLZFIMWK53MSU3KCENNKWE23OE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #518 was opened from pv:

Similar issue as #515, and related to #444:

We have a report https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4602#note_2819696 that GoXLR UCM profile with SplitPCM=1 specifies always 23 channels, but the device can't be opened with exactly 23 channels. According to https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4602#note_2819696 the device may have 21, 23, or 25 depending on firmware/etc details.

In Pipewire, I think we add a workaround that just uses the available channel count even if it is different from what UCM profile specifies, but logs warnings if the counts are different so these issues in the profiles can be caught.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/518
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
