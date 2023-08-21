Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0614782EB0
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 18:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 565F9825;
	Mon, 21 Aug 2023 18:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 565F9825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692636329;
	bh=LlrlqT5YFbaVq7QjCCWPiC/vKgnJUso9K3vZdLYpSrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qI9+7BqWRkxyPtpFHyg0zZ2v6JsCbigUwdW2SWAnzEWDkvpPrCsBIBeFuVoHbZ2YS
	 aDyAkdHgwzxYfs0+riCpluh6elGa4dm3iyIffiJ9+X25wpYBrZgtNBJnAREeX1nltM
	 tiAb0b/nLu9n6lLvXWZJFK9bCOzz3mZt0tVHbyJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A2A5F800BF; Mon, 21 Aug 2023 18:44:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C08F8016C;
	Mon, 21 Aug 2023 18:44:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C33D4F80199; Mon, 21 Aug 2023 18:44:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90DCBF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 18:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90DCBF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ybRr39jV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF79963EDE;
	Mon, 21 Aug 2023 16:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF49C433C7;
	Mon, 21 Aug 2023 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692636263;
	bh=LlrlqT5YFbaVq7QjCCWPiC/vKgnJUso9K3vZdLYpSrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ybRr39jV8vAJlQlMVP1ogmL+zehfOZcFpu9ASwI247gPAz+lGOtvrJ9yiJ2HT6GB8
	 vnplHA6UHU27663KPl6RS44kGk70wTAlT2TLFpm0FUZNYjHSy+UAhLbbnWnu8z3HpK
	 +w2ltuxxj06WyHzx6mxPz7jZHBYkK03FbidtcRIQ=
Date: Mon, 21 Aug 2023 18:44:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>, stable@vger.kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] [6.4.y] ASoC: SOF: intel: hda: Clean up link DMA for
 IPC3 during stop
Message-ID: <2023082110-stumble-founding-148d@gregkh>
References: <20230821122209.20139-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230821122209.20139-1-perex@perex.cz>
Message-ID-Hash: 33KCNN6CZC7HECXPPSH3IH6DLNDFN54E
X-Message-ID-Hash: 33KCNN6CZC7HECXPPSH3IH6DLNDFN54E
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33KCNN6CZC7HECXPPSH3IH6DLNDFN54E/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 21, 2023 at 02:22:09PM +0200, Jaroslav Kysela wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> commit 90219f1bd273055f1dc1d7bdc0965755b992c045 upstream.
> 
> With IPC3, we reset hw_params during the stop trigger, so we should also
> clean up the link DMA during the stop trigger.
> 
> Cc: <stable@vger.kernel.org> # 6.4.x
> Fixes: 1bf83fa6654c ("ASoC: SOF: Intel: hda-dai: Do not perform DMA cleanup during stop")
> Closes: https://github.com/thesofproject/linux/issues/4455
> Closes: https://github.com/thesofproject/linux/issues/4482
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217673
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Link: https://lore.kernel.org/r/20230808110627.32375-1-peter.ujfalusi@linux.intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> Note that many recent Intel based laptops are affected.
> 
> Added missing code for 6.4 kernels to keep the fix simple not depending
> on the other changes. This commit is present in 6.5 tree already.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Now queued up, thanks.

greg k-h
