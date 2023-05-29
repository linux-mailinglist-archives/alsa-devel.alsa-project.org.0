Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA17143B6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 07:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E99825;
	Mon, 29 May 2023 07:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E99825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685337880;
	bh=ndRWXQzxO1TqHUmrmU3vFMlwQAoNr+yislTsYdJ1l8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vYaOEVIyKEUEd3xP/RiBk4llxJLKWIllwJbKSYbucyp7kZeWNqY4Pzuj0k7sHGUWz
	 026mnyn0xtX1NBuqrCSdYA4mwDeXNJjX6EwtgWHAHJFM9V7DMBdEpyzBTTOb7rFrx/
	 Fh+/kbOwlL3srpGT+hkmD3Q5w4Q5ESHYgMJTUddE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE570F80557; Mon, 29 May 2023 07:23:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2085BF8055B;
	Mon, 29 May 2023 07:23:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C7B0F80510; Mon, 29 May 2023 07:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53287F80086
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 07:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53287F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CAGUJf01
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCDE761130;
	Mon, 29 May 2023 05:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC863C433D2;
	Mon, 29 May 2023 05:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685337360;
	bh=ndRWXQzxO1TqHUmrmU3vFMlwQAoNr+yislTsYdJ1l8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAGUJf01nAVHhzzT2a9QncHZwdEbwKD0lb6fQMLBsSGbPlggal8TF50Dt4OHTCkb5
	 Q4Mm105vamL3cX418ZnmoR301+t/4/oCk97npaX+mfjo4+IWTBPTp0ohwH+2caYNAw
	 h529n65tFgXHOtAL7cFZ4EL5YOF36o4go6uUm+qc9Ki0ADXkqKiWa2sShK+gDP7LhC
	 web6d8LmEX+wjcGiW/6PBwxsg5pVMLe8Iab/ze5OuxslZemcybeiu2W6G1cIznR4nL
	 XUAMZoIOzVpheUZXCNWeL0TqBR6hGFnJGvLaRervT66YpPgpiSbue12RzdOv8ibglY
	 bDt7V8KLVlHIQ==
Date: Mon, 29 May 2023 10:45:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH] soundwire: intel_bus_common: update error log
Message-ID: <ZHQ1DHv8HxSWMpiJ@matsya>
References: <20230518024215.164281-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518024215.164281-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: AEY2QUT3527CZ4BPF2AZU6SLSERCWSSJ
X-Message-ID-Hash: AEY2QUT3527CZ4BPF2AZU6SLSERCWSSJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEY2QUT3527CZ4BPF2AZU6SLSERCWSSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18-05-23, 10:42, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> We use __func__ in all calls of sdw_cdns_check_self_clearing_bits(),
> except in one case. Likely an editing miss when the code was
> refactored.

Applied, thanks

-- 
~Vinod
