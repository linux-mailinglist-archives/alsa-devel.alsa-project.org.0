Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B4E4B0F31
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 14:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107021938;
	Thu, 10 Feb 2022 14:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107021938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644501039;
	bh=pkJgMwC0UXrEQU6Z3PROxsQ48Zm/YeCFFMRVynxtPPw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=blprzROMmG/vMJTAHvFReLou+RgOS4wpAmnet39yIeSBq8icfJFzUW4BZVNBemBUc
	 Jl63UeFulGwcXgHRWcvIOrc3OSY4w/+di5KjV23RWc43CqK/dpo/3R8Vcix81NupW0
	 No1XffuheQSAi+MSd0weTfzEBz6yLupQUG6cA6qY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EE90F80508;
	Thu, 10 Feb 2022 14:49:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E9ECF804FF; Thu, 10 Feb 2022 14:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C6CEF804AC
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 14:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6CEF804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r7X5atbB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D06F4B8255B;
 Thu, 10 Feb 2022 13:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80A6C004E1;
 Thu, 10 Feb 2022 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644500966;
 bh=pkJgMwC0UXrEQU6Z3PROxsQ48Zm/YeCFFMRVynxtPPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r7X5atbBQeGFHdpXiuGJuhrjoPRGK0GDDKZ/8j6PhszIGaFInpNoGJrzR2R9BqLbN
 RxD1kZK8dZ6+AFjOX0HfoyLWyOhrJpsqBMXNeiH5+3Q2cpe9ZrHZfA8YXPzcadD6v3
 gGnXL+h9DkEkjMxx2EpCAgAGYUAXup8OhleRC+uefOL43PJxOVT5Iu4qbOtsK6Pyi/
 fqMcy5L92CCDot20Ngm5ICRE+JJkpyqqHNcAic1K4snj3tiaW5AoPAwprePECjn/YK
 B3UNrMqzRS4AdbNK1PGtSvGW26kLpnbELxFlhufJSWU8rs8VpeySLqQhxfzAM/iW6q
 FsUDeG+ML267A==
Date: Thu, 10 Feb 2022 19:19:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] soundwire: Replace acpi_bus_get_device()
Message-ID: <YgUX4rRet+p+LVFA@matsya>
References: <3173256.44csPzL39Z@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3173256.44csPzL39Z@kreacher>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26-01-22, 20:50, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Replace acpi_bus_get_device() that is going to be dropped with
> acpi_fetch_acpi_dev().
> 
> No intentional functional impact.

Applied, thanks

-- 
~Vinod
