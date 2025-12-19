Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72854CCF86B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Dec 2025 12:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA6226022B;
	Fri, 19 Dec 2025 12:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA6226022B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766142451;
	bh=ixAinEGK8ak593S43HCKdCqI27oqKZXW3EWvb0K5MjU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pfOMPc2yGMkrvn9ri++RexWj746zc7eiIiKdn2xZ4omoSFsEL3rGCuwUzTYOo9pLS
	 q+4rTHqIR3W8V8qez0xHdeupUeFc9x7OmE6Ac1H/wDxDG/CU9xgQPrzVYMZ2o/1Gsm
	 SyYDEHFvU+6EeNjDhT/7mhQzzVVkB71PaLJGc/8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39D36F805D8; Fri, 19 Dec 2025 12:06:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A763EF805D3;
	Fri, 19 Dec 2025 12:06:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0F10F80508; Fri, 19 Dec 2025 12:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D150FF800B8
	for <alsa-devel@alsa-project.org>; Fri, 19 Dec 2025 12:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D150FF800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <188299187bf20900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/633@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/633@alsa-project.org>
Subject: ucm2: sof: hdmi: Add 5.1 and 7.1 variants of HDMI devices when using
 IPC4
Date: Fri, 19 Dec 2025 12:05:37 +0100 (CET)
Message-ID-Hash: ERSIIFO44ZEFKTTXJ2AR7HNVRHSTO44H
X-Message-ID-Hash: ERSIIFO44ZEFKTTXJ2AR7HNVRHSTO44H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERSIIFO44ZEFKTTXJ2AR7HNVRHSTO44H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #633 was reopened from ujfalusi:

Systems using IPC4 can support up to 8 channels of audio (and passthrough) via HDMI.

In UCM the default PlaybackChannels is set to 2, which prevents users from selecting multichannel configurations.

When probing the card, Pipewire will drop configurations that are not supported either by the PCM device or based on ELD information.
This means that if the equipment supports only stereo then the 5.1 and 7.1 variants should not be visible, if the equipment is 5.1 capable, then only the 7.1 variant is removed.

The kernel will refine the PCM parameters based on the ELD information as wall when https://lore.kernel.org/linux-sound/20251029073600.13624-1-peter.ujfalusi@linux.intel.com/ is applied.

@perexg, @wtay, @ford-prefect, is this something which can help PW and user space to handle the HDMI a bit better with SOF?

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/633
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/633.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
