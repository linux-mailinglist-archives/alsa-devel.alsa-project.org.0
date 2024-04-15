Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C88A5647
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 17:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F3FB1925;
	Mon, 15 Apr 2024 17:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F3FB1925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713194678;
	bh=s4pElKXidgrVwuji74xRdzh3BHxxk4NhPw4FDj+FQ1c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aBKrykLd6ItcUScQT0A5a3NYXF5sxk03pcDoTtv1sq1DkRT0ddHVCP6NISACMOjh4
	 2TrGFZ/I5UAyor+rTI0WjFM56TXznw42ZVHPwNeQx2aNqVGNSAgUo+LppqrAA+ktGm
	 AtLMZuCj8uPlzFFNBFiDYVINA3fbVX2ebGfUsF2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F025FF80570; Mon, 15 Apr 2024 17:24:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54CFEF805AA;
	Mon, 15 Apr 2024 17:24:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69252F8025A; Mon, 15 Apr 2024 17:24:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D0DF80124
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 17:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D0DF80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713194638435916901-webhooks-bot@alsa-project.org>
References: <1713194638435916901-webhooks-bot@alsa-project.org>
Subject: alsa-info.sh: log SoundWire devices reported in ACPI
Message-Id: <20240415152401.69252F8025A@alsa1.perex.cz>
Date: Mon, 15 Apr 2024 17:24:01 +0200 (CEST)
Message-ID-Hash: INBZMVR4PYRTRFS4FZHZ3COSDTAYKAYW
X-Message-ID-Hash: INBZMVR4PYRTRFS4FZHZ3COSDTAYKAYW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INBZMVR4PYRTRFS4FZHZ3COSDTAYKAYW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #264 was opened from plbossart:

Track SoundWire devices reported in ACPI, this will help detect missing or invalid configurations.

For now we only filter information from Realtek, Cirrus Logic and TI, based on the manufacturer ID of their devices.

Example log for the classic RT711/RT1316x2/RT714 configuration.

!!ACPI SoundWire Device Status Information
!!---------------

Realtek 0x000030025d071101
Realtek 0x000331025d131601
Realtek 0x000230025d131601
Realtek 0x000130025d071401

Request URL   : https://github.com/alsa-project/alsa-utils/pull/264
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/264.patch
Repository URL: https://github.com/alsa-project/alsa-utils
