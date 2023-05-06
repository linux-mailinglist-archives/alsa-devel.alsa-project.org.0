Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A200C6F8EB6
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 07:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61FC72A72;
	Sat,  6 May 2023 07:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61FC72A72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683351749;
	bh=5UPVFKZv42UUgSBuKEyFp14gYJWebvTKGSItHieR3cA=;
	h=Date:To:From:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TukoD/R2WhvLlJmt2kUsE9csYPLuZ6ejA2mnTyaFJmlmg6LKc/yew/ckA1ctNmhe9
	 /XiRBOwm8hX/KVKzou5mP6o11Mw588WPNkd0kYPPVFPg3jJpjazHc8gy+L9PrMIeRJ
	 I+XvBVJEZjuK3LW/DbXMSz0CIkg8TKW7bzcbuAtE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8E5FF80529;
	Sat,  6 May 2023 07:41:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCF77F8052D; Sat,  6 May 2023 07:40:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2B5FF80114
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 07:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2B5FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YsrPgbIv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=dFEzHDIu+qBSXPc+L1/bWITnShE9xROgVs7GLl3cwXg=; b=YsrPgbIv0vhEzPJpUgMbE8rLHn
	zof3DFrUiQ8t+yBWtUo1RrJFFsA7HPTmkMO40nAh0WTvt1AM/QhD1+l60qNDsi/ilppjntazIhG64
	XwVvQjzVeRBVcW9g7eoV4fl0agOEcrIiMpMu+GFNt0f6NcnS6b3DoBczqe2PBR+BoPyqlKVEsHqex
	tjtZpbpSMDFxzOjldcmzMdRHF5+FlERSgFJTE4iykR5fu2B7OumKVzbz52WWwi6WrR7S7tR/t3mYx
	OIwnEKuxfdE6mKpcr+ddNIhrSkoYTMamaBN3Q18NdSoSnNP7Rbr61+MxY5AJZLj4wP2C+17QXDM47
	O9q+hSXw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pvAeU-00CbC9-26;
	Sat, 06 May 2023 05:40:14 +0000
Message-ID: <36efe6f3-009c-e849-f9d7-6a643edad8e0@infradead.org>
Date: Fri, 5 May 2023 22:40:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 stable <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: patch for 5.10.stable (sound/oss/dmasound)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ASMXNXNZZ6QGARRF5CVC4KMF5X7MXQWJ
X-Message-ID-Hash: ASMXNXNZZ6QGARRF5CVC4KMF5X7MXQWJ
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Michal Marek <michal.lkml@markovi.net>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASMXNXNZZ6QGARRF5CVC4KMF5X7MXQWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Please apply

commit 9dd7c46346ca
Author: Randy Dunlap <rdunlap@infradead.org>
Date:   Tue Apr 5 16:41:18 2022 -0700

    sound/oss/dmasound: fix build when drivers are mixed =y/=m

to the 5.10 stable tree. The kernel test robot <lkp@intel.com> reported a build
error on 5.10.y and this patch fixes the build error.

-- 
~Randy
