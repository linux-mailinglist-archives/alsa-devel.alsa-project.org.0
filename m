Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F577CFC2E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59F0E7C;
	Thu, 19 Oct 2023 16:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59F0E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724762;
	bh=obQ7rLTQoDuPCE2rLDRckyTjxr2JC5XJ4Cg9jqJjOGI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UsiYriUoI8NMASAoLDCEttbQxzU7DijO8wCO99Tvn4ZBQsMJbqeB0Qqw7avMP84lv
	 uDdgwJxxq73WDXUKGZCE6pdKmXU8v7OVfJts8BoN6pLJ/h+IOIETYTHgHNo64ELoI+
	 Dy5qu9s4pIB/fFG5NMRfh9iUNs0piPyYqsRc02eY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7580F805C0; Thu, 19 Oct 2023 16:10:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11492F805B5;
	Thu, 19 Oct 2023 16:10:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DA23F8025F; Tue, 17 Oct 2023 22:25:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10829F80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 22:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10829F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ZQ/ABCFu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CE544B81F29;
	Tue, 17 Oct 2023 20:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20CFC433C7;
	Tue, 17 Oct 2023 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697574329;
	bh=obQ7rLTQoDuPCE2rLDRckyTjxr2JC5XJ4Cg9jqJjOGI=;
	h=Date:From:To:Cc:Subject:From;
	b=ZQ/ABCFu2wFcAJ4ZIvtMvzKHoRThY6tWQsFSqGNHRr8Lh/2YMeYXRpQm8X8V4FGri
	 Mszw8xpDhe7Yfz01/mGfjIfBdYOSjp448GRZ+J6HRUDMuzA65t9tQ+tM9yM+oPvf9B
	 SycMymjlgA+Okv/IURQ7QOqdPB9mPPmxSq0fRovM=
Date: Tue, 17 Oct 2023 16:25:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Cc: broonie@kernel.org, tiwai@suse.de, perex@perex.cz
Subject: Migrating this list to a different platform (take 2)
Message-ID: <20231017-coroner-blurt-edffe8@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DCBWJLUELCQKBLDXVHY7TCFYVL7GBOHH
X-Message-ID-Hash: DCBWJLUELCQKBLDXVHY7TCFYVL7GBOHH
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:10:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCBWJLUELCQKBLDXVHY7TCFYVL7GBOHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello, all:

I'm told that a while back there were some discussions to migrate this list to
vger, but the process never really got finalized.

I would like to restart this discussion again, because I am in the middle of
vger list migrations and it seems like an opportune moment to bring this up.

There are the following benefits to gain after migration:

- it becomes an open list that doesn't require much moderator involvement
- the messages are DMARC-compliant when received by subscribers
- the infrastructure is supported and monitored by LF IT 24/7

However, there will be the following impacts:

- we can try to set up a forward from the old address, but previous attempts
  to do so with mailman had mixed results
- if the old address is set up to forward mail to the new address, then anyone
  sending to both addresses will get doubles of everything, which can be
  annoying
- setting up a hard bounce at the old address would probably be preferable,
  but it's a "ripping off the bandaid" kind of approach

If you are interested in migrating the list, I suggest we move it to
alsa-devel@lists.linux.dev and not vger, solely because vger is in the process
of migration itself and it would be easier to use the lists.linux.dev domain
at this stage than to go with vger.kernel.org.

I am happy to provide any more info if you have any questions.

-K
