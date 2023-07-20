Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426EC75A4EA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 05:58:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F941EC;
	Thu, 20 Jul 2023 05:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F941EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689825522;
	bh=mdNBTldOL6PUT/vtG6xIcJox7GE/RMcRUn6r63lC/K4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=q1rO4ZZtQP2REwINQcSN8nYccPD26pEH97tOjRdVigoqJv5tzBtapnPse9u5uVtfD
	 oyD4ckxjpr0mzilCXpt/h+Lzp/udWWH8QKQisbNpsXzDoKe65dBAFosm/xcUCVV9UY
	 SV/eROEoODlTpOffdlLDgr+uDnOjChGm3M7Ovn+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C342FF80544; Thu, 20 Jul 2023 05:57:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 109F1F8032D;
	Thu, 20 Jul 2023 05:57:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E77F8047D; Thu, 20 Jul 2023 05:52:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E42E0F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 05:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E42E0F80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689825115049217224-webhooks-bot@alsa-project.org>
References: <1689825115049217224-webhooks-bot@alsa-project.org>
Subject: Broken microphone switch on mtk-rt5650
Message-Id: <20230720035208.D1E77F8047D@alsa1.perex.cz>
Date: Thu, 20 Jul 2023 05:52:08 +0200 (CEST)
Message-ID-Hash: 4EIQIIS75X2FUXXRHZ55377NZPJKXIN4
X-Message-ID-Hash: 4EIQIIS75X2FUXXRHZ55377NZPJKXIN4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EIQIIS75X2FUXXRHZ55377NZPJKXIN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #336 was opened from jenneron:

The problem is that both headphones and mic use `JackControl "Headset Jack"` When there are headphones without mic connected it switches to external mic which is not present.

In kernel there appears to be only one switch https://github.com/torvalds/linux/blob/3c8b5861850c734add65233e538d4a8c2dff95d9/sound/soc/mediatek/mt8173/mt8173-rt5650.c#L130-L135 responsible for handling both headphone and microphone. So, how is userspace supposed to distinguish connection of headset and headphones without mic?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/336
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
