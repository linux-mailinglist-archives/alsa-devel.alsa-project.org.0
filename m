Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD9271341E
	for <lists+alsa-devel@lfdr.de>; Sat, 27 May 2023 12:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA603E8;
	Sat, 27 May 2023 12:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA603E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685184136;
	bh=3ENny4TLjAP6BGM/oHhGNzefJxUwL+iQcwwURQ1DS0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A26g5F6k6IGeotm5P5cVEu24KZT75E1chAQjoD7eaR7vvgEC7QuVQw7+p1911aUl8
	 ZRgWI3KdNYg5X4zAayKhcns+wVDV+b7r3vtfEpuJL4B8nrAiBkasDGAnvMFB9p495B
	 fSd2LhI8dO/Eo6T4UTAEIn1AHYPOqv9Jd/68k6JM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B8D7F80425; Sat, 27 May 2023 12:40:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E37FF80425;
	Sat, 27 May 2023 12:40:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FD21F80549; Sat, 27 May 2023 12:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 771E4F80544
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 12:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 771E4F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jPqBWun2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5DD360BC8;
	Sat, 27 May 2023 10:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD647C433D2;
	Sat, 27 May 2023 10:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685183939;
	bh=3ENny4TLjAP6BGM/oHhGNzefJxUwL+iQcwwURQ1DS0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPqBWun2jt1uDOsPLMUyWY1ve5naJCAfB7AwNdGcZ30zRQ5zxCpPRUG1N0e2UwusN
	 d1nms3MgE83xe42z+IhTSmHgdKmh6AG7MgZnne3AhmJtpfvaFOa3XpmZypEzVVVB/b
	 1e7js1lGGCmUN/9dRMLzaTpHdaVsF1kLAFFnbfhbGRpaXVLA+n0Tf6Fhdsa4Lf427D
	 16K4N+WYt3x6VIZK+HdRCs4A74WjMgwyAtXGY/xAdjhpVl5aGqqC60UcpweiN18kZq
	 nTA7HZLDFw69frvGso96Jw/ACc6Orw4RtA0pFR0rK8CtN7UX9BzQDJ1ENj8MHf2T4U
	 K7DZpuE2PQxLg==
Date: Sat, 27 May 2023 16:08:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH] soundwire: intel: read AC timing control register before
 updating it
Message-ID: <ZHHdvx4cDFIiX27s@matsya>
References: <20230515081301.12921-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515081301.12921-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: CIR5PPI4O7NBBOX2GA7WCI5YXFMD4TR6
X-Message-ID-Hash: CIR5PPI4O7NBBOX2GA7WCI5YXFMD4TR6
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIR5PPI4O7NBBOX2GA7WCI5YXFMD4TR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-05-23, 16:13, Bard Liao wrote:
> From: Chao Song <chao.song@linux.intel.com>
> 
> Start from ACE1.x, DOAISE is added to AC timing control
> register bit 5, it combines with DOAIS to get effective
> timing, and has the default value 1.
> 
> The current code fills DOAIS, DACTQE and DODS bits to a
> variable initialized to zero, and updates the variable
> to AC timing control register. With this operation, We
> change DOAISE to 0, and force a much more aggressive
> timing. The timing is even unable to form a working
> waveform on SDA pin on Meteorlake.
> 
> This patch uses read-modify-write operation for the AC
> timing control register access, thus makes sure those
> bits not supposed and intended to change are not touched.

Applied, thanks

-- 
~Vinod
