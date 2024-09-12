Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCBE976625
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 11:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C8D86E;
	Thu, 12 Sep 2024 11:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C8D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726135027;
	bh=/TleOWHZP4whem8IIAIpC+gQ6k0D0xz6bxVum5AFqms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fS6n75X32XkoTBZyKludtPP99TEE1u6/p9t7OMTLpd99FCMKMWS0s+H8bXlOyjvQK
	 r5Z0cVRhgAqzqnrGXMl9sfJFRf/QA31Hoa4/9P6Fk2okVyftH/tJHmjOu8k5VcD6B4
	 3tth5KWkUKsDS6FG4H178zpgxWpKux2rvVIaSSJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10FB1F805B3; Thu, 12 Sep 2024 11:56:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42641F801F5;
	Thu, 12 Sep 2024 11:56:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A66A6F801F5; Thu, 12 Sep 2024 11:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C756F80107
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 11:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C756F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fHMCmL+p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Af3UiaSTtvVMACXrK0RDN/VWI8LBjfOwA+0RWsQXywA=; b=fHMCmL+pKkST2F0FEKk/v7OOnu
	Bm48g9MMpH1gSWUkkXNGRh5k3O+rIGF2s8OAE2hKBo0g8airQVuEy61YSkhOuZuQyvgFYNsDHMYGv
	2p0hR4owi+Z2Qif4yYLar44mrEkdEVxExkPJAd/C9f37trPokE8zd1QPQ8udfLjkUEwLLxAqvP2rl
	/Qde/eks7Q581sLcIVgyMvx2sjeLbAdoAqAsz6I5zzkyYzIk2hDd6tqE4uoHsj7Ak6Q3OZ2PYMOB0
	DL9zBeN+bv1kYjMtr7LaESfVxQSOp+nnDXOR0br8XurQdFgVuvEvbrDlJ43y7DqLwDQvhF6ccwziq
	UoMLHNPA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux))
	id 1sogYn-0000000Cc97-3iuE;
	Thu, 12 Sep 2024 09:56:21 +0000
Date: Thu, 12 Sep 2024 02:56:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Takashi Iwai <tiwai@suse.de>, Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	stable@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZuK6xcmAE4sngFqk@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Message-ID-Hash: CMAOVHHT36XO7YZYMPJJITIW3IW2KMF7
X-Message-ID-Hash: CMAOVHHT36XO7YZYMPJJITIW3IW2KMF7
X-MailFrom: 
 BATV+78b913441a3cb29668e4+7690+infradead.org+hch@bombadil.srs.infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CMAOVHHT36XO7YZYMPJJITIW3IW2KMF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> Individual subsystems ought not to know or care about XENPV; it's a
> layering violation.

Agreed.

> If the main APIs don't behave properly, then it probably means we've got
> a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> which is probably affecting other subsystems too.
> 
> I think we need to re-analyse the original bug.  Right now, the
> behaviour resulting from 53466ebde is worse than what it was trying to fix.

53466ebde looks bogus to me, and the commit message doesn't even
try to explain what bad behavior it works around.  I'd also like to
state once again that if you think something is broken about dma
allocation or mapping helpers please Cc me and the iommu list.

Most of the time it's actually the drivers doing something invalid, but
sometimes it is a core dma layer bug or something that needs a proper
API.

Also while looking at the above commit I noticed the broken fallback
code in snd_dma_noncontig_alloc - get_dma_ops is not for driver use,
and starting with the code queued up for 6.12 will also return NULL
when using dma-iommu for example.
