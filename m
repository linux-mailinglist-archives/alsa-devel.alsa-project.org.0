Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73547E674
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 17:37:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14ED418CD;
	Thu, 23 Dec 2021 17:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14ED418CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640277440;
	bh=N390lWOZKv0lRWDpfux31O6R5ZTVe+v7Xb1rOr2jH1M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=naQx8Gk/ukFV3esr40bRooCARIRrlkJIMye93AFxkV1FNa3Jzq/Uxjbo4I50clH6Z
	 WO1PpmEJSG8fQPdZ13W0aak1U9GVwvCHSAN5mY9Fn7kDgvvJsFzNGBUy9HoE1+QNqZ
	 xOlWqnF5+huSVanYT64N5GmoZXInKMg/AcONZzmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 672BFF804E4;
	Thu, 23 Dec 2021 17:36:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B086DF804EB; Thu, 23 Dec 2021 17:36:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86A6DF804E4
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 17:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86A6DF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eVj/7ERr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 672C961EC9;
 Thu, 23 Dec 2021 16:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196C7C36AE9;
 Thu, 23 Dec 2021 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640277351;
 bh=N390lWOZKv0lRWDpfux31O6R5ZTVe+v7Xb1rOr2jH1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVj/7ERrDDmgNfY6pNuVHLBGnVI3edhEAFpe+OC1vB37o0WaNTW9R3noLiRp0Ik2U
 4dM8HNJZYTE1GYYeML2NOlFy4UKJM/OqEH6wCPwZOzchYe2P9jMfZmxCoEO4dKxkAw
 aPEqiARbma0yC0RAI3G26unf1d8SuqrlpaNBh+WXawo905UrnfedRsdFDdlWJnUkVq
 inpt+jbx2rR7ubpwX4DbcYVIVPQP6aWZfcr0rwonddiWmpjzz1qkA5FKDFmJuE9ZLw
 m6sT3VLNdrofefv7JiYMqO4Z3aQRwdEZj2ENmI1veSiZ+RzMYEYv1noo0QsR8ShE72
 hUHHkoeOsn1GA==
Date: Thu, 23 Dec 2021 22:05:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 7/7] soundwire: intel: remove PDM support
Message-ID: <YcSlZHN7B5hqpJRM@matsya>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
 <20211213054634.30088-8-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213054634.30088-8-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

On 13-12-21, 13:46, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> While the hardware supports PDM streams, this capability has never
> been tested or enabled on any product, so this is dead-code. Let's
> remove all this.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
