Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16897524B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 14:32:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4EE682C;
	Wed, 11 Sep 2024 14:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4EE682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726057929;
	bh=Fdj0q0pVD/ggTHM+Ik2S/NvfwPTQ8AAyOcVULW9PyVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GYPRh37D7XvsrUKwA2pNanujoe7XJwq+G8ff4BFiX5uoZ3Ii5nMio+N1omX1qYrmi
	 kNgdqOqNVBACpAZps2AoKd2odHvwoGQFK0k3RlbjofwlUvO3Ve8oBuC4zz7XbgfyMC
	 MqGqnw8WsMCd3RsZeDJKrFWmFvOPv5YzqjCycjcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C58F80301; Wed, 11 Sep 2024 14:31:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD38F805AB;
	Wed, 11 Sep 2024 14:31:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25325F801F5; Wed, 11 Sep 2024 14:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 383ADF80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 14:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 383ADF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ayVjDTRz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42014A44D68;
	Wed, 11 Sep 2024 12:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D761DC4CEC5;
	Wed, 11 Sep 2024 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726057889;
	bh=Fdj0q0pVD/ggTHM+Ik2S/NvfwPTQ8AAyOcVULW9PyVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ayVjDTRz6hgaLP0bob5pmAAi5bmpANJE/YTTIfCCz7FoFJJkabeYrkTlo205lNaHe
	 ZftpOfexRw3cV1FhK50YbS1uxkAGjB2ZcAvWRgb/uut69eeRwuKFaDk/vxxZn/Tb3A
	 xSpkq4nvgYbRX0XJY41QKVhJUgHpVlMtlOPF4+v4=
Date: Wed, 11 Sep 2024 14:31:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	krzysztof.kozlowski@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <2024091130-detail-remix-34f7@gregkh>
References: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
 <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
Message-ID-Hash: SXSTVDS4EAHNNSUJ3TQN67IBUV4C4BO5
X-Message-ID-Hash: SXSTVDS4EAHNNSUJ3TQN67IBUV4C4BO5
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXSTVDS4EAHNNSUJ3TQN67IBUV4C4BO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 10, 2024 at 04:02:29PM +0300, Péter Ujfalusi wrote:
> Hi,
> 
> On 10/09/2024 15:40, Peter Ujfalusi wrote:
> > The prop->src_dpn_prop and prop.sink_dpn_prop is allocated for the _number_
> > of ports and it is forced as 0 index based.
> > 
> > The original code was correct while the change to walk the bits and use
> > their position as index into the arrays is not correct.
> > 
> > For exmple we can have the prop.source_ports=0x2, which means we have one
> > port, but the prop.src_dpn_prop[1] is accessing outside of the allocated
> > memory.
> > 
> > This reverts commit 6fa78e9c41471fe43052cd6feba6eae1b0277ae3.
> 
> I just noticed that Krzysztof already sent the revert patch but it is
> not picked up for stable-6.10.y
> 
> https://lore.kernel.org/lkml/20240909164746.136629-1-krzysztof.kozlowski@linaro.org/

Is this in Linus's tree yet?  That's what we are waiting for.

> > Cc: stable@vger.kernel.org # 6.10.y
> > Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > ---
> > Hi,
> > 
> > The reverted patch causes major regression on soundwire causing all audio
> > to fail.
> > Interestingly the patch is only in 6.10.8 and 6.10.9, not in mainline or linux-next.

Really?  Commit ab8d66d132bc ("soundwire: stream: fix programming slave
ports for non-continous port maps") is in Linus's tree, why isn't it
being reverted there first?

confused,

greg k-h
