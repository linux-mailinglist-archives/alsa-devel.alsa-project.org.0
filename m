Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265E1945F6E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 16:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD7B46D7;
	Fri,  2 Aug 2024 16:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD7B46D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722608979;
	bh=rcjXhvsDuJeuTyGqAQ6tnKXCWD0eYSsMOcl8vWz6m80=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=invGJUL2rZazOl4oBYiiqLEk+7xdA2PmjmeCHvmAEUx10OnwrkhW1CLG5TGg2+UY5
	 6dA3Jny+CaK9BXq2xivux0VMgKQS8peulFQeHZlFwSojgM/Ra14wSO/D16KRBrBvDX
	 U6243nFQ8PVWq4sHEbQ0syUXz3dLPe4MbsecdkPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C4A0F805A8; Fri,  2 Aug 2024 16:29:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A139FF8026A;
	Fri,  2 Aug 2024 16:29:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82D39F80269; Fri,  2 Aug 2024 16:29:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=KHOP_HELO_FCRDNS,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6ABF800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 16:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A6ABF800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1722608939700242281-webhooks-bot@alsa-project.org>
References: <1722608939700242281-webhooks-bot@alsa-project.org>
Subject: common: pcm: hdmi/sof-hda-dsp/sof-soundwire: Syntax 7 dependent macro
 to generate the hdmi device sections
Message-Id: <20240802142902.82D39F80269@alsa1.perex.cz>
Date: Fri,  2 Aug 2024 16:29:02 +0200 (CEST)
Message-ID-Hash: Q73CMK35PIDUV5NKTJVSDHSLF2RWSDHR
X-Message-ID-Hash: Q73CMK35PIDUV5NKTJVSDHSLF2RWSDHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q73CMK35PIDUV5NKTJVSDHSLF2RWSDHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #413 was edited from ujfalusi:

Hi,

The PR will introduce a generic `HdmiDevice` macro, which can replace duplicated conditions in sof UCM files and potentially used by other devices to generate the needed section for the hdmi PCM devices to allow passthrough.

The PR is marked as DNM and is in draft since the change depends on Syntax 7 support, which is only available in git version of alsa-lib, it is not a simple ask for a user (or developer) to use it and the change would break UCM for released alsa-lib.

@perexg, is this something that you were suggesting? I think the macro and it's definition is generic enough, I hope that it will be usable for non SOF setups.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/413
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/413.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
