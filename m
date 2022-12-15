Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF364E0B3
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 19:25:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0CA32127;
	Thu, 15 Dec 2022 19:24:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0CA32127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671128732;
	bh=bdCtT+5ElJmr9KjTrYdZQTFR2w3Tb5egfy2oVKPmxjI=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D1vDKE7d8Z4DGfhk3nm+nyJXUxdmjTKu/wjUfdJy7h1oLq2v+yevm4JgdJ/+S5mNa
	 n4qUMWmlcYhE0X+BptQw97bkQA+TZobWABAGiDCftQWLMC2rJvziO3mBXbyDuSlVLC
	 m6PA9RqXigzg5AtXfQ/jNkJQC/8aa32Gmaw2RvOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 711A7F80141;
	Thu, 15 Dec 2022 19:24:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8576DF804ED; Thu, 15 Dec 2022 19:24:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4610FF80141
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 19:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4610FF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mGYvkiNG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671128672; x=1702664672;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=bdCtT+5ElJmr9KjTrYdZQTFR2w3Tb5egfy2oVKPmxjI=;
 b=mGYvkiNGny6mN/KyPhPH3TSZYaSu8uZnYv/KOwGERsgnOInSOx9XTCZk
 me7VONxeRkaBRVNog7MVZz8T4BylyxdjbXlJKwJvDxm13rgP7n9gjKxZg
 hM7w+9rOHOi3ce7yimSfPHD/hfAIv46vsbG86kxrvfsRzoGdy+sHpHZrY
 bhgGcA4XL3/cHcpDX0AS8wXPo3RmB3/PfEJI6GNBwjdEt2LqTeKiCEJ1S
 z1ULq1wIlPtk4j5xliVhGUmdnDpoIBdgN3PkxqcpavDfYviYKtLp3+5LI
 CLiocQSnmzVyXvtIr57pEcGQf+NZrTYjHD2V+FCil6S8IPsNtm95j/x69 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="316408393"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="316408393"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:24:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="978287239"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="978287239"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:24:23 -0800
Date: Thu, 15 Dec 2022 20:23:59 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [6.2][regression] after commit
 ffcb754584603adf7039d7972564fbf6febdc542
 all sound devices disappeared (due BUG at mm/page_alloc.c:3592!)
In-Reply-To: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2212152017110.3532114@eliteleevi.tm.intel.com>
References: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Takashi Iwai <tiwai@suse.de>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Thu, 15 Dec 2022, Mikhail Gavrilov wrote:

> The kernel 6.2 preparation cycle has begun and yesterday after the
> kernel was updated on my Fedora Rawhide all audio devices disappeared.

I can confirm this breaks audio in our SOF tests if I cherry-pick the 
identified patch ffcb754584603a to sound tree. This affects audio on a 
very large number of x86 systems.

Br, Kai
