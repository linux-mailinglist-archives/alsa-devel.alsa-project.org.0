Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA3739730
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 08:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51E1F74C;
	Thu, 22 Jun 2023 08:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51E1F74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687413891;
	bh=WMzsl9jOqdfV0nTMQTOxJtowXW18+3sjqjJn10GU6K0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UCuYa1w1oeHueiM2IpBBh/meQmnNmON/9jylaUhds17XmYl1gztEEEAj9b/wJ3Dkf
	 W8iEu4vq1+Z/8hcgWswpP8bA8XBQbnYPEOpKEphqssr9v064AiHe4YT9ngZ39FZI/p
	 dw6mmopm2g/nx5t9xZsf6nW8ReDQDDVd/tn/8dYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91567F80124; Thu, 22 Jun 2023 08:03:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB98BF80124;
	Thu, 22 Jun 2023 08:03:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5EE0F80141; Thu, 22 Jun 2023 07:59:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B5E7F80022
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 07:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5E7F80022
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687413552659843683-webhooks-bot@alsa-project.org>
References: <1687413552659843683-webhooks-bot@alsa-project.org>
Subject: topology: plugins: nhlt: set dmic stereo mode only in hw version 1
Message-Id: <20230622055916.B5EE0F80141@alsa1.perex.cz>
Date: Thu, 22 Jun 2023 07:59:16 +0200 (CEST)
Message-ID-Hash: X6PSPTJCGCF527VDXHSTOGQIDIE6JDNP
X-Message-ID-Hash: X6PSPTJCGCF527VDXHSTOGQIDIE6JDNP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6PSPTJCGCF527VDXHSTOGQIDIE6JDNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #222 was opened from juimonen:

Dmic stereo mode should be set only in hw version 1. In later hw versions this bit is reserved.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/222
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/222.patch
Repository URL: https://github.com/alsa-project/alsa-utils
