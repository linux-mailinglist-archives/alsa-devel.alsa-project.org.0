Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964776F5A65
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 16:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B69801269;
	Wed,  3 May 2023 16:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B69801269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683125365;
	bh=j/DoXZE5tcMsoj1vUSVMvpLdqie9YofqsfjW3h6Vyvo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=T/C71Dwe6i2BqZgQOAQCKHlaH3Qyqcs39+nDZ69z37xj92GDa5X0UnUR8j9RKzj3i
	 yQKSXRSaod1lEla/QxAg5aewIdHCzjueK08YR6w+jQCeRBgBiHQpp9JRryjTj1MqSH
	 ulkdo+d+AlnBKv+D8mhwfuHxTmsY4QHAg3eyuctk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30906F80137;
	Wed,  3 May 2023 16:48:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5253AF8032B; Wed,  3 May 2023 16:48:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A7957F800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 16:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7957F800EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683125309029746771-webhooks-bot@alsa-project.org>
References: <1683125309029746771-webhooks-bot@alsa-project.org>
Subject: Using mili/micro/nanoseconds in split files
Message-Id: <20230503144832.5253AF8032B@alsa1.perex.cz>
Date: Wed,  3 May 2023 16:48:32 +0200 (CEST)
Message-ID-Hash: TCIU55K46PTNIF36CVXZTY7MCLARBV3E
X-Message-ID-Hash: TCIU55K46PTNIF36CVXZTY7MCLARBV3E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCIU55K46PTNIF36CVXZTY7MCLARBV3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #209 was edited from kfilipan:

This is more of a feature request rather than an issue. When using `arecord` with `--max-file-time` and `--use-strftime`, one cannot get nanoseconds in the file name. This is however available in the e.g. `date` command `date +"%Y-%m-%d_%H-%M-%S.%N"` (`%N` gives nanoseconds). This would be useful for testing sound card recording time delays because having only seconds is not precise enough, e.g. it could take days or weeks for even slightly better sound cards to experience a second of delay. Thank you!

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/209
Repository URL: https://github.com/alsa-project/alsa-utils
