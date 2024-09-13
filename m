Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 277C8977EE3
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B986FE0D;
	Fri, 13 Sep 2024 13:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B986FE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726228334;
	bh=bDQ2cHKwBgZirp1r+Hr2bpHWKmVZ+wjLFiy68UToSsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S1DdTjXVsMm0AmOj5m4kMVylZRbX/Ahda/KByo69jfrbraAuqpalKF3/C+5euiz2N
	 Ol5xU7HnxYci4KK9YWdDb+ywvOOE39tb3ES0P6dRAPbryKClLF6OwihF0z1wSthBO6
	 49KLWrv3EaMGh41yPiGh3Q0EMB2WN45E0QLVxzig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2044F805B0; Fri, 13 Sep 2024 13:51:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74714F80527;
	Fri, 13 Sep 2024 13:51:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1407F801F5; Fri, 13 Sep 2024 13:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F71F80074
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 13:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F71F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cnw0/Jrj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E78B5C5D31;
	Fri, 13 Sep 2024 11:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D26BC4CEC0;
	Fri, 13 Sep 2024 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726228290;
	bh=bDQ2cHKwBgZirp1r+Hr2bpHWKmVZ+wjLFiy68UToSsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cnw0/Jrj2V/AnMFdy16uEyvcUU9eEyu/3xxKMDM2cTRbzZSNWAP9C7uF5z6/avJfc
	 8aBl0mQVSY9DP3osEYsrAq9Nmh1rnYJCgcS97AzgCugxHjYvCBq4i7pqRXpL39uejY
	 TLf1ONc/DsRr/n0cof4p0CVA2lzcIjIirKJTAuHImByJLPCinlyyQC5jjt+fwntTKK
	 igk/thqZJUx809wRqwuQgANDuDTFcuy9LzSYJoMdOF/UhqZuEau18025GmX2slI240
	 bwoSMHU2RuYUjp0IUcOPYeMgumptePJFqZ8KYm7J24KGjwrwQBY+oz92SmKu7t50JZ
	 OTXQ5KvLjR/uw==
Date: Fri, 13 Sep 2024 17:21:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	krzysztof.kozlowski@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <ZuQnPnRsXaUEBv6X@vaman>
References: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
 <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
 <2024091130-detail-remix-34f7@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024091130-detail-remix-34f7@gregkh>
Message-ID-Hash: 5OWOMDRUIWHIIKBQYEENU77QLHA5PWFV
X-Message-ID-Hash: 5OWOMDRUIWHIIKBQYEENU77QLHA5PWFV
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5OWOMDRUIWHIIKBQYEENU77QLHA5PWFV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11-09-24, 14:31, Greg KH wrote:
> On Tue, Sep 10, 2024 at 04:02:29PM +0300, Péter Ujfalusi wrote:
> > Hi,
> > 
> > On 10/09/2024 15:40, Peter Ujfalusi wrote:
> > > The prop->src_dpn_prop and prop.sink_dpn_prop is allocated for the _number_
> > > of ports and it is forced as 0 index based.
> > > 
> > > The original code was correct while the change to walk the bits and use
> > > their position as index into the arrays is not correct.
> > > 
> > > For exmple we can have the prop.source_ports=0x2, which means we have one
> > > port, but the prop.src_dpn_prop[1] is accessing outside of the allocated
> > > memory.
> > > 
> > > This reverts commit 6fa78e9c41471fe43052cd6feba6eae1b0277ae3.
> > 
> > I just noticed that Krzysztof already sent the revert patch but it is
> > not picked up for stable-6.10.y
> > 
> > https://lore.kernel.org/lkml/20240909164746.136629-1-krzysztof.kozlowski@linaro.org/
> 
> Is this in Linus's tree yet?  That's what we are waiting for.

Yes I was waiting for that as well, the pull request has been sent to
Linus, this should be in his tree, hopefully tomorow..

> 
> > > Cc: stable@vger.kernel.org # 6.10.y
> > > Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > > ---
> > > Hi,
> > > 
> > > The reverted patch causes major regression on soundwire causing all audio
> > > to fail.
> > > Interestingly the patch is only in 6.10.8 and 6.10.9, not in mainline or linux-next.
> 
> Really?  Commit ab8d66d132bc ("soundwire: stream: fix programming slave
> ports for non-continous port maps") is in Linus's tree, why isn't it
> being reverted there first?

I guess Peter jumped the gun, I was planning to ask you once this is
picked up Linus

-- 
~Vinod
