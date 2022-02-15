Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB084B844E
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:31:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3900717FD;
	Wed, 16 Feb 2022 10:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3900717FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003904;
	bh=kUCZYr9eynBGfoyFNpGztKhdR0TjeWfPR20goAdEojo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oFPWDTJaVd52g/yuc3aDwr8Nzk4Gycj0xN9cZxq0MGkxy/6bJftrXL7Q9hns37ij+
	 XLe9CoVvwKGCLRgZ56Zr+rUVgMHJsjII2PbHowTwdNxjzXlZxoNxvRpE5ogVHUtRCM
	 iCSv2itLSjIiVh4f92R8bun640pcMFJgw9mf0DZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C54DCF8058C;
	Wed, 16 Feb 2022 10:25:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FA87F80132; Tue, 15 Feb 2022 20:24:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 136E7F800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 20:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 136E7F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pgheRwOA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4835061758;
 Tue, 15 Feb 2022 19:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8127AC340EB;
 Tue, 15 Feb 2022 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644953086;
 bh=kUCZYr9eynBGfoyFNpGztKhdR0TjeWfPR20goAdEojo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pgheRwOAKjRlXMfJul10RwEjs5CBKHR/i0QEhyIM79774uc0ovg3u5myvyhB8s/qu
 xkZdoun6Ve/NuXn1+qZDB9F/trYlid+yq9euKiwm3PP7bJ4zoGvDfPTjgfeWCzsH6f
 Z5GtGABFqXnkSAxbAOokUuetZQuukvg8GogLN1PAUilOeXNWgORbaiYjI/aeCr++5W
 YWvZj7f6KVH+xfahOEVmZaopl52rdr1jj6eaQg39ut/UgM8cVQWsEKIq8K1eRZzAAa
 TaPAe7uN1AmbZCmz+9XMV8T/S9ihvGxGOcJfBqdWD8uwk44Sq4S7ITZBKug7wSeC6N
 S7tHpNRHJfaSA==
Date: Tue, 15 Feb 2022 13:32:21 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220215193221.GA884407@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ygv8wY75hNqS7zO6@unreal>
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, mpi3mr-linuxdrv.pdl@broadcom.com,
 coresight@lists.linaro.org, sparmaintainer@unisys.com,
 linux-um@lists.infradead.org, greybus-dev@lists.linaro.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org
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

On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > 
> > > These all look trivially correct to me. Only two didn't have the end of
> > > the struct visible in the patch, and checking those showed them to be
> > > trailing members as well, so:
> > > 
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > 
> > I'll add this to my -next tree.
> 
> I would like to ask you to send mlx5 patch separately to netdev. We are working
> to delete that file completely and prefer to avoid from unnecessary merge conflicts.

Oh OK. Sure thing; I will do so.

Thanks
--
Gustavo
