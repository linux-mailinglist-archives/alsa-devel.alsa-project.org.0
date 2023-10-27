Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D227DA195
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 22:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB145DEF;
	Fri, 27 Oct 2023 22:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB145DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698436919;
	bh=Cujt3J0TQHCl9Lx3QHHiLfeYmGDtJ6CuOZbdKFKyN98=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=S07Otg5JQ19l3wCUtlrOcFlNs6Jm/CjLoax16fkDy4L0MUffKIlNHC0ZCYSRJbml2
	 q3e1zKYKQVUb5eMfz+E6PY8e2DQtjfCVPliVsVqNYi2DY9HgQVwqbKJ7/m/m3cBbmO
	 LmwAOmzy9iyxpR0n29TIODQ8I7AmHOdV+tLzBouo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D38F80165; Fri, 27 Oct 2023 22:01:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F8CF8014B;
	Fri, 27 Oct 2023 22:01:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1DFEF80165; Fri, 27 Oct 2023 22:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 48543F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 22:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48543F8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698436863181976557-webhooks-bot@alsa-project.org>
References: <1698436863181976557-webhooks-bot@alsa-project.org>
Subject: aplaymidi uses the wrong tempo
Message-Id: <20231027200104.D1DFEF80165@alsa1.perex.cz>
Date: Fri, 27 Oct 2023 22:01:04 +0200 (CEST)
Message-ID-Hash: MF6Y2VXYUKARCFXNIWSHIQWTWEOIT72G
X-Message-ID-Hash: MF6Y2VXYUKARCFXNIWSHIQWTWEOIT72G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MF6Y2VXYUKARCFXNIWSHIQWTWEOIT72G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #241 was edited from PQCraft:

It seems to be locked to a tempo of 120 for some reason.

Version: 1.2.10

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/241
Repository URL: https://github.com/alsa-project/alsa-utils
