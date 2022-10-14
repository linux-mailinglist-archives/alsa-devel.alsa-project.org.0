Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAC55FF46D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 22:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBAFD702A;
	Fri, 14 Oct 2022 22:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBAFD702A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665778565;
	bh=daprHI620cy91kHu3D4xEZ58HIOQozicsyEEAiVVF5c=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jWVfBd8TazvmWrK6PMkOTWbcpiTs69az/WyOT727ljoeon4+wxl/AAMk2QFVpOUNR
	 z6P5SerXk/wb8gmv07kZ22TKIFmpBbWb3oNzgga/QfUciq8vd8lfYBVYkApGEPfoO5
	 BJMPQDGSOeV3RAcHnV2W12s9Yf5ZFY0sejnfIns0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BC26F800F3;
	Fri, 14 Oct 2022 22:15:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77C22F80224; Fri, 14 Oct 2022 22:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 767BDF800F3
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 22:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767BDF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p2AWD1hT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C41A06135D;
 Fri, 14 Oct 2022 20:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076B5C433D7;
 Fri, 14 Oct 2022 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665778498;
 bh=daprHI620cy91kHu3D4xEZ58HIOQozicsyEEAiVVF5c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=p2AWD1hTSCVKY1/Huw6yQZCSkaDmtgEMACuJKrCNUa8CzNmN+B/SwgNhvfw9ds+6R
 oKUIRJAop++sx12ZWcwOTsfmxUAptD5O6Iq/jJU2kh9r/McXWyk6RpAnF6GjdPmfpW
 2z3DfxeQklg5Miq5HXAvHwK8rUud136d8R2iKxpDwnYz5wj5T/kY2JecVn3X0JFj+k
 n/STfZ0kQuRlNjo3RIRo7G49FfDtUOSV8aKlDLwW1U0NUW+F4ZP3a6i0RV7+HxZ+62
 mY5Aquy42/Uj+XBYvq7DtdEuwplSbzKTfZ7Lt5rhdizdWPYqJiIzGKusxTZm9p3ko2
 UMXi+tYhqGccA==
Date: Fri, 14 Oct 2022 15:14:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ALSA: hda: Add Intel DG2 PCI ID and HDMI codec vid
Message-ID: <20221014201456.GA3492621@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130124732.696896-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Uma Shankar <uma.shankar@intel.com>
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

On Tue, Nov 30, 2021 at 02:47:31PM +0200, Kai Vehmanen wrote:
> Add HD Audio PCI ID and HDMI codec vendor ID for Intel DG2.
> 
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  sound/pci/hda/hda_intel.c  | 12 +++++++++++-
>  sound/pci/hda/patch_hdmi.c |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 221afacbc7fd..b98d7975adea 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -335,7 +335,10 @@ enum {
>  					((pci)->device == 0x0c0c) || \
>  					((pci)->device == 0x0d0c) || \
>  					((pci)->device == 0x160c) || \
> -					((pci)->device == 0x490d))
> +					((pci)->device == 0x490d) || \
> +					((pci)->device == 0x4f90) || \
> +					((pci)->device == 0x4f91) || \
> +					((pci)->device == 0x4f92))

Would you consider adding these device IDs to the Linux PCI ID
database so lspci knows what they are?  Everything starting with
0x490d is missing.

There's an "Add item" link at the top of https://pci-ids.ucw.cz/read/PC/8086

Bjorn
