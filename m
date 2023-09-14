Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2057A0F83
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 23:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2553C886;
	Thu, 14 Sep 2023 23:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2553C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694725658;
	bh=/V8J0ufmo3jfKgDyQsQ1QqleL4vltw/5ve7+oWMW27Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nEBNqxDNMZIWnDLf/YeKfmTXnqQ/0JYBBhw9hLjoW+EgNipu7nRGNGN5wx3CspKcl
	 6O1TK5GVtBhkZm4AGjc5IYPyeUprbxe+lQYUgYkISeocYKKib0+3h/UHtYRlPW+kUw
	 wySCBI44nAPFSOdVSaEwzbLbghB4Z3Aa8i2vdafY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 982ECF80558; Thu, 14 Sep 2023 23:06:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E57AF80246;
	Thu, 14 Sep 2023 23:06:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D26A5F80425; Thu, 14 Sep 2023 23:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 656E8F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 23:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 656E8F80141
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694725596251107216-webhooks-bot@alsa-project.org>
References: <1694725596251107216-webhooks-bot@alsa-project.org>
Subject: Audio issues in acer nitro 5
Message-Id: <20230914210642.D26A5F80425@alsa1.perex.cz>
Date: Thu, 14 Sep 2023 23:06:42 +0200 (CEST)
Message-ID-Hash: G27TP2G45XU7BTT3BRERQWDOGOUXEWZ3
X-Message-ID-Hash: G27TP2G45XU7BTT3BRERQWDOGOUXEWZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G27TP2G45XU7BTT3BRERQWDOGOUXEWZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-firmware issue #9 was opened from achallion:

i am using pop os in acer nitro 5 and codec is Realtek ALC287. Earlier everything was working fine but after certain update, my headset mic stopped to get detected in my linux though we can hear sound through it. Everything else is working fine.

Issue URL     : https://github.com/alsa-project/alsa-firmware/issues/9
Repository URL: https://github.com/alsa-project/alsa-firmware
