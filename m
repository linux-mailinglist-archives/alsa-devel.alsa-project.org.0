Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A0642C72
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 17:03:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949F917EF;
	Mon,  5 Dec 2022 17:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949F917EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670256215;
	bh=fUCRk5umyyi3F3OQ84Ugjf+XIjegvMCAtqFGwoNUqqc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6PwG85nCxoEI3y2dc1ZZNfcS+PifooEc2nVMcVC8bNcfTqATtDU5a+53XmB8yxPs
	 KKLr/0iO7+9WwcqsRVMElgVC17Lo4x3+XF3FzLOE0Bqb/3UJhYPzJjgg9GGsu8EX2a
	 NGfnzPDNBZqySH9JwIOChb+vFKdPw6Z0JE8SNJ0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B92EF800BD;
	Mon,  5 Dec 2022 17:02:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D53A0F80236; Mon,  5 Dec 2022 17:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F361EF800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 17:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F361EF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="o8sllyzq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 822B661188;
 Mon,  5 Dec 2022 16:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59369C433D6;
 Mon,  5 Dec 2022 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1670256148;
 bh=fUCRk5umyyi3F3OQ84Ugjf+XIjegvMCAtqFGwoNUqqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8sllyzqWv2DzA+KUc9+w2ABl/BVpS0Lah/qIWLxT+W/phFpqpqdbXN1oOWepc2y6
 1CM6I2RlaNDAfcFYCSOSYzTwNVhYoEmdiIQoSi0gEVkPf+sgz5otQ4QNZFNjb4x0YQ
 NNzgKtGndHDakAGEC+w4etUgbRYKrSRN7qSWH+MA=
Date: Mon, 5 Dec 2022 17:02:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 4/6] xen: make remove callback of xen driver void returned
Message-ID: <Y44WEkKh9tdNjMlW@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB232333CB411691110A8B9D96CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB232333CB411691110A8B9D96CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org,
 linux-hyperv@vger.kernel.org, mpe@ellerman.id.au, haiyangz@microsoft.com,
 linuxppc-dev@lists.ozlabs.org, decui@microsoft.com,
 alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org,
 christophe.leroy@csgroup.eu, bgoswami@quicinc.com,
 xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com,
 robert.jarzmik@free.fr, roger.pau@citrix.com
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

On Mon, Dec 05, 2022 at 11:36:42PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.

Please wrap changelogs at 72 columns.

And this should go through the maintainers of the Xen bus code, not me,
right?

And why wasn't this attached to the 0/6 email properly?  Did you use
different tools?  If so, our tools can't find the link to keep them in
sync either :(

thanks,

greg k-h
