Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0206B8C8D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 09:06:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 735841424;
	Tue, 14 Mar 2023 09:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 735841424
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678781207;
	bh=IKRvo1OoITDTUvd4oou/WgsaXyQOcsNYF4K882rzMa4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=A/EMV5fDQm7MQcM6im/gaQ7PoL6dNYHOg4GfHFUHQ4hJYrOHUPsgMEgeICCV82O7Y
	 ChcYrD5tLT10n96iCUmtPhMCGCYR9dbTWGtSrX7lfPaoqMIzEFfagyuMHFuQqbMnr2
	 uH9wZfMZKMCnfTUzT3ZpMMTqURMu+sqB/MhVtDZo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB163F8032D;
	Tue, 14 Mar 2023 09:05:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D80DF80423; Tue, 14 Mar 2023 09:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E8E0AF80272
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 09:05:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E0AF80272
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1678781151383624792-webhooks-bot@alsa-project.org>
References: <1678781151383624792-webhooks-bot@alsa-project.org>
Subject: Tegra: add UCM configuration for RT5631,
 WM8903 and MAX98089 based devices
Message-Id: <20230314080553.5D80DF80423@alsa1.perex.cz>
Date: Tue, 14 Mar 2023 09:05:53 +0100 (CET)
Message-ID-Hash: ATNELGLUF2QB2EQKCYCLHZZHVBE4OVH6
X-Message-ID-Hash: ATNELGLUF2QB2EQKCYCLHZZHVBE4OVH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATNELGLUF2QB2EQKCYCLHZZHVBE4OVH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #291 was edited from clamor-s:

Proposed UCM configurations were tested for a while on wide range of devices.
Did not cause any issues so far.

List of supported devices using RT5631:
- ASUS TF201
- ASUS TF300TG
- ASUS TF300TL
- ASUS TF700T 

using WM8903:
- ASUS TF101
- ASUS SL101
- ASUS TF300T

using MAX98089
- LG P880
- LG P895

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/291
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/291.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
