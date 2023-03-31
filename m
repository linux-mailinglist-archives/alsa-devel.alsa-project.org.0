Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4816D2152
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 15:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E691F9;
	Fri, 31 Mar 2023 15:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E691F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680268588;
	bh=LUbAsg5ttocyiJL1QbsovywDIOC9eC4ES6W8XYgAYq4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OT4ntR2OHjIFg9RHj6AoGnnVXY1znZAUScC4OpH/LqkBHgcYR/b7diQocugH2xeeh
	 363QlvChx+89Gzp4dojvCcFaDBX7/3dP7VAgRpJFOheGL+KYk2DY5Fi2BTLTuWufRu
	 6rSyJeIKYsmYTEJ/gYt3Y5bJajKfny9/psgLlBO4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C06AF80272;
	Fri, 31 Mar 2023 15:15:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53D84F80272; Fri, 31 Mar 2023 15:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B6EEF800C9
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 15:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B6EEF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gF71sGrU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4052762914;
	Fri, 31 Mar 2023 13:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E54C433EF;
	Fri, 31 Mar 2023 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268530;
	bh=LUbAsg5ttocyiJL1QbsovywDIOC9eC4ES6W8XYgAYq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gF71sGrU8nNLHX0uOSq/zT4uGi02EfQ8/tCAyUM9GdNIK+vxt/1BclR8V2FYGKGIt
	 +zIYoPWOgRZ99NJtt5BCDVd8MkxHSjvDF0mWzmJQh525Q9XqmSjxn2ec8sTGsJW7MF
	 KlIz2B/kM+2SVwhJ9bwAfmXYnP6A0FnSCm85g06gIRYsOS+0ksIGVvqsbsbnM16SJI
	 HNjll00kF3+9zLV1mnbE8rB3DDYAQO3UITZWyhfJu4y/ftURAngiYcWw2ShpVAtt3A
	 iS/p6wOXSk+BCXGJamh7TqodHmC/3L+owdkSdfYy0B1dEvBYbL1b3iXlndciFi9Ybl
	 6SAI5BiMkzSdw==
Date: Fri, 31 Mar 2023 18:45:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/2] soundwire: stream: uniquify dev_err() logs
Message-ID: <ZCbc7omBvGNLuCcZ@matsya>
References: <20230322035524.1509029-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322035524.1509029-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: VLHUUCOXR32GY5AX2KXGIUZ5LYVYPDJG
X-Message-ID-Hash: VLHUUCOXR32GY5AX2KXGIUZ5LYVYPDJG
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLHUUCOXR32GY5AX2KXGIUZ5LYVYPDJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22-03-23, 11:55, Bard Liao wrote:
> There are a couple of duplicate logs which makes harder than needed to
> follow the error flows. Add __func__ or make the log unique.
> This series also changed some uses of "dev_err(bus->dev," where the stream
> may depend on multiple managers/buses.

Applied, thanks

-- 
~Vinod
