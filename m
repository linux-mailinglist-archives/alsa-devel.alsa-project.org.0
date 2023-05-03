Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8F6F5AD9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 17:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E677912DC;
	Wed,  3 May 2023 17:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E677912DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683127244;
	bh=3IwhjS9qkQ91bj61qm5pyCPrrEwto3HyX7BlhQ4xTdM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uS0ZriDiKutYaOy7X6Wg8iexNfLISnDuo10X15KgXKZhQGABUizWvWFGZ1LByXXfH
	 xhMB/8bwILwaUM7PAmsxJ5bddb7Ld2RmKoVmWB8OTaSGzpYViS2J+JVsbFXF70bJIH
	 DfkYq4yUKWvzocRsaqwG7OPVvX7vjt9vl0s5pWBU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21CD4F80137;
	Wed,  3 May 2023 17:19:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBCA6F8032B; Wed,  3 May 2023 17:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D13F800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 17:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D13F800EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683127187539551497-webhooks-bot@alsa-project.org>
References: <1683127187539551497-webhooks-bot@alsa-project.org>
Subject: ucm2: USB-Audio: Add support for Focusrite Scarlett Solo devices
Message-Id: <20230503151949.DBCA6F8032B@alsa1.perex.cz>
Date: Wed,  3 May 2023 17:19:49 +0200 (CEST)
Message-ID-Hash: AVP6YWX77AUKAZLZ2JR3MDGQHEQEQ6U3
X-Message-ID-Hash: AVP6YWX77AUKAZLZ2JR3MDGQHEQEQ6U3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVP6YWX77AUKAZLZ2JR3MDGQHEQEQ6U3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #309 was opened from kepstin:

These are basically identical to the Scarlett 2i2 devices of the same generation; the difference is that the first input can only be used for a mic, and the second input can only be used for line/instrument. (On the 2i devices, both inputs are the same - they both have mic preamps, and both support line/instrument input.)

I've added a new profile for them so the Comment can be set to the correct device name, but because of the similarity between the Solo and 2i devices, I've re-used the existing Scarlett-2i-HiFi use case to set up the split input devices.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/309
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/309.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
