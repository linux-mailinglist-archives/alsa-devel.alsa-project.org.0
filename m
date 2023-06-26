Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197273D903
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 09:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0376B83B;
	Mon, 26 Jun 2023 09:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0376B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687766396;
	bh=hPX29wPGIn9e7zS1+BW1SEPExtF8L929xQpeA8xeqJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lfjmPh4dro/G15/V/ea/lYaMeOrUt/pRPjnEkgxiHafKK+YXyuluWRTRK5In0t+oC
	 S34gTunoTgc6R/os0GaWyXJZXnXIDHV06O6WxUF98C66RZ3a45HVzAg5LB3sgXLKSy
	 yg9HUPjdbRWXq1w3q7O4Au+4D9VC3Cmciflev34Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0137FF8053B; Mon, 26 Jun 2023 09:58:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A123DF80212;
	Mon, 26 Jun 2023 09:58:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F07C6F80246; Mon, 26 Jun 2023 09:58:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B88BFF80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 09:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B88BFF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZncGQtQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7B6okcQX5DvR+o2sW8uBe3UYiOMl6OT7JIHNly8h6yU=; b=ZncGQtQhxUTzraJizW2ZrM+rSH
	Oz9z05YQewLNQpl1p4Js2qLMCkQxx/UTTg+cx+4U1uPZ4bo0V9jG9kXpYPzEPU1Bp3hTWSPTR88as
	TH/GgG1LtSwD4kWXymNNtZVEY2Cr9F1/pVEXGiuj96gyUL0+w25/DkHKeWff438DvraVBjIKQneeA
	Ft2LuzTJshBYS3PKL+vcwbI2swwzmkK0FVmgZH89mG89ESUBXOMBc2JcLTi32/+al8ULN7UeWudFu
	UjKm9xK8JDnMatC9MBhhyMiabIHBrEvDfWPfqI9OwVGJHOJmHtZ5Ud3dSj5HGirhB8gbs3jlW40Om
	uB2zETDQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux))
	id 1qDh78-009bXc-1k;
	Mon, 26 Jun 2023 07:58:22 +0000
Date: Mon, 26 Jun 2023 00:58:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Yingkun Meng <mengyingkun@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: loongson: fix address space confusion
Message-ID: <ZJlFHtmJE6vPyT0k@infradead.org>
References: <20230622101235.3230941-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622101235.3230941-1-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Message-ID-Hash: MJX2ZV3M3UL2332PH76UFR4G3YNC3KZP
X-Message-ID-Hash: MJX2ZV3M3UL2332PH76UFR4G3YNC3KZP
X-MailFrom: 
 BATV+ec510b2fbccd77f4060a+7246+infradead.org+hch@bombadil.srs.infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJX2ZV3M3UL2332PH76UFR4G3YNC3KZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 22, 2023 at 12:12:22PM +0200, Arnd Bergmann wrote:
> Change the driver to instead use the physical address as stored in the
> PCI BAR resource directly. Since 'dev_addr' is a 32-bit address, I think
> this results in the same truncated address on loongarch but is otherwise
> closer to portable code and avoids the warning.

This gets rid of the warning, but is still broken.
pci_resource_start retuns a resource_size_t, which really is a
phys_addr_t, but certainly no DMA address.  To map PCI(e) resources
for DMA the driver needs to call dma_map_resource.

