Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72546D214F
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 15:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893511FA;
	Fri, 31 Mar 2023 15:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893511FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680268531;
	bh=ElQipzBcY4KMggMY+UKzQLm1C6J3oRRCnD3Lc53TuvM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QuHcizy2mGMza/vmpkYIxX3oNQ4Ld3RiOvZJ2zFZ5aurI5Z20vTroZtUrGY+AqykR
	 731MSrSHPwhF6PZEhxr/gfa+1cgalcxWe8WN9B/65JtCGc5DFwUCblfQt+kd/afGo7
	 AA7sw/bvbZd2Oxg+S/EwzPNTxJswwAz/jSKQwPsU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA293F8021D;
	Fri, 31 Mar 2023 15:14:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1CB1F8024E; Fri, 31 Mar 2023 15:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79469F80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 15:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79469F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d7J9TbIG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 024B26290E;
	Fri, 31 Mar 2023 13:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D38AC4339C;
	Fri, 31 Mar 2023 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268468;
	bh=ElQipzBcY4KMggMY+UKzQLm1C6J3oRRCnD3Lc53TuvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7J9TbIGKK72qyYbTw60L++4GpuVGuVYpJv1k2ctWapzJQtFOHjkPYu6LSPTfIhR0
	 37viDlCuPz4fQ/mq+weHr+OpWxaNUZUHQg9a1zSoEP1j1vjZkFLmC8OkQtZD/NX1V0
	 d3DC5MOvlybv8wOZhbG2UMvokIhWcwelxRJ8YRG+W/+eoX/jfxCQY4tknl17B56DyV
	 sRvhp4rPd4uAid3oXL+u2rQJwYPM2N7LtuP4t89pJcVNtTAE5fIQzBMt2HBZjI6Qku
	 xdPh0zS2gKVb3FJ6ecobgkyWmE/ISV0NJh8VZNl4wtzuKMGSy9guvUQWZWdhrYIt8K
	 j6dFl8O/kbDQw==
Date: Fri, 31 Mar 2023 18:44:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V8 0/8] Add SoundWire support for AMD platforms
Message-ID: <ZCbcsPdde09rY6jj@matsya>
References: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
Message-ID-Hash: ME6P2VOOPMV2WRXZOYOALPGWATJ64FEC
X-Message-ID-Hash: ME6P2VOOPMV2WRXZOYOALPGWATJ64FEC
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ME6P2VOOPMV2WRXZOYOALPGWATJ64FEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21-03-23, 10:38, Vijendar Mukunda wrote:
> ACP IP(v6.x) block has two SoundWire manager instance support.
> This patchset adds support for AMD SoundWire manager driver.

Applied, thanks

-- 
~Vinod
