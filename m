Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CCD737A84
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 07:04:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1A874C;
	Wed, 21 Jun 2023 07:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1A874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687323885;
	bh=gsE7TzsZMJaik6JWym0Tvl1jIcRIDPaCmtf25TcqzQY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Dr7pHADSDKhZ9SgzvZ8kU7h+y9BT55zEvmUkeP5fEY3lX+VwFjeoag4kLcrj0plgr
	 oYXoKi06QV8nNaNisaQUh7Elhys/0CA+IH6/FDvnUDnric5V3HFCWkBnPrIq+bps5h
	 XnQFtjas7HVK+k5tlFKApdMlF+WcYanQ4Qu9efk0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D95DFF80551; Wed, 21 Jun 2023 07:03:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34EB1F80132;
	Wed, 21 Jun 2023 07:03:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4674F80141; Wed, 21 Jun 2023 07:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6984FF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 07:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6984FF80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687323787137549877-webhooks-bot@alsa-project.org>
References: <1687323787137549877-webhooks-bot@alsa-project.org>
Subject: Thinkpad Z16 Gen2 Mic mute LED not switching on when press F4
Message-Id: <20230621050315.C4674F80141@alsa1.perex.cz>
Date: Wed, 21 Jun 2023 07:03:15 +0200 (CEST)
Message-ID-Hash: MXOE54VIR5N7AZIVDQ7VWZBASQTNUCO3
X-Message-ID-Hash: MXOE54VIR5N7AZIVDQ7VWZBASQTNUCO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXOE54VIR5N7AZIVDQ7VWZBASQTNUCO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #326 was opened from pma1:

The mic and sound output works fine.
alsamixer can switch on/off the F4/Mic-mute LED automatically.
But when press Fn+F4, the mic-mute led is not working.

/sys/class/sound/ctl-led/mic/card1# cat list
129

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/326
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
