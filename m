Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55470745DF4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B5861D7;
	Mon,  3 Jul 2023 15:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B5861D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688392490;
	bh=acJWERObQWg23Yw0ZkX/+QrYi/eY+ncNpMPY2sd/ppg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Mbnzluvq8hjNPdcG8Y9yVYiqCWBoRSOguDtq0yKCG5srQtwp+gME1FQCspl2T8gVE
	 21d4+kxFWV0JFuHp/Yu71MU+7Kk5pKvqIoXSxHHNII/ylMjGR75XLCSgIkb0mn6sIr
	 9ZXFDQOhUq5RAYEFnfmh18h2gzGeLt9xqpsB0kFc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26B81F80124; Mon,  3 Jul 2023 15:53:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B998EF8025F;
	Mon,  3 Jul 2023 15:53:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4D49F80535; Mon,  3 Jul 2023 15:53:39 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id BC00BF80124
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:53:39 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Mon, 03 Jul 2023 13:53:39 -0000
Message-ID: <168839241976.20.1297601488525827705@mailman-web.alsa-project.org>
In-Reply-To: <87a5wd5etm.wl-tiwai@suse.de>
References: <87a5wd5etm.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: R76BW3YLHN3COS42EEEF6XV6IIZPR3BT
X-Message-ID-Hash: R76BW3YLHN3COS42EEEF6XV6IIZPR3BT
X-MailFrom: happy.debugging@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R76BW3YLHN3COS42EEEF6XV6IIZPR3BT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you much. I should  have everything now to start building.
