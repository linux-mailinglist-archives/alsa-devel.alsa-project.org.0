Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800C87963D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 15:29:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 937FAE68;
	Tue, 12 Mar 2024 15:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 937FAE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710253786;
	bh=b8/MRJ8LakY99G1QQ64B617SgCzSJwIMQhrpxiIt270=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m0qrjlm63AL3kcxJXVgpHGuSVSoHHiyIpQfcxpzAlp+a0ITZiX66dCgoYTnM8IieQ
	 5S66UsUh7QdcVPiHJp+fyO8+uym/W+5Yz4DqEl3RyWZCM8TYV83WOO6zSDfPlVxors
	 qQPqoZejvK+pobH5Xtu3aGKKhpN3P3DIDflYP1Pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EF7FF805AB; Tue, 12 Mar 2024 15:29:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 706FBF805A0;
	Tue, 12 Mar 2024 15:29:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA9CEF8028D; Tue, 12 Mar 2024 15:29:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73570F800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 15:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73570F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fz0B+Rxg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3337B611E3;
	Tue, 12 Mar 2024 14:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295F7C433F1;
	Tue, 12 Mar 2024 14:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710253733;
	bh=b8/MRJ8LakY99G1QQ64B617SgCzSJwIMQhrpxiIt270=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fz0B+Rxg62nx2JGhJSElcsR0JDn8SmfO+cJtn/ImZfYYQM7h1tmwqncdCJTFvpB93
	 Ig496AVhtQS+1pg8poXOlVMfktSkivjLGq4oUMWnbnIXon1RBAmWC3F22/fDwxEu8W
	 YgXMqKsY9FEo4TuB/qNWLcfMudD4oZsBsoyVzMHzCGhUzc27rAcItwHTVAqWAoQNEo
	 QsKxa2deINLLnaancYIFwZeMVUKst4MQP1llNQ0dOIQkM7s3w/7OWnpTcJCWYJKho3
	 1/Jxb8iUnddI1f63vxiBaNxiOS2xP6wBWL8w/T3ySOXSnnw7LHZQnEu/b6gIh20Oof
	 eyFCOay1jcTNg==
Date: Tue, 12 Mar 2024 19:58:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Message-ID: <ZfBmoe4Rv2zjS7PV@matsya>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <565b9a1d-a074-4bb6-b4c5-2b9be9095a3f@sirena.org.uk>
 <581a81f4-e540-4de2-b17d-51bc192ae6ec@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <581a81f4-e540-4de2-b17d-51bc192ae6ec@amd.com>
Message-ID-Hash: HRMSX2LQTBLVAIF7RLV3GNQYKBQOATTP
X-Message-ID-Hash: HRMSX2LQTBLVAIF7RLV3GNQYKBQOATTP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRMSX2LQTBLVAIF7RLV3GNQYKBQOATTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04-03-24, 12:17, Mukunda,Vijendar wrote:
> On 31/01/24 23:21, Mark Brown wrote:
> > On Mon, Jan 29, 2024 at 11:21:34AM +0530, Vijendar Mukunda wrote:
> >> This patch series is to redesign existing platform device creation logic
> >> for SoundWire managers and Implement generic functions for SoundWire
> >> manager probe, start and exit sequence which are common for both Legacy
> >> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for
> >> AMD SOF stack (ACP 6.3 based platform).
> > The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:
> >
> >   Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-soundwire-amd-v6.9
> 
> Hi Vinod,
> 
> As this patch series is merged in to sound git, Could you please let us know
> when this soundwire patch series will be picked in to Soundwire git.
> 
> We need to send few fixes on top of this patch series.

If you had told me earlier I would have pulled. It is late now in merge
window, pls send the patches after rc1 is out in two weeks

BR

-- 
~Vinod
