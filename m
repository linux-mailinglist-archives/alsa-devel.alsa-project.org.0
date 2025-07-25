Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B623AB11DDB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jul 2025 13:46:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0B6A60228;
	Fri, 25 Jul 2025 13:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0B6A60228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753443993;
	bh=OzBBt68aYz1kIdlvcERuMb/PPJkcnjkir9+WHjZMuNw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iqz650BT1eZqUfy455SjicOl49Ot4OcNaf7fukWzeo1o0MZsOEgSltmlHCYZXuDWO
	 5WYPVbYAO3eqeZJlhOpZk4199N0PfaVMq2i1WkdPXzL4dmwiBs9hUHfSqSETPROyof
	 G7XPRWWIL6fMwe43rVxQeVP3zc+eH7JnTWTO5K5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCA50F805C9; Fri, 25 Jul 2025 13:46:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EE5BF80134;
	Fri, 25 Jul 2025 13:45:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19C8F804FB; Fri, 25 Jul 2025 13:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 383CEF8047D
	for <alsa-devel@alsa-project.org>; Fri, 25 Jul 2025 13:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 383CEF8047D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18557bf40ddb0300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/tinycompress/pr/29@alsa-project.org>
References: <alsa-project/tinycompress/pr/29@alsa-project.org>
Subject: tinycompress: add support for new SNDRV_COMPRESS_TSTAMP64 and
 _AVAIL64
Date: Fri, 25 Jul 2025 13:45:22 +0200 (CEST)
Message-ID-Hash: CHJR3YXDVJNONCPTXH5KKL335YERI3A3
X-Message-ID-Hash: CHJR3YXDVJNONCPTXH5KKL335YERI3A3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHJR3YXDVJNONCPTXH5KKL335YERI3A3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/tinycompress pull request #29 was opened from jorisverhaegen:

These 2 ioctl are under review to be added to kernel. See https://lore.kernel.org/linux-sound/20250725114249.2086974-1-verhaegen@google.com/T/#t

This pull request should be merged after this kernel is available.

Request URL   : https://github.com/alsa-project/tinycompress/pull/29
Patch URL     : https://github.com/alsa-project/tinycompress/pull/29.patch
Repository URL: https://github.com/alsa-project/tinycompress
