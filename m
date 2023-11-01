Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C79887DDA7B
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 02:04:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FED94E;
	Wed,  1 Nov 2023 02:03:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FED94E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698800642;
	bh=+YS+fENUfeRWGNAbTa7pxfCCY0IV8yQdLh56IiqQ+x0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FKiSOtCRIgSQGcwpE1nf/iReNjJNH4I0mdMO4qIvEIzzGOHiNCQTzJqfJ/+/3ghlb
	 ItClTX3mIerC7h4qWpahWSR0zWD1AGEf0HQ048i1mRIQGb/iVFPHgTloYk9VNaHHlZ
	 7VifGcHc+VcD+9ynGv+QbX+Ti9VBhLm2ETyWq/mA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C9E8F80425; Wed,  1 Nov 2023 02:03:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6FFAF8016D;
	Wed,  1 Nov 2023 02:03:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B789F8020D; Wed,  1 Nov 2023 02:02:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E13F1F80152
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 02:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13F1F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698800535719654799-webhooks-bot@alsa-project.org>
References: <1698800535719654799-webhooks-bot@alsa-project.org>
Subject: Initialise AIF2 ADC Stereo Capture Route
Message-Id: <20231101010223.2B789F8020D@alsa1.perex.cz>
Date: Wed,  1 Nov 2023 02:02:23 +0100 (CET)
Message-ID-Hash: JGHMHC2JC247XF565LCXSOOJOQ7CJFNJ
X-Message-ID-Hash: JGHMHC2JC247XF565LCXSOOJOQ7CJFNJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGHMHC2JC247XF565LCXSOOJOQ7CJFNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #365 was opened from broukema:

As pointed out in issue #351 [1], the parameter 'AIF2 ADC Stereo Capture Route' was previously uninitialised. I'm not very convinced that this particular value (Mix Mono) is the best combination with the other PinePhone settings, but better that there is at least a value rather than no value, so that people can provide bug reports based on tests that are closer to being reproducible. As described in [1], there is circumstantial evidence favouring this value.

This commit does not set a value for HiFi.conf - presumably the value is irrelevant for HiFi, which does not appear to be as buggy as VoiceCall.

[1] https://github.com/alsa-project/alsa-ucm-conf/issues/351

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/365
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/365.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
