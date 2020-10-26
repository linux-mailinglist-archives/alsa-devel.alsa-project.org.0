Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11220298EF1
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:16:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9024F16C9;
	Mon, 26 Oct 2020 15:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9024F16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603721773;
	bh=2qLSIc7k4XMXAWyWMEK9MRLmkYAUIzU/1aq7uRh/K/k=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=evBo2m+uSSm4vv4bnsU7Y+mSzuiWVTWACA2JoZ7QdcRHOIFdeAhBfeY/qQS+uvggA
	 8QGDpxV9mDUljv+riFmzqORDKZJqqqp6Pr981mw3Ta5LbyNcY3wFdIG2yXSCoxXbnL
	 6OenVKIniWVd/Nco73sGqgHhV2sBUJ1/Mu/h6Nc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305A6F801D5;
	Mon, 26 Oct 2020 15:14:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9181DF80212; Mon, 26 Oct 2020 15:14:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB1E3F801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB1E3F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K3IKflmp"
Received: from coco.lan (ip5f5ad5a1.dynamic.kabel-deutschland.de
 [95.90.213.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE24021655;
 Mon, 26 Oct 2020 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603721669;
 bh=2qLSIc7k4XMXAWyWMEK9MRLmkYAUIzU/1aq7uRh/K/k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K3IKflmpxBRU6TXMyWrNEDYrZiZ1oNRms/Eio7YpPVPZaOwdl5rWt97pyF8z+9ps3
 XG1fXkbVdFO09ithiMvD56yHvQbdxY9RGmYGJJsRk/dAAj4giiNV3vZRVdXRUIbmPA
 l6sUeiBCrc8TRn5cbSA7Uy0WgzTiqGnVtQsdQ+Yo=
Date: Mon, 26 Oct 2020 15:14:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 48/56] sound: fix kernel-doc markups
Message-ID: <20201026151423.622f847e@coco.lan>
In-Reply-To: <s5h5z6x5cdg.wl-tiwai@suse.de>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <535182d6f55d7a7de293dda9676df68f5f60afc6.1603469755.git.mchehab+huawei@kernel.org>
 <s5h5z6x5cdg.wl-tiwai@suse.de>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@linaro.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, paulhsia <paulhsia@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Em Mon, 26 Oct 2020 14:46:03 +0100
Takashi Iwai <tiwai@suse.de> escreveu:

> On Fri, 23 Oct 2020 18:33:35 +0200,
> Mauro Carvalho Chehab wrote:
> > 
> > Kernel-doc markups should use this format:
> >         identifier - description
> > 
> > There is a common comment marked, instead, with kernel-doc
> > notation.
> > 
> > Some identifiers have different names between their prototypes
> > and the kernel-doc markup.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Shall I merge this through sound git tree?
> 
> Or if this goes via doc tree, feel free to take my ack
>   Reviewed-by: Takashi Iwai <tiwai@suse.de>

Thanks for reviewing it!

Feel free to merge it though sound tree.
 
Thanks,
Mauro
