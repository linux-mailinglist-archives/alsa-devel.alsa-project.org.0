Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05D86260B
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Feb 2024 17:37:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA6F683E;
	Sat, 24 Feb 2024 17:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA6F683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708792636;
	bh=vPKRfTfTQKo0yBGzyT/S9fc1fksY8N7WXLzbsFcFfSM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K1CK+q8vNsJyFam3J+wBBKZaKnyYuzAi17tFQ1JhaOh2IZkIDQjt6eI7JhJvjXzrG
	 XcnRnv5sG/X81GytxNQ1UiIUqk+TzjoO0/d2PQU22K2kDD320BrVdac7GXrsGcsSyl
	 K6+KDE7p7Cunsilq1yJORxuOHDTd0E/wEAl0V/ms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09886F80589; Sat, 24 Feb 2024 17:36:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A286F805A0;
	Sat, 24 Feb 2024 17:36:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75AE5F80496; Sat, 24 Feb 2024 17:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F413F800ED
	for <alsa-devel@alsa-project.org>; Sat, 24 Feb 2024 17:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F413F800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1708792497841289282-webhooks-bot@alsa-project.org>
References: <1708792497841289282-webhooks-bot@alsa-project.org>
Subject: pulseaudio: rewind does not seem to work properly
Message-Id: <20240224163504.75AE5F80496@alsa1.perex.cz>
Date: Sat, 24 Feb 2024 17:35:04 +0100 (CET)
Message-ID-Hash: HIHFFDGD5N2TIMD3TOCAM5RCUR6TIA7U
X-Message-ID-Hash: HIHFFDGD5N2TIMD3TOCAM5RCUR6TIA7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIHFFDGD5N2TIMD3TOCAM5RCUR6TIA7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #56 was opened from z-s-e:

In my application, after I use `snd_pcm_rewind()` strange things happen, such as `snd_pcm_status_get_avail()` reporting a value larger than `period_count * frames_per_period` which my app depends on to never happen.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/56
Repository URL: https://github.com/alsa-project/alsa-plugins
