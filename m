Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB176F182
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 20:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 909F1210;
	Thu,  3 Aug 2023 20:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 909F1210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691086260;
	bh=4b2/4o73t5Hw5YDgK33lZbq8+/9danVw9AASYJHPLsY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Toto4h5jGrCTbuJlrEHgs8ntM8M+wkp2If7ACiQ+0wJmczqX43MDpqKcsi43hHbae
	 bRvq0iDSwtl5eE6ZX9JkJOxZjoll3nsg/YcSaSzrWAdZ9gLLiPwbdylW9XVN+UwHZy
	 1h+h+3Q64bCrd+E1MF+Cec/PlCuTFY0TrYSgDiiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BE6BF802BE; Thu,  3 Aug 2023 20:10:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E15EF801D5;
	Thu,  3 Aug 2023 20:10:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F10ADF8025A; Thu,  3 Aug 2023 20:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60C59F8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 20:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C59F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3HG/Iqr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0dEImclfLlmfTU0yTnFzJTof7y09txrCVp+rAtpvb1A=; b=Q3HG/IqrxhjbWVUPp+QxIv0M1M
	CQDRO12DZSkGS5jgxTy1lTzGCbAt0VPfKVjWzx5PwJFoM/CNjPu1pDLEfCKrZzwziQHSLvWxbeM2f
	BZ8VxSXklUYAQlj3+f5Kz6bnN3jqkTjocUVE0SjFPJlb2l9IWU4vM5eSnb3jwpN6adAOIOFzz4A3t
	9qzqv/mIFVddvR1Tfe8iJx+/ypoasiZODYZhfoMRX0KxmslYD3qhhSKSiKolEpT/6fWl+1OgkK7B0
	mtQvVTVyt9n9GKsLnj4XvXQ5Iztv4LIMmjLDNSO3r7x5tw6sR0i65zXcsWUMUZ9Hjv55m8RG7LbEo
	Q7F/U0lg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qRclc-00AXuC-0M;
	Thu, 03 Aug 2023 18:09:44 +0000
Message-ID: <63bc327d-999a-1654-e7b5-6bcfd7477a32@infradead.org>
Date: Thu, 3 Aug 2023 11:09:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 RESEND*3] ASoC: fsl MPC52xx drivers require
 PPC_BESTCOMM
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230803025941.24157-1-rdunlap@infradead.org>
 <9581313f-5340-455d-a75d-dc27d2eb3ec0@sirena.org.uk>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <9581313f-5340-455d-a75d-dc27d2eb3ec0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PDFFZ2GUBRGMFR7YPRAMHG2VTDO5O7E4
X-Message-ID-Hash: PDFFZ2GUBRGMFR7YPRAMHG2VTDO5O7E4
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDFFZ2GUBRGMFR7YPRAMHG2VTDO5O7E4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/3/23 04:27, Mark Brown wrote:
> On Wed, Aug 02, 2023 at 07:59:41PM -0700, Randy Dunlap wrote:
>> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
>> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
>> so the 2 former symbols should also depend on PPC_BESTCOMM since
>> "select" does not follow any dependency chains.
> 
> Take a hint, it's not clear that the patch is tasteful.

Thank you for replying.  I'll drop it and just report the build errors.

-- 
~Randy
